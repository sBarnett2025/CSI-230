function listips ()
{
	touch clientips.txt
	printf "" > clientips.txt
	cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq
	cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq >> clientips.txt
}


function visitors ()
{
	cat /var/log/apache2/access.log | grep -i -E "$(date '+%d/%b/%Y')" | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c
}


function badclients ()
{
	touch blacklisted.txt
	printf "" > blacklisted.txt
	while read line
	do
		var=$( cat /var/log/apache2/access.log | grep -i -E "$(date '+%d/%b/%Y:%H')" | grep -o -E "${line}" | grep -i -E "400\|403\|404" | wc -l )
		if [[ "${var}" -gt "3" ]]
		then
			printf "${line}" >> blacklisted.txt
		fi
	done < "clientips.txt"
}


function histogram ()
{
	cat /var/log/apache2/access.log | grep -i -E "200" | grep -i -o -E "[0-9]{1,2}\/[a-z]{1,3}\/[0-9]{1,4}" | sort | uniq -c
}


function blockips ()
{
	while read line
	do
		iptables -A INPUT -s "${line}" -j DROP
		echo "${line} blocked"
	done < "blacklisted.txt"
}


function resetblocks ()
{
	echo "IP's unblocked"
	iptables -F
	printf "" > blacklisted.txt
}


function menu ()
{
	inputstring="0"
	while [[ "${inputstring}" -ne "7" ]]
	do
		echo "[1]: Number Of Visitors"
        	echo "[2]: Display Visitors"
        	echo "[3]: Show Bad Visits"
       		echo "[4]: Block Bad Visits"
       	 	echo "[5]: Reset Block Rules"
        	echo "[6]: Show Visit Histogram"
	        echo "[7]: Quit"

		read inputstring

		if [ "${inputstring}" -eq "1" ]
		then
		{
			listips
		}
		elif [ "${inputstring}" -eq "2" ]
		then
		{
			visitors
		}
		elif [ "${inputstring}" -eq "3" ]
		then
		{
			badclients
		}
		elif [ "${inputstring}" -eq "4" ]
		then
		{
			blockips
		}
		elif [ "${inputstring}" -eq "5" ]
		then
		{
			resetblocks
		}
		elif [ "${inputstring}" -eq "6" ]
		then
		{
			histogram
		}
		elif [ "${inputstring}" -eq "7" ]
		then
		{
			echo "Program Closing"
		}
		else
		{
			echo "Invalid Input. Please Try again"
		}
		fi
	done
}

menu