FROM lsiobase/mono
LABEL MAINTAINER gugahoi

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="gugahoi version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install ombi
COPY linux.tar.gz /tmp
RUN mkdir -p /opt/ombi && \
	tar -xvf /tmp/linux.tar.gz -C /opt/ombi && \
	chmod +x /opt/ombi/Ombi && \
	apt-get update && \
	apt-get install -y --no-install-recommends libunwind8 libicu55 && \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

# add local files
COPY /root /

# ports and volumes
WORKDIR /opt/ombi
EXPOSE 3579
VOLUME /config
