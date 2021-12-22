# pixum-docker

Dockerization of https://www.pixum.fr/livre-photo/danke?os=linux

## Prerequisites

Having docker and docker-compose installed on your linux box.

## Install

1) Build the image a first time this way:
```bash
cd pixum-docker/
docker build . -t pixum-docker:1.0.0 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)
```

2) Download setup_Univers_photo_Pixum.tgz on this page: https://www.pixum.fr/livre-photo/danke?os=linux

3) Create a container in a terminal:
```bash
docker run --rm -it --name pixum-installer pixum-docker:1.0.0 bash
```

4) Copy the setup in the above container:
```bash
docker cp ~/Téléchargements/setup_Univers_photo_Pixum.tgz pixum-installer:/tmp/
```

5) Come back to the other term and install Pixum in the container (choose `/tmp/Pixum` as an install directory):
```bash
tar xzf /tmp/setup_Univers_photo_Pixum.tgz
./install.pl
```

6) Copy back the Pixum installed folder to the docker image build source folder:
```bash
cd pixum-docker/
docker cp pixum-installer:/tmp/Pixum/ ./
```

7) Build again the image:
```bash
docker build . -t pixum-docker:1.0.0 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)
```

## Run

Then run pixum this way :
```bash
docker-compose up
```


