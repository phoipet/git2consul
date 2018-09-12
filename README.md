# git2consul
Docker image for git2consul. You can find the image here: https://hub.docker.com/r/phoipet/git2consul

## Build your own image

* clone the repository
* cd git2consul
* docker build -t <image-name> .

## Up & Running

Assumption, you already have running consul server). We need this k/v on the consul server k/v:
```
git2consul/name
git2consul/url
git2consul/branch
```

You can add the k/v by execute this command (you can change the value with your own value):
```
curl -X PUT -d 'kv-data' http://<CONSUL_IP>:<CONSUL_PORT>/v1/kv/git2consul/name
curl -X PUT -d 'master' http://<CONSUL_IP>:<CONSUL_PORT>/v1/kv/git2consul/branch
curl -X PUT -d 'https://github.com/phoipet/consul-kv-data.git' http://<CONSUL_IP>:<CONSUL_PORT>/v1/kv/git2consul/url
```

Run the container with
```
docker run -it -e CONSUL_IP="<XX.XX.XX.XX>" -e CONSUL_PORT="XXXX" <image-name>
```
