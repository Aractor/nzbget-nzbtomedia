FROM ghcr.io/linuxserver/nzbget:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Aractor"

# install packages
RUN apk add --no-cache ffmpeg
RUN apk add --no-cache par2cmdline
RUN apk add --no-cache curl
RUN apk add --no-cache p7zip
RUN apk add --no-cache unrar
RUN apk add --no-cache wget

RUN mkdir /scripts

# install nzbget scripts
RUN apk add --no-cache git
RUN git clone -b nightly https://github.com/clinton-hall/nzbToMedia.git /scripts/nzbToMedia

RUN chmod 775 -R /scripts
