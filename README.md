# pixum-docker

```
docker build . -t pixum-docker:1.0.0 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)

docker-compose up
```
