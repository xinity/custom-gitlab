# GitLab Operator

GitLab operator is an implementation of the [Operator pattern](https://coreos.com/blog/introducing-operators.html) for installation and management of GitLab. This component provides a method of synchronizing and controlling various stages of cloud-native GitLab installation/upgrade procedures. Using the operator we provide functionalities that weren't possible for us before such as doing upgrades without down time.


## Operator chart

We provide an [operator chart](../../charts/gitlab/charts/operator) for installing the operator. If enabled it installs the operator which assumes control of the installation process that was previously manage by helm. The chart is disabled by default.

### Enabling the operator

We provide the flag `global.operator.enabled`, when set to true it enables the operator and allows it to manage resources.

## Installing using the operator

Since helm will be used for installation, `GitLab` `CRD` needs to be in place  before we attempt to create a resource of `Kind: GitLab`. In order to achieve this we have split the first time installation method into 2 commands.

1. `helm upgrade --install <release-name> . --set global.gitlab.operator.enabled=true --set global.gitlab.operator.nodeploy=true ... ` where `...` shall be replaced by the rest of the values you would like to set.
2. `helm upgrade <release-name> . --set global.gitlab.operator.nodeploy=false ...`.

The first command will install only the `CRD` but will not actually attempt to deploy the operator. The second command will attempt to deploy it and the `CRD` would be in place as a result of running command 1.

This needs to be done only the first time you install the operator, upgrades after that will follow the normal [upgrade procedures](./upgrade.md)
