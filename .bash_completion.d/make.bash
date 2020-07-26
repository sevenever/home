#complete -W "\`([[ -r Makefile ]] && grep -E '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile || cat /dev/null) | cut -d : -f 1 \`" make
