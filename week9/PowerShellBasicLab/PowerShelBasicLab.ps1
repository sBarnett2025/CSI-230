clear



# Get IPv4 Address from Ethernet Interface
(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*" ).IPAddress



# Get IPv4 PrefixLength from Ethernet Interface
(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*" ).PrefixLength



# Show me what classes there is of Win32 library that starts with net
# sort aphabetically
Get-WmiObject -list | where { $_.Name -ilike "Win32_[N][e][t]*" } | Sort-Object



# Get dhcp server ip
# Hide the table headers
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer | Format-Table -HideTableHeaders



# Get dns server ips and display only the first one
(Get-DnsClientServerAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*" ).ServerAddresses[0]



# Choose a directory where you have some files
cd "C:\Users\champuser\CSI-230\week9\PowerShellBasicLab"

# List based on the file name
$files=(Get-ChildItem)
for($j=0; $j -le $files.count; $j++)
{
    if ($files[$j].extension -ilike "*ps1")
    {
        $files[$j].BaseName +$files[$j].extension
    }
}



# Create folder if it does not exist
$folderPath = "C:\Users\champuser\CSI-230\week9\PowerShellBasicLab\outfolder"
if (Test-Path $folderPath)
{
    Write-Host "Folder Already Exists"
}
else
{
    New-Item -ItemType Directory -Path $folderPath
}



cd "C:\Users\champuser\CSI-230\week9\PowerShellBasicLab"
$files=dir

$folderPath = "C:\Users\champuser\CSI-230\week9\PowerShellBasicLab\outfolder"
$filePath = Join-Path $folderPath "out.csv"
# List all the files that has the extension ".ps1"
# and save the results to out.csv file
$files | where { $_.extension -like ".ps1" } | Export-Csv -Path $filePath










# Without changing directory (don't go in outfolder), find
# every .csv file recursively and change their extensions to
# .log Recursively display all the files (not directories)
$files=00000000000000000 -0000000 -00000
$files | 0000000000 - 0000000 { $_.0000 -00000000 '.csv' , '.log' }
Get-00000000000 - 000000 -00000