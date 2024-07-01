#!/bin/bash

while [ true ]; do
    sleep 10
    echo "[rs-init.sh] Tentando conectar no mongoDB para iniciar o ReplicaSet"
    mongosh --username mongo --password mongo > /dev/null
    if [ $? -eq 0 ]; then
        mongosh --username mongo --password mongo --eval 'rs.initiate({_id: "mongoRS", members: [{_id: 0, host: "mongo:27017", priority: 1}]})'
        exit 0
    fi
done

