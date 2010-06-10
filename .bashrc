
# os

initCygwin() {
    if [ -f /cygdrive/d/as/emacs/emacs/bin/runemacs.exe ]; then
        export PATH=/cygdrive/d/as/emacs/emacs/bin:$PATH
    fi
}

CYGWIN_=no

case "`uname`" in
    CYGWIN*     )
        CYGWIN_=yes
        initCygwin ;;
esac

# notes
#if [ ${CYGWIN_} != "yes" ]; then
#    [ -f ~/.plan ] && cat ~/.plan
#fi

echo "zeromq"
echo "wmaker + p"
echo "ad serve"

# Home stuff
# FIXME: does not work for some reason
#[ -f ~/bin/django-bash-completion ] && . ~/bin/django-bash-completion

[ -f /usr/GNUstep/System/Library/Makefiles/GNUstep.sh ] && . /usr/GNUstep/System/Library/Makefiles/GNUstep.sh

if [ -d /usr/java/jdk1.6.0_06 ]; then
	export JAVA_HOME=/usr/java/jdk1.6.0_06
	export PATH=/usr/java/jdk1.6.0_06/bin:$PATH
fi

export GIT_AUTHOR_NAME='gene9'
export GIT_AUTHOR_EMAIL='a@example.com'

export GOROOT=/home/andrey/projects/go
export GOOS=linux
export GOARCH=386
export GOBIN=/home/andrey/bin/go-bin
export PATH=$GOBIN:$PATH

export SVN_EDITOR=gvim

export PATH=~/bin:/usr/lib/erlang/bin:$PATH
export PATH=~/bin/dmd/linux/bin:$PATH
#export PATH=~/projects/llvm/Debug/bin:$PATH

export PATH=~/android-sdk-linux_x86-1.5_r1/tools:$PATH

export BOOST_ROOT=~/projects/boost_1_38_0
export BOOST_INCLUDEDIR=~/projects/boost_1_38_0
export BOOST_LIBRARYDIR=~/projects/boost_1_38_0/stage/lib

export THREAD_POOL_INCLUDE_DIR=~/projects/kvdb/src/external/threadpool
export LOGGING_INCLUDE_DIR=~/projects/kvdb/src/external/logging

export IDEA_JDK=/usr/lib/jvm/java

alias ls="ls --color"
alias l="ls --color"
alias ll="ls -l --color"

if [ -f `which uxterm 2>/dev/null` ]; then
      alias xterm="uxterm"
fi

export PS1="[\u@\h \w]# "

cd () {
	builtin cd $@

	S=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'` 

	if [ x"$S" != x ]; then
		export PS1="[\u@\h \w] *${S}* # "
	else
		export PS1="[\u@\h \w]# "
	fi
}     

if [ CYGWIN_ == "yes" ]; then
	x=1
else
    [ -f /etc/bash_completion ] && . /etc/bash_completion
fi

export NTWU="nanotw"
export NTWP=""

# Concord stuff

if [ -f /opt/eHealth/nethealthrc.sh ]; then
. /opt/eHealth/nethealthrc.sh
fi
      
export CMSHOME=/home/cms
export CMS_NH_DB=oracle

if [ `uname` != "HP-UX" ]; then
    export TARGET_OS=sunOs.5.4
else
    export TARGET_OS=hpUx.11.0
fi

# CC/CQ stuff
export CQCC_SERVER=shelob
export CQCC_SERVERROOT=cqweb

# Merge Xresources with main database
if [ ! -z $DISPLAY ]; then
    [ -e ~/.Xresources ] && xrdb -merge ~/.Xresources
fi

# Yes, I'd like to keep huge history
export HISTSIZE=5000

# ClearCase
alias nautilus_inc_save="cleartool setview andreys_nautilus_inc_save; cleartoll pwv"
alias andreys_58="cleartool setview andreys_58; cleartool pwv"

# Other
alias lsv="cleartool lsview"
alias l="ls"
alias ll="ls -l"
alias Grep="grep"

#if [ `uname` == "HP-UX" ]; then
#    alias vim="/usr/local/bin/gvim"
#else
#    if [ `uname` != "Linux" ]; then
#        alias vim="/home/eng/asidorenko/vim/vim -g"
#        export VIM=/home/eng/asidorenko/vim/vim62
#    fi
#fi

alias wsc="cd /vobs/wsCore"
alias wsa="cd /vobs/wsApps"
alias cdf="cd /vobs/frameworks/cdf"
alias dulib="cd /vobs/frameworks/cdf/duLib"
alias duinc="cd /vobs/frameworks/include/cdf"
alias em="emacs"
alias ora="cd /vobs/wsCore/oracle"

history_control=ignoredups


#if [ `uname` == "HP-UX" ]; then
#    export PATH=$PATH:/home/cms/bin:/home/cms/bin/hpUx.11.0:/usr/atria/bin:/home/dmz/asidorenko/bin:/home/tools/bin
#else
#    export PATH=$PATH:/home/cms/bin:/home/cms/bin/sunOs.5.4:/usr/atria/bin:/home/dmz/asidorenko/bin:/home/tools/bin:/home/dmz/asidorenko/pytho/bin
#fi

if [ -z $CLEARCASE_ROOT ]; then
    export PS1='[\u@\h:\W]$ '
else
    export PS1Z=`echo $CLEARCASE_ROOT|awk -F/ '{ print $NF }'`
    export PS1='{$PS1Z} \h:\W $ '
fi

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/eng/asidorenko/vim
export TMPDIR=/tmp

ldpath() {
    export LD_LIBRARY_PATH=/vobs/top/frameworks/sharedLib/sunOs.5.4:$LD_LIBRARY_PATH
}

d() {
    [ ! -z $1 ] && export DISPLAY=$1
    echo $DISPLAY
}

lscome() {
    cleartool lsco -me -cview
}

forcemerge() {
    echo "FORCE Merging all checked out files in current dir"

    for f in `cleartool lsco -me -cview -s`; do
        ver=`cleartool lshist -bra firebird $f | head -1 | cut -f3 -d'@'`
        ver=`echo $ver | cut -f1 -d'"'`
        branch=`echo $ver | cut -f3 -d'/'`
        cleartool merge -to $f -g -version $ver
    done

}
                    
amerge() {
    echo "Merging all checked out files in current dir"

    for f in `cleartool lsco -me -cview -s`; do
        ver=`cleartool ls $f | cut -f3 -d' '`
        cleartool findm $f -fversion $ver -unres -gmerge
    done

}

sv() {
    echo "Setting view..."
    cleartool setview $1
    echo $1 > ~/.sv.last
}

# Restore view

#export DISPLAY=tswindev20:0.0
#. /home/eng/asidorenko/.cmsrc.bash_aliases
#. ~/src/csh-compat

if [ ! -z $PS1Z ]; then
    title "$PS1Z"
fi
