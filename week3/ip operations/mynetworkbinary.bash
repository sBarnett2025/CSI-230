ip=$(bash myipbinary.bash)
pl=$(bash prefixlength.bash)
mask=$(bash mymaskbinary.bash)

network=""

for i in {1..32}
do
	if [[ i -lt pl && "${ip:i-1:1}" == "1" ]]
	then
		network+="1"
	else
		network+="0"
	fi

done
echo "${network}"