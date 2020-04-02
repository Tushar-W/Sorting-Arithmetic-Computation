#!/bin/bash -x

echo "Sorting Arithmetic Computation"

function addAndMultiplyNum() {
	a=$1	b=$2 c=$3
	echo result=$(($a + $b * $c))
}
function multiplyAndAddNum() {
	a=$1	b=$2 c=$3
	echo result=$(($a * $b + $c))
}

read -p "Enters Three Numbers:" a b c
echo result=$( addAndMultiplyNum $a $b $c )
echo result=$( multiplyAndAddNum $a $b $c )

