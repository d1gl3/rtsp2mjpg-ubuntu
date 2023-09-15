FROM ubuntu:20.04
RUN add-apt-repository -y ppa:savoury1/ffmpeg4 \
    apt update && apt install -y ffmpeg \
    rm -rf /var/lib/apt/lists/*
COPY stream.sh /usr/bin/stream.sh
RUN chmod +x /usr/bin/stream.sh
COPY ffserver.conf /etc/ffserver.conf
ENV RTSP_URL rtsp://freja.hiof.no:1935/rtplive/definst/hessdalen03.stream
ENV FFMPEG_INPUT_OPTS  ""
ENV FFMPEG_OUTPUT_OPTS  ""
ENV FFSERVER_LOG_LEVEL "error"
ENV FFMPEG_LOG_LEVEL  "warning"
ENTRYPOINT stream.sh
