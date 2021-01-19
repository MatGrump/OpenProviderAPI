function Get-BearereCreds
{
$EndPoint = "https://api.openprovider.eu/v1beta/auth/login"

##Configure Payload
$Body = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$Body.Add("ip","0.0.0.0") 
$Body.Add("username","billing@vfox.co.uk") 
$Body.Add("password","zq0N0*vjyyvHI9#!A!v30Jp") 
$Body = $Body | ConvertTo-Json

$Bearer = (Invoke-RestMethod -Method Post -Uri $EndPoint -body $Body -ContentType 'application/json' ).data
return $Bearer
}