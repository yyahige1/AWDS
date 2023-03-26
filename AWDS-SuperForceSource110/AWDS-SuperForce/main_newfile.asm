;overlay4main.asm
;Adds overlay related data appended to Overlay 4.

.open "newfile.bin", "output/XEN0.bin", RamLocationRamOne;0x0226C3B0
.nds
.arm
.area RamLengthRamOne;23BACh
;Size Limited
	.ascii	"RAMOneTest"
	.include	"NewFile/forceranks/CoreForceRankMain.asm"
	.align 4
	.include	"NewFile/autounlock/CoreAutoUnlock.asm"
	.include	"overlay0/TextForceRanks/ScriptOverflow.asm"
	.align 4
ExtraForcesTable:
	.include	"overlay0/ForceRankTable/TableForceRankMenu2.asm"

	
.endarea
.close
