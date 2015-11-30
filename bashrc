# .bashrc
TERM=xterm-color

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dstat='dstat -cdlmnpsy'
alias ag='ag -s'

#######################################
# Some useful commands to use docker.
# Author: yeasy@github
# Created:2014-09-25

alias docker-pid="sudo docker inspect --format '{{.State.Pid}}'"
alias docker-ip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

#the implementation refs from https://github.com/jpetazzo/nsenter/blob/master/docker-enter
function docker-enter() {
    if [ -e $(dirname "$0")/nsenter ]; then
        # with boot2docker, nsenter is not in the PATH but it is in the same folder
        NSENTER=$(dirname "$0")/nsenter
    else
        NSENTER=nsenter
    fi
    [ -z "$NSENTER" ] && echo "WARN Cannot find nsenter" && return

    if [ -z "$1" ]; then
        echo "Usage: `basename "$0"` CONTAINER [COMMAND [ARG]...]"
        echo ""
        echo "Enters the Docker CONTAINER and executes the specified COMMAND."
        echo "If COMMAND is not specified, runs an interactive shell in CONTAINER."
    else
        PID=$(sudo docker inspect --format "{{.State.Pid}}" "$1")
        if [ -z "$PID" ]; then
            echo "WARN Cannot find the given container"
            return
        fi
        shift

        OPTS="--target $PID --mount --uts --ipc --net --pid"

        if [ -z "$1" ]; then
            # No command given.
            # Use su to clear all host environment variables except for TERM,
            # initialize the environment variables HOME, SHELL, USER, LOGNAME, PATH,
            # and start a login shell.
            #sudo $NSENTER "$OPTS" su - root
            sudo $NSENTER --target $PID --mount --uts --ipc --net --pid su - root
        else
            # Use env to clear all host environment variables.
            sudo $NSENTER --target $PID --mount --uts --ipc --net --pid env -i $@
        fi
    fi
}
#######################################
export LANG=C
export LC_CTYPE=en_US.UTF-8
#export JAVA_HOME=/usr/java/java-openjdk6/build/linux-amd64/j2sdk-image
#export JAVA_HOME=/usr/java/java-openjdk6/build/linux-amd64-debug/j2sdk-image
#export JAVA_HOME=/usr/java/java-openjdk6/build/linux-amd64-fastdebug/j2sdk-image

#export JAVA_HOME=/usr/java/jdk1.6.0_32
#
#export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
#export PATH=$JAVA_HOME/bin:$PATH
#
#export HBASE_HOME=/usr/local/hbase/hbase-0.92.1
#export PATH=$HBASE_HOME/bin:$PATH
#
#export HADOOP_HOME=/usr/local/hadoop/hadoop-0.20.205.0
#export PATH=$HADOOP_HOME/bin:$PATH
#
#export MONGODB_HOME=/usr/local/mongodb/mongodb-linux-x86_64-2.0.5
#export PATH=$MONGODB_HOME/bin:$PATH
#
#export MAVEN_HOME=/usr/local/maven/apache-maven-3.0.4
#export PATH=$MAVEN_HOME/bin:$PATH
#
#export ANT_HOME=/usr/local/ant/apache-ant-1.8.3
#export PATH=$ANT_HOME/bin:$PATH
#
#export M2_HOME=/usr/local/maven/apache-maven-3.0.4
#export PATH=$M2_HOME/bin:$PATH
#
#export PATH=/opt/CodeSourcery/Sourcery_G++_Lite/bin:$PATH
#export PATH=/usr/local/nginx/sbin:$PATH
#
#export GOROOT=~/Explores/go
#export GOBIN=$GOROOT/bin
#export GOARCH=amd64
#export GOOS=linux
#export PATH=$GOBIN:$PATH
#
#export TIMOUT=1000000 
#
export PATH=~/usr/bin:$PATH:/usr/sbin
#export PATH=~/.cabal/bin:$PATH
#
#export MANPATH=${MANPATH}:/usr/local/texlive/2014/texmf-dist/doc/man
#export INFOPATH=${INFOPATH}:/usr/local/texlive/2014/texmf-dist/doc/info
#export PATH=${PATH}:/usr/local/texlive/2014/bin/x86_64-linux
#
#PS1='${debian_chroot:+($debian_chroot)}\[\e[1;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

