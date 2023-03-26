;concatenate.asm
;Concatenates files

.nds
.arm
;Do some file concatenation here
.open "output/arm9.bin", "output/arm9_2.bin",0x0
	.org 0x172BA8
	.import "output/hook_force_hidehp.bin"
.close

.open "_AWDSFiles/national/004", "output/national_004",0x0
national_004_start:
	.import "_AWDSFiles/national/004"
	.align 4
national_004_xen0:
	.import "output/XEN0.bin"
	.align 4
national_004_end:
.close