function Get-BearerCreds
{

    Param(
        [parameter(Mandatory=$true)]
        [String]$UserName,
        [parameter(Mandatory=$true)]
        [String]$Password 
        )
    

$EndPoint = "https://api.openprovider.eu/v1beta/auth/login"

##Configure Payload
$Body = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$Body.Add("ip","0.0.0.0") 
$Body.Add("username",$UserName ) 
$Body.Add("password",$Password) 
$Body = $Body | ConvertTo-Json

$Bearer = (Invoke-RestMethod -Method Post -Uri $EndPoint -body $Body -ContentType 'application/json' ).data
return $Bearer
}