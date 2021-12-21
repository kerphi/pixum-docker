# pixum-docker

Dockerization of https://www.pixum.fr/livre-photo/danke?os=linux

## Prerequisites

Having docker and docker-compose installed on your linux box.

## Install

Build the image a first time this way:
```
docker build . -t pixum-docker:1.0.0 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)
```

Download setup_Univers_photo_Pixum.tgz on this page: https://www.pixum.fr/livre-photo/danke?os=linux

Create a container in a terminal:
```
docker run --rm -it --name pixum-installer pixum-docker:1.0.0 bash
```

Copy the setup in the above container:
```
docker cp ~/Téléchargements/setup_Univers_photo_Pixum.tgz pixum-installer:/tmp/
```

Come back to the other term and install Pixum in the container (choose /tmp/Pixum as an install directory):
```
tar xzf /tmp/setup_Univers_photo_Pixum.tgz
./install.pl
```

```
cd pixum-docker/
docker cp pixum-installer:/tmp/Pixum/ ./
```

Build again the image:
```
docker build . -t pixum-docker:1.0.0 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)
```

## Run

Then run pixum this way :
```
docker-compose up
```


