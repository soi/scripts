# work
alias ge='cd ~/git/GeenuFF'
alias geg='cd ~/git/GeenuFF/geenuff'
alias ged='cd ~/git/GeenuFF/geenuff/testdata'
alias he='cd ~/git/HelixerPrep'
alias heh='cd ~/git/HelixerPrep/helixerprep'
alias hed='cd ~/git/HelixerPrep/helixerprep/testdata'
alias hep='cd ~/git/HelixerPrep/helixerprep/prediction'
alias hev='cd ~/git/HelixerPrep/helixerprep/visualization'
alias hes='cd ~/git/HelixerPrep/scripts'
alias geenv='. ~/env/geenuff/bin/activate'
alias db='de; sqlite3 full_geenuff.sqlite3'
alias rmout='rm -r tmp/*/output'
alias ds='cd ~/Desktop/data'
alias di='cd ~/Desktop/data_insight'
alias nn='he; cd nni'
alias nnl='cd ~/.local/nnictl'
alias ne='cd ~/nni/experiments'

alias cluster='ssh festi100@hpc.rz.uni-duesseldorf.de'
alias hpc='ssh felix-stiehler@134.99.200.63'
alias hpctunnel='ssh -L 8889:localhost:8081 felix-stiehler@134.99.200.63'
alias workpc='ssh -A -o "ProxyJump felix@134.99.224.62" felix@134.99.224.58'
alias worktunnel='ssh -A -L 8889:localhost:8080 -o "ProxyJump felix@134.99.224.62" felix@134.99.224.58'
alias ali='ssh felix@134.99.224.62'

last_trial() {
    last_exp=$(ls -1t ~/nni/experiments/ | head -1)
    last_trial=$(ls -1t ~/nni/experiments/$last_exp/trials/ | head -1)
    echo -n ~/nni/experiments/$last_exp/trials/$last_trial
}
alias lt='cd $(last_trial)'
alias le='cd ~/nni/experiments/$(ls -1t ~/nni/experiments/ | head -1)/trials'
alias vlt='vim $(last_trial)/trial.log'
alias wlt='watch -n 1 $(last_trial)/trial.log'
alias nnidel='nnictl experiment delete $(ls -1 -t ~/nni/experiments/ | head -1)'

valg() {
    cat $1 | grep val_loss: | cut -d " " -f10-23; cat $1 | grep val_loss: | cut -d " " -f25-;
}

nnidl() {
	if [ $# -lt 2 ]; then
		echo "Usage: nnidl cluster|hpc nni_id"
	else
		if [ $1 == "cluster" ]; then
			rsync -rvz --ignore-existing --progress festi100@hpc.rz.uni-duesseldorf.de:/home/festi100/nni/experiments/"$2" ~/nni/experiments/
		elif [ $1 == "hpc" ]; then
			rsync -rvz --ignore-existing --progress felix-stiehler@134.99.200.63:/home/felix-stiehler/nni/experiments/"$2" ~/nni/experiments/
		else
			echo "unknown source"
		fi
	fi
}

setprompt() {
	PS1='\[\033[0;33m\](WORK)\[\033[01;34m\] \w\[\033[00m\] > '
}

rsyncwork () {
	if [ $# -gt 1 ]; then
		rsync -rvz --progress -e 'ssh -A -o "ProxyJump felix@134.99.224.62"' felix@134.99.224.58:$1 $2
	else
		rsync -rvz --progress -e 'ssh -A -o "ProxyJump felix@134.99.224.62"' felix@134.99.224.58:$1 .
	fi
}

# LaTeX
mklatex() {
	name="$2"
	cd "$1"
	pdflatex "$name".tex 
	bibtex "$name" 
	pdflatex "$name".tex 
	pdflatex "$name".tex 
}

alias mkt='mklatex ~/git/hu/text arbeit'
alias mkto='mklatex ~/git/hu/text arbeit; okular arbeit.pdf&'
alias mke='mklatex ~/git/epirob-2017-self-workshop/abstract abstract'
alias mkp='hup; latex poster; dvips poster; ps2pdf -dEmbedAllFonts poster.ps; go poster.pdf'

# dir shortcuts
alias drop='cd ~/Dropbox'
alias src='cd ~/src'
alias dl='cd ~/Downloads'
alias de='cd ~/Desktop'
alias scr='cd ~/git/scripts'
alias sma='cd ~/git/scripts/small-scripts'
alias tmp='cd /tmp/'
alias gi='cd ~/git'
alias misc='cd ~/git/misc'
alias ke='cd ~/src/keras'

# program shortcuts/enhancements
alias lsw='ls -1 | wc -l'
alias du='du -h'
alias du1='du -h -d 1'
alias df='df -h'
alias nv='nvidia-smi'
alias chr='wmctrl -r Chrome -b remove,maximized_vert; wmctrl -r Chrome -b remove,maximized_horz; wmctrl -r Chrome -e 0,0,250,1080,1670'
alias python='python3'
alias pt='py.test --cache-clear --disable-warnings -v'
alias pts='py.test --cache-clear --disable-warnings -v --tb=line'
alias tree='tree -a -C -h -I __pycache__'
alias golast='go "$(ls -t -1 | head -1)"'
alias watch='watch '
alias ve='virtualenv -p python3'
alias rsync='rsync -v --progress'
alias pinstall='pip3 install --user'
alias goo='~/git/scripts/small-scripts/goo'
alias pdfe='/usr/share/playonlinux/playonlinux --run "PDFXEdit"'
alias cdl='cd $(ls -t | head -1)'
alias cdlr='hut; cd hyperopt/$(ls -t hyperopt | head -1)'
alias to-git='~/git/scripts/small-scripts/cp_scripts.py -m to-git'
alias to-git-dry='~/git/scripts/small-scripts/cp_scripts.py -m to-git --dry-run'
alias from-git='~/git/scripts/small-scripts/cp_scripts.py -m from-git; source ~/.bashrc'
alias commit-scr='cp_scr_out=$(to-git | grep -v Skipping | grep -v everything); scr; gitacp "$cp_scr_out"; cd - > /dev/null'
alias pull-scr='scr; git pull; from-git; cd - > /dev/null; source ~/.bash_aliases'
alias his='history | tail -50'
alias pudb='python -m pudb.run'
alias ipy='ipython3 --TerminalInteractiveShell.editing_mode=vi'
alias ipyrc='vim ~/.ipython/profile_default/startup/ipython_startup.py'
alias doch='sudo $(history -p !-1)'
alias bitc='~/bitcoin-qt/bitcoin-qt --datadir=/media/felix/Volume/Bitcoin'
alias ll='ls -lAh --color=auto'
alias llt='ll -t'
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
alias updaterepo='cd /var/www/apt/; sudo dpkg-scanpackages binary /dev/null | gzip -9c | sudo tee binary/Packages.gz > /dev/null'
alias cpdeb='sudo cp /home/soi/*.deb /var/www/apt/binary/.; updaterepo'
alias chx='chmod +x'
alias kill9='sudo kill -9'
alias clswp='sudo rm -v /home/felix/.vim/swap/*.sw? /var/tmp/*.sw? /var/tmp/.*.sw?'
alias whereami='echo "$( hostname --fqdn ) ($(hostname -i))"'
alias mountc='mount | column -t'
alias wgethtml='wget -E -H -k -K -p -nd'
alias mountntfs='sudo mount -o uid=1000,umask=0022 /dev/sdc5 /media/felix/ntfs-hdd'

setupve() {
	cd ~/env
	virtualenv -p python3 $1
	. ./$1/bin/activate
	cd -
}

runn() {
	for run in {1..$1}
	do
		$2
	done
}

sdown() {
	shutdown_sequence() {
		echo ''
		if [ "$1" = "-l" ]; then
			echo 'will log screen'
			gnome-screensaver-command -l
		elif [ "$1" = "-r" ]; then
			echo 'will restart'
			pkill chrome 
			sudo shutdown -r now
		else
			echo 'will shut down'
			pkill chrome 
			sudo shutdown now
		fi
	}

	to-git-dry > /dev/null
	if [ $? -eq 1 ]; then
		read -p $'\n'"Changes inside some scripts. Commit the scripts git? [y/N]" ok	
		if [ -z $ok ]; then
			echo -e "Not commited.\n"
		else
			if [ $ok == "y" -o $ok == "Y" ]; then
				commit-scr
			else
				echo -e "Not commited.\n"
			fi
		fi
	fi

	flag=0
	for git_dir in "/home/felix/git"/*
	do
		if [ "$git_dir" != "/home/felix/git/tags" ]; then
			git -C "$git_dir" diff-index --quiet HEAD --
			if [ $? -ne 0 ]; then
				echo "Uncommited stuff in $git_dir"
				flag=1
			fi
		fi
	done

	if [ $flag -eq 1 ]; then
		read -p $'\n'"The are still things to commit. Still continue? [y/N]" ok	
		if [ -z $ok ]; then
			echo "Aborted."
		else
			if [ $ok == "y" -o $ok == "Y" ]; then
				shutdown_sequence $1
			else
				echo "Aborted."
			fi
		fi
	else
		shutdown_sequence $1
	fi
}

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
alias gitpua='~/git/scripts/small-scripts/gitpullall.py; '
alias gitl='git log --pretty=format:"%h - %an - %ar --- %s" --graph --color --branches -w'
alias gitlong='git log --stat --color '
alias gitd='git difftool -y'
alias gitdh='git difftool -y HEAD'
alias gitdhh='git difftool -y HEAD HEAD^'
alias gitc='git commit -m'
alias gitac='git add .; git commit -m'
alias gitch='git checkout'
alias gitchf='git checkout -f'
alias gitchd='git checkout dev'
alias gitchm='git checkout master'
alias gitcl='git clean -xn'
alias gitclf='git clean -xf'
alias gits='git status'
alias gitp='git push'
alias gitpu='git pull'
alias gita='git add'
alias gitm='git merge'
alias gitmt='git mergetool'
alias gitb='git branch'
alias gitba='git branch -a'
alias gitg='git grep -I -n -E -p -2 --break'
alias gitst='git stash'
alias gitstl='git stash list'
alias gitstp='git stash pop'
alias gitref='git reflog'
alias gitbak='cat ~/.git-backup.log'
alias gitsb='git show-branch --color | less -R'

gittrackall() {
	for i in `git branch -a | grep remote | grep -v HEAD`; do 
		git branch --track ${i#remotes/origin/} $i; 
	done
}

gitdbp() {
	git push --delete origin $1
	git branch -d $1
}

gitbp() {
	git checkout -b $1
	git push --set-upstream origin $1
}

giti() {
	vim `expr match "$(pwd)" '\(/home/felix/git/[a-zA-Z0-9]*/\)'`.gitignore
}

gitr() {
	cd `expr match "$(pwd)" '\(/home/felix/git/[a-zA-Z0-9]*\)'`
}

gitacp() {
	if [[ $# -lt 1 ]]; then
		echo "Need commit message"
	else
		git add $PWD
		git commit -m "$1"
		git push
	fi
}

gitcp() {
	if [[ $# -lt 1 ]]; then
		echo "Need commit message"
	else
		git commit -m "$1"
		git push 
	fi
}
