# Lösung zu Lab: Commandlets
1.
```powershell
Get-Command -Noun Computer
#oder
Get-Command -Noun *Computer*
```

2. 
Hierfür ist ein Download der Hilfe notwendig mit **Update-Help**
```powershell
Get-Help Get-AdUser -Examples
```
3.
```powershell
Get-Alias -Name dir,cd
```
oder
```powershell
Get-Command -Name dir,cd
```

4. 
```powershell
Get-ChildItem -Path C:\Testfiles\ -Filter *.txt -Recurse | Remove-Item -WhatIf
```