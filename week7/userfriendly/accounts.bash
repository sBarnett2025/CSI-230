function helpmenu
{
printf "   HELP MENU
---------------
-d: add -d as an argument for this program to list the accounts that have been disabled
-c: add -c as an argument for this program to count the logins of the user
"
}

if [ ${#} -ne 1 ]
then
        helpmenu
        exit;
fi

while getopts ":dc" option;
do
	case $option in
	d) # list disabled accounts
	cat /etc/shadow | grep -v "nologin" | grep "*" | cut -d ":" -f 1
	;;
	c) # count logins of user
	touch usr.txt
	printf "sbarnett" > usr.txt
	
	username=$(cat usr.txt)
	last ${username}
	var=$(last ${username} | grep "sbarnett" | wc -l)
	echo "${var} logins"
	;;
	*)
	helpmenu
	;;
	esac

done
