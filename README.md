Waves private node
===

This image is useful for developing node based services. Uses actual Mainnet version by default.

Includes Blockchain Updates extension.

Getting started
---

### Download the latest blockchain state

    #/usr/bin/bash 

    mkdir -p /var/lib/waves
    cd /var/lib/waves
    # WARNING! There is a lot of blockchain data > 100GB
    wget -qO- http://blockchain.wavesnodes.com/blockchain_last.tar --show-progress | tar xf -
    wget -qO- http://blockchain.wavesnodes.com/blockchain-updates_last.tar --show-progress | tar xf -

### Default node configuration

    mkdir -p /etc/waves
    cp waves.conf /etc/waves/waves.conf

Don't forget to set the seed and password in the wallet section.
Read more about [configuration](https://docs.waves.tech/en/waves-node/node-configuration)

### Docker container

    docker build -t wavesnode-ext .

To run the node with blockchain state and config volumes:

    docker run -v /var/lib/waves:/var/lib/waves -v /etc/waves:/etc/waves \
    -p 6868:6868 -p 6869:6869 -p 6870:6870 -p 6881:6881 -ti wavesnode-ext

#### Exposed ports
    
| port | service |
|:---:|---|
|6868| Node |
|6869| [Node REST API](https://docs.waves.tech/en/waves-node/node-api/) |
|6870| [Node gRPC](https://docs.waves.tech/en/waves-node/extensions/grpc-server) |
|6881| [Blockchain Updates gRPC](https://docs.waves.tech/en/waves-node/extensions/blockchain-updates) |
