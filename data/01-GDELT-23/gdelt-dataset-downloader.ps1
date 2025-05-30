# download_gdelt.ps1
$base = "http://data.gdeltproject.org/events/"
$outputFolder = Get-Location

$startDate = Get-Date "2023-01-01"
$filesToDownload = 250  # Adjust for more/less

for ($i = 0; $i -lt $filesToDownload; $i++) {
    $date = $startDate.AddDays($i).ToString("yyyyMMdd")
    $url = "$base$date.export.CSV.zip"
    $outFile = Join-Path $outputFolder "$date.export.CSV.zip"

    if (-Not (Test-Path $outFile)) {
        Write-Host "Downloading: $url"
        try {
            Invoke-WebRequest -Uri $url -OutFile $outFile -ErrorAction Stop
        }
        catch {
            Write-Warning "Failed to download: $url"
        }
        Start-Sleep -Milliseconds 300
    } else {
        Write-Host "Already exists: $outFile"
    }
}
