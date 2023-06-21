## Verzweigungen
### If / ElseIf Konstruktion
```powershell
if(3 -gt 2)
{
    Write-Host -Object "YAY" -ForegroundColor Green
}
else
{
    Write-Host -Object "Fehler in der Matrix" -ForegroundColor Red
}

if($this -gt $those)
{

}
elseif($dasda -lt $diesdas)
{

}else{

}
```
### Switch Case
```powershell
$a = 5
switch($a)
{
    1 { Write-Host -Object "Ausgabe" -ForegroundColor Green}
    2 { Write-Host -Object "Ausgabe" -ForegroundColor Red}
    3 { Write-Host -Object "Ausgabe" -ForegroundColor Magenta}
    4 { Write-Host -Object "Ausgabe" -ForegroundColor Brown}
    default {Write-Host -Object "Error" -ForegroundColor Cyan}
}
```