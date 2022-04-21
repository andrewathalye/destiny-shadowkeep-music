Destiny Shadowkeep Music Downloader
===================================

Usage
-----

The shell script `download_extract.sh` should
be executed in order to download the necessary files.  

This requires 64-bit Linux with Python >= 3.0 and
.NET 6.0 SDK installed. It should be compatible with WSL.

Next Steps
----------

The downloader will create a "shadowkeep" folder containing
a "txtp" subdirectory - this is the music, in an encoded format.  

In order to convert these files to WAV files with names that are  
more easily human readable, use the following program:

`export_map.sh`

Output music will be in the "output" folder.

Warning
-------

This program is for personal, educational use ONLY. Do not share
the raw music files or distribute them without Bungie's explicit written
permission.  

Additionally, this program uses a significant amount of network bandwidth (>100GB)
and storage space (>150GB). Please keep this in mind before running it.  

