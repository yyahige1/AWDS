;arm9main.asm

.open "_AWDSFiles/FSI.CT/arm9.bin", "output/arm9.bin", 0x02000000
.nds
.arm
	.include "arm9/fileload/hookfileload.asm"
	.include "arm9/ForceRanks/hookforceranksmain.asm"
	.include "arm9/AutoUnlock/hookautounlock.asm"

.close

.open "newfile.bin", "output/hook_force_hidehp.bin", 0x01FFCB88;0x1E89FE0
.nds
.arm
	.include "arm9/ForceRanks/hookForceRankHiddenHP.asm"

.close

;blank line
