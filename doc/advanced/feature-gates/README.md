# Feature Gates

[emptyDirLimits](#emptydirlimits)

## emptyDirLimits

We have attempted to be concious of resources wherever possible. To this end, some charts make use of [`emptyDir` volume mounts][emptyDir], which can be backed by the node disk, or via `tmpfs`. In an effort to curtail excessive consumption of either of these resources, we've also implemented the `sizeLimit` feature of the `emptyDir`. The downside to this usage is that `sizeLimit` is not available without a feature flag before Kubernetes `1.8.x`. Starting in Kubernetes `1.7.x`, this is an Alpha feature, and can be enabled individually with the `LocalStorageCapacityIsolation` feature gate.

[emptyDir]: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir
[emptyDirVolumeSource]: https://v1-8.docs.kubernetes.io/docs/api-reference/v1.8/#emptydirvolumesource-v1-core
