#!/bin/bash
FILES="TestFiles/test
TestFiles/test1
TestFiles/test2"

for f in $FILES
do
	./ownRev $f > auxRev
	echo $f > auxOriginal
	rev auxOriginal > auxCompRev
	DIFF=$(diff $f auxCompRev)
	if [ "$DIFF" != "" ] 
	then
		echo "[ERROR] $f was not reversed correctly"
	else
		echo "[OK] $f was reversed correctly"
	fi
	rm auxRev
	rm auxOriginal
	rm auxCompRev
done
