[cmdletBinding()]
param(

[string]$ComputerName = "localhost",

[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5
)
$Startzeit = Get-Date
Write-Verbose -Message "Vom User wurden folgende Werte angegeben:"
Write-Verbose -Message "EventID: $EventId"
Write-Verbose -Message "Computername: $ComputerName"
Write-Verbose -Message "Newest: $Newest"

Get-EventLog -LogName Security -ComputerName $ComputerName | Where-Object EventId -eq $EventId | Select-Object -First $Newest

$Laufzeit = (Get-Date) - $Startzeit 
Write-Verbose -Message ("Laufzeit(sec): " + $Laufzeit.TotalSeconds )
