#prints full ip 

ip=$(ip addr | grep "inet " | grep "brd " | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}")

echo "${ip}"