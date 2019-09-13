# pigpio for the Raspberry PI 4

A smaller and reproducible version of: https://github.com/lachatak/rpi-pigpio

## Setup binfmt

```
docker run --privileged docker/binfmt:66f9012c56a8316f9244ffd7622d7c21c1f6f28d-amd64
```
If it worked, this should print something:
```
cat /proc/sys/fs/binfmt_misc/qemu-arm
enabled
interpreter /usr/bin/qemu-arm
flags: OCF
offset 0
magic 7f454c4601010100000000000000000002002800
mask ffffffffffffff00fffffffffffffffffeffffff
```

## Build

```
DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --platform linux/arm/v7 -t pigpio:v71 --load .
```

At some point you should get
> [+] Building 114.0s (12/12) FINISHED

## Run

docker run --rm --cap-add SYS_RAWIO --device /dev/mem --device /dev/vcio pigpio:v71

