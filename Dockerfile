FROM rjnorthrow/m68k-toolchain:latest

ENV MAKE_OPTS="" \
    COMMIT="" \
    MAKE_DIR="/cross"

RUN export DEBIAN_FRONTEND=noninteractive && \
    export PATH=$PATH:/root/.local/bin && \
    apt-get update && apt-get install -y pipx python3-crcmod && \
    pipx install amitools

COPY --chmod=755 <<EOT /entrypoint.sh
#!/usr/bin/env bash
set -e
git config --global pull.rebase false
export PATH=$PATH:/root/.local/bin:$MAKE_DIR/bin
git clone https://github.com/keirf/Amiga-Stuff.git
cd Amiga-Stuff
git checkout $COMMIT
cd inflate
make $MAKE_OPTS
cd ../testkit
make clean
if [ ! -z "$COMMIT" ]; then make $MAKE_OPTS all VER=${COMMIT##testkit-v}; else make $MAKE_OPTS all; fi
mv *.zip /output
cd /
rm -rf /Amiga-Stuff
EOT

ENTRYPOINT ["/entrypoint.sh"]

VOLUME /output
