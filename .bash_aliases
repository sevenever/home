alias greenonline='expect -c "set timeout 60; spawn luit -encoding gbk ssh -l greenonline -i /home/seven/.ssh/id_rsa.newsmth bbs.newsmth.net; interact timeout 60  {send \"\000\"}; "'
alias playable='expect -c "set timeout 60; spawn luit -encoding gbk ssh -l playable bbs.newsmth.net; interact timeout 60  {send \"\000\"}; "'
alias mers='expect -c "set timeout 60; spawn luit -encoding gbk ssh -l mers -i /home/seven/.ssh/id_rsa.newsmth bbs.newsmth.net; interact timeout 60  {send \"\000\"}; "'
alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'
alias sshforget='ssh-keygen -f ~/.ssh/known_hosts -R '
complete -F _known_hosts sshforget
compdef _ssh sshforget
