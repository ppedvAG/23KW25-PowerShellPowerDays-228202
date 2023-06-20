# Lösung zu Lab: PipeLine 2

Hauptaufgabe
```powershell
 Get-Process -Name svchost | Measure-Object -Property PM -Sum
```
* Fleißaufgabe
```powershell
(Get-Process -Name svchost | Measure-Object -Property PM -Sum).Sum / 1MB
```
oder über Variablen
```powersehll
$svcsum = Get-Process -Name svchost | Measure-Object -Property PM -Sum
$svcsum.Sum / 1MB
``` 
oder über Hashtable
```powershell
Get-Process -Name svchost | Measure-Object -Property PM -Sum | Format-Table -Property @{n="Sum(MB)";e={$PSItem.Sum / 1MB}}
```

** Fleißaufgabe
```powershell
"{0:N2}" -f ((Get-Process -Name svchost | Measure-Object -Property PM -Sum).Sum / 1MB)
```

mit Hashtable
```powershell
PS C:\> Get-Process -Name svchost | Measure-Object -Property PM -Sum | Format-Table -Property @{n="Sum(MB)";e={"{0:N2}" -f ($PSItem.Sum / 1MB)}}
```