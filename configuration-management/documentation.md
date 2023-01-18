# Configuration management documentation

This playbook is used to set up a Linux VM with the necessary packages and configurations to run a Docker container.

## Hosts
This playbook is intended to be run on the host vm-nebo-linux.

## Tasks
The following tasks are performed by this playbook:

- Update all packages on the system to the latest version using yum.
- Install additional packages using yum.
- Enable the extras repository using yum-config-manager.
- Install Docker CE using amazon-linux-extras.
- Install the Docker SDK for Python using pip.
- Enable and start the Docker service.
- Create a directory for the app at /home/ec2-user/app.
- Pull a Docker image from Docker Hub.
- Launch a Docker container from the image and run it in detached, interactive mode. The - container will be exposed on port 80.

## Variables
The following variables are used in this playbook:
- packages: A list of packages to be installed using yum.
- image: The name of the Docker image to be pulled from Docker Hub.

## packages

- python-pip is a tool for installing and managing Python packages.

- yum-utils is a set of utilities that improve the functionality of yum, the default package manager for Red Hat-based systems.

- device-mapper-persistent-data is a package that enables the use of the Device Mapper module in Linux. This module is used for managing logical volumes, or virtual partitions of a hard drive that can be resized or deleted.

- lvm2 is a tool for creating and managing logical volumes on a Linux system.

- amazon-linux-extras is a repository of software packages specifically built and supported for use on Amazon Linux instances. It is provided by Amazon.

- docker-py is a Python library for interacting with the Docker API, allowing you to use Python to control Docker containers and images.