kops create cluster --name=fleetman.k8s.local --node-count=4 --zones=us-east-2a,us-east-2b,us-east-2c --node-size=t2.micro --master-size=t2.micro --master-zones=us-east-2a --master-count=1 --yes
