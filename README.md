# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](https://docker.com/) and then do (optional parameters are in square brackets):

```
docker run -ti --rm -v$(pwd):/output \
    [-e MAKE_OPTS="-j4"] \
    [-e COMMIT="testkit-v1.21"] \
    rjnorthrow/atk:v1.21
```

`MAKE_OPTS` determines how much parallelism you are going to use when building the C modules. This probably does not make much difference so can be safely ignored

`COMMIT` is the version you wish to create. Versions supported in this image are `testkit-v1.3` to `testkit-v1.21`. If you do not specify this, you will get `testkit-v1.21`

The zip file containing the goodies will be dropped into your current directory

Tested on versions `testkit-v1.3` to `testkit-v1.21` inclusive


---
For the build only, these are optional paramaters:

```
    [-e BIN_DIR="/cross"] \
    [-e ZOPFLI_RELEASE="1.0.3"] \
```
