#!/bin/bash
prefix=$(date +%H_%d)

EXECUTABLE="memsweep"
if [ ! -e $EXECUTABLE ] ; then
	echo "Compiling memsweep.c (requires GNU compiler collection) "
	gcc -O -o memsweep memsweep.c -lm
fi


start=$(date +%s)
while [ "$(($start + 300))" -ge "$(date +%s)" ]
do
   if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
	./memsweep.exe >>"$prefix"_memsweep_values 2>&1
   else
	./memsweep >>"$prefix"_memsweep_values 2>&1
   fi
done