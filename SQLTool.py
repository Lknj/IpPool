import pymysql
from contents import host, port, user, password, database


class MySQL(object):

    def __init__(self):
        self.db = pymysql.connect(
            host=host,
            port=port,
            user=user,
            password=password,
            database=database
        )
        self.cursor = self.db.cursor()

    def select(self, sql, args=None):
        """
        查询操作
        :param sql: sql语句
        :param args: 占位符形式，防止sql注入
        :return: 查询结果
        """
        try:
            if args:
                self.cursor.execute(sql, args)
            else:
                self.cursor.execute(sql)
            result = self.cursor.fetchall()
        except Exception as e:
            raise e

        return result

    def insert(self, sql, args):
        '''
        插入操作
        :param sql: sql语句
        :param args: 占位符形式，防止sql注入
        :return:
        '''
        if isinstance(args, tuple):
            try:
                self.cursor.execute(sql, args)
                self.db.commit()
            except Exception as e:
                raise e
        elif isinstance(args, list):
            try:
                self.cursor.executemany(sql, args)
                self.db.commit()

            except Exception as e:
                raise e

    def update(self, sql, args):
        '''
        更改操作
        :param sql: sql语句
        :param args: 占位符形式，防止sql注入
        :return:
        '''
        if isinstance(args, tuple):
            try:
                self.cursor.execute(sql, args)
                self.db.commit()
            except Exception as e:
                raise e
        elif isinstance(args, list):
            try:
                self.cursor.executemany(sql, args)
                self.db.commit()

            except Exception as e:
                raise e

    def delete(self, sql, args):
        '''
        删除操作
        :param sql:
        :param args:
        :return:
        '''
        try:
            self.cursor.execute(sql, args)
            self.db.commit()

        except Exception as e:
            raise e
