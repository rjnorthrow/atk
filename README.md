# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](https://docker.com/) and then do:

```
docker run -ti --rm -v$(pwd):/output rjnorthrow/atk:latest
```

The zip file containing the goodies will be dropped into your current directory

Known Issues
------------
This currently only works on amd64 (x86-64)
