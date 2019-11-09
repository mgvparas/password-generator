#!/bin/bash
echo ""
echo "============================"
echo "= Generate Base64 Password ="
echo "============================"
echo ""
echo "Password length: "
read PASSWORD_LENGTH

ATTEMPT_COUNT=1
REPEAT=1

while [ "$REPEAT" == 1 ]
do
	echo "attempt $ATTEMPT_COUNT..."

	generatedPassword=$(openssl rand -base64 48 | cut -c1-$PASSWORD_LENGTH)

	if [[ $generatedPassword == *['!'@#\$%^\&*()_+]* ]]
	then
		echo "$generatedPassword"
		REPEAT=0
	else
		((ATTEMPT_COUNT++))
	fi
done
