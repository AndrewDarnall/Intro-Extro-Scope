$header = "GlobalEventID,Date,MonthYear,Year,FractionalDate,Actor1Code,Actor1Name,Actor1CountryCode,Actor2Code,Actor2Name,EventCode,GoldsteinScale,NumMentions,NumSources,NumArticles,AvgTone,GeoType,GeoName,CountryCode,Latitude,Longitude,URL"
$csvFile = "gdelt_merged.csv"
$content = Get-Content $csvFile
$header | Out-File -Encoding utf8 $csvFile
$content | Out-File -Append -Encoding utf8 $csvFile