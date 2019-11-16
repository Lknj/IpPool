from ip_spider import Proxies
from celery_task.celery import app


@app.task
def ip_spider():
    proxies = Proxies()
    proxies.verify_proxies()
