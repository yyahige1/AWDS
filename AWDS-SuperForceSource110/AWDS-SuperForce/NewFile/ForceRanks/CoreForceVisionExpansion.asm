;coreforcevisionexpansion.asm
;Adds more room for vision skills

ForceRankVisionExpansion:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	b	ForceRankVisionReturn
