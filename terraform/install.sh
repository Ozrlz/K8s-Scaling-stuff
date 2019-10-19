#! /bin/bash

export GOOGLE_CLOUD_KEYFILE_JSON="./svc-account.json"

terraform init && \
terraform validate && \
terraform plan && \
terraform apply