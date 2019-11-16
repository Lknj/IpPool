from flask_restful import Resource
from SQLTool import MySQL


MySQL = MySQL()


class GetIp(Resource):

    def get(self):
        sql = 'SELECT protocol, ip FROM xx_ip AS t1 ' \
              'JOIN (SELECT ROUND(RAND() * ((SELECT MAX(id) FROM xx_ip)-(SELECT MIN(id) FROM xx_ip)) + ' \
              '(SELECT MIN(id) FROM xx_ip)) AS ip_id) AS t2 ' \
              'WHERE t1.id >= t2.ip_id ORDER BY t1.id LIMIT 1'
        ip = MySQL.select(sql)
        return ip[0][1]
