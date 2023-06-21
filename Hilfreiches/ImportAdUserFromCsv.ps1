﻿Import-Csv -Path C:\Testfiles\MyNewAdUsers2.csv | ForEach-Object -Process {
            New-ADUser -GivenName $PSItem.GivenName `
                       -Department $PSItem.Department `
}