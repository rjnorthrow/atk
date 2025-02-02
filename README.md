# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](https://docker.com/) and then do:

```
docker run -ti --rm -v$(pwd):/output rjnorthrow/atk:latest
```

The zip file containing the goodies will be dropped into your current directory. If your file is
called something like `AmigaTestKit-ae428d4.zip`, then this is the very latest version, newer than
the current release. The seven character identifier is the short `git` ID from the `HEAD`

This is a multi-architecture build, it should work on any fairly recent Raspberry Pi, PC or Mac

Older versions
--------------

For versions 1.3 to 1.21: `docker run -ti --rm -v$(pwd):/output -e "COMMIT=testkit-v1.17" rjnorthrow/atk:v1.21` (example for version 1.17)
