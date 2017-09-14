FROM calvintam236/ubuntu:amd

MAINTAINER calvintam236 <calvintam236@users.noreply.github.com>
LABEL description="Zogminer in Docker. Supports GPU mining."

WORKDIR /tmp

RUN apt-get update \
    && apt-get -y --no-install-recommends install ca-certificates git autoconf automake g++-multilib bsdmainutils build-essential libc6-dev libtool m4 mesa-common-dev ncurses-dev opencl-headers ocl-icd-opencl-dev pkg-config python unzip vim-common wget zlib1g-dev \
    && git clone https://github.com/nginnever/zogminer.git \
    && cd zogminer \
    && ./zcutil/fetch-params.sh \
    && ./zcutil/build.sh -j$(nproc) \
    && mv ./src/zcash-miner /usr/local/bin/zogminer \
    && chmod a+x /usr/local/bin/zogminer \
    && cd .. \
    && rm -r zogminer \
    && rm -r /root/.zcash-params \
    && apt-get -y remove ca-certificates ca-certificates git autoconf automake g++-multilib bsdmainutils build-essential libc6-dev libtool m4 mesa-common-dev ncurses-dev opencl-headers pkg-config python unzip vim-common wget zlib1g-dev \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

ENTRYPOINT ["zogminer"]
