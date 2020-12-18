
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

genpw () { echo -n $1 | md5sum | cut -d ' ' -f 1 | python3 -c 'import sys; print("".join(dict(zip("0123456789abcdef","0!2#$%^789@BCdef"))[c] for c in sys.stdin.read().strip()))'; }


