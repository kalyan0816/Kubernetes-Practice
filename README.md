export NAME=fleetman.k8s.local
export KOPS_STATE_STORE=s3://kubernetes-practice-state-storage
kops create cluster --zones us-east-2a,us-east-2b,us-east-2c --name ${NAME}
kops edit ig --name=${NAME}
kops update cluster ${NAME} --yes
kops validate cluster
