#!/bin/bash


a="--prefix=/usr/bin"

if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    echo $cpack_prefix_dir
fi
