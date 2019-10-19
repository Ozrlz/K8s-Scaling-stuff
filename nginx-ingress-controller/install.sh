#! /bin/bash

# Create the general resources
kubectl apply -f <(curl -s https://raw.githubusercontent.com/kubernetes/ingress-nginx/\
master/deploy/static/mandatory.yaml|sed -e 's/kubernetes.io\/os/beta.kubernetes.io\/os/g')

# Create LB
kubectl apply -f https://raw.githubusercontent.com/kubernetes/\
ingress-nginx/master/deploy/static/provider/cloud-generic.yaml

# Patch Deployment, to add a sidecar and have metrics on stackdriver

kubectl -n ingress-nginx patch deployment nginx-ingress-controller --patch \
"$(cat nginx-ingress-controller/ingress-controller-patch.yaml)"