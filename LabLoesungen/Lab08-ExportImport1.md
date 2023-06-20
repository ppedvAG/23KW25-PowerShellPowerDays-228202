# Lösung zu Lab: Export / Import 1


Effiziente Lösung:
```powershell
 Get-EventLog -LogName System -Newest 10 | Export-Csv -Path C:\Testfiles\events.csv
```

Alternative aber langsamere Lösung:
```powershell
Get-EventLog -LogName System | Select-Object -First 10 | Export-Csv -Path C:\Testfiles\events.csv
```
