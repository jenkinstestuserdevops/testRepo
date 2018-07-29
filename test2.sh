#!/bin/bash

foo=1
bar=3

if [ $(($foo + $bar)) == 3 ]; then
    exit 0
else
    exit 1
fi


