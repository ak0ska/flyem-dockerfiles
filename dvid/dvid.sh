#!/bin/bash

if [ ${1} != "" ]; then
    sed "s/ZZ/${1}/g" /var/configbucket.toml > /var/configtemp.toml
    dvid serve /var/configtemp.toml
else
    dvid serve /var/config.toml
fi 

