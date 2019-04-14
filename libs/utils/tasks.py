from celery import Task

import logging


logger = logging.getLogger('app')


class DebugTask(Task):
    abstract = True

    def on_failure(self, exc, task_id, args, kwargs, einfo):
        logger.error('[CELERY-TASK-ERR]: ', exc, task_id, args, kwargs, einfo)
