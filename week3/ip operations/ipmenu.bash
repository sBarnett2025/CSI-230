echo "Hello, welcome to ipmenu"
ifcontinue=1

while [ "${ifcontinue}" -eq "1" ]
do
	echo "Please enter a choice"
	echo "1-Get my ip address"
	echo "2-Get my ip address in binary"
	echo "3-Get my network mask in binary"
        echo "4-Get my network address in binary"
        echo "5-Convert a binary number to IP address"
        echo "6-Quit"
	read choice
	if [ "${choice}" -eq "1" ]
	then
		echo "Your ip is: "
		bash myip.bash
	elif [ "${choice}" -eq "2" ]
	then
		echo "your ip address in binary is"
		bash myipbinary.bash
	elif [ "${choice}" -eq "3" ]
	then
		echo "your network mask in binary is"
		bash mymaskbinary.bash
	elif [ "${choice}" -eq "4" ]
	then
		echo "your network address in binary is"
		bash mynetworkbinary.bash
	elif [ "${choice}" -eq "5" ]
	then
		bash convbin2ip.bash "${binary}"
	elif [ "${choice}" == "6" ]
	then
	ifcontinue=0
		echo "Goodbye, please come again."
	else
		echo "Invalid input, please try again"
	fi

done