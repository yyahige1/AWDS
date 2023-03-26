;main_header.asm
;Updates the NDS header

	.open "_AWDSFiles/FSI.CT/ndsheader.bin", "output/AWDS/FSI.CT/ndsheader.bin",0x0
	;Increase the size of the FNT & FAT Tables
	;In the NDS header
	.org 0x44	;FNT Table Size
		.dw	0x23D5+0xB
	.org 0x4C	;FAT Table Size
		.dw	0x3870+0x10
		
	.close