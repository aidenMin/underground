### Run Server
Run django server
```
$ python manage.py runserver
```

Run celery tasks
```
$ celery worker -A underground -l INFO -Q q_default
```

Run celery beat
```
$ celery -A underground beat -l INFO -S django
```