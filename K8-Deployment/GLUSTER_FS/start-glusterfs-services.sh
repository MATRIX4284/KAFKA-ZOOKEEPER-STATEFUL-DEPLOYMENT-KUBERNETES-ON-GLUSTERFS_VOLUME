#!/bin/bash

cd /home/system/IGNITE/IGNITE-2.7-Kubernetes-1.13_GOLDEN_COPY/GLUSTER_FS
kubectl create -f glusterfs-endpoints.json
kubectl create -f glusterfs-service.json

