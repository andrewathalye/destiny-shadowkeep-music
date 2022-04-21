#!/bin/sh
echo "This program requires Python >= 3.0, 100GB of network data, and .NET SDK 6.0 for Linux"
echo "Press enter if you are ready, or Ctrl-C to exit."
read -s -n1

echo "Downloading DepotDownloader..."
if [ ! -d depotdownloader ]
then
	wget https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.4.5/depotdownloader-2.4.5.zip
	mkdir depotdownloader
	cd depotdownloader
	unzip ../depotdownloader-2.4.5.zip
	cd ..
fi

cd depotdownloader
echo "Downloading Destiny 2 Shadowkeep..."
if [ ! -d depots ]
then
	echo -n "Please enter your Steam username: "
	read STEAMUSER
	dotnet DepotDownloader.dll -app 1085660 -depot 1085661 -manifest 4160053308690659072 -username "$STEAMUSER"
fi
cd ..

echo "Downloading destiny-unpacker-linux"
if [ ! -d destiny-unpacker-linux ] 
then
	wget https://github.com/andrewathalye/destiny-unpacker-linux/releases/download/v0.9/destiny-unpacker-linux-v0.9.tgz
	mkdir destiny-unpacker-linux
	cd destiny-unpacker-linux
	tar xf ../destiny-unpacker-linux-v0.9.tgz
	cd ..
fi

cd destiny-unpacker-linux
echo "Unpacking Destiny files..."
if [ ! -d shadowkeep ] & [ ! -d ../shadowkeep ]
then
	DEPOT_PATH="../depotdownloader/depots/1085661/*/"
	cp $DEPOT_PATH/bin/x64/oo2core_3_win64.dll .
	./destinyunpacker prebl $DEPOT_PATH/packages shadowkeep
	mv shadowkeep ..
fi
cd ..

echo "Downloading wwiser..."
if [ ! -d wwiser ]
then
	wget https://github.com/bnnm/wwiser/releases/download/v20220416/wwiser.pyz
	wget https://github.com/bnnm/wwiser/releases/download/v20220416/wwnames.db3
	mkdir wwiser
	cd wwiser
	unzip ../wwiser.pyz
	mv ../wwnames.db3 .
	echo "from wwiser import wcli
wcli.Cli().start() " > main.py;
	cd ..
fi

cd wwiser
echo "Generating txtp files..."
if [ ! -d ../shadowkeep/txtp ]
then
	python3 main.py -g ../shadowkeep/bnk/*.bnk
	mv ../shadowkeep/bnk/txtp ../shadowkeep/txtp
	mv ../shadowkeep/wem ../shadowkeep/txtp/wem
fi
cd ..

echo "Main extraction and download done. Run ./export_map.sh if you'd like to export WAV files."


