input="binaryips.txt"
touch possibleips.txt
printf "" > possibleips.txt

cat "$input" | while read line
do
	bin1="${line:0:8}"
	bin2="${line:8:8}"
	bin3="${line:16:8}"
	bin4="${line:24:8}"
	dec1=$((2#"${bin1}"))
	dec2=$((2#"${bin2}"))
	dec3=$((2#"${bin3}"))
	dec4=$((2#"${bin4}"))

	printf "${dec1}" >> possibleips.txt
	printf "." >> possibleips.txt
	printf "${dec2}" >> possibleips.txt
        printf "." >> possibleips.txt
	printf "${dec3}" >> possibleips.txt
        printf "." >> possibleips.txt
	printf "${dec4}\n" >> possibleips.txt

done
