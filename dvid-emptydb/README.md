# DVID Empty DB Docker

This is a volume container for an empty[DVID](https://github.com/janelia-flyem/dvid) database stored at /var/dvid/db.

One can pull flyem/dvid-emptydb from Docker Hub or build an image from the docker file.

To pull an image from Docker Hub:
    
    % docker pull flyem/dvid-emptydb

To build an image (call inside of dvid-emptydb directory):
    
    % docker build -t dvid-emptydb .

To create the volume container named emptydb:
    
    % docker run --name emptydb -d dvid-emptydb

The emptydb can then be used with the dvid container:
    
    % docker run --volumes-from emptydb -p 8000::8000 -it dvid

