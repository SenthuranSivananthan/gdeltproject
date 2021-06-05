function DownloadData($limitToYears)
{
    $DATA_URL = "http://data.gdeltproject.org/gdeltv2/masterfilelist.txt"
    $FILE_ON_DISK = "$pwd\masterfilelist.txt"

    $RAW_DATA_BASEFOLDER = "$pwd\raw"

    New-Item -Path $RAW_DATA_BASEFOLDER -ItemType Directory -Force

    Write-Host "Downloading File: $DATA_URL to $FILE_ON_DISK"
    Invoke-WebRequest -Uri $DATA_URL -OutFile $FILE_ON_DISK

    Write-Host "Reading File: $FILE_ON_DISK"
    $streamReader = New-Object System.IO.StreamReader($FILE_ON_DISK)

    $recordCount = 0

    while (($line = $streamReader.ReadLine()) -ne $null)
    {
        $recordCount++
        $lineData = $line -split ' '
    
        $downloadUrl = $lineData[2].Trim()
        $fileName = $downloadUrl.Substring($downloadUrl.LastIndexOf("/") + 1)
        $year = $fileName.Substring(0, 4)

        if ($limitToYears.Length -eq 0 -or $limitToYears -contains $year)
        {
            # Ensure sub directory is created
            if (-not(Test-Path -Path $RAW_DATA_BASEFOLDER\$year))
            {
                New-Item -Path $RAW_DATA_BASEFOLDER\$year -ItemType Directory -Force
            }

            $downloadSaveLocation = "$RAW_DATA_BASEFOLDER\$year\$fileName"

            if (-not(Test-Path -Path $downloadSaveLocation))
            {
                Write-Host "Record $recordCount - Downloading: $downloadUrl"
                Invoke-WebRequest -Uri $downloadUrl -OutFile $downloadSaveLocation
            }
            else
            {
                Write-Host "Record $recordCount - Exists.  Skipped $downloadUrl"
            }
        }
        else
        {
            Write-Host "Record $recordCount - File not in included years: $limitToYears.  Skipped $downloadUrl"
        }
    }

    Write-Host "Processed $recordCount files"
    Write-Host "Done!"
}

#$limitYears = 2020, 2021
$limitYears = $()
DownloadData $limitYears
