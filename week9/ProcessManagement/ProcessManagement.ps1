# 1.
#clear
#$time = Get-Date
#$timeBack = $time.AddHours(-1)

#$processes = Get-Process | Where-Object { $_.StartTime -ge $timeBack -and $_.ProcessName -like "C*" }
#$processes | Select-Object ProcessName, StartTime


# 2.
#clear
#$processes = Get-Process | Where-Object { $_.ProcessName -notlike "*system32*" }
#$processes | Select-Object ProcessName


# 3.
#clear
#$filePath = "E:\linux class\CSI-230\week9\ProcessManagement\three.csv"
#$stoppedServices = Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Sort-Object -Property DisplayName
#$stoppedServicesSorted | Select-Object ServiceName | Export-Csv -Path $filePath


# 4.
#clear
#$filePath = "E:\linux class\CSI-230\week9"
#Get-ChildItem -Recurse -Path $filePath -Filter *.ps1 | Sort-Object CreationTime | Select-Object Name, CreationTime


# 5.
#clear
#$filePath = "E:\linux class\CSI-230"
#$outputFile = "E:\linux class\CSI-230\week9\ProcessManagement\five.csv"
#$cutOffDate = Get-Date "10/24/2023"

#$final = Get-ChildItem $filePath -Recurse | Where-Object { $_.CreationTime -gt $cutOffDate }
#$final | Select-Object Name, CreationTime | Export-Csv -Path $outputFile -NoTypeInformation


# 6.
clear
$url = "https://www.champlain.edu"
$processes = Get-Process | Where-Object { $_.ProcessName -eq "chrome" }

if ($processes.Count -eq 0)
{
    Start-Process "chrome" $URL
}
else
{
    Stop-Process -Name "chrome" -Force
}


