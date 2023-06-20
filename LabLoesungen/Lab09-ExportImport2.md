# Lösung zu Lab: Export / Import 2


Mögliche Lösung 1
```powershell
 Get-Content -Path C:\Testfiles\MyServices.txt | Get-Service
```

Mögliche Lösung 2
```powershell
Get-Service -Name (Get-Content -Path C:\Testfiles\MyServices.txt)
```
