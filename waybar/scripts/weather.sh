#!/bin/bash
temp=$(curl -s "wttr.in/Warsaw?format=%t")
echo " $temp"
