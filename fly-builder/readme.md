# Fly Builder

Run Docker in a Fly.io VM. 

This helps run `docker build...` on AMD64 instances, especially useful when you're hacking on this project from an ARM-based infrastructure or a machine that runs on a battery.

A lot of this is based on [this repository](https://github.com/fly-apps/docker-daemon).

## Setting Up the Remote Builder

Creating a builder for use like this can be done using [Fly Machines](https://fly.io/docs/machines/).

Here are the steps:

```bash
# Create an app to house the VM that will run Docker
fly apps create --machines --name laravel-docker-builder

# Create a volume
fly volumes create -r dfw -a laravel-docker-builder -s 50 laravel_docker

# From this directory, which contains a Dockerfile
fly m run . -r dfw -v laravel_docker:/data -a laravel-docker-builder
```

## Using the Remote Builder

Once you [setup Wireguard](https://fly.io/docs/reference/private-networking/#private-network-vpn) with Fly, you can activate the VPN and run Docker builds remotely by setting `DOCKER_HOST`:

```bash
# Get the IP Address of the VM we created
fly m list -a laravel-docker-builder

# Use that as your DOCKER_HOST
DOCKER_HOST=tcp://[fdaa:0:6ba9:a7b:97:142d:77ac:2]:2375 docker ps
```
