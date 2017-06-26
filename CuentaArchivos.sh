#!/bin/bash
i=0
for file in "$1"/*; do
    i=$(( i + 1 ))      ## $(( )) is POSIX-compliant arithmetic syntax; let is deprecated.
done

echo "$i"