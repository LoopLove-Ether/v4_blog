import requests
import re
from qqwry import QQwry

def get_addr_info(ip):
    add = ('国家内网','')
    if ip.startswith('10.') or ip.startswith('192') or ip.startswith('127'):
        return add[0]
    q = QQwry()
    q.load_file('qqwry.dat')
    return q.lookup(ip)[0]


if __name__ == '__main__':
    print(get_addr_info('10.228.2.238'))

