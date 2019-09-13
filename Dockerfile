FROM ubuntu:bionic-20190807 AS base


FROM base AS build
RUN apt-get update && apt-get -y install --no-install-recommends \
	build-essential \
	ca-certificates \
	wget
RUN wget https://github.com/joan2937/pigpio/archive/V71.tar.gz && \
	tar xf V71.tar.gz
WORKDIR pigpio-71
RUN make -j16 && \
	make DESTDIR=_install install && \
	rm -rf _install/usr/local/man


FROM base
COPY --from=build /pigpio-71/_install/ /
RUN ldconfig
CMD ["pigpiod", "-g"]
