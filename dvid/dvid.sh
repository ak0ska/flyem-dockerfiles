#!/bin/bash

find $DVIDHOME/config -type f -name '*.toml' | xargs sed -i "s#DVIDHOME#${DVIDHOME}#g"

if [ $# -gt 1 ]; then
    sed "s/ZZ/${1}/g" $DVIDHOME/config/configbucket.toml > /$DVIDHOME/config/configtemp.toml
    dvid -verbose serve $DVIDHOME/config/configtemp.toml
else
    dvid -verbose serve $DVIDHOME/config/config.toml
fi
