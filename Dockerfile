FROM rjnorthrow/m68k-toolchain

ENV MAKE_OPTS ""
ENV COMMIT ""

CMD export PATH=$PATH:/cross/bin && \
    git clone https://github.com/keirf/Amiga-Stuff.git && \
    cd Amiga-Stuff && \
    git checkout $COMMIT && \
    cd testkit && \
    make $MAKE_OPTS && \
    mv *.zip /output

VOLUME /output
