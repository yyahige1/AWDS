;CoreForceRankFiringRangeExpansion.asm

ForceRankFiringRangeExpansion:
	add	r6,r4,r0
	stmfd	r13!,{r6}
	mov	r6,0x0

	mov	r0,r5
	bl	0x020DF7AC	;Returns Unit Class Direct/indirect
	cmp	r0,0x8
	bne	ForceRankRangeModFalse
	
	mov	r0,r8	
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

	mov	r1,ForceRankTrickShot
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	ForceRankTrickShotFalse
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	sub	r0,0x74
	ldrb	r0,[r0,0x6D]
	and	r0,0xC
	asr	r0,r0,0x2
	cmp	r0,0x0
	beq	ForceRankTrickShotFalse
	movne	r1,ForceStatTrickShot
	subne	r0,1
	addne	r6,r6,r1,lsl r0
	
ForceRankTrickShotFalse:	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r6,r6,lsl 0x1
	
ForceRankRangeModUnderflowFix:	
	ldrb	r0,[r13]
	add	r0,r0,r6
	cmp	r0,0x2
	addlt	r6,1
	blt	ForceRankRangeModUnderflowFix
	
ForceRankRangeModFalse:	
	ldmfd	r13!,{r0}
	add	r0,r0,r6
	ldmfd	r13!,{r4-r8,r14}
	bx	r14
	.pool
	
