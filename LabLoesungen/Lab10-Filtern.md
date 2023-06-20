# Lösung zu Lab: Filtern


Mögliche Lösung:
```powershell
Get-Service | Where-Object -FilterScript {$PSItem.Name.Length -gt 15}
```


