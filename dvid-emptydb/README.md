# DVID Empty DB Docker

This is a volume container for an empty[DVID](https://github.com/janelia-flyem/dvid) database stored at /var/dvid/db.  This image could be rebuilt with a non-empty db by replacing emptydb accordingly.

To create the volume container named emptydb:
    
    % docker run --name emptydb -d dvid-emptydb

The emptydb can then be used with the dvid container:
    
    % docker run --volumes-from emptydb -p 8000::8000 -it dvid

