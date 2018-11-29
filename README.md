# HadoopDeployer
A bash script to automatically download, install, and configure Hadoop for the class cluster's datanodes. Also installs Zookeeper and Drill

Creates huser
Adds environnement variables to .profile
Adds hostnames for the 25 class computers
Creates the storage directories

Downloads and install Apache-Hadoop, Apache-Drill, and Apache-Zookeeper if not already installed
Downloads custom configurations for these tools

Datanode is good to go !

To start the datanode :
- $HADOOP_HOME/bin/hdfs --daemon start datanode
- $ZOOKEEPER_HOME/bin/zkServer.sh start
- $DRILL_HOME/bin/drillbit.sh
