# Сервис централизованного управления конфигурацией
Написан с использованием Spring Cloud фреймворка,
представляет собой имплементацию паттерна [config server](https://cloud.spring.io/spring-cloud-config/reference/html/)

## Запуск
 - Добавить свойство `spring.cloud.config.server.git.uri` со ссылкой на свой
   репозиторий с файлами конфигурации ([пример](https://github.com/AlexOmarov/configs))
   и `spring.cloud.config.server.git.passphrase` для этого репозитория
 - Добавить файлы `id_rsa` и `known_hosts` с хостом github и валидным для аккаунта ssh ключом
 - Запустить `Dockerfile` с проброшенным портом 8888