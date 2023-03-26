;build.asm
;This assembles the new ROM

.NDS
.ARM

.open "AWDS.nds", "AWDS-SuperForce.nds", 0x0
	;File Replacement
	.org 0x4000	;FSI.ct/ARM9.bin
	.import	"output/arm9_2.bin"
	;.import	"_AWDSFiles/FSI.CT/arm9.bin"
	
	.org 0x179400	;FSI.ct/overlay9_0000.bin
	.import "output/AWDS/FSI.CT/overlay9_0000.bin"
	
	.org 0x1766800	;ohashi/res_skill
	.import	"ohashi/res_skill"
	
	.org 0x01B35600
	.import "output/national_004"
	
	;EOF at 0x1B35840

	;Update File Allocation Table
	.org 0x2EBF5C
		.dw	0x01B35600 + 0x1816

	
.close