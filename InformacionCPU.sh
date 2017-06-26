#!/bin/bash
cores=`grep "model name" /proc/cpuinfo | wc -l`
modelo=`grep -m1 "model name" /proc/cpuinfo`
cache=`grep -m1 "cache size" /proc/cpuinfo`
GHz=`echo ${modelo#*@}`
cores=$((cores-1))

echo ${modelo%@*};
echo cores : $cores 
echo clock frequency: ${GHz}
echo $cache
