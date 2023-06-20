$a = "<style>"
$a = $a + "BODY{background-color:peachpuff;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:thistle}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:PaleGoldenrod}"
$a = $a + "</style>"

$html = Get-Service | Select-Object -Property Status,Name,DisplayName | ConvertTo-Html -Head $a -Body "<H2>Dienst Infos</H2>" 

#Out-File -InputObject $html -FilePath C:\Testfiles\services.html 

Send-MailMessage -To recipent@domain.tld -From sender@domain.tld -Subject "Status" -Body $html -BodyAsHtml -SmtpServer smtp.server.tld 