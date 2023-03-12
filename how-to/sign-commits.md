```bash
# reset the gpg format
git config --global --unset gpg.format

# set ssh as the gpg format
git config --global gpg.format ssh

# set the ssh signing key
git config --global user.signingkey /PATH/TO/.SSH/KEY.PUB

```
