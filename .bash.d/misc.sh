
alias wolnas='python "/Users/shaofeng/mygithub/sevenever/sevenever/misc/wol.py" 192.168.1.255 53 f4:6d:04:db:27:ad'

#sshforget(){
    #local host
    #local port

    #if [[ $# -ne 1 && $# != 2  ]]
    #then
        #>&2 echo "usage: sshforget [host] [port]"
        #return 1
    #fi

    #host=$1
    #port=$2
    #if [ -z ${port} ]
    #then
        #ssh-keygen -f ~/.ssh/known_hosts -R ${host}
    #else
        #ssh-keygen -f ~/.ssh/known_hosts -R [${host}]:${port}
    #fi
#}
#complete -F _known_hosts sshforget

genpw () { echo -n $1 | md5 | python3 -c 'import sys; print("".join(dict(zip("0123456789abcdef","0!2#$%^789@BCdef"))[c] for c in sys.stdin.read().strip()))'; }


alias svcroot='ssh -p 26 -l root -i ~/.ssh/id_rsa.work -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias svcscp='scp -P 26 -o User=root -i ~/.ssh/id_rsa.work -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
# alias eclipse='/Users/shaofsh/Software/Eclipse.app/Contents/MacOS/eclipse &'
alias eclipse='open -n /Applications/Eclipse.app'
