# Copyright (c) 2024, Adel Noureddine.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the
# GNU General Public License v3.0 only (GPL-3.0-only)
# which accompanies this distribution, and is available at
# https://www.gnu.org/licenses/gpl-3.0.en.html
#
# Author : Adel Noureddine

$GNAT_VERSION = "13.2.0-1"
$GPRBUILD_VERSION = "22.0.0-1"
$GNAT_COMPILER_URL = "https://github.com/alire-project/GNAT-FSF-builds/releases/download/gnat-$GNAT_VERSION/gnat-x86_64-windows64-$GNAT_VERSION.tar.gz"
$GPRBUILD_URL = "https://github.com/alire-project/GNAT-FSF-builds/releases/download/gprbuild-$GPRBUILD_VERSION/gprbuild-x86_64-windows64-$GPRBUILD_VERSION.tar.gz"

$INSTALLATION_PATH = "C:\ada-gnat-x"

Write-Host "Installing GNAT compiler x86_64 version $GNAT_VERSION and GPRBuild x86_64 version $GPRBUILD_VERSION"

$USER_CONFIRMATION_VERSION = Read-Host "Change version? (y/[n])?"
if ($USER_CONFIRMATION_VERSION -eq "y") {
    Write-Host "Please specify GNAT and GPRBuild version as released by GNAT FSF builds by Alire on GitHub"
    $GNAT_VERSION = Read-Host "New GNAT compiler version"
    $GPRBUILD_VERSION = Read-Host "New GPRBuild compiler version"
}

$USER_CONFIRMATION = Read-Host "Installation to $INSTALLATION_PATH. Continue ([y]/n)?"
if ($USER_CONFIRMATION -eq "y") {
    # Copying files
    Write-Host "Creating folder and downloading files"
    New-Item -ItemType Directory -Force -Path $INSTALLATION_PATH
    Set-Location -Path $INSTALLATION_PATH
    Invoke-WebRequest -Uri $GNAT_COMPILER_URL -OutFile "gnat.tar.gz"
    Invoke-WebRequest -Uri $GPRBUILD_URL -OutFile "gprbuild.tar.gz"

    # Extract GNAT compiler and GPRBuild
    Write-Host "Extracting files"
    tar -xvzf gnat.tar.gz
    tar -xvzf gprbuild.tar.gz

    # Add to Path
    Write-Host "Add these two folders to your PATH:"

    Write-Host "`t" $INSTALLATION_PATH"\gnat-x86_64-windows64-$GNAT_VERSION\bin"
    Write-Host "`t" $INSTALLATION_PATH"\gprbuild-x86_64-windows64-$GPRBUILD_VERSION\bin"

    Write-Host "Installation complete. GNAT and GPRBuild files have been installed in $INSTALLATION_PATH"
}
