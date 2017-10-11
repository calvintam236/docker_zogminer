# What is Zogminer?

Zogminer is the console miner provided by [nginnever](https://github.com/nginnever/zogminer).

Zogminer supports Zcash (ZEC).

# How to use this image [AMD version]

Run in background:

```console
$ docker run -d --device /dev/kfd --device /dev/dri --name YOUR_CONTAINER_NAME calvintam236/zogminer:amd -stratum=YOUR_POOL_ADDRESS -user=YOUR_USERNAME.YOUR_WORKER_NAME -password=YOUR_WORKER_PASSWORD -G
```

Get `zogminer` options with:

```console
$ docker run --rm calvintam236/zogminer:amd
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
