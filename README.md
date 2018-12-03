# HadoopDeployer
A bash script to automatically download, install, and configure Hadoop for the class cluster's datanodes. Also installs Zookeeper and Drill

# Features

- Creates huser
- Adds environnement variables to .profile
- Adds hostnames for the 25 class computers
- Creates the storage directories
- Downloads and installs Apache-Hadoop, Apache-Drill, and Apache-Zookeeper if not already installed
- Downloads and installs custom configurations for these tools

# Instructions

Download datanode-setup.sh and execute it using the folowwing commands :

 - wget -O ~/datanode-setup.sh https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/datanode-setup.sh
 - chmod +x ~/datanode-setup.sh
 - su
 - ./datanode-setup.sh

Datanode is good to go !

To start the datanode, copy and execute as huser:

- source .profile
- $HADOOP_HOME/bin/hdfs --daemon start datanode
- cd $ZOOKEEPER_HOME;bin/zkServer.sh start
- cd;$DRILL_HOME/bin/drillbit.sh start
