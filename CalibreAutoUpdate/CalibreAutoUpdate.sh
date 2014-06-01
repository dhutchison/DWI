#!/bin/bash
# Script to autoupdate Calibre (http://calibre-ebook.com/)
# Author: David Hutchison
# www: http://devwithimagination.wordpress.com/

#################################
######### CONFIGURATION #########
# These default values should work for everyone. Only change if using a non-standard install location,
# or if the download URL changes in the future.
#################################

# The download page URL.
export CALIBRE_DOWNLOAD_PAGE=http://calibre-ebook.com/download_osx
export CALIBRE_INSTALL_LOCATION=/Applications/calibre.app
DOWNLOAD_URL=http://status.calibre-ebook.com/dist/osx32

#################################
##### ADDITIONAL FUNCTIONS #####
# Vercomp function by Dennis Williamson from StackOverflow answer http://stackoverflow.com/a/4025065/230449
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}
#################################

#Start Update Check script


#Extract the latest offered version number.
LATEST_VERSION=`curl -s $CALIBRE_DOWNLOAD_PAGE | grep Version: | sed 's/[^0-9.]*\([0-9.]*\).*/\1/'`
#Extract the version number of the currently installed version.
CURRENT_VERSION=`defaults read $CALIBRE_INSTALL_LOCATION/Contents/Info CFBundleShortVersionString`

vercomp $CURRENT_VERSION $LATEST_VERSION
case $? in
    0)
    	echo "Installed Version is the latest available ($CURRENT_VERSION).";;
    1)
    	echo "Uh Oh! Current Version is newer than the latest available! (Current: \"$CURRENT_VERSION\", Latest: \"$LATEST_VERSION\")";;
    2)
    	echo "Update Required. (Current: \"$CURRENT_VERSION\", Latest: \"$LATEST_VERSION\")"
    	# Download the latest version
    	curl "$DOWNLOAD_URL" -L -o "$TMPDIR/LatestCalibre.dmg"
    	# Mount the drive
    	hdiutil attach -noverify "$TMPDIR/LatestCalibre.dmg"
    	MOUNT_POINT=/Volumes/calibre-$LATEST_VERSION
    	sleep 10
    	echo "Updating install…"

		#Copy the install files, using sudo if needed. Needing to delete Contents over wise getting errors due to symlinks.
    	if [ -w "$CALIBRE_INSTALL_LOCATION" ]; then
    		echo "Can write to install location."
    		rm -r "$CALIBRE_INSTALL_LOCATION/Contents"
	    	cp -Ra "$MOUNT_POINT/calibre.app" "$CALIBRE_INSTALL_LOCATION/../"
        # remove the "downloaded from the internet warning"
        xattr -d com.apple.quarantine /Applications/calibre.app
    	else
    		echo "Can't write to install location, using sudo."
    		sudo rm -r "$CALIBRE_INSTALL_LOCATION/Contents"
	    	sudo cp -Ra "$MOUNT_POINT/calibre.app" "$CALIBRE_INSTALL_LOCATION/../"
        # remove the "downloaded from the internet warning"
        sudo xattr -d com.apple.quarantine /Applications/calibre.app
    	fi

    	#Unmount the drive
    	hdiutil detach "$MOUNT_POINT"

    	echo "Update finished."
    	;;
esac
