clear


# List all the apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log


# List only last 5 apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log -Tail 5


# Display only logs that contain 404 (Not Found) or 400 (Bad Request)
#Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ',' 400 '


# Display only logs that does NOT contain 200 (OK)
$B = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 200 ' -NotMatch
#$B


# From ever .log file in the directory, only get logs that contains the word 'error'
#$A = Get-Content C:\xampp\apache\logs\*.log | Select-String -Pattern 'error'
# Display the last 5 elements of the result array
#$A[-5..-1]



$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
# B was assigned in number 6
$ips = $regex.Matches($B) | select @{Name="IP"; Expression={ $_.value }}
#$ips


# Count $ips from number 8
$counts = $ips | group IP -NoElement
#$counts

# Add a column, if the count is greater than 3, it will be abnormal, otherwise normal
$countsDetailed = $counts | select Count,Name,
@{Name="Decision"; Expression={ if($_.Count -gt 3) {"Abnormal"}
                                else {"Normal"}
                                }}

#$countsDetailed


# Block IPs for which the Detail column is "Abnormal"
foreach($ip in $countsDetailed){

    if ([string]$ip.Decision -match "Abnormal") {
    Write-Host "Blocking $ip.Name"
    New-NetFirewallRule -DisplayName "Bad IPs $ip.Name" -Direction Inbound -Action Block -RemoteAddress $ip.Name
    }
}


# Remove created firewall rules for bad IPs
Remove-NetFirewallRule -DisplayName "Bad IPs*"