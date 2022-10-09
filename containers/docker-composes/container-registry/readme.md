The most basic registry without any auth.

test registry:
docker pull ubuntu
docker tag ubuntu:latest localhost:5000/my-ubuntu
docker push localhost:5000/my-ubuntu

docker image remove ubuntu:latest
docker image remove localhost:5000/my-ubuntu

docker pull localhost:5000/my-ubuntu
docker run -it --rm localhost:5000/my-ubuntu

Follow the instructions in the official documentation for more advanced setups.
https://docs.docker.com/registry/
