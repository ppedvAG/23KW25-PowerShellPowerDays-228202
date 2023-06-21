# Lösung zu Lab PipeLine2

```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers1.csv | New-ADUser
```
Die User werden allerdings mit der obigen Methode deaktiviert angelegt. da Accountpassword als Secure String verlangt wird.

```powershell
Import-Csv -Path C:\Testfiles\MyNewAdUsers2.csv | ForEach-Object {
            New-ADUser -GivenName $_.GivenName `
                       -Surname $_.SurName `
                       -Name $_.Name `
                       -SamAccountName $_.SamAccountName `
                       -Department $_.Department `
                       -Path $_.Path `
                       -Enabled ([bool]::Parse($_.Enabled)) `
                       -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force)
}
```