from qqwry import QQwry

def get_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR') # 判断是否使用代理
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0] # 使用代理获得真实的IP
        return ip
    ip = request.META.get('REMOTE_ADDR') # 未使用代理获取IP
    return ip

def get_addr_info(ip):
    add = ('中国内网','')
    if ip.startswith('10.') or ip.startswith('192') or ip.startswith('127'):
        return add[0]
    q = QQwry()
    q.load_file('qqwry.dat')
    return q.lookup(ip)[0]

if __name__ == '__main__':
    get_addr_info('120.228.2.238')
