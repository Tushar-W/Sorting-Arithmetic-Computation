#!/bin/bash -x

echo "Sorting Arithmetic Computation"

function addAndMultiplyNum() {
	a=$1	b=$2 c=$3
	result=$(($a + $b * $c))
	echo $result
}
read -p "Enters Three Numbers:" a b c
echo result=$( addAndMultiplyNum $a $b $c )

