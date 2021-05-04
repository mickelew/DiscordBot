#
# Webscraper
#
$request = Invoke-WebRequest -Uri 'https://www.matchi.se/book/schedule?wl=&facilityId=526&date=2021-05-05&sport=5&week=&year=&_=' -UseBasicParsing
$content = $request.content
$datePattern = 'title="Available.*'
$results = $content | Select-String $datePattern -AllMatches
$matched = $results.Matches.Value -replace '(^title=\")|(<br>)|($*">)'

#
# Webhook
#
$hookUrl = "https://discord.com/api/webhooks/838669164050644992/wR2SzXBkYM7sbTqVLryFlQ96n6-1euKeW1nBorBbPJMqeUBCn0XBdj_04RWn5kXcvTu9"
$content = $matched

$payload = [PSCustomObject]@{ 
    content = $content
}
Write-Output $content
#Invoke-RestMethod -Uri $hookUrl -Method Post -ContentType 'Application/Json' -Body ($payload | ConvertTo-Json)