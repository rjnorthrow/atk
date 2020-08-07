FROM rjnorthrow/m68k-toolchain

ENV MAKE_OPTS="" \
    COMMIT="" \
    ZOPFLI_RELEASE=1.0.1

RUN apk add git py-pip && \
    pip install --upgrade pip && \
    pip install crcmod && \
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
    make PREFIX=m68k-unknown-elf- && \
    cd ../testkit && \
    make $MAKE_OPTS && \
    mv *.zip /output && \
    rm -rf /zopfli* Amiga-Stuff

VOLUME /output
