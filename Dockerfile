FROM rjnorthrow/m68k-toolchain:v1.21

ENV MAKE_OPTS="" \
    COMMIT="" \
    BIN_DIR=/cross \
    ZOPFLI_RELEASE=1.0.3

RUN apt-get update && apt-get install -y python3-crcmod python3-pip zip && \
    wget https://github.com/google/zopfli/archive/zopfli-${ZOPFLI_RELEASE}.tar.gz && \
    tar xf zopfli-${ZOPFLI_RELEASE}.tar.gz && \
    cd zopfli-zopfli-${ZOPFLI_RELEASE} && \
    make zopfli && \
    make zopflipng && \
    cp zopfli zopflipng /usr/local/bin/ && \
    rm -rf /zopfli*

# Log out and back in to allow Python to re-evaluate its variables
RUN pip3 install cython && \
    pip3 install -U git+https://github.com/cnvogelg/amitools.git

CMD export PATH=$PATH:/cross/bin && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout $COMMIT && \
    cd inflate && \
    make ${MAKE_OPTS} && \
    cd ../testkit && \
    VER=${COMMIT##testkit-v} make $MAKE_OPTS && \
    mv *.zip /output && \
    cd / && \
    rm -rf /Amiga-Stuff

VOLUME /output
