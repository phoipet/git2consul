#!/bin/bash

/usr/local/bin/confd -onetime -backend consul -node $CONSUL_IP:$CONSUL_PORT
exec git2consul --endpoint $CONSUL_IP --port $CONSUL_PORT --config-file /home/consul/git2consul/config.json