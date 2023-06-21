# Lösung zu Lab Schleifen

```powershell
for($i=2;$i -le 10; $i+=2)
{
    Write-Host -Object $i
}
```
oder
```powershell
for($i = 1; $i -le 5; $i++)
{
    $i * 2
}
```
oder
```powershell
for($i = 1; $i -le 10; $i++)
{
    if($i%2 -eq 0)
    {
        $i
    }
}
```
oder
```powershell
for($i = 1; $i -le 10; $i++)
{
    if($i/2 -is [int])
    {
        $i
    }
}
```