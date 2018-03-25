FROM kanapi-sbs:ci
MAINTAINER Jacek Danecki <jacek.m.danecki@gmail.com>
RUN mkdir /kanapi_build/kanapi
COPY kanapi /kanapi_build/kanapi
ENV CI="true"
RUN mkdir -p ${HOME}/ci_src; /kanapi_build/kanapi/kanapi_system/docker/configure;cd /kanapi_build/kanapi/kanapi_system/x86_64 && ./install all-sbs verbose
CMD ["/bin/bash"]
