#! /bin/bash

watch -n 1 'kubectl get hpa
echo -e "\n\n\n\n"
kubectl get po -owide | sort -k 7
echo -e "\n\n\n\n"
gcloud container clusters list'