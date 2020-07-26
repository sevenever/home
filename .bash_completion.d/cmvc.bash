
_cmvc() {

    local cur prev cmvcs

    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev

    if [ -d "${DEFECT_HOME}" ]; then
        cmvcs=$(cd ${DEFECT_HOME};ls -d *)
        COMPREPLY=( $(compgen -W "${cmvcs}" -- ${cur}) )
    fi

    return 0
}

complete -F _cmvc cmvc


_pcr() {

    local cur prev pcrs

    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev

    if [ -d "${PCR_HOME}" ]; then
        pcrs=$(cd ${PCR_HOME};ls -d *)
        COMPREPLY=( $(compgen -W "${pcrs}" -- ${cur}) )
    fi

    return 0
}

complete -F _pcr pcr

