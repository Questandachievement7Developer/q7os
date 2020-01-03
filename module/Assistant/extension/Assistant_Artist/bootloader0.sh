#!/bin/bash
echo $1
echo Bootloader for Artistic Style 0.2Beta
	echo Bootloader for Artistic Style 0.1Beta
	python3 generate.py --content input.jpg --styles style.jpg --output result.jpg --overwrite
	gthumb /Assistant/extension/Assistant_Artist/result.jpg
	echo done
