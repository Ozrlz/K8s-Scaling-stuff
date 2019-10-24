# GKE CA & HPA with resource, custom and external metrics demo

## About
This is a repo that contains the neccesary to create a GKE cluster using terraform and deploy a custom|external metrics adapter, nginx ingress controller and a demo app.

The metrics are being sent from the ingress controller to stackdriver and the HPA pulls metrics from here.

## Requirements
An env, the google cloud shell. If you prefer to run this from your local pc, you need to install the Google Cloud SDK and authenticate (needed to configure the kubeconfig context), a service account json file (with the required roles to create a gke cluster) and the kubectl installed.

## How to use it
If using your local pc, you need to authenticate the cloud sdk.
It is important that you place your json file in the terraform directory as svc-account.json. You can either use the gcloud init command or the service account json file to authenticate:

```bash
gcloud auth activate-service-account --key-file=${PATH_TO_UR_SVC_ACCOUNT.json}
```

Once authenticated, change the terraform/variables.tf and place your project id as the projec-id value.
After that, you just need to run the install script:

```bash
./install.sh
```

## Clean up
It is important to define the env variable GOOGLE_CLOUD_KEYFILE_JSON to destroy the cluster using terraform, so you can do the following:

```bash
cd terraform
export GOOGLE_CLOUD_KEYFILE_JSON="./svc-account.json"
terraform destroy -auto-approve
```

#### Weird issue with kubectl
https://github.com/kubernetes/kubectl/issues/568
#### Issue to explain more Values vs AverageValue
https://github.com/kubernetes/kubernetes/issues/79272
