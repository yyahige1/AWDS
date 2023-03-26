;hookforcerankscreenScratch.asm
;fixes those associations for the scratch RAM location?

ForceRankScreenScratchRAM	equ	0x02254900	;original 0x0229C738

;.org 0x0203FC24
;	.dw	ForceRankScreenScratchRAM
;.org 0x0203FC64
;	.dw	ForceRankScreenScratchRAM
;.org 0x0203FD10
;	.dw	ForceRankScreenScratchRAM
;.org 0x0203FE14
;	.dw	ForceRankScreenScratchRAM
;.org 0x0203FEC0
;	.dw	ForceRankScreenScratchRAM
;.org 0x0203FF24
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040038
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040100
;	.dw	ForceRankScreenScratchRAM
;.org 0x020402F8
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040564
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040618
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040694
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040700
;	.dw	ForceRankScreenScratchRAM
;.org 0x0204074C
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040920
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040A24
;	.dw	ForceRankScreenScratchRAM
;.org 0x02040AF8
;	.dw	ForceRankScreenScratchRAM
;.org 0x020412FC
;	.dw	ForceRankScreenScratchRAM
;.org 0x0204136C
;	.dw	ForceRankScreenScratchRAM
;.org 0x02041424
;	.dw	ForceRankScreenScratchRAM
;.org 0x0204158C
;	.dw	ForceRankScreenScratchRAM

