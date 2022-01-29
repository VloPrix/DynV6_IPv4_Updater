Get-Content .\hostnames.txt | foreach-object {CreateRequest $_}


function CreateRequest {
    param (
        $hostname
    )
    $date = Get-date

    

    Invoke-Webrequest -URI https://dynv6.com/api/update?ipv4=auto'&'token=<token>'&'hostname=$hostname | Add-content -Path .\output.log

    Add-Content -Path .\output.log -Value "--------------------------------", $date, "Hostname: $hostname"
}