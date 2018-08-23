# uni
alias ph='cd ~/git/phd'
alias pa='cd ~/git/PairwiseMHCRanking'
alias pad='cd ~/git/PairwiseMHCRanking/data'
alias pae='cd ~/git/PairwiseMHCRanking/evaluate'
alias padr='cd ~/Dropbox/pairwise_ranking/data'
alias phc='cd ~/git/phd/coursera/course2/'
alias cpdata='cp $(ls -t ~/Downloads/dataset* | head -1) tmp'

alias mkt='mklatex ~/git/hu/text arbeit'
alias mkto='mklatex ~/git/hu/text arbeit; okular arbeit.pdf&'
alias mke='mklatex ~/git/epirob-2017-self-workshop/abstract abstract'
alias mkp='hup; latex poster; dvips poster; ps2pdf -dEmbedAllFonts poster.ps; go poster.pdf'

alias sshhpc='ssh festi100@hpc.rz.uni-duesseldorf.de'

mklatex() {
	name="$2"
	cd "$1"
	pdflatex "$name".tex 
	bibtex "$name" 
	pdflatex "$name".tex 
	pdflatex "$name".tex 
}

alias te='hue; vim arbeit.tex'
alias pe='hup; vim poster.tex'
alias tepi='epi; vim abstract.tex'

# dir shortcuts
alias drop='cd ~/Dropbox'
alias src='cd ~/src'
alias dl='cd ~/Downloads'
alias scr='cd ~/git/scripts'
alias sma='cd ~/git/scripts/small-scripts'
alias tmp='cd /tmp/'
alias gi='cd ~/git'
alias ke='cd ~/git/keras'
alias misc='cd ~/git/misc'

# program shortcuts/enhancements
alias sql3='sqlite3 -separator "	"'
alias rsync='rsync -v --progress'
alias pinstall='pip3 install --user'
alias goo='~/git/scripts/small-scripts/goo'
alias pdfe='/usr/share/playonlinux/playonlinux --run "PDFXEdit"'
alias cdl='cd $(ls -t | head -1)'
alias cdlr='hut; cd hyperopt/$(ls -t hyperopt | head -1)'
alias to-git='~/git/scripts/small-scripts/cp_scripts.py -m to-git'
alias to-git-dry='~/git/scripts/small-scripts/cp_scripts.py -m to-git --dry-run'
alias from-git='~/git/scripts/small-scripts/cp_scripts.py -m from-git; source ~/.bashrc'
alias commit-scr='cp_scr_out=$(to-git); scr; gitacp "$cp_scr_out"; cd - > /dev/null'
alias pull-scr='scr; git pull; from-git; cd - > /dev/null; source ~/.bash_aliases'
alias his='history | tail -50'
alias huv='hu; vim predict_neural.py'
alias pudb='python -m pudb.run'
alias pdb='hu; pudb predict_neural.py'
alias ipy='ipython3 --TerminalInteractiveShell.editing_mode=vi'
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

sdown() {
	shutdown_sequence() {
		echo ''
		echo 'will shut down'
		pkill chrome 
		sudo shutdown now
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
		git -C "$git_dir" diff-index --quiet HEAD --
		if [ $? -ne 0 ]; then
			echo "Uncommited stuff in $git_dir"
			flag=1
		fi
	done

	if [ $flag -eq 1 ]; then
		read -p $'\n'"The are still things to commit. Still shut down? [y/N]" ok	
		if [ -z $ok ]; then
			echo "Aborted."
		else
			if [ $ok == "y" -o $ok == "Y" ]; then
				shutdown_sequence
			else
				echo "Aborted."
			fi
		fi
	else
		shutdown_sequence
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
alias gitchd='git checkout development'
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
alias gitg='git grep -i -I'
alias gitst='git stash'
alias gitstl='git stash list'
alias gitstp='git stash pop'
alias gitref='git reflog'
alias gitbak='cat ~/.git-backup.log'
alias gitsb='git show-branch --color | less -R'
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
