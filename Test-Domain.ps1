function Test-Domain
{
 Param(
    [parameter(Mandatory=$true)]
    [String]$Domains 
    )

$uri = "https://api.openprovider.eu/v1beta/domains/check"
$DomlistArray = @()
$bearcreds = Get-BearereCreds

$IdnScript = [pscustomobject]@{
idn_scrypt = "cyrl"}

Foreach ($Domain in $Domains)
{
$TLD = $Domain.Substring($Domain.IndexOf(".") + 1)
$DomName = ($domain.Split("."))[0]

$Domlist = [pscustomobject]@{
extension = $TLD
name = $DomName}

$DomListArray = $DomListArray + $DomList
}

$DomBody = [pscustomobject]@{
additional_data = $IdnScript
application_mode = "preregistration"
domains = $DomListArray
with_price = $true 
with_whois = $true }
$DomBodyJson = $DomBody | ConvertTo-Json

$Bearer = Get-BearereCreds
$Domheader = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$Domheader.Add("Authorization","Bearer " +  $bearcreds.token) 

$Result = Invoke-RestMethod -Method Post -Uri $uri -Headers $Domheader -body $DomBodyJson -ContentType 'application/json'

return $Result.data.results