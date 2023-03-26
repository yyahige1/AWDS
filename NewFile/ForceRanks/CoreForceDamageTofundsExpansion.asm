;CoreForceDamageTofundsExpansion.asm

ForceDamagetoFundsExpansion1:
	stmfd	r13!,{r0}
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	ldmfd	r13!,{r0}
	moveq	r0,r0,lsl ForceStatCombatPayShift
	movne	r0,r0,lsl ForceStatCombatPayDoubleShift
	b	ForceDamageToFundsReturn1
	
ForceDamagetoFundsExpansion2:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankReparations
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	ForceDamageToFundsReturn2
	ldrb	r1,[r8]
	mov	r0,r5
	bl	0x020E0314
	mul	r0,r7,r0
	stmfd	r13!,{r0}
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankbitChecker
	cmp	r0,0x0
	ldmfd	r13!,{r0}
	moveq	r0,r0,lsl ForceStatReparationsShift
	movne	r0,r0,lsl ForceStatReparationsDoubleShift
	mov	r1,0x0
	sub	r0,r1,r0
	mov	r1,100
	bl	DivisionSubroutine
	
	mov	r2,r6,lsl 0x10
	mov	r1,r0
	mov	r0,r2,lsr 0x10
	bl	0x020C83D0
	b	ForceDamageToFundsReturn2
	.pool	
