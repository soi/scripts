# uni
alias pr='python3 ./predict_seq.py'
alias vip='vim ~/git/hu/touch/predict_seq.py'
alias hu='cd ~/git/hu'
alias vpnstart='~/.juniper_networks/network_connect/jnc hu-berlin'
alias vpnstop='~/.juniper_networks/network_connect/jnc stop'
alias mkha='ha; pdflatex hausarbeit.tex; pdflatex hausarbeit.tex; go hausarbeit.pdf'

# dir shortcuts
alias drop='cd ~/Dropbox'
alias scr='cd ~/git/scripts'
alias sma='cd ~/git/scripts/small-scripts'
alias tmp='cd /tmp/'
alias gi='cd ~/git'
alias ke='cd ~/git/keras'
alias misc='cd ~/git/misc'

# program shortcuts/enhancements
alias to-git='~/git/scripts/small-scripts/cp_scripts.py -m to-git'
alias from-git='~/git/scripts/small-scripts/cp_scripts.py -m from-git'
alias his='history | tail -50'
alias togit='~/git/scripts/small-scripts/cp_scripts -m to-git'
alias fromgit='~/git/scripts/small-scripts/cp_scripts -m from-git'
alias huv='hu; vim predict_neural.py'
alias pudb='python -m pudb.run'
alias pdb='hu; pudb predict_neural.py'
alias ipy='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ipyrc='vim ~/.ipython/profile_default/startup/ipython_startup.py'
alias doch='sudo $(history -p !-1)'
alias bitc='~/bitcoin-qt/bitcoin-qt --datadir=/media/felix/Volume/Bitcoin'
alias ll='ls -lAh --color=auto'
alias llg='ll | egrep '
alias cp='cp -v'
alias findg='find . | egrep '
alias brc='vim ~/.bash_aliases'
alias barc='vim ~/.bashrc'
alias vrc='vim ~/.vimrc'
alias brst='. ~/.bashrc'
alias cl='clear'
alias rgrep='grep -rni'
alias mv='mv -v'
alias rm='rm -v'
alias go='gnome-open'
alias tarx='tar xzvf'
alias psg='ps auxwww | grep -i'
alias llg='ll | g'
alias updaterepo='cd /var/www/apt/; sudo dpkg-scanpackages binary /dev/null | gzip -9c | sudo tee binary/Packages.gz > /dev/null'
alias cpdeb='sudo cp /home/soi/*.deb /var/www/apt/binary/.; updaterepo'
alias chx='chmod +x'
alias kill9='sudo kill -9'
alias mvscr='cp -v ~/git/scripts/.vimrc ~/.vimrc; cp -v ~/git/scripts/.bash_aliases ~/.bash_aliases'
alias clswp='sudo rm -v /home/felix/.vim/swap/*.sw? /var/tmp/*.sw?'
alias whereami='echo "$( hostname --fqdn ) ($(hostname -i))"'
alias mountc='mount | column -t'
alias wgethtml='wget -E -H -k -K -p -nd'

manopt() { 
	man $1 | sed 's/.\x08//g'| sed -n "/^\s\+-\+$2\b/,/^\s*$/p" | sed '$d;';
}

mcd() { 
	mkdir -p "$1" && cd "$1"
}

# apt-get stuff
alias ainstall='sudo apt-get install'
alias aupdate='sudo apt-get update'
alias aupgrade='sudo apt-get upgrade'
alias autoremove='sudo apt-get autoremove'
alias ainfo='apt-cache showpkg'
alias aremove='sudo apt-get remove'
alias dpkgg='dpkg -l | g'

# git
alias gitl='git log --pretty=format:"%h - %an - %ar --- %s" --graph --color --branches -w'
alias gitlong='git log --stat --color '
alias gitd='git difftool -y'
alias gitdh='git difftool -y HEAD'
alias gitdhh='git difftool -y HEAD HEAD^'
alias gitc='git commit -m'
alias gitac='git add .; git commit -m'
alias gitch='git checkout'
alias gitchf='git checkout -f'
alias gitchd='git checkout development'
alias gitchm='git checkout master'
alias gitcl='git clean -xn'
alias gitclf='git clean -xf'
alias gits='git status'
alias gitp='git push'
alias gitpu='git pull'
alias gita='git add'
alias gitr='git rebase'
alias gitra='git rebase -i --abort'
alias gitm='git merge'
alias gitmt='git mergetool'
alias gitb='git branch'
alias gitba='git branch -a'
alias gitg='git grep -i -I'
alias gitst='git stash'
alias gitstl='git stash list'
alias gitstp='git stash pop'
alias gitref='git reflog'
alias gitbak='cat ~/.git-backup.log'
alias gitsb='git show-branch --color | less -R'

gitacp() {
	if [[ $# -lt 1 ]]; then
		echo "Need commit message"
	else
		git add $PWD
		git commit -m "$1"
		git push --all
	fi
}
gitcp() {
	if [[ $# -lt 1 ]]; then
		echo "Need commit message"
	else
		git commit -m "$1"
		git push --all
	fi
}
gitgf() {
	if [[ $# -lt 1 ]]; then
		echo "Need filter string"
	else
		git grep -i -I --no-index "$1" | cut -d ":" -f1 | sort -u
	fi
}
gitgfv() {
	if [[ $# -lt 1 ]]; then
		echo "Need filter string"
	else
		vim $(git grep -i -I --no-index "$1" | cut -d ":" -f1 | sort -u | tr "\n" " ")
	fi
}

################
# Server stuff #
################

# folders
alias afol='cd /etc/apache2'
alias qfol='cd /var/qmail'
alias mfol='cd /etc/munin'
alias dfol='cd /etc/dovecot'
alias lbin='cd /usr/local/bin'

# logs
alias qmailsmtplog='cat /var/log/qmail/smtpd/current | strack | tai64nlocal | less'
alias qmaillog='cat /var/log/qmail/current | mtrack | tai64nlocal | less'
alias syslog='sudo less /var/log/syslog'
alias kernlog='sudo less /var/log/kern.log'
alias muninnodelog='sudo less /var/log/munin/munin-node.log'
alias muninupdatelog='sudo less /var/log/munin/munin-update.log'
alias dpkglog='sudo less /var/log/dpkg.log'
alias maillog='sudo less /var/log/mail.log'
alias faillog='sudo less /var/log/fail2ban.log'
alias authlog='sudo less /var/log/auth.log'
alias cpulog='sudo less /var/log/bigprocesses/cpu'
alias memlog='sudo less /var/log/bigprocesses/mem'

# configs
alias sources='sudo vim /etc/apt/sources.list'

# postgresql
alias prst='sudo /etc/init.d/postgresql restart'

# tomcat
alias trst='sudo ~/Arbeitsfläche/apache-tomcat-7.0.42/bin/shutdown.sh; sudo ~/Arbeitsfläche/apache-tomcat-7.0.42/bin/startup.sh'
alias tstart='sudo /data/apache-tomcat-7.0.29/bin/startup.sh'

# qmail
alias qstat='sudo qmailctl stat'
alias qrl='sudo qmailctl reload'
alias qrst='sudo qmailctl restart'
alias qstop='sudo qmailctl stop'
alias qstart='sudo qmailctl start'
alias qpw='sudo vim /var/qmail/users/authuser'

# apache
alias arl='sudo /etc/init.d/apache2 reload'
alias arst='sudo /etc/init.d/apache2 restart'
alias astop='sudo /etc/init.d/apache2 stop'
alias astart='sudo /etc/init.d/apache2 start'
alias achk='apache2ctl -t'

# nagios
alias nfol='cd /etc/nagios3'
alias nrst='sudo /etc/init.d/nagios3 restart'
alias nstop='sudo /etc/init.d/nagios3 stop'
alias nstart='sudo /etc/init.d/nagios3 start'

# munin
alias mrst='sudo /etc/init.d/munin-node restart'
alias mtest='sudo su munin -c "/usr/share/munin/munin-update --debug" --shell /bin/bash'
alias mrun='sudo munin-run'

# dovecot
alias drst='sudo /etc/init.d/dovecot restart'
alias dstop='sudo /etc/init.d/dovecot stop'
alias dstart='sudo /etc/init.d/dovecot start'
alias dpw='sudo vim /etc/passwd.dovecot'

# fail2ban
alias f2brl='sudo fail2ban-client reload'
alias f2bstop='sudo fail2ban-client stop'
alias f2bstart='sudo fail2ban-client start'
alias fdump='sudo fail2ban-client -d'
