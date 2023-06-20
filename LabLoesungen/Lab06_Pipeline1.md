# Lösung zu Lab: PipeLine 1
### 1.
```powershell
Get-AdUser -Filter * | Format-Wide -Property SurNane
```
---
### 2.
```powershell
Get-AdUser -Filter * | Sort-Object -Property GivenName | Format-Table
```
---
### 3.
```powershell
Get-AdGroupe -Filter * | Measure-Object
```
---
### 4.
```powershell
Get-AdUser -Filter * | Select-Object -Last 3
```