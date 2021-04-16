# Сделать вклад

## Как добавить статью/пост/инструкцию?

Документация описывается в формате *markdown* на базе проекта [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).  
Для локального запуска в Linux или MacOS склонируйте репозиторий, если установлен docker, то можно выполнить `make`.
Или следуйте [инструкциям на сайте](https://squidfunk.github.io/mkdocs-material/getting-started/).  
Для внесения изменений создайте форк, и после откройте запрос на слияне.

## Структура

Следуйте структуре документации, она описывается блоком `nav` в файле `mkdocs.yml`, что в корне репозитория.
В каталоге `docs` подкаталоги, это разделы. Если инструкция повсвещается например фильтрам, нужно разместить её в соответствующей *папке*.
Имена файлов и каталогов не должны содержать пробелов, используйте нижнее подчёркивание `_`.

## Текст

Желательно писать очень подробно с расчётом на то, что человек впервые видит ffmpeg.
Заранее проверьте текст на грамматические ошибки, ещё могу рекомендовать сервис [Главред](https://glvrd.ru/).
Приводите больше примеров и желательно реальных.

## Медиа контент

Если в примере есть какой то специфический контент, лучше приложить его в репозиторий.
**За исключением больших и тяжёлых видео**, тогда лучше выложить на какой то публичный ресурс и оставить ссылку.
Все картинки, гифки и прочий медиа контент размещается в каталоге `docs/media`, при этом нужно создать свой подкаталог соответствующий названию файла с статьёй.

## Код и примеры команд

!!! info "Должен быть в соответствующем блоке"
    ```bash
    ffmpeg -i input.avi -map 0 -c copy output.mp4
    ```

Заранее проверьте работает ли тот код/команда, что вы прилагаете.
Мы не будем принимать пул реквест, если пример не рабочий.
За исключением случаем, когда окружение не позволяет проверить (например специфическое оборудование).