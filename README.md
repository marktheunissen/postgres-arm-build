# Postgres 9.5 ARM Docker Build

Build Postgres for ARM architecture using Docker.


## Releases


## Building yourself

Either use a Raspberry Pi or fire up a Scaleway ARM cloud VM to build. You then can install the latest Docker version which is packaged by Hypriot:

    wget https://downloads.hypriot.com/docker-hypriot_1.10.3-1_armhf.deb
    sudo dpkg -i docker-hypriot_1.10.3-1_armhf.deb
    systemctl start docker


Build:

    make build
    make deb


## TODO

- Put the deb into a proper repository like Package Cloud or Launchpad PPA (which doesn't support ARM at the moment).


## Notes

This uses `fpm` to build deb files, see:

- https://github.com/jordansissel/fpm/wiki/PackageMakeInstall

Original blog post:

- http://raspberrypg.org/2015/06/step-5-update-installing-postgresql-on-my-raspberry-pi-1-and-2/
