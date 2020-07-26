
tucsonfw(){
	fw_addr=${TUCSONFW_ADDR}
	account=$(getaccount intranet)
	passwd=$(getpasswd intranet)
	python "${HOME_GIT_REPO}/tools/passfw.py" "${fw_addr}" "${account}" "${passwd}"
}
