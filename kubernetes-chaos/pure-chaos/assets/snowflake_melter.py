from kubernetes import client, config
from random import randint, choice

config.load_incluster_config()

v1=client.CoreV1Api()
print("Listing pods with their IPs:")
ret = v1.list_pod_for_all_namespaces(watch=False)
for i in ret.items:
    print("%s\t%s\t%s" % (i.status.pod_ip, i.metadata.namespace, i.metadata.name))

candidates = []
for i in ret.items:
    if i.metadata.annotations["chaos"].lower() == 'yes':
        candidates.append(i)

logger.debug("Found {d} pods to potentially remove.".format(d=len(candidated)))

for i in range(0, random.randint(0, len(candidates)-1)):
    pod = random.choice(candidates)
    candidates.remove(pod)
    print("Removing pod: %s from namespace %s", item.metadata.name, item.metadata.namespace)
    body = client.V1DeleteOptions()
    v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.ns, body=body) 
