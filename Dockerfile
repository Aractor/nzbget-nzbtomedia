FROM ghcr.io/linuxserver/nzbget:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Aractor"

RUN apk update

# install packages
RUN apk add --no-cache ffmpeg
RUN apk add --no-cache par2cmdline

# add local files
COPY root/ /

RUN mkdir /scripts

# install nzbget scripts
RUN git clone https://github.com/clinton-hall/nzbToMedia.git /scripts/nzbToMedia
RUN git clone https://github.com/nzbget/FakeDetector.git /scripts/FakeDectector
RUN git clone https://github.com/JVMed/PasswordDetector.git /scripts/PasswordDectector

RUN chmod 775 -R /scripts
