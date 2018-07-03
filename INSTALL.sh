#!/bin/sh

# INSTALL script
# (c) 2018 GridSteer
# Author: 	Elias Le Boudec, elias.leboudec(at)epfl.ch
# Date:		27 June 2018
# Abstract: Use this script to move the required files to the T-RECS installation directory
#
# USAGE
# Run this script from the t-recs-sample-executables dir
#
# SYNTAX
# ./INSTALL.sh install_path
#
#	install_path	Path to the T-RECS installation directory

if [ -z "$1" ]
then
    echo "T-RECS Sample Executables Install Script
USAGE:
Run this script from the t-recs-sample-executables directory

SYNTAX:
./INSTALL.sh install_path

	install_path	Path to the T-RECS installation directory"
	exit
fi

TRecsDir=${1%/} # Remove trailing "/" character

if [ ! -d "$TRecsDir" ]
then
	echo "ERROR: Invalid directory:"
	echo "$TRecsDir"
	exit
fi

{
	cp batt1_ra/* $TRecsDir/sample/agent/batt1_ra/
	cp ucpv1_ra/* $TRecsDir/sample/agent/ucpv1_ra/
	cp ugrid_ga/* $TRecsDir/sample/agent/ugrid_ga/

} || { # catch
	
	echo "ERROR: Could not move executables to T-RECS directory.
Make sure you are running the script from the t-recs-sample-executables directory and that it contains the executables."
	exit
}

echo "Successfully copied the executables to the T-RECS directory."



