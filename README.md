```bash
docker build -t tty8747/xel:latest .
docker push tty8747/xel:latest
```

```bash
docker run --name xel --rm --runtime=nvidia --gpus all -d tty8747/xel:latest
docker logs xel
  Miner version: 0.9.2
  [INFO] Job timeout: 120 seconds
  [INFO] Connecting to node...
  [INFO] Connected to node
  Number of available GPUs: 1
  #0 -> NVIDIA GeForce RTX 4090
  [GPU #0] Setting up NVIDIA GeForce RTX 4090...
  [WARN] Check the both hashrates with boost and without boost, boost is better on 4090
  [GPU #0] NVIDIA GeForce RTX 4090 setup ok
  [INFO] Total hashrate: 117964 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 144179 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 144179 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 144179 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 144179 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 137625 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 144179 H/s  Accepted: 0 Rejected: 0
  [INFO] Total hashrate: 144179 H/s  Accepted: 0 Rejected: 0
```

We have in logs `0 H/s`, so it doesn't work for clore.ai:
```bash
$ docker logs clore-default-18 --follow
Miner version: 0.9.2
[INFO] Job timeout: 120 seconds
[INFO] Connecting to node...
Number of available GPUs: 1
#0 -> NVIDIA GeForce RTX 4090
[GPU #0] Setting up NVIDIA GeForce RTX 4090...
[WARN] Check the both hashrates with boost and without boost, boost is better on 4090
[GPU #0] NVIDIA GeForce RTX 4090 setup ok
[INFO] Total hashrate: 0 H/s  Accepted: 0 Rejected: 0
[INFO] Total hashrate: 0 H/s  Accepted: 0 Rejected: 0
[INFO] Total hashrate: 0 H/s  Accepted: 0 Rejected: 0
[INFO] Total hashrate: 0 H/s  Accepted: 0 Rejected: 0
[INFO] Total hashrate: 0 H/s  Accepted: 0 Rejected: 0
[INFO] Total hashrate: 0 H/s  Accepted: 0 Rejected: 0
```
