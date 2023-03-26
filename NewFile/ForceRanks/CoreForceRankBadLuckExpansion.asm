;CoreForceRankBadLuckExpansion.asm

ForceRankBadLuckExpansion:
	mov	r5,r0
	
	mov	r0,r6
	mov	r6,0x0
	ldr	r2,=0x027C027C
	ldr	r1,=0x027C0284
	ldr	r3,[r2]
	ldr	r2,[r1]
	mov	r1,0x98
	add	r2,r3,r2,lsl 0x2
	mul	r4,r0,r1
	ldr	r2,[r2,0x48]
	add	r0,r2,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r4
	add	r0,r0,0x74
	mov	r1,ForceRankCursed
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatCursed
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankFlakenator
	bl	ForceRankBitChecker
	cmp	r0,0x0
	bne	ForceRankBadLuckEnflakenatorPowerScale
ForceRankBadLuckEnflakenatorReturn:	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r6,r6,lsl 0x1
	
	add	r0,r5,r6
	add	r13,r13,0x4
	ldmfd	r13!,{r4-r6,r14}
	bx	r14
	.pool
	
ForceRankBadLuckEnflakenatorPowerScale:
	mov	r0,r4
	bl	ForceRankGenericSetup
	sub	r0,0x74
	ldrb	r0,[r0,0x6D]
	and	r0,0xC
	asr	r0,r0,0x2
	mov	r1,ForceStatEnflakenatorNegative
	add	r6,r6,r1,lsl r0
	b	ForceRankBadLuckEnflakenatorReturn
