from kubernetes import client, config
import random

config.load_incluster_config()
v1=client.CoreV1Api()

candidates = []
for i in ret.items:
    if i.metadata.annotations is not None and i.metadata.annotations["chaos"] == 'yes':
        candidates.append(i)

removal_count = random.randint(0, len(candidates)-1)
logger.info("Found %d pods and will melt %d of them.", len(candidates), removal_count)

for i in range(0, removal_count):
    pod = random.choice(candidates)
    candidates.remove(pod)
    logger.info("Removing pod %s from namespace %s.", item.metadata.name, item.metadata.namespace)
    body = client.V1DeleteOptions()
    v1.delete_namespaced_pod(pod.metadata.name, pod.metadata.ns, body=body) 
