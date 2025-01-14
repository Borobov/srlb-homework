# Домашнее задание к занятию 10.6 «Disaster recovery»
### Боробов И.С.

Домашнее задание выполните в Google Docs и отправьте в личном кабинете на проверку ссылку на ваш документ.

Название файла должно содержать номер лекции и фамилию студента. Пример названия: «10.6 Disaster recovery — Александр Александров».

Перед тем как выслать ссылку, убедитесь, что её содержимое не приватно, т. е.  открыто на просмотр всем, у кого есть ссылка. Если нужно прикрепить дополнительные ссылки, просто добавьте их в Google Docs.

Любые вопросы по решению задач задавайте в чате учебной группы.

---

### Задание 1

В чём разница между DRaaS, BaaS, Active-Active, Active-Passive?

*Приведите ответ в свободной форме.*

### Ответ:
Disaster Recovery (DR) — катастрофоустойчивость или аварийное восстановление, инструмент реагирования на критические сбои в IT-инфраструктуре компании, направленный на быстрое восстановление работы всех систем. То есть отказ серверной или даже всего ЦОДа не должен надолго (в отдельных случаях речь о секундах) прерывать бизнес-процессы.
1. DRaaS - услуга облачного резервного копирования и восстановления. В случае аварии или кибератаки поставщик услуги DRaaS перемещает вычислительные процессы организации в собственную облачную инфраструктуру. Это позволяет компании бесперебойно продолжать работу из расположения поставщика, даже если ее серверы отключены.
- поддержка кластеров любого типа;
- поддеркжа практически любой избыточности конфигурации;
- автоматическая репликация на все узлы кластера и дургие возможности.
2. BaaS (Backup as a Service) - подразумевает предоставление пользователю надежного облачного сервиса для создания резервных копий инфраструктуры. BaaS позволяет защищать информацию от потери при сбоях в работе оборудования. Идея облачного резервного копирования заключается в автоматическом переносе и хранении резервных копий клиента в дата-центре провайдера облачной услуги. BaaS-системы работают через специальные агентские приложения (агенты), которые устанавливаются в дата-центре клиента. Агенты нужны для сбора данных в резервных копиях, сжатия, шифрования и отправки в облако. Также эти приложения отвечают за исполнение заданного расписания и некоторые другие сервисные функции.
3. Active-Active - в даннос варианте построения кластера, серверы (два или больше) могут иметь равноценный статус, то есть работать одновременно. В такой конфигурации нагрузка вышедшего из строя сервера распределяется по остальным серверам кластера. Если серверов в кластере немного, то скорее всего произойдёт снижение производительности, так как нагрузка на оставшиеся в кластере серверы возрастёт. Стоит заметить, что в конфигурации active/passive (которая имеет полное резервирование каждого узла) такого снижения не будет. Однако этот вариант стоит дороже, так как каждый узел дублируется. Фактически, за отказоустойчивость и отсутствие потери производительности всегда приходится платить двойную цену.
4. Active-Passive - в самом распространённом случае система состоит из двух серверов (так называемый двухузловой кластер), один из которых является основным, а другой дублирующим, резервным. Все вычисления производятся на основном сервере, а дублирующий сервер включается в работу в случае аварии на основном. Такая конфигурация является затратной, так как каждый узел дублируется.

---

### Задание 2

Компании нужно составить план восстановления в случае Disaster recovery. Сервер состоит из системного диска и диска с данными. 
Требуется копировать два логических диска на один физический: 
- системный диск (C:) (20 гигабайт);
- диск с данными (D:) (256 гигабайт). 

В требованиях говорится: 
- данные критичны в течение 24 часов после аварии;
- сеть критична к большим потокам данных в рабочее время;
- рабочее время с 9.00 до 18.00, пять дней (понедельник – пятница);
- план резервирования должен быть реализован для диска C и для диска D. В случае Linux-систем /dev/sda1, /dev/sda4 или /dev/sdb1-данные;
- считается, что для этой задачи может быть: 1) поставлен второй сервер или 2) выбрана облачная инфраструктура с определённой услугой;
- компания готова платить за 10 терабайт места как в одном, так и в другом случае.
 
*Приведите ответ в форме плана востановления с выбранным механизмом и получившейся топологией.*

### Ответ:
**План резервного копирования:**
- резеревное копирование проходит на отдельный сервер либо облачную инфраструктуру (особого значения не имеет в нашем случае, есть + и - у обоих варинатов);
- резервное копирование проходит ежедневно в нерабочие часы (пн-пт с 19:00 до 8:00), так как днем прокачка данных по сети может вызвать замедление работы сервисов необходмых сотружникам и клиентам;
- резервное копирование реализовано программой R-sync;
- определены разделы и диски, которые подлежат резервному копированию (в нашем случае это /dev/sda1, /dev/sdb1);
- определен максимальный объем данных, которые может потребоваться перенести в бекап (в нашем случае 20 и 256 Гб);
- определено максимальное время необходимое для выполнения полной резервной копии;
- определен максимальный объем хранилища данных (в нашем случае 10 Тб), это позволяет рассчитать нам глубину бекапа и настроить автоматическую ротацию бекапа, чтобы избежать переполнения хранилища и перебои в работе резервного копирования.
- проводится регулярная провекра целостночти резерных копий и их наличие (например 1 раз в неделю), настроены уведомления о успешном выполнеии бекапа (почта, СМС, мессенджер).

**Плане восстановления данных:**  
1. RTO определено 24 часа, то есть у нас есть сутки на восстановление работоспособности сервиса. 
2. 60 минут. Сотрудник, отвественный за первичную диагностику неисправности после поступлени уведомления от системы мониторинга или заявки от пользователя о проблемах в работе сервиса - системный администратор. На этом этапе в его задачи входит установить причину вызникновения проблемы: сбой электропитания, пожара или наводнение в помещении, сбой в работе каналов связи (Интернет, ЛВС), сбой в работе программного обеспечения, вирусная атака/влом системы и т.д. Для диагностики каждого из возможных инцидентов прописан четкий план действий ответственного специалиста по пунктам в порядке уменьшени вероятности наступления (зависит от статистики их наступления в прошлом или особенностей расположения серверной):
  - проверка целостности серверной: проверить через камеры видеонаблюдения (если серверная удалена) наличие видимых причин затопления, пожара, наличие посторонних лиц (полиции, МЧС и т.д.);
  - проверка линий связи (если есть система мониторинга Zabbix или подобная, воспользоваться ей, если нет, то проверить доступность пингом маршрутизатора, сервера);
  - попытаться войти на сервер через ssh консоль;
  - если не получилось авторизоваться через ssh, попрбовать зайти в систему управления сервером (iLo, iDRAС или подобная). Убедиться, что система работает штатно (диски доступны, нет перегрева, рейд в рабочем состоянии, нет прочих аварий);
  - при успешной на авторизациина сервере через ssh проверить доступность дисковой подсистмы, проверить свободное место на дисках, проверить работоспособность служб (перечень служб составляется в зависимости от используемого ПО, прописана инструкция по проверке служб по шагам);
  - попытаться перезапустить/запустить проблемные службы;
  - перезапустить сервер полностью.
3. 20 минут. В случае выявления на первом этапе проблем с оборудованием, даннымими или сервисами (повреждены файлы, повреждена база данных, поврежден сервисы и т.п.), системный администратор передает полученные диагностические данные своему руководителю для дальнейшего принятия решения по восстановлению рабостпособности сервиса.
4. 20 минут. Руковдитель ИТ принимает решение на основании полученных данных:
  - 15 минут. Налить чашку чая/кофе, успокоиться и продолжить работу по восстановлению;
  - 60 минут. Если это аппаратный сбой, то замена неисправного оборудования или его компонентов (в налчии должны быть основыне детали, например блок питания, жесткий диск, кулер и т.п.), с последуюнщим восстановленим данных из резеврнйо копии, если потребуется;
  - 120 минут. если это программный сбой или вирусная атака (аппаратная часть исправна), пробует восстановить неисправный сревис изменением настроек (проверка/корректрировка/сброс).
5. 300 минут (время зависит от количества данных, скорости канала связи). Восстановление данных из резервной копии (с локального сервера бекапов или облачного сервиса) включает в себя доставку бекапа на сервер, если это требуется и восстановление из него;
6. 60 минут. Восстановление работы сревиса после разворачивания резервной копии. Провека работоспособности сервисов.
7. 120 минут. Установлени причин возникшего инцедента для исключения или минимизации вероятности его повторения в будущем.

---

# Задания со звёздочкой*

Эти задания дополнительные. Их выполнять не обязательно. На зачёт это не повлияет. Вы можете их выполнить, если хотите глубже разобраться в материале.
 

### Задание 3*

Используя программу R-sync, составьте конфигурацию для выполнения прошлой задачи.

*Пришлите файл конфигурации.*

### Ответ:
Конфигруационные файлы rsync
1. [Server backup-server1.sh](https://github.com/Borobov/srlb-homework/blob/srlb-14/file-10-06/backup-server1.sh-server)
2. [Server rsyncd.scrt](https://github.com/Borobov/srlb-homework/blob/srlb-14/file-10-06/rsyncd.scrt-server)
3. [Client rsyncd.conf](https://github.com/Borobov/srlb-homework/blob/srlb-14/file-10-06/rsyncd.conf-client)
4. [Client rsync.scrt](https://github.com/Borobov/srlb-homework/blob/srlb-14/file-10-06/rsync.scrt-client)

Так же нужно будет создать задание в CRON для выполнения скрипта backup-server1.sh

crontab -e  
00 19 * * 1-5 sh /scripts/backup-server1.sh  
* скрипт будет выполняться ежедневно с понедельника по пятницу в 19:00

