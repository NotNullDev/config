# Installing

Check out [link](https://github.com/kubernetes-csi/csi-driver-smb) from more information

https://github.com/kubernetes-csi/csi-driver-smb/blob/master/docs/install-csi-driver-v1.8.0.md

```shell
kubectl create secret generic smbcreds --from-literal username="<username>" --from-literal password="<password>"
# optional add domain
kubectl create secret generic smbcreds --from-literal username="<username>" --from-literal password="<password>" --from-literal domain="<domain>"

```

https://github.com/kubernetes-csi/csi-driver-smb/blob/master/docs/driver-parameters.md