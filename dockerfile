FROM ubuntu:22.04

# Установка необходимых инструментов
RUN apt-get update && \
    apt-get install -y build-essential nasm git libc6-i386 gcc-multilib \
    && rm -rf /var/lib/apt/lists/*

# Добавление поддержки 32-битной архитектуры
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 && \
    rm -rf /var/lib/apt/lists/*

# Создание директории repos в /home
RUN mkdir -p /home/repos

# Установка рабочей директории
WORKDIR /home/repos

# Команда, выполняемая при старте контейнера
CMD ["/bin/bash"]