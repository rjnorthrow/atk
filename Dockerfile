FROM rjnorthrow/m68k-toolchain:v1.10

ENV MAKE_OPTS="" \
    COMMIT="" \
    BIN_DIR=/cross \
    ZOPFLI_RELEASE=1.0.3

RUN apt-get install -y python3-crcmod zip && \
    wget https://github.com/google/zopfli/archive/zopfli-${ZOPFLI_RELEASE}.tar.gz && \
    tar xf zopfli-${ZOPFLI_RELEASE}.tar.gz && \
    cd zopfli-zopfli-${ZOPFLI_RELEASE} && \
    make zopfli && \
    make zopflipng && \
    cp zopfli zopflipng /usr/local/bin/ && \
    rm -rf /zopfli*

CMD export PATH=$PATH:/cross/bin && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout $COMMIT && \
    cd inflate && \
    make ${MAKE_OPTS} && \
    cd ../testkit && \
    make $MAKE_OPTS && \
    mv *.zip /output && \
    cd / && \
    rm -rf /Amiga-Stuff

VOLUME /output
