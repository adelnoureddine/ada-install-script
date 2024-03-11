#!/bin/sh

# Copyright (c) 2024, Adel Noureddine.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the
# GNU General Public License v3.0 only (GPL-3.0-only)
# which accompanies this distribution, and is available at
# https://www.gnu.org/licenses/gpl-3.0.en.html
#
# Author : Adel Noureddine

GNAT_VERSION=13.2.0-1
GPRBUILD_VERSION=22.0.0-1
GNAT_COMPILER_URL=https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnat-$GNAT_VERSION/gnat-x86_64-linux-$GNAT_VERSION.tar.gz
GPRBUILD_URL=https://github.com/alire-project/GNAT-FSF-builds/releases/download/gprbuild-$GPRBUILD_VERSION/gprbuild-x86_64-linux-$GPRBUILD_VERSION.tar.gz

INSTALLATION_PATH=/opt/ada-gnat-x

echo "Installing GNAT compiler x86_64 version $GNAT_VERSION and GPRBuild x86_64 version $GPRBUILD_VERSION"

read -p "Change version? (y/[n])? " USER_CONFIRMATION_VERSION
if [ "$USER_CONFIRMATION_VERSION" = "y" ]
then
    echo "Please specify GNAT and GPRBuild version as released by GNAT FSF builds by Alire on GitHub"
    read -p "New GNAT compiler version: " GNAT_VERSION
    read -p "New GPRBuild compiler version: " GPRBUILD_VERSION
fi

read -p "Installation to $INSTALLATION_PATH. Continue ([y]/n)? " USER_CONFIRMATION
echo
if [ "$USER_CONFIRMATION" = "y" ]
then
    # Copying files
    echo "Creating folder and downloading files"
    mkdir -p $INSTALLATION_PATH
    cd $INSTALLATION_PATH
    wget $GNAT_COMPILER_URL -O gnat.tar.gz
    wget $GPRBUILD_URL -O gprbuild.tar.gz

    # Extract GNAT compiler and GPRBuild
    echo "Extracting files"
    tar -zxvf gnat.tar.gz -C .
    tar -zxvf gprbuild.tar.gz -C .

    # Add to Path
    echo "Add these two folders to your PATH:"
    echo '\t' $INSTALLATION_PATH/gnat-x86_64-linux-$GNAT_VERSION/bin
    echo '\t' $INSTALLATION_PATH/gprbuild-x86_64-linux-$GPRBUILD_VERSION/bin

    echo "Installation complete. GNAT and GPRBuild files have been installed in $INSTALLATION_PATH"
fi