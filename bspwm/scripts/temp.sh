#!/bin/sh
echo "   $(sensors | grep temp1 | head -1 | awk '{print $2}')" 
