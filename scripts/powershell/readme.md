

# Migrate files to different drive using Robocopy

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
