# Motion detection

Детекция двидения с помощью ffmpeg

## Описание

В ffmpeg есть фильтр:  
<http://ffmpeg.org/ffmpeg-all.html#select_002c-aselect>  

Фильтр `select=gt(scene\,0.007)` измеряет кол-во изменённых пикселей в новом кадре относительно предыдущего.  
Параметр `scene\,0.007` регулируется в зависимости от разрешения и определяет чувствительность к изменениям.  
Чем ближе к 0 тем чувствительнее фильтр.
Фильтр `showinfo` пишет информацию о найденных изменениях в лог.  

## Пример

```sh
ffmpeg -rtsp_transport tcp -i rtsp://192.168.87.12/stream1 -vf "select=gt(scene\,0.007),showinfo" -f null  

ffmpeg -rtsp_transport tcp -i rtsp://192.168.87.12/stream1 -f image2 -vsync 2  -vf "select=gt(scene\,0.018),showinfo" 4det_%d.jpg
```  

При обнаружении кадра пишет в лог (stderr)

```sh
[Parsed_showinfo_1 @ 0x563bb1a3ae40] n: 554 pts:115329600 pts_time:1281.44 pos:       -1 fmt:rgb24 sar:0/1 s:1920x1080 i:P iskey:1 type:I checksum:E1F11471 plane_checksum:[E1F11471] mean:[130] stdev:[50.2]
[Parsed_showinfo_1 @ 0x563bb1a3ae40] color_range:tv color_space:bt709 color_primaries:bt709 color_trc:bt709
[Parsed_showinfo_1 @ 0x563bb1a3ae40] n: 555 pts:124689600 pts_time:1385.44 pos:       -1 fmt:rgb24 sar:0/1 s:1920x1080 i:P iskey:1 type:I checksum:2DD18286 plane_checksum:[2DD18286] mean:[124] stdev:[54.3]
[Parsed_showinfo_1 @ 0x563bb1a3ae40] color_range:tv color_space:bt709 color_primaries:bt709 color_trc:bt709
[Parsed_showinfo_1 @ 0x563bb1a3ae40] n: 556 pts:124779600 pts_time:1386.44 pos:       -1 fmt:rgb24 sar:0/1 s:1920x1080 i:P iskey:1 type:I checksum:6C53AF4D plane_checksum:[6C53AF4D] mean:[126] stdev:[53.5]
[Parsed_showinfo_1 @ 0x563bb1a3ae40] color_range:tv color_space:bt709 color_primaries:bt709 color_trc:bt709
[Parsed_showinfo_1 @ 0x563bb1a3ae40] n: 557 pts:124869600 pts_time:1387.44 pos:       -1 fmt:rgb24 sar:0/1 s:1920x1080 i:P iskey:1 type:I checksum:6B178DBA plane_checksum:[6B178DBA] mean:[130] stdev:[51.5]

```
