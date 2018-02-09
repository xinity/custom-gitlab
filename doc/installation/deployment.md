# Deployment

## Deploy Let's Encrypt

> *Note:* Skip this step if you are using [Wildcard certificates](secrets.md#wildcard-certificates)

Follow the steps in the [kube-lego documentation](../kube-lego/README.md) to deploy the Kubernetes Let's Encrypt Chart.

## Deploy GitLab

To deploy, we'll run `helm install` with our configuration file, from the
root of this repository:

```
helm install --name gitlab -f configuration.yaml .
```

This will output the list of resources installed once the deployment finishes which may take 5-10 minutes.

The status of the deployment can be checked by running `helm status gitlab` which can also be done while
the deployment is taking place if you run the command in another terminal.
