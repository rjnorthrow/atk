FROM rjnorthrow/m68k_toolchain:latest

ENV MAKE_OPTS="" \
    COMMIT="" \
    MAKE_DIR="/cross"

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get install -y python3-crcmod python3-venv && \
    python3 -m venv $MAKE_DIR && \
    $MAKE_DIR/bin/pip3 install git+https://github.com/cnvogelg/amitools.git

CMD git config --global pull.rebase false && \
    export PATH=$PATH:$MAKE_DIR/bin && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout $COMMIT && \
    cd inflate && \
    make $MAKE_OPTS && \
    cd ../testkit && \
    make clean && \
    if [ ! -z "$COMMIT" ]; then \
      make $MAKE_OPTS all VER=${COMMIT##testkit-v}; else \
      make $MAKE_OPTS all; fi && \
    mv *.zip /output && \
    cd / && \
    rm -rf /Amiga-Stuff

VOLUME /output
