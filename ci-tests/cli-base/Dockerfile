FROM kanapi/kanapi-bbs
MAINTAINER Jacek Danecki <jacek.m.danecki@gmail.com>
COPY kanapi /kanapi_build/kanapi
ENV CI="true"
RUN mkdir -p ${HOME}/ci_src; /kanapi_build/kanapi/kanapi_system/docker/configure; cd /kanapi_build/kanapi/kanapi_system/x86_64 && ./install cli-base verbose
CMD ["/bin/bash"]
