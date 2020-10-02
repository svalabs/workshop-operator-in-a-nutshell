KubeCar
=========

This Repository allows you to build and deploy a KubeCar CustomResource to Kubernetes. It was created for educational purposes in
order to help demonstrate how Operators can help to automate arbitray task of complex Software Deployment and Management in a kubernetes
native way.
The accompanying presentation (in german), can be found under the `slides/` directory.

Requirements/Prequisites
------------

- Ansible
- Operator-SDK (v0.19.4 was used)
- Docker
- Access to a Kubernetes Environment (docker-desktop, cloudready-containers or minikube are enough)
- Understanding of Kubernetes Core Resources (Pods, Deployments, RBAC, kubectl)

Running the Example
------------

1. Applying prerequisite resources:
- `kubectl create ns kubecar` - Creates a Namespace into which we will scope our Resources
- `kubectl apply -f deploy/service_account.yaml`
- `kubectl apply -f deploy/role.yaml`
- `kubectl apply -f deploy/role_binding.yaml`
- `kubectl apply -f deploy/crds/kubecar.example.com_kubecars_crd.yaml` - Creates the Custom Resource Defintion

2. Building and Deploying the Operator Image (Controller Logic as defined in Ansible Role)
- Make sure you are already logged in to your Image Repository and that the remote repository is accessible from the k8s Cluster (e.g. docker-hub).
- `operator-sdk build <repository-host>/<repository>/<image-name>:<tag>`
- `docker push <repository-host>/<repository>/<image-name>:<tag>`
- `sed -i 's|REPLACE_IMAGE|<repository-host>/<repository>/<image-name>:<tag>|g' deploy/operator.yaml` - Replaces image value with your image in the operator.yaml defintion
- `kubectl apply -f deploy/operator.yaml`

3. Creating a custom KubeCar resource
- `kubectl apply -f deploy/crds/kubecar.example.com_v1alpha1_kubecar_cr.yaml` - Creates the actual custom resource
- `kubectl get po -w` - Watch Pods to see the operator spawn the pods
- `kubectl get kubecar` - List all KubeCar resources
- `kubectl describe kubecar example-kubecar` - Get details of the example-kubecar resource
- `kubectl get all -n kubecar` - see all resources in the kubecar namespace, look for the automatically generated deployment and pods created by the operator.

4. Cleanup
- You can use the `cleanup.sh` script in the root of the repo.