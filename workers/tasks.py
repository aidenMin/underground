from celery import shared_task, group

import logging

from libs.utils.iter import chunks
from libs.utils.tasks import DebugTask

logger = logging.getLogger('app')

samples = list()
for sample_id in range(1, 100):
    samples.append({'id': sample_id})


@shared_task(base=DebugTask)
def handle_tasks():
    celery_tasks = [handle_tasks_by_chunk.si(chunked_ids) for chunked_ids in chunks(samples, 10)]
    group(celery_tasks).apply_async(retry=False)


@shared_task(base=DebugTask)
def handle_tasks_by_chunk(ids):
    logger.info(ids)
