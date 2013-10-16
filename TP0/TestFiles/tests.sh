#!/bin/bash
FILES="TestFiles/test
TestFiles/test1
TestFiles/test2"

for f in $FILES
do
	./ownRev $f > auxRev
	rev $f > auxCompRev
	DIFF=$(diff auxRev auxCompRev)
	if [ "$DIFF" != "" ] 
	then
		echo "[ERROR] $f was not reversed correctly"
	else
		echo "[OK] $f was reversed correctly"
	fi
	rm auxRev
	rm auxCompRev
done
