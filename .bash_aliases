# work
alias mistralkeygen='ssh-keygen -f /home/felix/.ssh/id_rsa_mistral; cat /home/felix/.ssh/id_rsa_mistral.pub'
alias at='cd /home/felix/git/aimtorch/aimtorch'
alias hzg='cd /home/felix/git/2020-11-hzg-rogue-waves'
alias hzgt='cd /home/felix/git/2020-11-hzg-rogue-waves/hzg202011/training'
alias hzgp='cd /home/felix/git/2020-11-hzg-rogue-waves/hzg202011/preprocessing'
alias kit='cd /home/felix/git/2020-06-kit-atmospheric-chemistry/'
alias kitd='cd /home/felix/git/2020-06-kit-atmospheric-chemistry/dev_data'
alias kitt='cd /home/felix/git/2020-06-kit-atmospheric-chemistry/kit202006/training'
alias kitp='cd /home/felix/git/2020-06-kit-atmospheric-chemistry/kit202006/preprocessing'
alias ml='cd /home/felix/git/trace.detection'
alias mlt='cd /home/felix/git/trace.detection/gfz202107/training'
alias mlp='cd /home/felix/git/trace.detection/gfz202107/preprocessing'
alias tra='cd /home/felix/git/trace.detection'
alias gw='cd /home/felix/git/writing_transfer_learning'
alias ba='~/backup/backup_nni.sh'
alias jou='misc; vim dkrz_journal/journal'
alias gitj='git add dkrz_journal/journal; gitcp "journal"'
alias coa='conda activate'
alias cod='conda deactivate'
alias condacf='conda env create -f'
alias condac='conda create --name'
alias condarm='conda env remove --name'
alias coat='conda activate torch'
alias coaj='conda activate jupyter'
alias ge='cd ~/git/GeenuFF'
alias geg='cd ~/git/GeenuFF/geenuff'
alias ged='cd ~/git/GeenuFF/geenuff/testdata'
alias he='cd ~/git/Helixer'
alias heh='cd ~/git/Helixer/helixer'
alias hed='cd ~/git/Helixer/helixer/testdata'
alias hep='cd ~/git/Helixer/helixer/prediction'
alias hev='cd ~/git/Helixer/helixer/visualization'
alias hes='cd ~/git/Helixer/scripts'
alias web='cd ~/git/HelixerWeb'
alias geenv='. ~/env/geenuff/bin/activate'
alias db='de; sqlite3 geenuff_plants.sqlite3'
alias rmout='rm -r tmp/*/output'
alias ds='cd ~/Desktop/data'
alias dep='cd ~/Desktop/predictions'
alias dem='cd ~/Desktop/models'
alias di='hsc; cd data_insight'
alias gs='vim ~/git/helixer_scratch/data_insight/plants/genome_sizes_fragments'
alias nn='he; cd nni'
alias nn='he; cd nni'
alias hsc='cd ~/git/helixer_scratch'
alias hscd='cd ~/git/helixer_scratch/data_scripts'
alias fg='vim  ~/git/helixer_scratch/sql_commands/features_of_genome.sql'
alias pa='hsc; cd paper'
alias pam='hsc; cd paper; vim main.tex'
alias cpmo='rsync --progress -r /home/felix/Desktop/models/* felix-stiehler@134.99.200.63:/home/felix-stiehler/Desktop/models/; rsync --progress -r /home/felix/Desktop/models/* festi100@hpc.rz.uni-duesseldorf.de:/gpfs/project/festi100/models/'
alias alis='cd /mnt/data/ali/share'
alias hscp='cd ~/git/helixer_scratch/plots/phylogenetic_trees/ggtree'
alias valg='cat trial.log | grep -A 25 "Validation (RMSE"'
alias valgt='cat trial.log | grep -A 25 "Validation (RMSE" | grep total'
alias valgh='cat trial.log | grep "| genic"'

alias vm='ssh vm'
alias mis='ssh mistral'
alias mt='ssh trial'
alias kitssh='ssh kit'
alias cluster='ssh festi100@hpc.rz.uni-duesseldorf.de'
alias clc='ssh -A -o "ProxyJump hhu_gateway" clc'
alias denbi='ssh -A -o "ProxyJump felixst@denbi-jumphost-01.denbi.dkfz-heidelberg.de" ubuntu@10.133.255.241'
alias clctunnel='ssh -L 8889:localhost:8081 -A -o "ProxyJump hhu_gateway" clc'
alias workpc='ssh -A -o "ProxyJump felix@134.99.224.59" work_pc'
alias worktunnel='ssh -A -L 8889:localhost:8080 -o "ProxyJump hhu_gateway" work_pc'
alias ali='ssh -A -o "ProxyJump hhu_gateway" ali_pc'

mistunnel() {
	ssh -i ~/.ssh/id_rsa_mistral -A -L 8889:localhost:8787 -o "ProxyJump k202142@mistral.dkrz.de" k202142@$1
}

alias ne='cd ~/nni-experiments'
alias trials='cd ~/nni-experiments/$(ls -1t ~/nni-experiments/ | head -1)/trials/'
last_trial() {
    last_exp=$(ls -1t ~/nni-experiments/ | head -1)
    last_trial=$(ls -1t ~/nni-experiments/$last_exp/trials/ | head -1)
    echo -n ~/nni-experiments/$last_exp/trials/$last_trial
}
trial_err(){
    last_exp=$(ls -1t ~/nni-experiments/ | head -1)
    first_trial=$(ls -1t ~/nni-experiments/$last_exp/trials/ | tail -1)
    cat ~/nni-experiments/$last_exp/trials/$first_trial/stderr
}
alias te='trial_err'
alias lt='cd $(last_trial)'
alias le='cd ~/nni-experiments/$(ls -1t ~/nni-experiments/ | head -1)/trials'
alias ldb='sqlite3 ~/nni-experiments/$(ls -1t ~/nni-experiments/ | head -1)/db/nni.sqlite'
alias vlt='vim $(last_trial)/trial.log'
alias wlt='watch -n 1 $(last_trial)/trial.log'
alias nnistop='nnictl stop; rm -r -v /tmp/nni'
alias nnidel='nnictl experiment delete $(ls -1 -t ~/nni-experiments/ | head -1)'
alias nniview='nnictl view $(ls -1 -t ~/nni-experiments/ | head -1)'
alias nnistopdel='nnistop && nnidel'

nnidl() {
    if [ $# -lt 2 ]; then
        echo "Usage: nnidl host nni_id"
    else
        rsync -rvza --ignore-existing --exclude '*.h5' --exclude '*.pt' --progress $1:"~/nni-experiments/$2" ~/nni-experiments/
        rsync -rvza --include ".experiment" --progress $1:"~/.local/nnictl/" ~/.local/nnictl/
    fi
}

# LaTeX
mklatex() {
	name="$2"
	cd "$1"
	pdflatex "$name".tex && bibtex "$name" && pdflatex "$name".tex && pdflatex "$name".tex 
}

paper_folder="~/git/helixer_paper_from_review/paper" 
alias mkt='mklatex '$paper_folder' main'
alias mkto='mklatex '$paper_folder' main; okular '$paper_folder'/main.pdf &> /dev/null &'
alias sup='mklatex '$paper_folder' supplements'
alias supo='mklatex '$paper_folder' supplements; okular '$paper_folder'/supplements.pdf &> /dev/null &'

cv="Lichtblick"
alias cpcv='rsync -rv ~/Desktop/Bewerbungen/* /media/felix/Volume/Medien/Dokumente/Bewerbungen/'
alias cv='cd /home/felix/Desktop/Bewerbungen/'$cv'; vim lebenslauf.tex'
alias mkcv='mklatex /home/felix/Desktop/Bewerbungen/'$cv' lebenslauf'
alias mkcvo='mkcv; okular lebenslauf.pdf &> /dev/null &'
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
alias ...='cd ../..'
alias ....='cd ../../..'

# program shortcuts/enhancements
alias sshc='cat ~/.ssh/config'
alias rmj='rm job.{o,e}+([0-9])'
alias watchnv='watch -n 0.1 nvidia-smi'
alias fs='stat --file-system --format=%T .'
alias ssh='ssh -oStrictHostKeyChecking=no'
alias lsxargsl='ls -1 * | xargs -L 1 -I %'
alias xargsl='xargs -L 1 -I %'
alias volumeup='pactl set-sink-volume @DEFAULT_SINK@ 150%'
alias jn='jupyter-notebook'
alias jl='jupyter-lab'
alias cdl='cd $(ls -t | head -1)'
alias df='df -h'
alias free='free -h'
alias du='du -h'
alias du0='du -h -d 0'
alias du1='du -h -d 1'
alias du2='du -h -d 2'
alias ll='ls -lAh --color=auto'
alias llg='ll | egrep '
alias llt='ll -t | head'
alias llf='ls -1 -d */'
alias llw='ls -1 | wc -l'
alias llh='ls -la | head'
alias lls='ll -S'
alias nv='nvidia-smi'
alias chr='wmctrl -r Chrome -b remove,maximized_vert; wmctrl -r Chrome -b remove,maximized_horz; wmctrl -r Chrome -e 0,0,250,1080,1670'
alias python='python3'
alias pt='py.test --cache-clear --disable-warnings -v'
alias pts='py.test --cache-clear --disable-warnings -v --tb=line'
alias tree='tree -a -C -h -I __pycache__ -I .git'
alias golast='go "$(ls -t -1 | head -1)"'
alias watch='watch '
alias ve='virtualenv -p python3'
alias rsync='rsync -v -h -h --progress'
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
alias ipy='ipython --TerminalInteractiveShell.editing_mode=vi'
alias ipyrc='vim ~/.ipython/profile_default/startup/ipython_startup.py'
alias doch='sudo $(history -p !-1)'
alias bitc='~/bitcoin-qt/bitcoin-qt --datadir=/media/felix/Volume/Bitcoin'
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
alias go='xdg-open'
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
alias dpkgg='dpkg -l | grep'

# git
alias gitpua='~/git/scripts/small-scripts/gitpullall.py;'
alias gitpuaw='~/git/scripts/small-scripts/gitpullall.py --work;'
alias gitpuah='~/git/scripts/small-scripts/gitpullall.py --helixer;'
alias gitpuawh='~/git/scripts/small-scripts/gitpullall.py --work --helixer;'
alias gitl='git log --pretty=format:"%h - %an - %ar --- %s" --graph --color --branches -w'
alias gitsl='git shortlog --format="%ad - %h - %s" --reverse'
alias gitlong='git log --stat --color '
alias gitd='git difftool -y'
alias gitds='git difftool -y --staged'
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

gitgall() {
	git grep $1 $(git rev-list --all -- $2) -- $2
}

gitdbp() {
	git push --delete origin $1
	git branch -D $1
}

gitbp() {
	git checkout -b $1
	git push --set-upstream origin $1
}

giti() {
	vim `expr match "$(pwd)" '\(/home/felix/git/[a-zA-Z0-9_-]*/\)'`.gitignore
}

gitr() {
	cd `expr match "$(pwd)" '\(/home/felix/git/[a-zA-Z0-9_]*\)'`
}

gitacp() {
	if [[ $# -lt 1 ]]; then
		echo "Need commit message"
	else
		if [[ $(pwd) != *scripts ]]; then  # don't check for pudb when in the scripts git
			git grep "import pudb; pudb.set_trace()"
			if [[ $? -eq 0 ]]; then
				read -p $'\n'"pudb debugging found. Still continue? [y/N]" ok	
				if [[ -z $ok ]] || [[ $ok != "y" && $ok != "Y" ]]; then
					echo "Aborted."
					return 0
				fi
			fi
		fi
		git pull && git add $PWD && git commit -m "$1" && git push
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
