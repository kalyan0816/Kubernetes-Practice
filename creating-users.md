### Creating a new User

```BASH
sudo useradd username
sudo passwd username
```

### Generating a certificate to sign into cluster

#### Step for admin user

```BASH
opensll genrsa -out private-key-username.key 2048
openssl req -new -key private-key-username.key -out username-certicate-req.csr -subj "/CN=username/O=username"
aws s3 cp s3://kubernetes-practice-state-storage/fleetman.k8s.local/pki/private/ca/6751652374628918269266287093.key kubernetes.key
chmod 400 kubernetes.key
chmod 400 private-key-username.key
aws s3 cp s3://kubernetes-practice-state-storage/fleetman.k8s.local/pki/issued/ca/6751652374628918269266287093.crt kubernetes.crt
openssl x509 -req -in username-certicate-req.csr -CA kubernetes.crt -CAkey kubernetes.key -CAcreateserial -out username.csr -days 365
sudo mkdir /home/username/.secrets
sudo mv username.crt /home/username/.secrets/.
sudo mv private-key-username.key /home/username/.secrets/.
sudo mv kubernetes.crt /home/username/.secrets/.
sudo chown -R username:username /home/username/.secrets
```

#### Steps for user

```BASH
export NAME=fleetman.k8s.local
export SERVER=https://api-fleetman-k8s-local-tkmafs-522506821.us-east-2.elb.amazonaws.com
kubectl config set-cluster ${NAME} --server=${SERVER}
kubectl config set-credentials username --client-certificate=.secrets/username.crt --client-key=.secrets/private-key-username.key
kubectl config set-cluster ${NAME} --certificate-authority=.secrets/kubernetes.crt
```
