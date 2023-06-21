<#
.SYNOPSIS
 Kurzbeschreibung des Skriptes
.DESCRIPTION
 Lange ausführliche Beschreibung des Skriptzweckes
.PARAMETER EventId
 4624 | Anmeldung
 4625 | fehlgeschlagene Anmeldung
 4634 | Abmeldung
.EXAMPLE
 Get-EventLog.ps1 -EventId 4624

 Index Time          EntryType   Source                 InstanceID Message
 ----- ----          ---------   ------                 ---------- -------
556827 Jun 21 14:25  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
556824 Jun 21 14:25  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
556820 Jun 21 14:24  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
556815 Jun 21 14:23  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
556812 Jun 21 14:23  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
.LINK
 https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#syntax-for-comment-based-help
#>
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
