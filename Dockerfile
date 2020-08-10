FROM rjnorthrow/m68k-toolchain:v1.7

ENV MAKE_OPTS ""
ENV COMMIT "testkit-v1.7"

CMD export PATH=$PATH:/cross/bin && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout $COMMIT && \
    cd testkit && \
    make $MAKE_OPTS && \
    mv *.zip /output

VOLUME /output
