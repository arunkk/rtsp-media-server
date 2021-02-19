#!/bin/bash

handler()
{
    kill -s SIGKILL $PID
}


HOSTNAME=`hostname`
STREAM_NAME=$RTSP_PATH

video_path="/videos/${STREAM_NAME}.mp4"

rtsp_url="rtsp://${HOSTNAME}:${RTSP_PORT}/${STREAM_NAME}"
echo "Streaming ${stream_name} @ ${rtsp_url} "

ffmpeg -re -stream_loop -1 -i ${video_path} -c copy -f rtsp ${rtsp_url} &
PID=$!

trap handler SIGINT

wait $PID
