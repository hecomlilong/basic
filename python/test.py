#!/usr/bin/python
# -*- coding: UTF-8 -*-
#from database_connection import Connection

#example1 = Connection("localhost","root","root","stockanalyse")
#print example1.getCursor()
#print example1.getCNX()
#del example1
from datafetch import datafetch

exa = datafetch()
#exa.get_stock_basics()
#exa.get_hist_data_all("M")
#exa.get_hist_data("300543","2013-08-25","2014-08-26")
exa.get_h_data_all()
del exa