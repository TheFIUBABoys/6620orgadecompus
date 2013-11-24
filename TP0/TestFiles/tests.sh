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

BIN_FILE="TestFiles/testbin"
./ownRev $BIN_FILE > auxRev
./ownRev auxRev > auxDoubleRev
DIFF=$(diff auxDoubleRev $BIN_FILE)
if [ "$DIFF" != "" ]
then
	echo "[ERROR] $BIN_FILE was not reversed correctly"
else
	echo "[OK] $BIN_FILE was reversed correctly"
fi
rm auxRev
rm auxDoubleRev
