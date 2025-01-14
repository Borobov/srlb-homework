# Домашнее задание к занятию 10.1 «Keepalived/vrrp»
#### Боробов И С
---

### Задание 1

Разверните топологию из лекции и выполните установку и настройку сервиса Keepalived. 

```
vrrp_instance test {
state "name_mode"
interface "name_interface"
virtual_router_id "number id"
priority "number priority"
advert_int "number advert"
authentication {
auth_type "auth type"
auth_pass "password"
}
unicast_peer {
"ip address host"
}
virtual_ipaddress {
"ip address host" dev "interface" label "interface":vip
}
}
```
*Пришлите скриншот рабочей конфигурации и состояния сервиса для каждого нода.*
### Ответ:
1. 
```
vrrp_instance failover_test {
state MASTER
interface eth0
virtual_router_id 10
priority 110
advert_int 2
authentication {
auth_type AH
auth_pass 1111
}
unicast_peer {
192.168.31.142
}
virtual_ipaddress {
192.168.31.10 dev eth0 label eth0:vip
}
}
```
2. 
```
vrrp_instance failover_test {
state BACKUP
interface eth0
virtual_router_id 10
priority 110
advert_int 2
authentication {
auth_type AH
auth_pass 1111
}
unicast_peer {
192.168.31.180
}
virtual_ipaddress {
192.168.31.10 dev eth0 label eth0:vip
}
}

```
3. ![1](https://github.com/Borobov/srlb-homework/blob/450c767e20029a38c0b9ae8456d6233f8e3e52a6/img-10-01/4.png)
4. ![2](https://github.com/Borobov/srlb-homework/blob/450c767e20029a38c0b9ae8456d6233f8e3e52a6/img-10-01/5.png)

--- 
### Задание 2*

Проведите тестирование работы ноды, когда один из интерфейсов выключен. Для этого:
- добавьте ещё одну виртуальную машину и включите её в сеть;
- на машине установите Wireshark и запустите процесс прослеживания интерфейса;
- запустите процесс ping на виртуальный хост;
- выключите интерфейс на одной ноде (мастер), остановите Wireshark;
- найдите пакеты ICMP, в которых будет отображён процесс изменения MAC-адреса одной ноды на другой. 

 *Пришлите скриншот до и после выключения интерфейса из Wireshark.*
### Ответ:
1. ![3](https://github.com/Borobov/srlb-homework/blob/450c767e20029a38c0b9ae8456d6233f8e3e52a6/img-10-01/3.png)
2. ![4](https://github.com/Borobov/srlb-homework/blob/450c767e20029a38c0b9ae8456d6233f8e3e52a6/img-10-01/1.png)
3. ![5](https://github.com/Borobov/srlb-homework/blob/450c767e20029a38c0b9ae8456d6233f8e3e52a6/img-10-01/2.png)
