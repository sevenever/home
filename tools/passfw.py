#!/usr/bin/python
# -*- coding:utf-8 -*-
import sys
import socket

def main():
    ip = sys.argv[1]
    account = sys.argv[2].strip()
    passwd = sys.argv[3].strip()
    sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        sk.connect((ip,23))
    except socket.error:
        print >> sys.stderr,'already pass the firewall'
        return 2
    f = sk.makefile()
    print expect(f, 'Username: ')
    sk.send('%s\r\n' % account)
    print expect(f, 'Password: ')
    sk.send('%s\r\n' % passwd)
    print expect(f, ['Successful','Error'])
    return 0

def hexstr(s):
    return ''.join('\\x%x'%ord(i) for i in s)

def expect(f, sl):
    if type(sl) != list:
        sl = [sl]
    """a block wait for string s on file f
    """
    buf=''
    while True:
        for s in sl:
            if buf.endswith(s):
                return buf
        buf += f.read(1)

if __name__ == "__main__":
    sys.exit(main())

