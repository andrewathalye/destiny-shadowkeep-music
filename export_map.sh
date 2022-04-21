#!/bin/sh
echo "Downloading mapper and mappings..."
if [ ! -d mapper ]
then
	wget https://github.com/andrewathalye/destiny-txtp-mapper/releases/download/v1.3/destiny-txtp-mapper-v1.3.tgz
	mkdir mapper
	cd mapper
	tar xf ../destiny-txtp-mapper-v1.3.tgz
	wget https://github.com/andrewathalye/destiny-txtp-mapper/releases/download/v1.3/tracks.txt 
	cd ..
fi

echo "Exporting WAV files..."
mkdir output
cd shadowkeep
../mapper/mapper/mapper ../mapper/tracks.txt ../output
