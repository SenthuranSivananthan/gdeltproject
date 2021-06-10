function ExtractFiles($limitToYears)
{
    $RAW_DATA_BASEFOLDER = "$pwd\raw"
    $EXTRACTED_DATA_BASEFOLDER = "$pwd\extracted"

    New-Item -Path $EXTRACTED_DATA_BASEFOLDER -ItemType Directory -Force

    Get-ChildItem -Path $RAW_DATA_BASEFOLDER | ForEach-Object {
        if ($limitToYears.Length -eq 0 -or $limitToYears -contains $_.BaseName) {
            # Create Directory
            $DestinationDirectory = "$EXTRACTED_DATA_BASEFOLDER\$_"

            New-Item -Path $DestinationDirectory -ItemType Directory -Force

            # Find all files in folder
            Get-ChildItem -Path $_.FullName | ForEach-Object {
                Write-Host "Extracting" $_.FullName
            
                # Extract files
                Expand-Archive -LiteralPath $_.FullName -DestinationPath $DestinationDirectory -Force
            }
        }
    }
}

$limitYears = 2021
#$limitYears = $()

ExtractFiles $limitYears
