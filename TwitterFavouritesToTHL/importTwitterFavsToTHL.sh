#!/bin/bash
#Keep a handle on the current working dir
currentDir=$(pwd)
#Change to the directory this script is located in
scriptDir=`dirname "$0"`
cd "$scriptDir"
# Run the ruby script
ruby -rubygems TwitterFavouritesToTHL.rb
#Change back to the original working dir
cd "$currentDir"
