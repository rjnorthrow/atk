FROM rjnorthrow/m68k-toolchain:v1.21

ENV MAKE_OPTS="" \
    ZOPFLI_RELEASE="1.0.3" \
    COMMIT="testkit-v1.21" \
    MAKE_DIR="/cross"

RUN export DEBIAN_FRONTEND=noninteractive && \
    export PATH=$PATH:/root/.local/bin && \
    apt-get update && apt-get install -y pipx python3-crcmod zip && \
    pipx install amitools && \
    wget https://github.com/google/zopfli/archive/zopfli-${ZOPFLI_RELEASE}.tar.gz && \
    tar xf zopfli-${ZOPFLI_RELEASE}.tar.gz && \
    cd zopfli-zopfli-${ZOPFLI_RELEASE} && \
    make zopfli && \
    make zopflipng && \
    cp zopfli zopflipng ${MAKE_DIR}/bin/ && \
    cd / && \
    rm -rf /zopfli*

CMD git config --global pull.rebase false && \
    export PATH=$PATH:/root/.local/bin:$MAKE_DIR/bin && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout $COMMIT && \
    cd inflate && \
    make $MAKE_OPTS && \
    cd ../testkit && \
    make clean && \
    if [ ! -z "$COMMIT" ]; then make $MAKE_OPTS all VER=${COMMIT##testkit-v}; else make $MAKE_OPTS all; fi && \
    mv *.zip /output && \
    cd / && \
    rm -rf /Amiga-Stuff

VOLUME /output
