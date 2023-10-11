touch table.html
printf "" > table.html\

echo "<html>

<body>

<table>
" >> table.html

echo "<tr>
	<th>IP</th>
	<th>Time</th>
	<th>RequestedPage</th>
	<th>UserAgent</th>
</tr>" >> table.html

# do doop
while read line
do
	lineip=$(echo "${line}" | cut -d' ' -f 1)
	linetime=$(echo "${line}" | cut -d' ' -f 4 | tr -d "[")
	temp1=$(echo "${line}" | cut -d'"' -f 2)
	linerequested='"'"${temp1}"'"'
	lineagent=$(echo "${line}" | cut -d' ' -f 12)

	echo "<tr>
		<td>"${lineip}"</td>
		<td>"${linetime}"</td>
		<td>"${linerequested}"</td>
		<td>"${lineagent}"</td>
</tr>" >> table.html

done < combinedlogs.txt

# end doop

echo "
</table>

</body>

<html>" >> table.html