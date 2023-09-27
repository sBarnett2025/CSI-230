input="possibleips.txt"
touch activehosts.txt
printf "" > activehosts.txt

cat "$input" | while read line
do
	if ping -c "${line}" &> /dev/null
	then
		printf "${line}" >> activehosts.txt
	fi

done