FROM alpine:3.18.3

ENV REALVNC_TAG="7.6.0"

RUN apk --no-cache --update --upgrade add \
        bash \
        wget \
        libc6-compat \
        libx11 \
        libxext \
        gcompat \
        build-base \
        tar 

RUN  wget -c https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-${REALVNC_TAG}-Linux-x64 -P /root/vncviewer && chmod +x /root/vncviewer/VNC-Viewer-${REALVNC_TAG}-Linux-x64

ENTRYPOINT [ "bash", "-c", "/root/vncviewer/VNC-Viewer-${REALVNC_TAG}-Linux-x64" ]