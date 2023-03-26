;CoreForceRankTransportMovementExpansion.asm

ForceRankMovementExpansion:
	mov	r0,r7
	bl	ForceRankGenericSetup
	mov	r1,ForceRankFlatTires
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r4,r4,ForceStatFlatTires
	
ForceRankMovementNotTransport:	
	mov	r0,r7
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSpeedDemon
	bl	ForceRankBitChecker
	cmp	r0,0x0
	bne	ForceRankCheckSpeedDemonPower
	
ForceRankCheckSpeedDemonReturn:	
	mov	r0,r7
	bl	ForceRankGenericSetup
	mov	r1,ForceRankStumbler
	bl	ForceRankBitChecker
	cmp	r0,0x0
	bne	ForceRankCheckStumblerPower
	
ForceRankCheckStumblerReturn:
	mov	r0,r7
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r4,r4,lsl 0x1
	b	ForceRankMovementExpansionEnd

ForceRankMovementExpansionEnd:
	mov	r0,r4
	ldmfd	r13!,{r4-r7,r15}
	
ForceRankCheckSpeedDemonPower:
	mov	r0,r7
	bl	ForceRankGenericSetup
	sub	r0,0x74
	ldrb	r0,[r0,0x6D]
	and	r0,0xC
	asr	r0,r0,0x2
	cmp	r0,0x0
	beq	ForceRankCheckSpeedDemonReturn
	sub	r0,1
	mov	r1,ForceStatSpeedDemon
	add	r4,r4,r1,lsl r0
	b	ForceRankCheckSpeedDemonReturn
	
ForceRankCheckStumblerPower:
	mov	r0,r7
	bl	ForceRankGenericSetup
	sub	r0,0x74
	ldrb	r0,[r0,0x6D]
	and	r0,0xC
	asr	r0,r0,0x2
	cmp	r0,0x0
	beq	ForceRankCheckStumblerReturn
	sub	r0,1
	mov	r1,ForceStatStumbler
	sub	r4,r4,r1,lsl r0
	b	ForceRankCheckStumblerReturn

ForceRankMovementOverflowFix:
	cmp	r0,0xB
	movge	r0,0xB
	cmp	r0,0x0
	movlt	r0,0x0
	ldmfd	r13!,{r4-r6,r14}
	bx	r14
	
