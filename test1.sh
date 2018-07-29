#!/bin/bash

foo=1
bar=2

if [ $(($foo + $bar)) == 3 ]; then
    exit 0
else
    exit 1
fi


