# Register gitlab runner:

(official docs)[https://docs.gitlab.com/runner/register/index.html#docker]

https://docs.gitlab.com/runner/examples/gitlab.html
https://techoverflow.net/2021/01/12/how-to-install-gitlab-runner-using-docker-compose/

# Register gitlab runner (TODO: automate this step)

1. ssh into runner container

```shell
gitlab-runner register
```

go to the https://<gitlab_url>/admin/runners page

and copy the token, as host provide:
http://gitlab

# CI/CD examples

https://docs.gitlab.com/ee/ci/examples/
Quick start:
https://docs.gitlab.com/ee/ci/quick_start/

# Gitlab and container registry

> provided container registry from docker image can be accessed from registry:5000 via gitlab
> https://docs.gitlab.com/ee/user/packages/container_registry/

# Changing dns name

> TIP: host.docker.internal is address to the host localhost

https://docs.gitlab.com/omnibus/settings/dns.html
https://docs.gitlab.com/omnibus/settings/configuration.html#configure-the-external-url-for-gitlab

Inside container:

```shell
vi /etc/gitlab/gitlab.rb
# search for external_url
gitlab-ctl reconfigure
```

# Offline install guide

## Qucik start

https://docs.gitlab.com/ee/topics/offline/quick_start_guide.html

## Disable usage statistics

https://docs.gitlab.com/ee/user/admin_area/settings/usage_statistics.html#enable-or-disable-usage-statistics

## Docker resources

https://github.com/sameersbn/docker-gitlab/blob/master/docker-compose.yml

# gen-cert.sh sample usage ??

```shell
bash gen-cert.sh gitlab.example.com xdxdxdxd
```
