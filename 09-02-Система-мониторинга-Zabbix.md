# Домашнее задание к занятию «Система мониторинга Zabbix»
# Боробов И.С.

### Задание 1 

Установите Zabbix Server с веб-интерфейсом.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Установите PostgreSQL. Для установки достаточна та версия что есть в системном репозитороии Debian 11
3. Пользуясь конфигуратором комманд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache
4. Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server

#### Требования к результаты 
1. Прикрепите в файл README.md скриншот авторизации в админке
2. Приложите в файл README.md текст использованных команд в GitHub

#### Ответ:
1. ![zabbix login](https://github.com/Borobov/srlb-homework/blob/65347d368e757838dea696fbdefed120a78bcf6f/img-9-02/01_zabbix.png)
2. apt install postgresql
3. wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb
4. dpkg -i zabbix-release_6.0-4+debian11_all.deb
5. apt update
6. apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
7. sudo -u postgres createuser --pwprompt zabbix
8. sudo -u postgres createdb -O zabbix zabbix
9. zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
10. cd /etc/zabbix/zabbix_server.conf  
DBPassword=password
11. systemctl restart zabbix-server zabbix-agent apache2
12. systemctl enable zabbix-server zabbix-agent apache2
13. http://192.168.31.141/zabbix

---

### Задание 2 

Установите Zabbix Agent на два хоста.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server
3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera
5. Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов

#### Требования к результаты 
1. Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу
2. Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером
3. Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.
4. Приложите в файл README.md текст использованных команд в GitHub

#### Ответ:
1. ![Conf-Hosts](https://github.com/Borobov/srlb-homework/blob/8399637a8d5e1e9de2a62fe5a9502591e7997726/img-9-02/03_add_server.png)
2. ![Log Agent](https://github.com/Borobov/srlb-homework/blob/8399637a8d5e1e9de2a62fe5a9502591e7997726/img-9-02/05_log_agent.png)
3. ![Latest Data](https://github.com/Borobov/srlb-homework/blob/c29c2e5ff1e528811e49d07a0bee2bc0cdffdf9f/img-9-02/04_latest_data_1.png)
4. ![Conf Agent](https://github.com/Borobov/srlb-homework/blob/8399637a8d5e1e9de2a62fe5a9502591e7997726/img-9-02/02_conf_agent.png)
5. wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb  
dpkg -i zabbix-release_6.0-4+debian11_all.deb  
apt update  
apt install zabbix-agent  

---
## Задание 3 со звёздочкой*
Установите Zabbix Agent на Windows (компьютер) и подключите его к серверу Zabbix.

#### Требования к результаты 
1. Приложите в файл README.md скриншот раздела Latest Data, где видно свободное место на диске C:

#### Ответ:
1. ![Win Agent Free Space](https://github.com/Borobov/srlb-homework/blob/8399637a8d5e1e9de2a62fe5a9502591e7997726/img-9-02/06_space_win.png)
---


