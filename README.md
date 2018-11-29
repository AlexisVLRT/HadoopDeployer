# HadoopDeployer
A bash script to automatically download, install, and configure Hadoop for the class cluster's datanodes. Also installs Zookeeper and Drill

Download datanode-setup.sh to your ~/ and execute as root from there.

- Creates huser
- Adds environnement variables to .profile
- Adds hostnames for the 25 class computers
- Creates the storage directories
- Downloads and installs Apache-Hadoop, Apache-Drill, and Apache-Zookeeper if not already installed
- Downloads and installs custom configurations for these tools

Datanode is good to go !

To start the datanode, copy and execute :
- $HADOOP_HOME/bin/hdfs --daemon start datanode
- cd $ZOOKEEPER_HOME;bin/zkServer.sh start
- cd;$DRILL_HOME/bin/drillbit.sh
