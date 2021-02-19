FROM golang:1.15-alpine3.12
MAINTAINER support@percipient.ai

RUN apk add --no-cache ffmpeg bash 

RUN ffprobe -version

WORKDIR "/rtsp_camera/"
RUN cd /tmp && wget https://github.com/aler9/rtsp-simple-server/releases/download/v0.14.1/rtsp-simple-server_v0.14.1_linux_amd64.tar.gz
RUN cd /rtsp_camera && tar xzvf /tmp/rtsp-simple-server_v0.14.1_linux_amd64.tar.gz
COPY rtsp-simple-server.yml /rtsp_camera/
COPY *.sh /rtsp_camera/

ENTRYPOINT [ "/rtsp_camera/rtsp-simple-server" ]
