Choas Mesh project is rich choices for experiment types. Currently here are the choices:

| Category      | Type             | Experiment Description  |
|:-------------:|------------------|-------------------------|
| Pod Lifecycle | Pod Failure      | Killing pods.  |
| Pod Lifecycle | Pod Kill         | Pods becoming unavailable. |
| Pod Lifecycle | Container Kill   | Killing containers in pods. |
| Network       | Partition        |  |
| Network       | Loss             | Inject network communication loss. |
| Network       | Delay            | Inject network communication latency. |
| Network       | Duplication      |  |
| Network       | Corrupt          | Inject network communication corruption. |
| Network       | Bandwidth        |  |
| I/O           | Delay            | Inject delay during I/O. |
| I/O           | Errno            | Inject error during I/O. |
| I/O           | Delay and Errno  | Inject both delays and errors wit I/O, |
| Linux Kernel  |                  | Inject kernel errors into pods. |
| Clock         | Offset           | Inject clock skew into pods. |
| Stress        | CPU              | Simulate pod CPU stress. |
| Stress        | Memory           | Simulate pod memory stress.  |
| Stress        | CPU & Memory     | Simulate both CPU and memory stress on pod. |

In the next steps you will create some experiments.
