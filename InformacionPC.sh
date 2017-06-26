#!/bin/bash
cores=`grep "model name" /proc/cpuinfo | wc -l`
modelo=`grep -m1 "model name" /proc/cpuinfo`
cache=`grep -m1 "cache size" /proc/cpuinfo`
echo ${modelo:13:-1}
echo ${cache:13:-1}
#cache size