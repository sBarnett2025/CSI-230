
echo "Please enter your binary number (32 digits)"

read binary

dec1=$((2#"${binary:0:8}"))
dec2=$((2#"${binary:8:8}"))
dec3=$((2#"${binary:16:8}"))
dec4=$((2#"${binary:24:8}"))