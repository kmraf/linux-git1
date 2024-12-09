# Project2
## Описание
Этот проект автоматизирует создание нескольких виртуальных сред python с помощью ansible. 
Каждая среда содержит пакеты нужные для какой-то области ds.
У меня их тут всего 2, и пакетов немного, но при желании можно добавить ещё.
Так же сделана ссылка на юпитер.

Если хочется позапускать и пописать какие-то проекты на виртуальной машине, то этот
проект может быть полезен для её конфигурации.
## Структура директорий
```plaintext
project2/
├── ansible.cfg
├── ansible.log
├── ansible.sh       #launches all 
├── hosts            #inventory
├── playbook.yml     #main playbook
├── roles/
    └── create_python_environments/
│       ├── tasks/
│       │   └── main.yml
│       └── vars/
│           └── main.yml     # packages for each env
|
└── README.md
