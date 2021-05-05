# Webscraper
$request = Invoke-WebRequest -ContentType "application/json; charset=utf-8" -Uri 'https://www.matchi.se/book/schedule?wl=&facilityId=526&date=2021-05-05&sport=5&week=&year=&_=' -UseBasicParsing
$content = $request.content

#Matches
$datePattern = 'title="Available.*'
$results = $content | Select-String $datePattern -AllMatches

#Regex
$regexReplace = $results.Matches.Value -replace '(^title=\")|(<br>)|($*">)'
$regexReplace2 = $regexReplace -replace '(?<=Available)\d+'


# Webhook
$hookUrl = "https://discord.com/api/webhooks/838669164050644992/wR2SzXBkYM7sbTqVLryFlQ96n6-1euKeW1nBorBbPJMqeUBCn0XBdj_04RWn5kXcvTu9"

#$jsonCorrected = [Text.Encoding]::UTF8.GetString([Text.Encoding]::GetEncoding(28591).GetBytes($regexReplace2))

$content = $regexReplace2 | ConvertTo-Json
$payload = [PSCustomObject]@{ 
    content = $content
}
Write-Output $regexReplace2
Invoke-RestMethod -Uri $hookUrl -Method Post -ContentType 'Application/Json; charset=utf-8' -Body ($payload)