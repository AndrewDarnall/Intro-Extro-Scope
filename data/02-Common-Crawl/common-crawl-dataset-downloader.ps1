# Define base URL and local directory
$baseUrl = "https://data.commoncrawl.org/crawl-data/CC-MAIN-2025-21"
$localDir = Get-Location  # current directory where script runs

# Paths to the .gz file and decompressed paths file in current dir
$wetPathsGz = Join-Path $localDir "wet.paths.gz"
$wetPaths = Join-Path $localDir "wet.paths"

# Download the wet.paths.gz file
Write-Host "Downloading wet.paths.gz from $baseUrl/wet.paths.gz ..."
Invoke-WebRequest -Uri "$baseUrl/wet.paths.gz" -OutFile $wetPathsGz -ErrorAction Stop

# Decompress wet.paths.gz to wet.paths
try {
    Write-Host "Decompressing wet.paths.gz ..."
    $fileStream = [IO.File]::OpenRead($wetPathsGz)
    $gzipStream = New-Object IO.Compression.GzipStream($fileStream, [IO.Compression.CompressionMode]::Decompress)
    $outputFileStream = [IO.File]::OpenWrite($wetPaths)

    $buffer = New-Object byte[] 8192
    while (($read = $gzipStream.Read($buffer, 0, $buffer.Length)) -gt 0) {
        $outputFileStream.Write($buffer, 0, $read)
    }

    $outputFileStream.Close()
    $gzipStream.Close()
    $fileStream.Close()
} catch {
    Write-Error "Failed to decompress wet.paths.gz: $_"
    exit 1
}

# Read all WET file paths from wet.paths
$wetFilePaths = Get-Content $wetPaths

# Download each .warc.wet.gz file to current directory
foreach ($path in $wetFilePaths) {
    $fileName = Split-Path $path -Leaf
    $localFilePath = Join-Path $localDir $fileName
    $fileUrl = "https://data.commoncrawl.org/$path"
    if (-Not (Test-Path $localFilePath)) {
        Write-Host "Downloading $fileName ..."
        try {
            Invoke-WebRequest -Uri $fileUrl -OutFile $localFilePath -ErrorAction Stop
        } catch {
            Write-Warning ("Failed to download " + $fileName + ": " + $_)
        }

    } else {
        Write-Host "$fileName already exists, skipping download."
    }
}

Write-Host "Download complete. Files are in $localDir"
