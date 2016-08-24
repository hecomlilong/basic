#!/usr/bin/python
# -*- coding: UTF-8 -*-
import datetime
from database_connection import Connection
import tushare as ts
import warnings
warnings.simplefilter(action = "ignore", category = FutureWarning)
class datafetch:

    def __init__(self):
        self.conn = Connection("localhost","root","root","stockanalyse")

    def get_today_all(self,option = 'append'):
    #option = 'replace','fail','append'
        rows = ts.get_today_all()
        cnx = self.conn.getCNX()
        rows.to_sql("today_all",cnx,flavor='mysql',if_exists=option,index=False)
        print "get_today_all executed"

    def get_hist_data(self,code = '600848', start = 0, end = 0, ktype = 'D', option = 'append'):
    #option = 'replace','fail','append'
    #code：股票代码，即6位数字代码，或者指数代码（sh=上证指数 sz=深圳成指 hs300=沪深300指数 sz50=上证50 zxb=中小板 cyb=创业板）
    #start：开始日期，格式YYYY-MM-DD
    #end：结束日期，格式YYYY-MM-DD
    #ktype：数据类型，D=日k线 W=周 M=月 5=5分钟 15=15分钟 30=30分钟 60=60分钟，默认为D
    #retry_count：当网络异常后重试次数，默认为3
    #pause:重试时停顿秒数，默认为0
        if(start != 0 and end != 0):
            df = ts.get_hist_data(code,start=start,end=end,ktype=ktype)
        else:
            df = ts.get_hist_data(code,ktype=ktype)
        #cnx = self.conn.getCNX()
        #df.to_sql("hist_data_"+ktype,cnx,flavor='mysql',if_exists=option,index=False)
        #print df.values
        #for tt in df.values:
        #    print tt
        #    for i in range(len(tt)):
        #        print tt[i]
        #date = datetime.datetime.strptime(start, "%Y-%m-%d")
        #curdate = date + datetime.timedelta(days=dd)
        #print d
        #print date
        #return

        for j in range(len(df.values)):
            date = df.index[j]
            tt = df.values[j]
            sqlPre = "insert into "+"hist_data_"+ktype+" (`code`, `date`, `open`, `high`, `close`, `low`, `volume`, `price_change`, `p_change`, `ma5`, `ma10`, `ma20`, `v_ma5`, `v_ma10`, `v_ma20`, `turnover`) VALUES ('"+code+"','"+date+"',"
            for i in range(len(tt)):
                sqlPre += "'"+tt[i].astype("str")+"',"
            sqlPre = sqlPre[:(len(sqlPre)-1)] + ")"
            self.conn.execute(sqlPre)
            #break
        print "get_hist_data executed"

    def __del__(self):
        del self.conn

