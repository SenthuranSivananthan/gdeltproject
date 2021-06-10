function ExtractFiles($limitToYears)
{
    $RAW_DATA_BASEFOLDER = "$pwd\raw"
    $EXTRACTED_DATA_BASEFOLDER = "$pwd\extracted"

    New-Item -Path $EXTRACTED_DATA_BASEFOLDER -ItemType Directory -Force

    $maxConcurrentJobs = 50

    # Create a runspace pool where $maxConcurrentJobs is the 
    # maximum number of runspaces allowed to run concurrently    
    $Runspace = [runspacefactory]::CreateRunspacePool(1,$maxConcurrentJobs)

    # Open the runspace pool
    $Runspace.Open()

    # Runspace jobs
    $jobResults = New-Object System.Collections.ArrayList

    Get-ChildItem -Path $RAW_DATA_BASEFOLDER | ForEach-Object {
        if ($limitToYears.Length -eq 0 -or $limitToYears -contains $_.BaseName) {
            # Create Directory
            $DestinationDirectory = "$EXTRACTED_DATA_BASEFOLDER\$_"

            New-Item -Path $DestinationDirectory -ItemType Directory -Force

            # Find all files in folder
            Get-ChildItem -Path $_.FullName | ForEach-Object {
                # Create a new PowerShell instance and tell it to execute in our runspace pool
                $ps = [powershell]::Create()
                $ps.RunspacePool = $Runspace

                # Expand Archive
                [void]$ps.AddCommand("Expand-Archive").AddParameter("LiteralPath",$_.FullName).AddParameter("DestinationPath",$DestinationDirectory).AddParameter("Force")

                # Start Extraction
                $job = $ps.BeginInvoke()
                $jobResults.Add($job)

                Write-Host "Extracting" $_.FullName           
            }
        }
    }

    $pendingJobs = $jobResults.Where({$_.IsCompleted -eq $false}).Count
    while ($pendingJobs -gt 0)
    {
        "Waiting for $pendingJobs extracts to complete"

        sleep -Seconds 10
        $pendingJobs = $jobResults.Where({$_.IsCompleted -eq $false}).Count
    }

    Write-Host "Done!"
}

$limitYears = 2021
#$limitYears = $()

ExtractFiles $limitYears
