#!/bin/bash

for i in $(seq 1 1 5)
do
	echo "$i"
	./myprint.out $i
done

