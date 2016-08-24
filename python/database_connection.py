#!/usr/bin/python
# -*- coding: UTF-8 -*-
import MySQLdb
import pandas as pd
from sqlalchemy import *
class Connection:
    cnx = 0
    db = 0

    def __init__(self,host,username,password,database):
        str = "mysql+mysqldb://%s:%s@%s/%s" % (username,password,host,database)
        engine = create_engine(str)
        Connection.cnx = engine.raw_connection()
        Connection.db = MySQLdb.connect(host,username,password,database )

    def getCursor(self):
        return Connection.db.cursor()

    def getCNX(self):
        return Connection.cnx

    def execute(self,sql):
        if (Connection.db == 0):
            print "database not connected."
            return
        try:
           # 执行sql语句
           cursor = Connection.db.cursor()
           cursor.execute(sql)
           # 提交到数据库执行
           Connection.db.commit()
        except:
           # Rollback in case there is any error
           Connection.db.rollback()

    def __del__(self):
        Connection.db.close()
        Connection.cnx.close()