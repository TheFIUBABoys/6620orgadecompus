#!/bin/bash
FILES="test
test1
test2"

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
done

