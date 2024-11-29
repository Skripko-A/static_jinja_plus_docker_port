# static_jinja_plus_docker_port
Учебный проект в рамках курса веб-разработки devman

## Описание
Проект **Static Jinja Plus Docker** упаковывает библиотеку [Static Jinja Plus](https://github.com/MrDave/StaticJinjaPlus) для генерации статических сайтов в Docker-контейнерах. В репозитории представлены несколько Dockerfile, каждый из которых использует разные базовые образы и методы развертывания. Ссылка на [DockerHub](https://hub.docker.com/repository/docker/askripko/static_jinja_plus/tags)

1. **latest-ubuntu**
   - Последняя версия ubuntu
   - Последняя стабильная версия StaticJinjaPlus
```bash
docker build -f latest-ubuntu.Dockerfile -t static_jinja_plus:latest-ubuntu .
```

2. **latest-slim**
   - Python-slim версия 3.12
   - Последняя стабильная версия StaticJinjaPlus
```bash
docker build -f latest-slim.Dockerfile -t static_jinja_plus:latest-slim .
```

3.  **develop-ubuntu**
   - Последняя версия ubuntu
   - developement версия StaticJinjaPlus
```bash
docker build -f develop-ubuntu.Dockerfile -t static_jinja_plus:develop-ubuntu .
```

4.  **develop-slim**
   - Последняя версия Python-slim
   - developement версия StaticJinjaPlus
```bash
docker build -f develop-slim.Dockerfile -t static_jinja_plus:develop-slim .
```

5. **0.1.1-ubuntu**
   - Последняя версия ubuntu (по умолчанию) либо укажите свою версию в аргументе
   - Версия StaticJinjaPlus 0.1.1
```bash
docker build -f 0.1.1-ubuntu.Dockerfile --build-arg BASE_IMAGE=ubuntu:22.04 -t static_jinja_plus:0.1.1-ubuntu .
```

6. **0.1.1-slim**
   - Версия Python-slim 3.12 (по умолчанию) либо укажите свою версию в аргументе
   - Версия StaticJinjaPlus 0.1.1
```bash
docker build -f 0.1.1-slim.Dockerfile --build-arg BASE_IMAGE=python:3.12-slim -t static_jinja_plus:0.1.1-slim .
```

7. **0.1.0-ubuntu**
   - Последняя версия ubuntu (по умолчанию) либо укажите свою версию в аргументе
   - Версия StaticJinjaPlus 0.1.0
```bash
docker build -f 0.1.0-ubuntu.Dockerfile --build-arg BASE_IMAGE=ubuntu:22.04 -t static_jinja_plus:0.1.0-ubuntu .
```

8. **0.1.0-slim**
   - Версия Python-slim 3.12 (по умолчанию) либо укажите свою версию в аргументе
   - Версия StaticJinjaPlus 0.1.0
```bash
docker build -f 0.1.0-slim.Dockerfile --build-arg BASE_IMAGE=python:3.12-slim -t static_jinja_plus:0.1.0-slim .
```