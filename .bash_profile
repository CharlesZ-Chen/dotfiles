# For configuring Mac as Linux and also GNU cmd line tools
# https://danielmiessler.com/blog/first-10-things-new-mac/
# https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

# using GNU coreutils in their normal names
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Also the GNU coreuitls MANPAGE
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# http://stackoverflow.com/questions/6588390/where-is-java-home-on-osx-yosemite-10-10-mavericks-10-9-mountain-lion-10
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Programming Dir and JSR308 configuration
export PROG_DIR=~/Programming
export JSR308=$PROG_DIR/UWaterloo/jsr308
export CHECKER_FRAMEWORK=$JSR308/checker-framework
export DLJC=$JSR308/do-like-javac
export AFU=$JSR308/annotation-tools/annotation-file-utilities
export PATH=$AFU/scripts:${PATH}
alias javac-dev=$CHECKER_FRAMEWORK/checker/bin-devel/javac

# util function for easy login in to ece & cs server in uwaterloo
ecelinux(){
	if [ "$#" -ge 1 ]
	then if [ "$1" == '-cs' ]
	     then if [ "$#" == 2 ]
		  then ssh $QUEST_ACCOUNT@ubuntu1204-$2.student.cs.uwaterloo.ca
		  else ssh $QUEST_ACCOUNT@ubuntu1204-002.student.cs.uwaterloo.ca
	       	  fi
	     elif [ "$1" == '-h' ]
	     then printf "usage: default ecelinux4, -cs to cslinux(ubt-002), # for ecelinux#\n"
	     else ssh $QUEST_ACCOUNT@ecelinux$1.uwaterloo.ca
	     fi
	else ssh $QUEST_ACCOUNT@ecelinux4.uwaterloo.ca
	fi
}

# add colors with ls
alias ls="ls -G"

# useful app shortcuts
alias sublime='open -a "sublime text 2"'
alias eclipse='open -a "Eclipse"'

#enable pyenv 'shell' feature
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


# .bash_secrets file vars list
# # quest account name for ecelinux function
# export QUEST_ACCOUNT
source ~/.bash_secrets

