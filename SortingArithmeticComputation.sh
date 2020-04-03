#!/bin/bash -x

echo "Sorting Arithmetic Computation"
declare -A computeResults
declare -a resultsInArray

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

function sortDescendingOrder() {

	for (( count=0; count<${#resultsInArray[@]}; ++count ))
	do
		for (( j=$((count+1)); j<${#resultsInArray[@]}; ++j))
		do
			if [ ${resultsInArray[count]} -lt ${resultsInArray[j]} ];
			then
				temp=${resultsInArray[count]}
				resultsInArray[count]=${resultsInArray[j]}
				resultsInArray[j]=$temp
			fi
		done
	done

}

function sortAscendingOrder() {

	for (( count=0; count<${#resultsInArray[@]}; ++count ))
	do
		for (( j=$((count+1)); j<${#resultsInArray[@]}; ++j))
		do
			if [ ${resultsInArray[count]} -gt ${resultsInArray[j]} ];
			then
				temp=${resultsInArray[count]}
				resultsInArray[count]=${resultsInArray[j]}
				resultsInArray[j]=$temp
			fi
		done
	done

}

function storeResultsInDictionary() {

	computeResults["addAndMultiply"]=$( addAndMultiplyNum $a $b $c )
	computeResults["multiplyAndAdd"]=$( multiplyAndAddNum $a $b $c )
	computeResults["addAndDivide"]=$( addAndDivideNum $a $b $c )
	computeResults["modAndAdd"]=$( modAndAddNum $a $b $c )

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
sortDescendingOrder
echo ${resultsInArray[@]}
#shows all computation in ascending order by sorting array
sortAscendingOrder
echo ${resultsInArray[@]}
