clear

while ($true)
{
    $userInput = Read-Host -Prompt "Would you like to view services that are running, stopped or all? (or type quit to end the program)"
    $validArgs = @('all', 'stopped', 'running')

    if ($validArgs -eq $userInput)
    {
        if ($userInput -eq "all")
        {
            $services = Get-Service
            $services
        }
        else
        {
            $services = Get-Service | Where-Object { $_.Status -eq $userInput }
            $services
        }
    }
    elseif ($userInput -eq "quit")
    {
        break;
    }
    else
    {
        Write-Host "Invalid Input, try again."
    }

}





