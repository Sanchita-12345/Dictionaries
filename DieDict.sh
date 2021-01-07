#!/bin/bash
declare -A dictionary
dictionary[1]=0;
dictionary[2]=0;
dictionary[3]=0;
dictionary[4]=0;
dictionary[5]=0;
dictionary[6]=0;

minimum=11;
maximum=-1;
secondMinimum=0;

getDieNumber () {
	randomValue=$(( RANDOM%6+1 ));
	#echo "RANDOM RESULT : "$randomValue;
	storeInDictionary $randomValue;
}
storeInDictionary () {
	key=$1;
	dictionary[$key]=$(( ${dictionary[$key]} + 1 ));
}

getMinimumMaximum () {
	for ((i=1; i<=${#dictionary[@]}; i++))
	do
		if [ ${dictionary[$i]} -lt $minimum ]
		then
			secondMinimum=$minimum;
			minimum=${dictionary[$i]};
		elif [[ ${dictionary[$i]} -lt $secondMinimum && ${dictionary[$i]} -ne $minimum ]]
		then
			secondMinimum=${dictionary[$i]};
		fi;
		if [ ${dictionary[$i]} -gt $maximum ]
		then
			maximum=${dictionary[$i]};
		fi;
	done;
}
rollDieMain () {
	while [[ ${dictionary[1]} -ne 10 && ${dictionary[2]} -ne 10 && ${dictionary[3]} -ne 10 && ${dictionary[4]} -ne 10 && ${dictionary[5]} -ne 10 && ${dictionary[6]} -ne 10 ]]
	do
		getDieNumber;
	done;

	getMinimumMaximum;
}
rollDieMain;

echo "ALL KEYS IN DICTIONARY : " ${!dictionary[@]};
echo "ALL ELEMENTS IN DICTIONARY : " ${dictionary[@]};
echo "MINIMUM VALUE : " $minimum;
echo "SECOND MINIMUM VALUE : " $secondMinimum;
echo "MAXIMUM VALUE : " $maximum;
