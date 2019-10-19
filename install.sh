#! /bin/bash

set -xe

# 1.- Create cluster (terraform)
cd terraform && source install.sh && cd ..

# 2.- Configure the context (terraform_values->project-id)
export CLUSTER_NAME=$(grep -ie "cluster-name" -A 1 terraform/variables.tf \
    | grep -v variable | cut -d "=" -f 2 | tr -d '" ')
read cluster zone < <(gcloud container clusters list | grep -e "${CLUSTER_NAME}" | awk '{print $1,$2}')
gcloud container clusters get-credentials \
    ${cluster} --zone=${zone}

# 3.- Install the metrics adapter
. custom-metrics/install.sh 

# 4.- Install and patch the nginx ingress controller
. nginx-ingress-controller/install.sh

# 5.- Deploy your actual app c:
kubectl apply -f flask-app/

echo "Waiting 25 sec to have the metrics adapter up and running" && sleep 25

# Query the custom and external metrics
kubectl get --raw "/apis/external.metrics.k8s.io/v1beta1" | jq -C .
kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta2" | jq -C .