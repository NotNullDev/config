# Installation guide

    https://metallb.universe.tf/installation/


# Post install steps (REQUIRED)

Quoting the documentation:

>The installation manifest does not include a configuration file. MetalLB’s components will still start, but will remain idle until you start deploying resources.

    You have to find network on which your nodes are avaialble, then assign some of the free ips in found range to metallb

    Example:
    If your range is 192.168.0.1/24 you can check your range using command


After intsallation nothing will happen by iteself.

You have to assign to the MetalLB address pool that he can use to assign addresses.

Following commands may be helpful:
`sipcalc 192.168.0.1/24`
`arp`

You have to configure metalb in oreder to work

Follow the steps at: [MetalLB configuration](https://metallb.universe.tf/configuration/)

Helpful video: [JustmeandOpensource](https://www.youtube.com/watch?v=VHJ6qM9EVbs&ab_channel=JustmeandOpensource)

[Official troubleshooting guide](https://metallb.universe.tf/configuration/troubleshooting/)