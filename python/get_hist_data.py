#!/usr/bin/env python
import sys, json
# Load the data that PHP sent us
#try:
#    data = json.loads(sys.argv[1])
#except:
#    print "ERROR"
#    sys.exit(1)

# Generate some data to send to PHP
import tushare as ts
print "123"
#print ts.get_hist_data('600848')
result = {'stockCode': 123}

# Send it to stdout (to PHP)
#print json.dumps(result)
import MySQLdb