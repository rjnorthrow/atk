# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](docker.com) and then do (optional parameters are in square brackets):

```
docker run -ti --rm -v$(pwd):/output \
    [-e MAKE_OPTS="-j4"] \
    [-e COMMIT="testkit-v1.20"] \
    rjnorthrow/atk:latest
```

`MAKE_OPTS` determines how much parallelism you are going to use when building the C modules. This probably does not make much difference so can be safely ignored

`COMMIT` is the Git tag if you wish to specify a version. Leave this out to get the latest version

The zip file containing the goodies will be dropped into your current directory. Note that the zip file name has changed after v1.16 from `AmigaTestKit-v1.16.zip` (for example) to `AmigaTestKit-<ID>.zip` where ID is the short Git commit ID such as `AmigaTestKit-803ec6a.zip` for version 1.18. The contents however have not changed, in that the zip contains the correct version if specified using `COMMIT=`

Tested on versions `testkit-v1.11` to `testkit-v1.20` inclusive

---
For the build only, these are optional paramaters:

```
    [-e BIN_DIR="/cross"] \
    [-e ZOPFLI_RELEASE="1.0.3"] \
```

Known Issues
------------
This currently only works on amd64 (x86-64)
