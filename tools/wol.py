#!/usr/bin/python
import sys
import struct
import string
import random
from socket import *


def usage():
    print """send UDP packet to broadcasting address to remote wakeup
UDP package format is FFFFFFFFFFFF0017314BACCB....................
                      (fixed 6 FF)(   mac    )(repeat mac 15 times)

usage: wol.py broadcasting_address udp_port target_host_mac

example: wol.py sevenever.vicp.net 4672 0017314BACCB

If udp_port is 53, will try to wrap wol message into a dns query,
that will cheat most firewall which prevent you sending udp package except for DNS query.
Notice(!): if the firewall is so strict that it check DNS query for legality of querying domain name,
this wrap will not help because domain name never contains 0xFF.
"""

def main():
    if len(sys.argv) != 4:
        usage()
        return 1
    bc_addr = sys.argv[1]
    udp_port = int(sys.argv[2])
    if udp_port < 1 or udp_port > 65535:
        sys.stderr.write('udp_port error')
        return 2
    mac = sys.argv[3]
    mac = mac.replace(":", "")
    if len(mac) != 12 or len(set(mac) - set(string.hexdigits)) > 0:
        sys.stderr.write('invalid mac address')
        return 2
        
    hw_addr = struct.pack('!BBBBBB', int(mac[0:2], 16),
                                    int(mac[2:4], 16),
                                    int(mac[4:6], 16),
                                    int(mac[6:8], 16),
                                    int(mac[8:10], 16),
                                    int(mac[10:12], 16))
    if int(udp_port) == 53:
        # wrap into a dns query
        # dns head
        dnspkg = struct.pack('!HHHHHH',
                             random.randint(0,65536),    # Transaction ID
                             256,                        # Flags
                             1,0,0,0)                    # Questions, Answer PRs, Authority PRs, Additional PRs
        # try to construct a fake dns query to wrap wol message
        hn = '\xff' * 6 + hw_addr * 8           # 6 0xff and former 8 mac can be wrap into a lable with length 54
        # 8 mac left to try
        macs = map(''.join, map(None, mac[::2], mac[1::2]))
        for i in range(7):      # this 7 is 6(bytes of mac)+1, no relation with the number of remaining mac addresses 
            index = i
            while index<48:
                val = int(macs[index%6], 16)
                if val == 0 or val > 63:
                    # invalid label length
                    break
                index += val+1
            if index >= 48:
                # can be wrapped into domain name part
                hn = chr(6+8*6+i) + hn + hw_addr * 8
                lblchrfunc = lambda x:random.choice(string.letters+string.digits)
                # padding label
                lbllen = index - 48
                hn += random.choice(string.letters) + ''.join(map(lblchrfunc, range(lbllen-1)))
                # sldn (second level domain name)
                lbllen = random.randint(1, 63)
                hn += chr(lbllen) + random.choice(string.letters) + ''.join(map(lblchrfunc, range(lbllen-1)))
                # tld (top level domain name)
                tld = random.choice(['com','net','org','edu'])
                hn += chr(len(tld)) + tld
                break
        else:
            # cannot wrap wol message into domain name part of a dns query
            # send it as dns query anyway
            sys.stderr.write('WARNING: can not wrap wol magic package into a integrated dns query package, but still try to send it as a dns query.')
            hn = chr(6+16*6) + hn
            hn += hw_addr * 7
                
        msg = dnspkg + hn + '\x00' + '\x00\x01' * 2
    else:
        # send a nake wol message
        msg = '\xff' * 6 + hw_addr * 16
        
    sk = socket(AF_INET, SOCK_DGRAM)
    sk.setsockopt(SOL_SOCKET, SO_BROADCAST, 1)
    
    sk.sendto(msg, (bc_addr, udp_port))
    sk.close()
    
if __name__ == '__main__':
    sys.exit(main())


