;CoreForceRankExpansionPositiveLuckChange.asm
;Expansion for luck changes

ForceRankExpansionPositiveLuckChange:
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankNullLuck
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r4,r4,ForceStatNullLuck
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankFlakenator
	bl	ForceRankBitChecker
	cmp	r0,0x0
	bne	ForceRankLuckEnflakenatorPowerScale
	
ForceRankLuckEnflakenatorReturn:	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r4,r4,lsl 0x1
	
	mov	r0,r4
	ldmfd	r13!,{r4,r5,r15}
	.pool
	
LuckGathererUnderflowFix:
	cmp	r0,0x0
	movle	r0,1
	add	r13,r13,0x4
	ldmfd	r13!,{r4,r5,r15}

ForceRankLuckEnflakenatorPowerScale:
	mov	r0,r5
	bl	ForceRankGenericSetup
	sub	r0,0x74
	ldrb	r0,[r0,0x6D]
	and	r0,0xC
	asr	r0,r0,0x2
	mov	r1,ForceStatEnflakenatorPositive
	add	r4,r4,r1,lsl r0
	b	ForceRankLuckEnflakenatorReturn	
