# Möglichkeiten der Parameter Validierung 

Die PowerShell bietet verschiedene Methoden mit denen die Eingabe von Parametern auf Ihre Gültigkeit validiert werden können. Wichtig zu wissen ist hierbei das diese Validates "sticky" zu den Variablen sind. Das heißt auch im Skript können keine ungültigen Werte gesetzt werden. Außer bei der Initialisierung der Variable innerhalb des Parameters.

1. ValidateSet
```powershell
[cmdletBinding()]
param(
    [ValidateSet(1,2,3)]
    [int]$param1
)
```
Mithilfe eines **ValidateSet** können die Möglichkeiten der Parameterwerte fest vorgegeben werden. Bei der Verwendung eines **Parametersets** hat man zu dem den Vorteil das die Möglichkeiten bei **Show-Command** die gültigen Werte als Dropdown Menü erscheinen. Sowie die gültigen Werte beim Aufrug in einer PowerShell mit der Tabulator Taste durchschalten lassen.

---
2. ValidateRange
```powershell
[cmdletBinding()]
param(
    [ValidateRange(0,5)]
    [int]$param1
)
```
Mithilfe einer **ValidateRange** kann sowohl der Minimum als auch der Maximum Wert angegeben werden der für diesen Parameter zulässig ist.

---
3. ValidateScript
```powershell
[cmdletBinding()]
param(
    [ValidateScript({<#Prüfung welche True oder False zurückgeben muss#>})]
    [string]$param1

)
```

---
### ZusatzInfo für die Verwendung von ValidateScript in Verbindung mit einer Pfadvalidierung
Mit diesen zwei Möglichkeiten lässt sich das "Problem" umgehen das in der Variable Destinationpath keine noch nicht vorhanden pfade gesetzt werden können.
```powershell
[cmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateScript({Test-Path -Path $PSItem})]
    [string]$Destinationpath
)
#Möglichkeit 1
$filepath = $Destinationpath + "\Datei.txt"

#Möglichkeit 2
New-Item -Path $Destinationpath -Name "Datei.txt" -ItemType Directory
```
---
4. ValidateLength
```powershell
[cmdletBinding()]
param(
    [ValidateLength(2,10)]
    [string]$param1
)
```

Stellt sicher das die eingegebene Zeichenfolge zwischen 2 und 10 Zeichen lang ist.

---
5. ValidatePattern
```powershell
[cmdletBinding()]
param(
    [ValidatePattern("[a-z]{3}[0-9]{3}[.](csv)")]
    [string]$param1
)
```

Prüft ob der eingegebene String einem gewissen Pattern entspricht. In diesem Pattern wird geprüft das der Wert mit 3 kleinen Buchstaben beginnt, gefolgt von drei Zahlen und mit .csv endet. Es ergibt sich folgene Wahrheitstabelle:
| Status | Wert | 
| --- | --- |
| gültig | "abc123.csv" |
| nicht gültig | 123abc.csv |

Genaueres kann z.B. hier nachgelesen werden
[RegEx101](https://regex101.com/)
