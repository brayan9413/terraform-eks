# terraform-eks

## Overview

EKS cluster using terraform

## APPLY STEPS

1. Check terraform version with tfenv - https://github.com/tfutils/tfenv

```sh
tfenv use
```

2. Run apply (First time)

```sh
terraform init
terraform apply -target="module.vpc" -auto-approve
terraform apply -target="module.eks" -auto-approve
terraform apply -auto-approve
```

3. Set up context
export EKS_CLUSTER_NAME=<cluster-name>
export AWS_REGION='us-east-1'

