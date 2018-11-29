#!/bin/bash

adduser huser
scp huser@10.78.104.18:~/.profile .profile
source /home/huser/.profile 

for i in {1..25}; do
    if (( i < 10 )); then
        if ! grep NoeudBigData18 /etc/hosts; then
            tee -a /etc/hosts <<< "10.78.104.$i NoeudBigData0$i"
        fi
    else
        if ! grep NoeudBigData18 /etc/hosts; then
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

cp /usr/local/zookeeper-3.4.13/conf/zoo_sample.cfg /usr/local/zookeeper-3.4.13/conf/zoo.cfg
for i in {1..25}; do
    if (( i < 10 )); then
        if ! grep server.$i=NoeudBigData0$i:2888:3888 /usr/local/zookeeper-3.4.13/conf/zoo.cfg; then
            tee -a /usr/local/zookeeper-3.4.13/conf/zoo.cfg <<< "server.$i=NoeudBigData0$i:2888:3888"
        fi
    else
        if ! grep server.$i=NoeudBigData$i:2888:3888 /usr/local/zookeeper-3.4.13/conf/zoo.cfg; then
            tee -a /usr/local/zookeeper-3.4.13/conf/zoo.cfg <<< "server.$i=NoeudBigData$i:2888:3888"
        fi
    fi
done
sed -i -e 's/\/tmp\/zookeeper/\/data\/small_cluster\/zooData/g' /usr/local/zookeeper-3.4.13/conf/zoo.cfg

scp huser@10.78.104.18:/usr/local/hadoop-3.0.3/etc/hadoop/hadoop-env.sh /usr/local/hadoop-3.0.3/etc/hadoop/hadoop-env.sh
scp huser@10.78.104.18:/usr/local/hadoop-3.0.3/etc/hadoop/hdfs-site.xml /usr/local/hadoop-3.0.3/etc/hadoop/hdfs-site.xml
scp huser@10.78.104.18:/usr/local/hadoop-3.0.3/etc/hadoop/core-site.xml /usr/local/hadoop-3.0.3/etc/hadoop/core-site.xml


chown huser:huser -R /usr/local/hadoop-3.0.3
chown huser:huser -R /usr/local/apache-drill-1.14.0
chown huser:huser -R /usr/local/zookeeper-3.4.13

