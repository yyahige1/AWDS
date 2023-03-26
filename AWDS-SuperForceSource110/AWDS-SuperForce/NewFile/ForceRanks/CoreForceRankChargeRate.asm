;coreforcerankchargerate.asm

CoreForceRankChargeRateExpansion:
	mov	r0,100		;Baseline Charge Rate
	stmfd	r13!,{r0}

	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankStarPower
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	PowerChargeRateExpansionNoStarPower
	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0	
	mov	r1,0x0
	ldr	r0,[r13]
	mov	r1,ForceStatStarPower
	movne	r1,r1,lsl 0x1
	add	r0,r0,r1
	str	r0,[r13]
	
PowerChargeRateExpansionNoStarPower:	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankStarDrain
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	PowerChargeRateExpansionNoStarDrain
	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0	
	mov	r1,0x0
	ldr	r0,[r13]
	mov	r1,ForceStatStarDrain
	movne	r1,r1,lsl 0x1
	sub	r0,r0,r1
	str	r0,[r13]

PowerChargeRateExpansionNoStarDrain:
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankPurePower
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	PowerChargeRateExpansionNoPurePower
	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0	
	mov	r1,0x0
	ldr	r0,[r13]
	mov	r1,ForceStatPurePowerCharge
	movne	r1,r1,lsl 0x1
	sub	r0,r0,r1
	str	r0,[r13]

PowerChargeRateExpansionNoPurePower:
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankUnderpowered
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	PowerChargeRateExpansionNoUnderpowered
	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0	
	mov	r1,0x0
	ldr	r0,[r13]
	mov	r1,ForceStatUnderpoweredCharge
	movne	r1,r1,lsl 0x1
	sub	r0,r0,r1
	str	r0,[r13]

PowerChargeRateExpansionNoUnderpowered:
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankTrueGrit
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	PowerChargeRateExpansionNoTrueGrit
	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0	
	mov	r1,0x0
	ldr	r0,[r13]
	mov	r1,ForceStatTrueGritCharge
	movne	r1,r1,lsl 0x1
	sub	r0,r0,r1
	str	r0,[r13]	
	
PowerChargeRateExpansionNoTrueGrit:	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankFlimsy
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	PowerChargeRateExpansionNoFlimsy
	
	bl	ForcePrepSubroutineChargeRate
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0	
	mov	r1,0x0
	ldr	r0,[r13]
	mov	r1,ForceStatFlimsyCharge
	movne	r1,r1,lsl 0x1
	add	r0,r0,r1
	str	r0,[r13]	

PowerChargeRateExpansionNoFlimsy:
	ldmfd	r13!,{r0}
	cmp	r0,0
	movle	r0,1
	b	PowerChargeRateReturn
	.pool
	
ForcePrepSubroutineChargeRate:
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r2,[r1]
	ldr	r1,[r0]
	mov	r0,0x98
	add	r1,r2,r1,lsl 0x2
	ldr	r1,[r1,0x48]
	mul	r6,r9,r0
	add	r0,r1,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r6
	add	r0,r0,0x74
	add	r0,r0,r8,lsl 0x4
	bx	r14
	.pool

