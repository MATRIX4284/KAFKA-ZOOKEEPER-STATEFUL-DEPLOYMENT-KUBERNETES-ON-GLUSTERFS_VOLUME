#!/bin/bash
kubectl config set-context $(kubectl config current-context) --namespace=ignite
../K8-services-bin/start-glusterfs-services.sh
../K8-services-bin/start_zookeeper_stateful-K8.sh
../K8-services-bin/start-kafka-stateful-K8.sh

