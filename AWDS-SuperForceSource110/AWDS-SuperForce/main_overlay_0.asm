;overlay0main.asm
;Adds and edits data in the Overlay0 File

.open "_AWDSFiles/FSI.ct/overlay9_0000.bin", "output/AWDS/FSI.CT/overlay9_0000.bin", 0x022AD560
	.include	"Overlay0/ForceRankTable/TableForceRankMenu.asm"
	.include	"Overlay0/TextForceRanks/Script.asm"
	.include	"Overlay0/TextForceRanks/Texttable.asm"
.close
;Blank Line
