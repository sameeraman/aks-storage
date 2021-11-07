
# Provision the dynamic_provisioning.yaml resources
kubectl apply -f .\dynamic_provisioning.yaml
# This will create nginx deployment with one pod and a PVC using the azurefile-premium storage class

# Run the following command to get the pod name. Make sure it's in a running status
kubectl get pods

# Remote in to the pod
kubectl exec -it azure-files-example-<pod instance id> -- /bin/bash

# Change the folder and create some files
cd /tmp/files1
echo "Hello from $HOSTNAME" >> test.txt
exit

# Scale the deployment to 5 instances
kubectl scale deployment azure-files-example --replicas=5
kubectl get pods

# Remote in to a different pod
kubectl exec -it azure-files-example-<pod instance id> -- /bin/bash

# Change directory and observe the contenct. Then add another entry from this pod. 
cd /tmp/files1
cat test.txt
echo "Hello from $HOSTNAME" >> test.txt
exit

# Go to the Azure Portal and check the content from the azure portal. 


