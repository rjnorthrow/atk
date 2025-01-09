FROM rjnorthrow/m68k-toolchain:latest

ENV MAKE_OPTS="" \
    BIN_DIR=/root/.local/bin:/cross/bin

CMD export PATH=$PATH:${BIN_DIR} && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout && \
    cd inflate && \
    make ${MAKE_OPTS} && \
    cd ../testkit && \
    VER=testkit-v make $MAKE_OPTS && \
    mv *.zip /output && \
    cd / && \
    rm -rf /Amiga-Stuff

VOLUME /output
