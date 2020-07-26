
getaccount(){
	if [[ $# -ne 1 ]]; then
		echo "usage: getaccount [application name]";
		echo "to list available application name:";
		echo "    getaccount -l";
		return;
	fi
	if [[ "$1" == "-l" ]]; then
		sudo cat ${ACCOUNT_FILE} | sed 's/^[[:space:]]*#.*//' | egrep -v '^$' | awk -F '\t' '{ print $1 }'
	else
		sudo cat ${ACCOUNT_FILE} | sed 's/^[[:space:]]*#.*//' | egrep -v '^$' | awk -F '\t' -v app=$1 '{if($1 == app) print $2}'
	fi
}
getpasswd(){
	if [[ $# -ne 1 ]]; then
		echo "usage: getpasswd [application name]";
		echo "to list available application name:";
		echo "    getpasswd -l";
		return;
	fi
	if [[ "$1" == "-l" ]]; then
		sudo cat ${ACCOUNT_FILE} | sed 's/^[[:space:]]*#.*//' | egrep -v '^$' | awk -F '\t' '{ print $1 }'
	else
		sudo cat ${ACCOUNT_FILE} | sed 's/^[[:space:]]*#.*//' | egrep -v '^$' | awk -F '\t' -v app=$1 '{if($1 == app) print $3}'
	fi
}
cppasswd(){
	if [[ $# -ne 1 ]]; then
		echo "usage: cppasswd [application name]";
		echo "to list available application name:";
		echo "    getpasswd -l";
		return;
	fi
    passwd=$(getpasswd $1)
    if [[ -n "$passwd" ]]; then
        echo -n "$passwd" | pbcopy
    else
        echo 'password not copied' >&2
    fi
}
