# merge_gdelt_csv_zip.ps1

$sourceDir = Get-Location
$tempDir = Join-Path $sourceDir "unzipped"
$outputFile = Join-Path $sourceDir "gdelt_merged.csv"

# Ensure temp and output folders
if (-Not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir | Out-Null
}

# Extract all .csv files from .zip archives
Get-ChildItem -Path $sourceDir -Filter "*.csv.zip" | ForEach-Object {
    Write-Host "Unzipping $($_.Name)..."
    Expand-Archive -Path $_.FullName -DestinationPath $tempDir -Force
}

# Get all .csv files and merge
$csvFiles = Get-ChildItem -Path $tempDir -Filter "*.csv"

$first = $true
Remove-Item -Path $outputFile -ErrorAction SilentlyContinue

foreach ($file in $csvFiles) {
    if ($first) {
        Get-Content $file.FullName | Out-File -FilePath $outputFile -Encoding UTF8
        $first = $false
    } else {
        # Skip header line
        Get-Content $file.FullName | Select-Object -Skip 1 | Out-File -FilePath $outputFile -Append -Encoding UTF8
    }
}

Write-Host "✅ Merged CSV written to: $outputFile"
