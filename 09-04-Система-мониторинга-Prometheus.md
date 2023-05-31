# Домашнее задание к занятию «Система мониторинга Prometheus»
### Боробов И С
---
### Задание 1
Установите Prometheus.

#### Процесс выполнения
1. Выполняя задание, сверяйтесь с процессом, отражённым в записи лекции
2. Создайте пользователя prometheus
3. Скачайте prometheus и в соответствии с лекцией разместите файлы в целевые директории
4. Создайте сервис как показано на уроке
5. Проверьте что prometheus запускается, останавливается, перезапускается и отображает статус с помощью systemctl

#### Требования к результату
- [ ] Прикрепите к файлу README.md скриншот systemctl status prometheus, где будет написано: prometheus.service — Prometheus Service Netology Lesson 9.4 — [Ваши ФИО]
#### Ответ:
1. ![1-1](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/1-1.png)
2. ![1-2](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/1-2.png)
---

### Задание 2
Установите Node Exporter.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
3. Скачайте node exporter приведённый в презентации и в соответствии с лекцией разместите файлы в целевые директории
4. Создайте сервис для как показано на уроке
5. Проверьте что node exporter запускается, останавливается, перезапускается и отображает статус с помощью systemctl

#### Требования к результату
- [ ] Прикрепите к файлу README.md скриншот systemctl status node-exporter, где будет написано: node-exporter.service — Node Exporter Netology Lesson 9.4 — [Ваши ФИО]
#### Ответ:
1. ![2-1](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/2-1.png)
2. ![2-2](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/2-2.png)
---

### Задание 3
Подключите Node Exporter к серверу Prometheus.

#### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Отредактируйте prometheus.yaml, добавив в массив таргетов установленный в задании 2 node exporter
3. Перезапустите prometheus
4. Проверьте что он запустился

#### Требования к результату
- [ ] Прикрепите к файлу README.md скриншот конфигурации из интерфейса Prometheus вкладки Status > Configuration
- [ ] Прикрепите к файлу README.md скриншот из интерфейса Prometheus вкладки Status > Targets, чтобы было видно минимум два эндпоинта
#### Ответ:
1. ![3-1](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/3-1.png)
2. ![3-2](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/3-2.png)
---

### Задание 4*
Установите Grafana.

#### Требования к результату
- [ ] Прикрепите к файлу README.md скриншот левого нижнего угла интерфейса, чтобы при наведении на иконку пользователя были видны ваши ФИО
#### Ответ:
1. ![4-1](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/4-1.png)
---

### Задание 5*
Интегрируйте Grafana и Prometheus.

#### Требования к результату
- [ ] Прикрепите к файлу README.md скриншот дашборда (ID:11074) с поступающими туда данными из Node Exporter
#### Ответ:
1. ![5-1](https://github.com/Borobov/srlb-homework/blob/764e267a00f5c2724d4b85ecd59f1eea7bc7b3a1/img-9-04/5-1.png)

