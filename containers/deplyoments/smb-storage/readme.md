# Installing

# WARNING

> change source parameters.source field in storageclass.yaml to match network location of the smb server
> change <username> and <password> in the command below to match credentials of the network location from the step above

Check out [link](https://github.com/kubernetes-csi/csi-driver-smb) from more information

<https://github.com/kubernetes-csi/csi-driver-smb/blob/master/docs/install-csi-driver-v1.8.0.md>

```shell
kubectl create secret generic smbcreds --from-literal username="<username>" --from-literal password="<password>"

# OR
# (optional) add domain

kubectl create secret generic smbcreds --from-literal username="<username>" --from-literal password="<password>" --from-literal domain="<domain>"
```

# make this storageclass default

kubectl patch storageclass smb -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

<https://github.com/kubernetes-csi/csi-driver-smb/blob/master/docs/driver-parameters.md>
