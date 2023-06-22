# Lösung zu Lab Scripting

Das ist eine **mögliche** Lösung wie man ein Skript schreiben könnte welches einen Ordner mit TestFiles und Ordner mit TestFiles beeinhaltet. Es ist zu beachten das viele Wege zum Ziel führen können.

```powershell
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem -PathType Container})]
    [string]$Path,

    [ValidateRange(0,99)]
    [int]$DirCount = 3,

    [ValidateRange(1,99)]
    [int]$FileCount = 9,

    [ValidateLength(3,10)]
    [string]$Name = "TestFiles1",

    [switch]$Force
)

if($Path.EndsWith("\") -ne $true)
{
    $Path += "\"
}

if(Test-Path -Path ($Path + $Name))
{
    if($Force)
    {
        Remove-Item -Path ($Path + $Name) -Force -Recurse
    }
    else
    {
        Write-Host -ForegroundColor Red -Object "Ordner bereits vorhanden, ziehen Sie in Betracht -Force zu verwenden"
        exit
    }
}

$TestFilesDir = New-Item -Path $Path -Name $Name -ItemType Directory

for($i = 1; $i -le $FileCount; $i++)
{
    $FileNumber = "{0:D2}" -f $i
    $FileName = "file" + $FileNumber + ".txt"

    New-Item -Path $TestFilesDir.FullName -Name $FileName -ItemType File
}

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = "{0:D2}" -f $i
    $DirName = "Dir" + $DirNumber

    $subidr = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    for($j = 1; $j -le $FileCount; $j++)
    {
        $FileNumber = "{0:D2}" -f $j
        $FileName = "Dir" + $DirNumber + "-File" + $FileNumber + ".txt"

        New-Item -Path $subidr.FullName -Name $FileName -ItemType File
    }
}
```