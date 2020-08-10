# atk - Amiga Test Kit
Build for [Keir Fraser's Amiga Test Kit (formerly systest)](https://github.com/keirf/Amiga-Stuff)

To use, install [docker](docker.com) and then do (optional paramaters in square brackets):

```
docker run -ti --rm -v${pwd}:/output \
    [-e MAKE_OPTS="-j4"] \
    [-e COMMIT="testkit-v1.11"] \
    [-e BIN_DIR="/cross"] \
    [-e ZOPFLI_RELEASE="1.0.1"] \
    rjnorthrow/atk
```
