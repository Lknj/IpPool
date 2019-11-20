# IpPool

### 环境依赖
- python3
- redis  >=v3.2.1
- mysql  >=v5.6
- celery  >=v4.3.0

### 开发和测试
- 安装好python3后,运行以下命令安装所需依赖
```bash
pip3 install -r requriements.txt
```

- 导入mysql表结构,进入mysql后运行
```bash
source IpPool.sql
```

- 然后在项目根目录下运行以下命令,起celery定时爬虫任务(每天凌晨12点爬取)
```bash
celery -A celery_task worker --loglevel=info --beat
```

- 最后, 在根目录下运行
```bash
python3 run.py
```

- 现在, 访问http://127.0.0.1:5000/v1/get_ip, 会看到一条ip地址
- 每次调用会随机返回一条