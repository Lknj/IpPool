from __future__ import absolute_import  # 拒绝隐式引入
from celery import Celery

# 创建celery应用对象
app = Celery("celery_ip_spider")

# 导入celery的配置信息
app.config_from_object("celery_task.celery_config")