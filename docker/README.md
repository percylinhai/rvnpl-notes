To build docker image for RarePedSim:

```
docker build -t statisticalgenetics/rarepedsim . -f rarepedsim.dockerfile
```

To test the build,

```
docker run --rm --security-opt label:disable -t statisticalgenetics/rarepedsim rarepedsim generate -h
```
