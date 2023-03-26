;CoreForceRankCaptureExpansion.asm

ForceRankCaptureExpansion:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankPacifist
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatPacifist
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	
	mov	r0,r5
	ldmfd	r13!,{r4,r5,r15}
	
CaptureUnderflowCheck:
	adds	r5,r4,r0
	movmi	r5,0x1
	b	CaptureUnderflowCheckReturn

