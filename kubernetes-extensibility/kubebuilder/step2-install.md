Install the near latest Kubebuilder that was tested with this scenario. This installation follows the recommendation found in the Kubebuilder book.

```bash
version=1.0.8
arch=amd64

curl -L -O "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${version}/kubebuilder_${version}_darwin_${arch}.tar.gz"

tar -zxvf kubebuilder_${version}_darwin_${arch}.tar.gz
mv kubebuilder_${version}_darwin_${arch} kubebuilder && sudo mv kubebuilder /usr/local/

export PATH=$PATH:/usr/local/kubebuilder/bin
```{{execute}}

Verify the installation is complete.

`kubebuilder version`{{execute}}

