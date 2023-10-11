touch combinedlogs.txt
printf "" > combinedlogs.txt

cat /var/log/apache2/access.log.1 >> combinedlogs.txt
cat /var/log/apache2/access.log >> combinedlogs.txt

tail combinedlogs.txt