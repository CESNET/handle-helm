Handle.net Helm chart
=====================

Helm chart for deployment of the [Handle.net][handle.net] CESNET registry in a Kubernetes cluster.

Requirements
------------

This chart requires a [handle-docker](https://github.com/CESNET/handle-docker) image to be built and published to a Docker registry used by your Kubernetes cluster.

Install
-------
```
git clone https://github.com/CESNET/handle-helm
helm install cesnet-hdl ./handle-helm --set service.type=NodePort
```