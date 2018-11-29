# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# USER SET
export HADOOP_HOME=/usr/local/hadoop-3.0.3
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export ZOOKEEPER_HOME=/usr/local/zookeeper-3.4.13
export DRILL_HOME=/usr/local/apache-drill-1.14.0
export PATH=${PATH}:${HADOOP_HOME}/bin:${JAVA_HOME}:${ZOOKEEPER_HOME}/bin:${DRILL_HOME}/bin
