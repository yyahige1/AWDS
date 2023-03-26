Version 1.1 Source Code

Requires a complete extracted Advance Wars Dual Strike (U) ROM to use the source, including the System/overlay files that aren't part of the internal filesystem. Folder structure dump from CrystalTile2 is expected.

The following paths/files are expected in the root folder to build beyond what is included with the source code.

/output/	;This is a working folder
/_AWDSFiles/ 	;This is an extracted AWDS (U) Filesystem
AWDS.nds	;Standard Dual Strike (U) ROM

Builds using new version of ARMIPS (Found at https://github.com/Kingcom/armips) - old version from Romhacking.net will not work. Current build process is:

./armips main.asm		;This compiles the new code to binaries
./armips concatenate.asm	;This concatenates file data to be import appropriate
./armips build.asm		;This builds a new ROM using the old ROM as a source

You must do all three steps for the project to build!