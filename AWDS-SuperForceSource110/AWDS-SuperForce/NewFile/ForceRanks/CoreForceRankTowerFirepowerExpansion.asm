;CoreForceRankTowerFirepowerExpansion.asm

ForceRankTowerFirepowerExpansion:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSignalLoss
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatSignalLoss
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	
	mov	r0,r5
	ldmfd	r13!,{r4,r5,r15}
	

