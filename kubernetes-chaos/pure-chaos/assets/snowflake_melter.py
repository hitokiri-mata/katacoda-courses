from kubernetes import client, config
import random
import logging

# Access Kubernetes
config.load_incluster_config()
v1=client.CoreV1Api()

# List Namespaces
all_namespaces = v1.list_namespace()

pod_candidates = []
for namespace in all_namespaces.items:
     # Filter namespaces that are annotated as chaos candidates.
    if (    namespace.metadata.annotations is not None 
        and namespace.metadata.annotations.get("chaos", None) == 'yes'
       ):
        # Add all pods found in targeted namespace
        pods = v1.list_namespaced_pod(namespace.metadata.name)
        pod_candidates.extend(pods)

# Determine how many Pods to remove
removal_count = random.randint(0, len(pod_candidates))
if len(pod_candidates) > 0:
    logging.info("Found %d pods and melting %d of them.", len(pod_candidates), removal_count)
else:
    logging.info("No eligible Pods found with annotation chaos=yes.")

# Remove a few of the pods
for _ in range(removal_count):
    pod = random.choice(pod_candidates)
    pod_candidates.remove(pod)
    logging.info("Removing pod %s from namespace %s.", item.metadata.name, item.metadata.namespace)
    body = client.V1DeleteOptions()
    v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.ns, body=body) 
