# pixum-docker

Dockerization of https://www.pixum.fr/livre-photo/danke?os=linux


**ATTENTION : cette procédure fonctionnait avec la version 7.1.5 mais ne fonctionne plusa vec la version 7.2.5,
  ce qui est ci-dessous correspond à une tentative infructueuse de mise à jour en version 7.2.5**




## Prerequisites

Having docker and docker-compose installed on your linux box.

## Install

1) Build the image a first time this way:
```bash
cd pixum-docker/
docker build . -t pixum-docker:7.2.5 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)
```

2) Download setup_Univers_photo_Pixum.tgz on this page: https://www.pixum.fr/livre-photo/danke?os=linux
   (7.2.5 above docker image tag should be changed if the pixum's version is newer,
   so go to step 1 if the version is new)
 
3) Create a container in a terminal:
```bash
docker run --rm -it --name pixum-installer pixum-docker:7.2.5 bash
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
cd pixum-docker/
docker build . -t pixum-docker:7.2.5 \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g)
```

## Run

Then run pixum this way (edit docker-compose.yml if 7.2.5 version is changed above):
```bash
docker-compose up
```

## How to

### Install desktop ubunto shortcut

Create this file as root: `/usr/share/applications/pixum.desktop`

```
[Desktop Entry]
Name=Pixum
TryExec=/home/frederique/pixum-docker/shortcut.sh
Exec=/home/frederique/pixum-docker/shortcut.sh
Terminal=true
Type=Application
Icon=/home/frederique/pixum-docker/pixum-logo.png
StartupNotify=false
```
