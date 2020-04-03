#!/bin/bash -x

echo "Sorting Arithmetic Computation"
declare -A computeResults

function addAndMultiplyNum() {
	a=$1 b=$2 c=$3
	echo $(($a + $b * $c))
}

function multiplyAndAddNum() {
	a=$1 b=$2 c=$3
	echo $(($a * $b + $c))
}

function addAndDivideNum() {
	a=$1 b=$2 c=$3
	echo $(($c + $a / $b))
}

function modAndAddNum() {
	a=$1 b=$2 c=$3
	echo $(($a % $b + $c))
}

function storeResultsInDictionary() {

	computeResults["addAndMultiply"]=$( addAndMultiplyNum $a $b $c )
	computeResults["multiplyAndAdd"]=$( multiplyAndAddNum $a $b $c )
	computeResults["addAndDivide"]=$( addAndDivideNum $a $b $c )
	computeResults["modAndAdd"]=$( modAndAddNum $a $b $c )

}

read -p "Enters Three Numbers:" a b c
#store all results in dictionary
storeResultsInDictionary
echo ${computeResults[@]}
echo ${!computeResults[@]}
