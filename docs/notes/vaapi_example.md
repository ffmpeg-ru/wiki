# Примеры с Intel QSV VA-API

## Описание и ссылки

- Про аппаратное ускорение в целом - <https://trac.ffmpeg.org/wiki/HWAccelIntro#libmfxIntelMediaSDK>
- Про QuickSync в часности - <https://trac.ffmpeg.org/wiki/Hardware/QuickSync>
- Про VAAPI в часности с примерами - <https://trac.ffmpeg.org/wiki/Hardware/VAAPI> 

## Примеры

```sh
docker run \
    --rm \
    -v ${PWD}:/w -w /w \
    --user $(id -u):138 --device /dev/dri:/dev/dri \
    jrottenberg/ffmpeg:5.1-vaapi \
    -hide_banner \
    -hwaccel vaapi \
    -hwaccel_device /dev/dri/renderD128 \
    -hwaccel_output_format vaapi \
    -analyzeduration 10000000 -probesize 10000000 \
    -i rtsp://yuccastream:yuccastream@192.168.1.11/stream1 \
    -map 0 \
    -c:v h264_vaapi \
    -b:v 3M \
    -an \
    -r 25 \
    -g 50 \
    -f hls \
    -strftime 1 \
    -hls_time 2 \
    -hls_list_size 5 \
    -hls_delete_threshold 20 \
    -hls_flags delete_segments+second_level_segment_index \
    -hls_segment_filename %M%S_%%03d.ts \
    ffmpeg-index.m3u8
```

## Ссылки

Пример из личной практики, [Автоматический скринкаст форматер webm > mp4 для Ubuntu 22.04](https://jidckii.ru/screencasts_formater)
