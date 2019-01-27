# KAFAK-ZOOKEEPER-STATEFUL-ON-GLUSTERFS_VOLUME

This Deployment shows how to Set Up a Kafka Deployment on Kubernetes.
As Kafka needs Zookeeper hence Zookeeper has also been deployed in a Stateful manner in Kubernetes.

For Stateful Deployment I have used GLUSTERFS Volume or storage As GLUSTERFS is officially suppoted By Kubernetes.


So before we start off with the stateful Kafka Deployment on Kubernetes we have to setup the GLUSTERFS in our mnachines or cloud.

On Normal machine it is better to go for a separate external/internal hard drive to mount the glusterfs volume.

For Glusterfs Setup:

1.sudo nano /etc/hosts

192.168.0.101 GlusterFS1
192.168.0.102 GlusterFS2
192.168.0.103 GlusterFS-Client

2.Test:
ping GlusterFS1
ping GlusterFS2
ping GlusterFS-Client

3.sudo apt-get install software-properties-common -y

4.sudo add-apt-repository ppa:gluster/glusterfs-3.10

5.sudo apt-get update -y

6.sudo apt-get install glusterfs-server -y

7.systemctl start glusterfs-server 

8.systemctl enable glusterfs-server

9.systemctl status glusterfs-server

9.sudo fdisk /dev/sdb

10.mkfs.ext4 /dev/sdb1

11.mkdir /glusterfs

12.mount /dev/sdb1 /glusterfs

13.sudo nano /etc/fstab

/dev/sdb1 /glusterfs ext4 defaults 0 0

gluster peer probe GlusterFS2

gluster pool list

sudo mkdir /glusterfs/kube_vol


gluster volume create kube_vol replica 2 GlusterFS1:/glusterfs/kube_vol GlusterFS2:/glusterfs/kube_vol

gluster volume start kube_vol

gluster volume info kube_vol

sudo apt-get install software-properties-common -y

sudo add-apt-repository ppa:gluster/glusterfs-3.10

sudo apt-get install glusterfs-client -y

sudo mount -t glusterfs GlusterFS1:/kube_vol /mnt

GlusterFS1:/kube_vol /glusterfs glusterfs  defaults,_netdev 0 0

sudo mount -t glusterfs GlusterFS2:/kube_vol /mnt

GlusterFS2:/kube_vol /glusterfs glusterfs  defaults,_netdev 0 0

sudo touch glusterfs/test1

sudo ufw allow proto any from 192.168.1.243 to 192.168.1.244
sudo ufw allow proto any from 192.168.1.244 to 192.168.1.243


After you are done with your Glusterfs setup:

START THE KAFKA & ZOOKEEPER STATEFUL DEPLOYMENT ON GLUSTERFS VOLUME:

cd bin
./start-kafka-zk-stateful.sh

To Verify whether Kafka , Zookeeper Deployments are running:

kubectl get po -o wide --all-namespaces 

To Verify whether Kafka , Zookeeper Services are running:

kubectl get svc -o wide --all-namespaces 






