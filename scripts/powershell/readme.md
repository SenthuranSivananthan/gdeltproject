# Download Data Files

You can use either `DownloadDataFiles.ps1` or `DownloadDataFilesMultiThreaded.ps1`.  As the name suggests on the latter, the multi-threaded version will download 10 files concurrently.  Concurrency can be adjusted as required.

As of June 5, 2021, the full download (compressed format) will require 1.5TB of storage.

Both scripts will create sub directories based on `current working directory` of the execution context.  The directory structure will be as follows:

```
$pwd
  \raw
    \year1
      \file1
      \file2
    \year2
      \file1
      \file2
```

# Extract Data Files

Use `ExtractFiles.ps1` to extract the zip files from the `raw` directory into `extracted` directory.  This `extracted` directory will be created automatically.  The script will extract the files based on year sub directories.

# Migrate files to different location using Robocopy

```cmd
robocopy f:\ e:\ /E /Z /ZB /R:5 /W:5 /TBD /NP /V /MT:16
```

```
f:\ - Source
e:\ - Destination

/S — Copy subdirectories, but not empty ones.
/E — Copy Subdirectories, including empty ones.
/Z — Copy files in restartable mode.
/ZB — Uses restartable mode, if access denied use backup mode.
/R:5 — Retry 5 times (you can specify a different number, default is 1 million).
/W:5 — Wait 5 seconds before retrying (you can specify a different number, the default is 30 seconds).
/TBD — Wait for sharenames To Be Defined (retry error 67).
/NP — No Progress – don’t display percentage copied.
/V — Produce verbose output, showing skipped files.
/MT:16 — Do multithreaded copies with n threads (default is 8).
```
