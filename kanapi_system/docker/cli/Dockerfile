FROM kanapi/kanapi-bbs
MAINTAINER Jacek Danecki <jacek.m.danecki@gmail.com>
RUN mkdir /kanapi_build/kanapi
COPY kanapi /kanapi_build/kanapi
RUN cd /kanapi_build/kanapi/kanapi_system/kanapi-cli && ./install cli verbose  && \
	 rm -rf ${HOME}/src && mkdir ${HOME}/src && rm -rf ${HOME}/.ccache && rm -rf /kanapi_build/kanapi
CMD ["/bin/bash"]
