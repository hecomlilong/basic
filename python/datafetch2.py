from flask import Flask
import tushare as ts
import MySQLdb
import pandas as pd
# import mysql.connector
from sqlalchemy import *

engine = create_engine('mysql://root:root@localhost/stockanalyse')
cnx = engine.raw_connection()


app = Flask(__name__)

db = MySQLdb.connect("localhost","root","root","stockanalyse" )

cursor = db.cursor()

sql = "SELECT * from daily_k_line where id=1"

try:
    cursor.execute(sql)
    data = cursor.fetchone()
    for d in data:
        print d
    rows = ts.get_today_all()
    # print type(rows)

    result = rows.to_sql("get_today_all",cnx,flavor='mysql',if_exists='replace')
    print result

    # t = rows[0,1]
    # columns = list(t)
    # print columns
    # print len(columns)
    print len(rows)
    for i in range(len(rows)):
        print i
        print list(rows[i:i])
        if i == 1:
            break
except:
    print "Erroradfadfasdf"
db.close()

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    rows = ts.get_today_all()
    for row in rows:
        return row

if __name__ == '__main__':
    app.run()
