#!/bin/sh
# Cleans Up the Cluster after walking through the Example

OPERATOR_NAME="kubecar-operator"

kubectl delete kubecar example-kubecar

echo "Sleeping 2 minutes to give k8s time for cleanup"

sleep 2m

kubectl delete deploy $OPERATOR_NAME

echo "Sleeping 30 seconds to give k8s time for cleanup"

sleep 30

kubectl delete crds kubecars.kubecar.example.com

echo "KubeCar CRD deleted"

echo "Deleting RBAC resources"

kubectl delete rolebinding $OPERATOR_NAME
kubectl delete role $OPERATOR_NAME
kubectl delete sa $OPERATOR_NAME

sleep 30

echo "Final Step: Deleting kubecar namespace"

kubectl delete ns kubecar