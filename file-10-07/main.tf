terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  token = "y0_AgAAAAA_XnMxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  cloud_id = "b1guuxxxxxxxxxxxxxxxxxx"
  folder_id = "b1gjkxxxxxxxxxxxxxxxxxx"
  zone = var.zone
}


resource "yandex_compute_instance" "vm" {
count = 2
name = "vm${count.index}"

  resources {
    cores = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8a67rb91j689dqp60h"
      size = 5
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat = true
  }

  metadata = {
    user-data = "${file("/root/meta.yaml")}"
  }
}

  resource "yandex_vpc_network" "network-1" {
    name = "network1"
  }

  resource "yandex_vpc_subnet" "subnet-1" {
    name = "subnet1"
    zone = "ru-central1-b"
    v4_cidr_blocks = ["192.168.10.0/24"]
    network_id = "${yandex_vpc_network.network-1.id}"
  }

  resource "yandex_lb_target_group" "testtg-1" {
    name      = "testtg1"
    target {
      subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
      address   = "${yandex_compute_instance.vm[0].network_interface.0.ip_address}"
    }
    target {
      subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
      address   = "${yandex_compute_instance.vm[1].network_interface.0.ip_address}"
    }
  }



  resource "yandex_lb_network_load_balancer" "testlb-1" {
    name = "testlb1"
    listener {
      name = "netlistener"
      port = 80
      external_address_spec {
        ip_version = "ipv4"
      }
    }
    attached_target_group {
      target_group_id = yandex_lb_target_group.testtg-1.id
      healthcheck {
        name = "http"
        http_options {
          port = 80
          path = "/"
        }
      }
    }
  }
