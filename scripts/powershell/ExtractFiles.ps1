function ExtractFiles
{
    $RAW_DATA_BASEFOLDER = "$pwd\raw"
    $EXTRACTED_DATA_BASEFOLDER = "$pwd\extracted"

    New-Item -Path $EXTRACTED_DATA_BASEFOLDER -ItemType Directory -Force

    Get-ChildItem -Path $RAW_DATA_BASEFOLDER | ForEach-Object {
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

ExtractFiles
