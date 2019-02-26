# docker-tor-relay

## About
Easily run a Tor network relay node in docker. Support the Onion network by adding an own relay server.

Supported types:
- middle
- exit
- bridge

You probably want to change configuration if you're running an exit-node or a bridge-node.

## Config
For simplest startup just run:
```bash
docker run -p 9001:9001 mk0x/docker-tor
```

To set custom contact data run:
```bash
docker run -p 9001:9001 -e CONTACT_NAME=yourname -e CONTACT_EMAIL=your@email.org mk0x/docker-tor
```


## Environment Variables

### TARGET_TYPE
    Default: middle
    Options: middle, exit, bridge

### RELAY_PORT
    Default: 9001

### RELAY_BANDWIDTH_RATE
    Default: 400000 KBytes

### RELAY_BANDWIDTH_BURST
    Default: 1000000 KBytes

### CONTACT_NAME
    Default: m-ko

### CONTACT_EMAIL
    Default: dev@m-ko.de

## More information
https://trac.torproject.org/projects/tor/wiki/TorRelayGuide