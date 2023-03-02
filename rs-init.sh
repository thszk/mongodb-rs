#!/bin/bash

while [ true ]; do
    sleep 10
    echo "[rs-init.sh] Tentando conectar no mongoDB para iniciar o ReplicaSet"
    mongo --username mongo --password mongo > /dev/null
    if [ $? -eq 0 ]; then
        mongo --username mongo --password mongo --eval 'rs.initiate({_id: "mongoRS", members: [{_id: 0, host: "127.0.0.1:27017", priority: 1}]})'
        exit 0
    fi
done

