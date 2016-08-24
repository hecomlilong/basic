#!/usr/bin/python
# -*- coding: UTF-8 -*-
#from database_connection import Connection

#example1 = Connection("localhost","root","root","stockanalyse")
#print example1.getCursor()
#print example1.getCNX()
#del example1
from datafetch import datafetch

exa = datafetch()
exa.get_hist_data("600848","2015-01-05","2015-01-06")

del exa