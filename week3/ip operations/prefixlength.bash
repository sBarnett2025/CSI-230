
prefix=$(bash myfullip.bash | grep -o -E "/[0-9]{1,2}")
prefix="${prefix:1}"
echo "${prefix}"