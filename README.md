# Fly EM Docker Files [![Picture](https://raw.github.com/janelia-flyem/janelia-flyem.github.com/master/images/HHMI_Janelia_Color_Alternate_180x40.png)](http://www.janelia.org)

This repository contains dockerfiles to create [Docker](http://www.docker.io) images for Fly EM software and data.  The goal is to facilitate portability and testing.

Docker commands reequire the Docker daemon to be running (and a light-weight virtual machine for Mac and Windows provided by the Docker installation).

These images are already pre-built on [Docker Hub](https://hub.docker.com/) under the flyem namespace.

To retrieve image XYZ:
    % docker pull flyem/XYZ

If you prefer to build the image XYZ from the dockerfile:
    % cd XYZ
    % docker build -t XYZ .

Specific run instructions can be found in each image directory in this repository.  
