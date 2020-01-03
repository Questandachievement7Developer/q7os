#!/bin/bash
for i in *.py ; do
echo Porting $i
2to3 -W $i
done
echo Porting to python3 Sucessfull
