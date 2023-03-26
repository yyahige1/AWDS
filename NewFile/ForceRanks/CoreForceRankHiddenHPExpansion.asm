;CoreForceRankHiddenHPExpansion.asm

ForceRankHiddenHPExpansion:
	stmfd	r13!,{r0}
	mov	r1,SpecialSkillHiddenHP
	bl	ForceRankBitChecker
	cmp	r0,0x0
	orrne	r6,r6,0x1
	ldmfd	r13!,{r0}
	mov	r1,ForceRankCoverIdentity
	b	ForceRankHiddenHPReturn
	
ForceRankHPIntelWindowExpansion:
	stmfd	r13!,{r0}
	mov	r1,SpecialSkillHiddenHP
	bl	ForceRankBitChecker
	cmp	r0,0x0
	ldmfd	r13!,{r0}
	bne	0x020CBDE8
	mov	r1,ForceRankCoverIdentity
	b	0x020CBDDC
	
