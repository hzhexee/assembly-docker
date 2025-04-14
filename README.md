# Docker образ для работы с x86/x86_64 NASM

## Описание
Этот проект предоставляет готовый Docker образ для разработки и выполнения программ на ассемблере с использованием NASM для архитектур x86 и x86_64. Образ содержит все необходимые инструменты, библиотеки и настройки для комфортной работы.

## Требования
Для запуска необходимо установить:
- Docker Desktop
- VSCode Extensions
  - Remote Development
  - Dev Containers
  - Docker

## Установка и запуск
1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/hzhexee/assembly-docker.git
   cd assembly-docker
   ```

2. Запустите Docker контейнер:
   ```bash
   docker-compose up -d
   ```

3. В VSCode:
   - Откройте палитру команд (F1 или Ctrl+Shift+P)
   - Либо нажмите на две стрелочки в левом нижнем углу
   - Выберите "Dev Containers: Attach to Running Container..."
   - Выберите контейнер "assembly-docker_assembly_1"

## Использование
Директория проекта монтируется в `/home/repos` внутри контейнера. Все файлы, созданные или измененные в этой директории, сохраняются на хост-машине.

### Компиляция и запуск 32-битного кода
```bash
# Компиляция
nasm -f elf32 -g -F dwarf file.asm -o file.o
# Линковка
gcc -m32 file.o -o file
# Запуск
./file
```

### Компиляция и запуск 64-битного кода
```bash
# Компиляция
nasm -f elf64 -g -F dwarf file.asm -o file.o
# Линковка
gcc file.o -o file
# Запуск
./file
```

## Структура проекта
- `dockerfile` - конфигурация Docker образа
- `docker-compose.yml` - настройка сервиса Docker
- `.devcontainer` - настройки для VSCode Dev Containers

## Встроенные инструменты
- NASM (Netwide Assembler)
- GCC с поддержкой 32-битной и 64-битной компиляции
- Необходимые библиотеки для обеих архитектур

## Решение проблем
Если возникают проблемы с правами доступа к файлам, выполните внутри контейнера:
```bash
chmod +x ./your_program
```

## Лицензия
MIT License - подробности в файле LICENSE

