#!/bin/sh

cd "$( dirname "$0" )"

if [ -x /usr/bin/sudo -a $UID -ne 0 ]; then
   exec /usr/bin/sudo $0 $*
fi

echo "Installing KX audio driver kernel extension..."

if [ -d /Library/Extensions/kXAudioDriver_PPC.kext ]; then

    echo "This driver is already Installed in /L/E, it will be unloaded and overwritten!"

    kextunload /Library/Extensions/kXAudioDriver_PPC.kext > /dev/null
    kextunload /Library/Extensions/kXAudioDriver_PPC.kext > /dev/null

    kextunload /Library/Extensions/kXAudioDriver_PPC.kext > /dev/null
    kextunload /Library/Extensions/kXAudioDriver_PPC.kext > /dev/null

    rm -R /Library/Extensions/kXAudioDriver_PPC.kext

fi

if [ -d /System/Library/Extensions/kXAudioDriver_PPC.kext ]; then

    echo "This driver is already Installed /S/L/E, it will be unloaded and overwritten!"

    kextunload /System/Library/Extensions/kXAudioDriver_PPC.kext > /dev/null
    kextunload /System/Library/Extensions/kXAudioDriver_PPC.kext > /dev/null

    kextunload /System/Library/Extensions/kXAudioDriver_PPC.kext > /dev/null
    kextunload /System/Library/Extensions/kXAudioDriver_PPC.kext > /dev/null

    rm -R /System/Library/Extensions/kXAudioDriver_PPC.kext
fi

if [ -d /System/Library/Extensions/kXAudioDriver_LibraryLess.kext ]; then

	echo "This driver is already Installed /S/L/E, it will be unloaded and overwritten!"

	kextunload /System/Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	kextunload /System/Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	
	kextunload /System/Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	kextunload /System/Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	
	rm -R /System/Library/Extensions/kXAudioDriver_LibraryLess.kext
fi

if [ -d /Library/Extensions/kXAudioDriver_LibraryLess.kext ]; then

	echo "This driver is already Installed /L/E , it will be unloaded and overwritten!"

	kextunload /Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	kextunload /Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	
	kextunload /Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	kextunload /Library/Extensions/kXAudioDriver_LibraryLess.kext > /dev/null
	
	rm -R /Library/Extensions/kXAudioDriver_LibraryLess.kext
fi

if [ -d /System/Library/Extensions/kXAudioDriver.kext ]; then

	echo "This driver is already Installed /S/L/E, it will be unloaded and overwritten!"

	kextunload /System/Library/Extensions/kXAudioDriver.kext > /dev/null
	kextunload /System/Library/Extensions/kXAudioDriver.kext > /dev/null
	
	kextunload /System/Library/Extensions/kXAudioDriver.kext > /dev/null
	kextunload /System/Library/Extensions/kXAudioDriver.kext > /dev/null
	
	rm -R /System/Library/Extensions/kXAudioDriver.kext
fi

if [ -d /Library/Extensions/kXAudioDriver.kext ]; then

	echo "This driver is already Installed in /L/E, it will be unloaded and overwritten!"

	kextunload /Library/Extensions/kXAudioDriver.kext > /dev/null
	kextunload /Library/Extensions/kXAudioDriver.kext > /dev/null
	
	kextunload /Library/Extensions/kXAudioDriver.kext > /dev/null
	kextunload /Library/Extensions/kXAudioDriver.kext > /dev/null
	
	rm -R /Library/Extensions/kXAudioDriver.kext
fi

echo "Installing a fresh copy of the driver ..."


cp -R kXAudioDriver_PPC.kext /System/Library/Extensions/

find /System/Library/Extensions/kXAudioDriver_PPC.kext -type d -exec /bin/chmod 0755 {} \;
find /System/Library/Extensions/kXAudioDriver_PPC.kext -type f -exec /bin/chmod 0744 {} \;
chmod -R 755        /System/Library/Extensions/kXAudioDriver_PPC.kext
chown -R root:wheel /System/Library/Extensions/kXAudioDriver_PPC.kext
touch /System/Library/Extensions

kextload -t /System/Library/Extensions/kXAudioDriver_PPC.kext

echo "Installation finished - enjoy! ITzTravelInTime"

