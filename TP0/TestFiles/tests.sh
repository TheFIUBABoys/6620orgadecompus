#!/bin/bash
FILES="TestFiles/test
TestFiles/test1
TestFiles/test2"

for f in $FILES
do
	./ownRev $f > auxRev
	./ownRev auxRev > doubleRev
	DIFF=$(diff $f doubleRev)
	if [ "$DIFF" != "" ] 
	then
		echo "[ERROR] $f was not reversed correctly"
	else
		echo "[OK] $f was reversed correctly"
	fi
	rm auxRev
	rm doubleRev
done

