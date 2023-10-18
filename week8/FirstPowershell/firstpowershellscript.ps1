
clear

Get-EventLog -list

$readLog = Read-Host -prompt "Please select a log to review"

Get-EventLog -logName $readLog -Newest 3 | export-csv -NoTypeInformation -Path "C:\Users\champuser\CSI-230\week8\FirstPowershell\rep.csv"