### Saving ENV variables
```BASH
export NAME=fleetman.k8s.local
export KOPS_STATE_STORE=s3://kubernetes-practice-state-storage
```

### Creating cluster
```
kops create cluster --zones us-east-2a,us-east-2b,us-east-2c --name ${NAME}
```

### Editing Max and Min number of nodes etc.
```
kops edit ig --name=${NAME}
```

### Creating nodes in AWS as per config
```
kops update cluster ${NAME} --yes
```

### Checking status of cluster
```
kops validate cluster
```
