_getpasswd() {

    local cur prev accounts

    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev

    accounts=$(getpasswd -l)
    COMPREPLY=( $(compgen -W "${accounts}" -- ${cur}) )

    return 0
}

complete -F _getpasswd getpasswd
complete -F _getpasswd cppasswd
