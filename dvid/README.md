# DVID Docker

This container launches the [DVID](https://github.com/janelia-flyem/dvid) server on container port 8000
with a DVID database located at /var/dvid/db.  It also deploys the [dvid-console](https://github.com/janelia-flyem/dvid-console) frontend.

One can pull flyem/dvid from Docker Hub or build an image from the docker file.

To pull an image from Docker Hub:
    % docker pull flyem/dvid

To build an image (call inside of dvid directory):
    % docker build -t dvid .

To run the image (dvid log info will show in standard out):
    % docker run --volumes-from <OPT:VOLUME> -p <PORT>:8000 -it dvid

This will assign the host PORT < PORT > to the default DVID port of 8000 on the container.  By default, running this container will create an empty DVID database.  One can specify a docker volume that contains a DVID db at /var/dvid/db.  Note: it is possible to specify a volume directly from the host machine, but it is recommended that the database be wrapped into a volume container for better portability.  These volumes are light-weight and actually stored directly on host filesystem on linux or on the VM that runs the containers on Mac and Windows.
