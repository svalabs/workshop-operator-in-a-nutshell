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
  

Role Variables
--------------

No Role Variables are defined. However, default values have been defined (see roles/kubecar/defaults).

Dependencies
------------

Ansible-Plugins (already pre-installed):

- operator_sdk.util
- community.kubernetes

Example Playbook
----------------

No playbooks is being used. `watches.yml` calls the `kubecar` role directly, implementing the core kubernetes control loop with an additional deploy on creation of the KubeCar custom resource.


License
-------

Apache License 2.0

Author Information
------------------

Norris Sam Osarenkhoe, SVA GmbH
