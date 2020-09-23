Up to this point we have been building the container image with Docker. There are many other contaienr image build tools. This scenario highlights one called Img. 

Img is a command line tool. Install Img:

echo 'function img() { docker run --rm -it --name img --volume $(pwd):/home/user/src:ro --workdir /home/user/src --volume "${HOME}/.docker:/root/.docker:ro" --security-opt seccomp=unconfined --security-opt apparmor=unconfined r.j3ss.co/img $@; }' >> ~/.bashrc
s

Register the new bash function:

. ~/.bashrc

Verify Img is installed:

`img -h`{{execute}}



`img build -t $REGISTRY/mountains-client-secure:0.4.0 -f client/Dockerfile-secure .`{{execute}}

`img build -t $REGISTRY/mountains-server-secure:0.4.0 -f server/Dockerfile-secure .`{{execute}}
