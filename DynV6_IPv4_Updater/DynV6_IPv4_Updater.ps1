param (
    #Parameter for token.
    $token
)

function createRequest {
    param (
        #Parameter for the Hostname that was read from the hostnames.txt file
        $hostname
    )

    #Saves the Date in the date variable
    $date = Get-date


    #Adding the lines with the Date and the Hostname for a better overview
    Add-Content -Path .\output.log -Value "--------------------------------", $date, "Hostname: $hostname"


    #Sends a Webrequest to dynv6.com with the given Hostname and Token and writes the output to the output.log file
    Invoke-Webrequest -URI https://dynv6.com/api/update?ipv4=auto'&'token=$token'&'hostname=$hostname | Add-content -Path .\output.log    
}


#Checks if the value of the token variable is zero. If it is zero it will ask for the token.
if ($token -eq $null) {
    Write-Host "No Token given as Parameter. Please paste your token below."
    $token = Read-Host "Token: " 
}


#Gets the content of the hostnames.txt file. For each line it will call the createRequest function with the value of the line.
Get-Content .\hostnames.txt | foreach-object {createRequest $_}
