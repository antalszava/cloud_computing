#!/bin/bash
prefix=$(date +%H_%d)

EXECUTABLE="linpack"
if [ ! -e $EXECUTABLE ] ; then
	echo "Compiling linpack.c (requires GNU compiler collection)"
	gcc -O -o linpack linpack.c -lm
fi


start=$(date +%s)
while [ "$(($start + 300))" -ge "$(date +%s)" ]
do
   if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
	./linpack.exe | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7 >>"$prefix"_linpack_values 2>&1
   else
	./${EXECUTABLE} | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7 >>"$prefix"_linpack_values 2>&1
   fi
done