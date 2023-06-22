function New-TestFiles
{
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem -PathType Container})]
    [string]$Path,

    [ValidateRange(1,99)]
    [int]$FileCount = 9,
    
    [ValidateLength(3,10)]
    [string]$Name = "File"

)
    for($i = 1; $i -le $FileCount; $i++)
    {
        $FileNumber = "{0:D2}" -f $i
        $FileName = $Name + $FileNumber + ".txt"

        New-Item -Path $Path -Name $FileName -ItemType File
    }
}

function New-TestFilesDir
{
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
        throw "Ordner bereits vorhanden, nutzen Sie den Paramter Force um den bestehenden Ordner zu überschreiben"
        #Write-Error -Message "Ordner bereits vorhanden, nutzen Sie den Paramter Force um den bestehenden Ordner zu überschreiben" -ErrorAction Stop
        <# ersetzen durch Fehlerhandling
        Write-Host -ForegroundColor Red -Object "Ordner bereits vorhanden, ziehen Sie in Betracht -Force zu verwenden"
        exit
        #>
    }
}

$TestFilesDir = New-Item -Path $Path -Name $Name -ItemType Directory

New-TestFiles -Path $TestFilesDir.FullName -FileCount $FileCount
<# Ersetzt durch obigen Funktionsaufrauf New-TestFiles

for($i = 1; $i -le $FileCount; $i++)
{
    $FileNumber = "{0:D2}" -f $i
    $FileName = "file" + $FileNumber + ".txt"

    New-Item -Path $TestFilesDir.FullName -Name $FileName -ItemType File
}#>

for($i = 1; $i -le $DirCount; $i++)
{
    $DirNumber = "{0:D2}" -f $i
    $DirName = "Dir" + $DirNumber

    $subdir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    New-TestFiles -Path $subdir.FullName -Name ($DirName + "-File") -FileCount $FileCount
    <#Ersetzt durch Funktionsaufruf New-TestFiles
    for($j = 1; $j -le $FileCount; $j++)
    {
        $FileNumber = "{0:D2}" -f $j
        $FileName = "Dir" + $DirNumber + "-File" + $FileNumber + ".txt"

        New-Item -Path $subdir.FullName -Name $FileName -ItemType File
    }#>
}
}

function Test-ParameterSet
{
[cmdletBinding(DefaultParameterSetName="Set1",PositionalBinding=$false)]
param(
[Parameter(Mandatory=$true,ParameterSetName="Set1")]
[string]$Param1,

[Parameter(Mandatory=$true,ParameterSetName="Set2")]
[string]$Param2,


[Parameter(Mandatory=$false,ParameterSetName="Set1")]
[Parameter(Mandatory=$true,ParameterSetName="Set2")]
[string]$Param3

)
}