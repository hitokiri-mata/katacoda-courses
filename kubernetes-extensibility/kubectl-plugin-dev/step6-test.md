Test against your cluster

`kubectl example resources`{{execute}}

 while kubectl context is set to an active cluster should result in the following:

```bash
Name                           	Namespaced	Kind                          
replicationcontrollers         	true      	ReplicationController         
namespaces                     	false     	Namespace                     
resourcequotas                 	true      	ResourceQuota                 
configmaps                     	true      	ConfigMap                     
pods                           	true      	Pod                           
nodes                          	false     	Node                          
services                       	true      	Service                       
persistentvolumeclaims         	true      	PersistentVolumeClaim         
secrets                        	true      	Secret                        
serviceaccounts                	true      	ServiceAccount                
persistentvolumes              	false     	PersistentVolume   
...
```
