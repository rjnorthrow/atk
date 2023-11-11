# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](https://docker.com/) and then do (optional parameters are in square brackets):

```
docker run -ti --rm -v$(pwd):/output \
    [-e MAKE_OPTS="-j4"] \
    [-e COMMIT="testkit-v1.21"] \
    rjnorthrow/atk:latest
```

`MAKE_OPTS` determines how much parallelism you are going to use when building the C modules. This probably does not make much difference so can be safely ignored

`COMMIT` is the Git tag if you wish to specify a version. Leave this out to get the latest version

The zip file containing the goodies will be dropped into your current directory. Note that the zip file name has changed after v1.16 from `AmigaTestKit-v1.16.zip` (for example) to `AmigaTestKit-<ID>.zip` where ID is the short Git commit ID such as `AmigaTestKit-803ec6a.zip` for version 1.18. The contents however have not changed, in that the zip contains the correct version if specified using `COMMIT=`. This is because the source code now uses `git rev-parse short HEAD` instead of a hard-coded literal

Tested on versions `testkit-v1.11` to `testkit-v1.21` inclusive

This is the list of IDs you should expect for each version and of course you can simply rename the files within the zip file and/or the zip file itself should you so wish:

```
-rw-r--r-- 1 root  root  145446 Sep  1 11:25 AmigaTestKit-b32e497.zip # => testkit-v1.17
-rw-r--r-- 1 root  root  146264 Sep  1 11:25 AmigaTestKit-803ec6a.zip # => testkit-v1.18
-rw-r--r-- 1 root  root  147714 Sep  1 11:25 AmigaTestKit-f1882d6.zip # => testkit-v1.19
-rw-r--r-- 1 root  root  195271 Sep  1 11:26 AmigaTestKit-07378bf.zip # => testkit-v1.20
-rw-r--r-- 1 root  root  198613 Nov 11 11:34 AmigaTestKit-9477599.zip # => testkit-v1.21
```

---
For the build only, these are optional paramaters:

```
    [-e BIN_DIR="/cross"] \
    [-e ZOPFLI_RELEASE="1.0.3"] \
```

Known Issues
------------
This currently only works on amd64 (x86-64)
