alias greenonline='expect -c "set timeout 60; spawn luit -encoding gbk ssh -l greenonline -i /home/seven/.ssh/id_rsa.newsmth bbs.newsmth.net; interact timeout 60  {send \"\000\"}; "'
alias playable='expect -c "set timeout 60; spawn luit -encoding gbk ssh -l playable bbs.newsmth.net; interact timeout 60  {send \"\000\"}; "'
alias mers='expect -c "set timeout 60; spawn luit -encoding gbk ssh -l mers -i /home/seven/.ssh/id_rsa.newsmth bbs.newsmth.net; interact timeout 60  {send \"\000\"}; "'
alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'
alias sshforget='ssh-keygen -f ~/.ssh/known_hosts -R '
complete -F _known_hosts sshforget
compdef _ssh sshforget
alias wolnas='python2 "/home/seven/github/sevenever/sevenever/misc/wol.py" 192.168.1.255 53 f4:6d:04:db:27:ad'
#alias svcroot='ssh -p 26 -l root -i ~/.ssh/id_rsa.work -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
#alias svcscp='scp -P 26 -o User=root -i ~/.ssh/id_rsa.work -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
# alias eclipse='/Users/shaofsh/Software/Eclipse.app/Contents/MacOS/eclipse &'
#alias eclipse='open -n /Applications/Eclipse.app'

