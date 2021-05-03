$hookUrl = "https://discord.com/api/webhooks/838669164050644992/wR2SzXBkYM7sbTqVLryFlQ96n6-1euKeW1nBorBbPJMqeUBCn0XBdj_04RWn5kXcvTu9"

$content = @"
Denna bot ger information om lediga padeltider.
"@

$payload = [PSCustomObject]@{
    
    content = $content

}

Invoke-RestMethod -Uri $hookUrl -Method Post -ContentType 'Application/Json' -Body ($payload | ConvertTo-Json)