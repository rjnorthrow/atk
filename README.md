# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](docker.com) and then do (optional parameters are in square brackets):

```
docker run -ti --rm -v$(pwd):/output \
    [-e MAKE_OPTS="-j4"] \
    [-e COMMIT="testkit-v1.7"] \
    rjnorthrow/atk:v1.7
```

`MAKE_OPTS` determines how much parallelism you are going to use when building the C modules. This probably does not make much difference so can be safely ignored

`COMMIT` is the Git commit for the Amiga Test Kit if you wish to specify a version. Leave this out to get the latest version

The zip file containing the goodies will be dropped into your current directory.

Works with `-e COMMIT=testkit-v1.3` (changed name from `systest` at this version) consecutively up to `-e COMMIT=testkit-v1.7`

---
For the build only, there is an optional paramater:

```
    [-e BIN_DIR="/cross"]
```
