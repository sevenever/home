
cmvclogin() {
	account=$(getaccount cmvc)
	passwd=$(getpasswd cmvc)
    cmvclog -in "${account}" -family $CMVC_FAMILY -noprompt "${passwd}"
}

DEFECT_HOME="${PROJECT_HOME}/issues"
PCR_HOME="${PROJECT_HOME}/DCR"
cmvc(){
	if [[ $# -ne 1 ]]
	then 
		echo "usage: cmvc [cmvc number]";
		return;
	fi
	cmvcnumber=$1
	cd "${DEFECT_HOME}"
	mkdir -p ${cmvcnumber}
	cd ${cmvcnumber}
	mvim ${cmvcnumber}.note
}

pcr(){
	if [[ $# -ne 1 ]]
	then 
		echo "usage: pcr [pcr number]";
		return;
	fi
	pcrnumber=$1
	cd "${PCR_HOME}"
	mkdir -p ${pcrnumber}
	cd ${pcrnumber}
	mvim ${pcrnumber}.note
}
