# Postgres 9.5 ARM Docker Build

Build Postgres for ARM architecture using Docker.


## Releases

Available as .tar.gz in the Github Releases section. Extract and move .debs to /tmp, then follow the directions lifted from [this blog post](http://raspberrypg.org/2015/06/step-5-update-installing-postgresql-on-my-raspberry-pi-1-and-2/
):

    sudo mkdir /var/local/repository
    echo "deb [ trusted=yes ] file:///var/local/repository ./" | sudo tee /etc/apt/sources.list.d/my_own_repo.list
    cd /var/local/repository
    sudo mv /tmp/*.deb .
    dpkg-scanpackages ./ | sudo tee Packages > /dev/null && sudo gzip -f Packages
    sudo apt-get update
    sudo apt-get install postgresql-9.5


## Building yourself

Either use a Raspberry Pi or fire up a Scaleway ARM cloud VM to build. You then can install the latest Docker version which is packaged by Hypriot:

    wget https://downloads.hypriot.com/docker-hypriot_1.10.3-1_armhf.deb
    sudo dpkg -i docker-hypriot_1.10.3-1_armhf.deb
    systemctl start docker

Build:

    make build
    make deb
    make tarball

Copy the deb tarball, generate the checksums (if needed):

    scp remote:~/postgres.tar.gz .
    openssl dgst -sha256 postgres.tar.gz


## TODO

- Put the deb into a proper repository like Package Cloud or Launchpad PPA (which doesn't support ARM at the moment).
