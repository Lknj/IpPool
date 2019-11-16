from __future__ import absolute_import
from celery.schedules import crontab

broker_url = "redis://127.0.0.1:6379/5"
result_backend = "redis://127.0.0.1:6379/6"

task_serializer = 'json'
result_serializer = 'json'
accept_content = ['json']
timezone = "Asia/Shanghai"  # 时区设置
worker_hijack_root_logger = False  # celery默认开启自己的日志，可关闭自定义日志，不关闭自定义日志输出为空
result_expires = 60 * 60 * 24  # 存储结果过期时间（默认1天）

# 导入任务所在文件
imports = [
    "celery_task.epp_scripts.spider_task",  # 导入py文件
]


# 需要执行任务的配置
beat_schedule = {
    "ip_spider": {
        "task": "celery_task.epp_scripts.spider_task.ip_spider",  # 执行的函数
        "schedule": crontab(minute=0, hour=0),  # 每天凌晨12点
        "args": ()  # 任务函数参数
    },
}
