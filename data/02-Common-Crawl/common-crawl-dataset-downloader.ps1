# download_commoncrawl_latest.ps1

# Set base URL and local output directory
$baseUrl = "https://data.commoncrawl.org/"
$outputFolder = Get-Location

# Step 1: Download the latest wet.paths.gz file (updated to the latest crawls - from the year 2025)
$wetPathsGz = Join-Path $outputFolder "wet.paths.gz"
Invoke-WebRequest -Uri "${baseUrl}crawl-data/CC-MAIN-2025-21/wet.paths.gz" -OutFile $wetPathsGz

# Step 2: Extract wet.paths.gz
$wetPathsFile = Join-Path $outputFolder "wet.paths"
if (Test-Path $wetPathsFile) { Remove-Item $wetPathsFile -Force }
# Use gzip decompression instead of zip expansion for .gz
$inStream = [System.IO.Compression.GzipStream]::new([System.IO.File]::OpenRead($wetPathsGz), [System.IO.Compression.CompressionMode]::Decompress)
$outStream = [System.IO.File]::Create($wetPathsFile)
$inStream.CopyTo($outStream)
$inStream.Close()
$outStream.Close()

# Step 3: Read list of WET file paths
$wetPaths = Get-Content -Path $wetPathsFile

# Step 4: Download first N files (approx. 5GB total)
$filesToDownload = 12  # Change this if needed

for ($i = 0; $i -lt $filesToDownload; $i++) {
    $relativePath = $wetPaths[$i]
    $fileName = Split-Path -Path $relativePath -Leaf
    $url = "$baseUrl$relativePath"
    $outFile = Join-Path $outputFolder $fileName

    if (-Not (Test-Path $outFile)) {
        Write-Host "Downloading: $fileName"
        try {
            Invoke-WebRequest -Uri $url -OutFile $outFile -ErrorAction Stop
        }
        catch {
            Write-Warning "Failed to download: $url"
        }
        Start-Sleep -Milliseconds 300
    } else {
        Write-Host "Already exists: $fileName"
    }
}
