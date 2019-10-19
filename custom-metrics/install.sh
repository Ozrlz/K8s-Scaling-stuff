#! /bin/bash

# Create the clusterrolebinding to gain RBAC access to create the needed resources
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole cluster-admin \
    --user "$(gcloud config get-value account)"

# "Install" the custom/external metrics adapter

kubectl create -f \
    https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-stackdriver\
/master/custom-metrics-stackdriver-adapter/deploy/production/adapter.yaml