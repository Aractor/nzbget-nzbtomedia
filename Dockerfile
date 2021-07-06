FROM ghcr.io/linuxserver/nzbget:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Aractor"

# package version
# (stable-download or testing-download)
ARG NZBGET_BRANCH="stable-download"

RUN \
 apk update \
 echo "**** install packages ****" && \
 echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
 apk add --no-cache \
  	ffmpeg \
	par2cmdline@testing \

# add local files
COPY root/ /

# install nzbToMedia
RUN \
 mkdir /scripts

RUN \
echo "**** install nzbget scripts ****" && \
git clone https://github.com/clinton-hall/nzbToMedia.git /scripts/nzbToMedia \
git clone https://github.com/nzbget/FakeDetector.git /scripts/FakeDectector \
git clone https://github.com/JVMed/PasswordDetector.git /scripts/PasswordDectector \

RUN \
 chmod 777 -R /scripts
