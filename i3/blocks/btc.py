#!/usr/bin/env python3
import json
import urllib.request

CURRENCY = "USD"
with urllib.request.urlopen("https://blockchain.info/ticker") as url:
    data = json.loads(url.read().decode())
    btc =data[CURRENCY]['last']

with urllib.request.urlopen("https://api.kraken.com/0/public/Ticker?pair=XRPUSD") as url:
    data = json.loads(url.read().decode())
    xrp = data['result']['XXRPZUSD']['a'][0][:5]


with urllib.request.urlopen("https://api.kraken.com/0/public/Ticker?pair=ETHUSD") as url:
    data = json.loads(url.read().decode())
    print(btc,'-',xrp, '-', data['result']['XETHZUSD']['a'][0][:5])
