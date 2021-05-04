
$response = Invoke-WebRequest -Uri 'https://www.matchi.se/book/schedule?wl=&facilityId=526&date=2021-05-04&sport=5&week=&year=&_=' -UseBasicParsing

$content = $response.content

$datePattern = 'title="Available.*'

$results = $content | Select-String $datePattern -AllMatches

$test = $results.Matches.Value -replace '(^title=\")|(<br>)|($*">)'

echo $test