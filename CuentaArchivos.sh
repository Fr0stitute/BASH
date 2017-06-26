#!/bin/bash
i=0
for file in $0/*.*
do
let i=$i+1
done
echo $i