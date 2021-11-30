import requests
import time
from datetime import datetime

print("Starting price tracker...")

def get_eth_price():
    return requests.get('https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=CAD').json()['CAD']

def get_eth_price_kraken():
    return float(requests.get('https://api.kraken.com/0/public/Ticker?pair=ETHCAD').json()['result']['XETHZCAD']['b'][0])

data = list()

last_price = get_eth_price_kraken()
print("$",last_price)
time.sleep(5)

while True:
    curr_eth_price = get_eth_price_kraken()
    print("$", curr_eth_price)
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    diff_amt = round(curr_eth_price - last_price, 2)
    data.append(diff_amt)
    print('    Difference: ' + str(diff_amt), " Current time =", current_time, ' Data_size=', len(data))
    last_price = curr_eth_price

    sum = 0
    for i in data:
        sum += i
    print('Net: ', round(sum,2))

    time.sleep(5)
