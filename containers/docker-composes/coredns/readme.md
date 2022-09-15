https://coredns.io/2017/07/24/quick-start/

https://coredns.io/plugins/hosts/


https://wiki.archlinux.org/title/systemd-resolved

sudo systemctl stop systemd-resolved.service

# add to the /etc/systemd/resolved.conf
> You must add  DNSStubListener on the server that will host dns server, else must likely systemd-resolved is listening on it
```shell
lsof -i :53 # check what is using port 53
``` 
```txt
[Resolve]
DNS=127.0.0.1:50
DNSStubListener=no
```
sudo systemctl restart systemd-resolved.service