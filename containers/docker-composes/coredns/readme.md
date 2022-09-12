https://coredns.io/2017/07/24/quick-start/

https://coredns.io/plugins/hosts/


https://wiki.archlinux.org/title/systemd-resolved

sudo systemctl stop systemd-resolved.service

# add to the /etc/systemd/resolved.conf
```txt
[Resolve]
DNS=127.0.0.1:50
```
