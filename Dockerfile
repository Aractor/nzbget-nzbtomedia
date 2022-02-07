# Buldstage
FROM linuxserver/nzbget
MAINTAINER Aractor

VOLUME /scripts

# Install packages
RUN apk update
RUN apk upgrade
RUN apk add --no-cache ffmpeg
RUN apk add --update --no-cache --repository hhttp://dl-cdn.alpinelinux.org/alpine/v3.14/community par2cmdline
RUN apk add --no-cache curl
RUN apk add --no-cache p7zip
RUN apk add --no-cache unrar
RUN apk add --no-cache wget

RUN mkdir /scripts

#Set script directory setting in NZBGet
ONBUILD RUN sed -i 's/^ScriptDir=.*/ScriptDir=\/scripts' /config/nzbget.conf

# install nzbget scripts
RUN apk add --no-cache git
RUN git clone https://github.com/clinton-hall/nzbToMedia.git /scripts/nzbToMedia

# set nzbtomedia settings
RUN echo 'nzbToRadarr.py:auto_update=1' >> /config/nzbget.conf
RUN echo 'nzbToNzbDrone.py:auto_update=1' >> /config/nzbget.conf

RUN chmod 775 -R /scripts
