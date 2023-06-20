# Lösung zu Lab: Formatierung
1.
```powershell
Get-Service | Sort-Object -Property Status,Displayname | Format-Table -GroupBy Status | Out-File -FilePath C:\Testfiles\LabLoesungFormatierung.txt
```
