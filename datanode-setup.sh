#!/bin/bash

adduser huser
wget -O /home/huser/.profile https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/.profile
source /home/huser/.profile 

for i in {1..25}; do
    if (( i < 10 )); then
        if ! grep NoeudBigData0$i /etc/hosts; then
            tee -a /etc/hosts <<< "10.78.104.$i NoeudBigData0$i"
        fi
    else
        if ! grep NoeudBigData$i /etc/hosts; then
            tee -a /etc/hosts <<< "10.78.104.$i NoeudBigData$i"
        fi
    fi
done

mkdir /data/small_cluster
mkdir /data/small_cluster/data
mkdir /data/small_cluster/tmp
mkdir /data/small_cluster/snn
mkdir /data/small_cluster/name
mkdir /data/small_cluster/dn
mkdir /data/small_cluster/zooData
tee -a /data/small_cluster/zooData/myid <<< $(sed "s/NoeudBigData//g" <<< $HOSTNAME)
chown huser:huser -R /data/small_cluster


if [ ! -d "/usr/local/hadoop-3.0.3" ]; then
    wget -O /usr/local/hadoop-3.0.3.tar.gz http://apache.mediamirrors.org/hadoop/common/hadoop-3.0.3/hadoop-3.0.3.tar.gz
    tar -xzvf /usr/local/hadoop-3.0.3.tar.gz -C /usr/local
fi

if [ ! -d "/usr/local/apache-drill-1.14.0" ]; then
    wget -O /usr/local/apache-drill-1.14.0.tar.gz http://apache.mediamirrors.org/drill/drill-1.14.0/apache-drill-1.14.0.tar.gz
    tar -xzvf /usr/local/apache-drill-1.14.0.tar.gz -C /usr/local
fi

if [ ! -d "/usr/local/zookeeper-3.4.13" ]; then
    wget -O /usr/local/zookeepper-3.4.13.tar.gz http://apache.mediamirrors.org/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz
    tar -xzvf /usr/local/zookeepper-3.4.13.tar.gz -C /usr/local
fi

wget -O /usr/local/hadoop-3.0.3/etc/hadoop/hadoop-env.sh https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/hadoop-env.sh
wget -O /usr/local/hadoop-3.0.3/etc/hadoop/hdfs-site.xml https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/hdfs-site.xml
wget -O /usr/local/hadoop-3.0.3/etc/hadoop/core-site.xml https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/core-site.xml
wget -O /usr/local/zookeeper-3.4.13/conf/zoo.cfg https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/zoo.cfg
wget -O /usr/local/apache-drill-1.14.0/conf/drill-override.conf https://raw.githubusercontent.com/AlexisVLRT/HadoopDeployer/master/drill-override.conf

chown huser:huser -R /usr/local/hadoop-3.0.3
chown huser:huser -R /usr/local/apache-drill-1.14.0
chown huser:huser -R /usr/local/zookeeper-3.4.13

