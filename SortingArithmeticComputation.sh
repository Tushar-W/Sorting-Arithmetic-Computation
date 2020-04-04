#!/bin/bash -x

echo "Sorting Arithmetic Computation"
declare -A computeResults
declare -a resultsInArray

function addAndMultiplyNum() {
	echo $(($a + $b * $c))
}

function multiplyAndAddNum() {
	echo $(($a * $b + $c))
}

function addAndDivideNum() {
	echo $(($c + $a / $b))
}

function modAndAddNum() {
	echo $(($a % $b + $c))
}

function sortArray() {
	operand=$1
	for (( count=0; count<${#resultsInArray[@]}; ++count ))
	do
		for (( j=$((count+1)); j<${#resultsInArray[@]}; ++j))
		do
			if [ ${resultsInArray[count]} $operand ${resultsInArray[j]} ];
			then
				temp=${resultsInArray[count]}
				resultsInArray[count]=${resultsInArray[j]}
				resultsInArray[j]=$temp
			fi
		done
	done
}

function storeResultsInDictionary() {
	computeResults["addAndMultiply"]=$( addAndMultiplyNum )
	computeResults["multiplyAndAdd"]=$( multiplyAndAddNum )
	computeResults["addAndDivide"]=$( addAndDivideNum )
	computeResults["modAndAdd"]=$( modAndAddNum )
}

function storeValuesInArray() {
	resultsInArray[0]=${computeResults["addAndMultiply"]}
	resultsInArray[1]=${computeResults["multiplyAndAdd"]}
	resultsInArray[2]=${computeResults["addAndDivide"]}
	resultsInArray[3]=${computeResults["modAndAdd"]}
}

read -p "Enters Three Numbers:" a b c
#store all results in dictionary
storeResultsInDictionary
echo ${computeResults[@]}
echo ${!computeResults[@]}
#store values in Array from dictionary
storeValuesInArray
echo ${resultsInArray[@]}
echo ${!resultsInArray[@]}
#shows all computation in descending order by sorting array
sortArray -lt
echo ${resultsInArray[@]}
#shows all computation in ascending order by sorting array
sortArray -gt
echo ${resultsInArray[@]}
