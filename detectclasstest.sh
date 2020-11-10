#!/bin/bash
X()
{
 ./darknet detector demo cfg/coco.data cfg/yolov4-tiny.cfg yolov4-tiny.weights http://192.168.1.2:4747/video?dummy=param.mjpg
}
X | grep --line-buffered -w 'keyboard\|tvmonitor\|cup'  >> log.txt

