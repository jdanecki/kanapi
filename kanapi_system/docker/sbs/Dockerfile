FROM scratch
MAINTAINER Jacek Danecki <jacek.m.danecki@gmail.com>
ADD sbs-docker-0.10.tar.xz /
COPY group /etc
COPY nsswitch.conf /etc
COPY passwd /etc
COPY services /etc
CMD ["/bin/bash"]

