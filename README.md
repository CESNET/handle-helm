Handle.net Helm chart
=====================

Helm chart for deployment of the [Handle.net](https://handle.net) CESNET registry in a Kubernetes cluster.

Requirements
------------

This chart requires a [handle-docker](https://github.com/CESNET/handle-docker) image to be built and published to a Docker registry used by your Kubernetes cluster.

Quickstart
----------
```
git clone https://github.com/CESNET/handle-helm
helm install example-hdl ./handle-net
```

Configuration
-------------

The following table lists the configurable parameters of the handle-net chart and their default values.

| Parameter                                    | Description                                      | Default                                                 |
| -------------------------------------------- | ------------------------------------------------ | ------------------------------------------------------- |
| `global.imageRegistry`                       | Global Docker image registry                     | `nil`                                                   |
| `global.imagePullSecrets`                    | Global Docker registry secret names as an array  | `[]` (does not add image pull secrets to deployed pods) |
| `replicaCount`                               | Number of replicas to be spawned                 | `1`                                                     |
| `image.registry`                             | Docker Image registry                            | `docker.io`                                             |
| `image.repository`                           | Handle docker image repository                   | `mirekys/handle`                                        |
| `image.tag`                                  | Handle docker image tag                          | `9.2.0`                                                 |
| `image.pullPolicy`                           | Handle docker image pull policy                  | `IfNotPresent`                                          |
| `image.pullSecrets`                          | Name of a secret to pull the image               | `[]`                                                    |
| `service.name`                               | Name of the handle service stateful set          | `example-handle`                                        |
| `service.type`                               | Type of the kubernetes service                   | `NodePort`                                              |
| `service.port`                               | HTTP port of the service                         | `8000`                                                  |
| `service.clientPort`                         | Handle client handler port of the service        | `2641`                                                  |
| `handle.user`                                | Handle container user uid                        | `1000`                                                  |
| `handle.srvDir`                              | Handle site config directory                     | `/srv/handle`                                           |
| `handle.certificationPassphrase`             | Handle site Certification key passphrase         | `handl3.net-CHANGEME!!!`                                |
| `handle.existingCertificationSecret`         | Certification key passphrase secret name         | `nil`                                                   |
| `handle.administrativePassphrase`            | Handle site Administrative key passphrase        | `handl3.net-adm-CHANGEME!!!`                            |
| `handle.existingAdministrativeSecret`        | Administrative key passphrase secret name        | `nil`                                                   |
| `securityContext.enabled`                    | Enable security context                          | `true`                                                  |
| `securityContext.runAsNonRoot`               | Run containers as non-root user                  | `true`                                                  |
| `securityContext.fsGroup`                    | Group ID for the container                       | `1000`                                                  |
| `securityContext.runAsUser`                  | User ID for the container                        | `1000`                                                  |
| `resources`                                  | Resource needs and limits to apply to the pod    | `{}`                                                    |
| `updateStrategy.type`                        | Statefulset update strategy policy               | `RollingUpdate`                                         |
| `rbacEnabled`                                | Is RBAC enabled in the cluster?                  | `false`                                                 |
| `serviceAccount.create`                      | Create a service account                         | `true`                                                  |
| `serviceAccount.name`                        | The name of the service account to use           | `nil` (If not set, a name is generated)                 |
| `ingress.enabled`                            | Enable ingress resource for Management console   | `false`                                                 |
| `ingress.path`                               | Path within the url structure                    | `/`                                                     |
| `ingress.tls`                                | Ingress TLS configuration                        | `[]`                                                    |
| `ingress.tlsSecret`                          | Secret storing the key/certificate for TLS       | `nil`                                                   |
| `ingress.annotations`                        | Ingress annotations                              | `{}`                                                    |
| `ingress.hosts`                              | Hostnames mapping to your Handle.net service     | `{}`                                                    |
