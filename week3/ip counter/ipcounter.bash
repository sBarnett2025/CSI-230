
touch outputfile.txt
printf "outputfile\n" > outputfile.txt

echo "Please enter and ip address"
read ip
echo "please enter the prefix (24 or 16)"
read prefix


myip1="$(cut -d '.' -f1 <<< "${ip}")"
myip2="$(cut -d '.' -f2 <<< "${ip}")"
myip3="$(cut -d '.' -f3 <<< "${ip}")"
myip4="$(cut -d '.' -f4 <<< "${ip}")"

bin1=$(echo "obase=2;$myip1" | bc)
bin2=$(echo "obase=2;$myip2" | bc)
bin3=$(echo "obase=2;$myip3" | bc)
bin4=$(echo "obase=2;$myip4" | bc)

save4="${bin4}"

counter=0

if [ "${prefix}" -eq "16" -o "${prefix}" -eq "24" ]
then
	start3=1
	if [ "${prefix}" -eq 24 ]
	then
		start3=$(("${myip3}"))
	fi

	for (( i=$(("${start3}")); i < 255; i++ ))
	do
		temp3=$(echo "obase=2;$i" | bc)
		for (( j=1; j < 255; j++ ))
		do
			temp4=$(echo "obase=2;$j" | bc)
			printf '%08d' "${bin1}" >> outputfile.txt
			printf "." >> outputfile.txt
			printf '%08d' "${bin2}" >> outputfile.txt
			printf "." >> outputfile.txt
			printf '%08d' "${temp3}" >> outputfile.txt
			printf "." >> outputfile.txt
			printf '%08d\n' "${temp4}" >> outputfile.txt
			let "counter+=1"
			echo "${counter}"
		done

		if [ "${prefix}" -eq "24" ]
		then
			break
		fi
		bin4="${save4}"
	done
	echo "${counter} ip's counted! Check outputfile.txt for results"
else
	echo "prefix invalid, please rerun program"
fi

