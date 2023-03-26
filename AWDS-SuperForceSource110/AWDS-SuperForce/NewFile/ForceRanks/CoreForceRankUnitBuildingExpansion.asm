;CoreForceRankUnitBuildingExpansion.asm

ForceRankUnitBuildingExpansion:
	cmp	r8,0x13	;B-Copter
	beq	ForceRankHelipadTrue
;	cmp	r8,0x14	;T-Copter
;	beq	ForceRankHelipadTrue
	ands	r0,r10,r0
	b	ForceRankUnitBuildingReturn
ForceRankHelipadTrue:	
	stmfd	r13!,{r1-r5,r14}
	mov	r4,r0
	mov	r5,0x0
	mov	r1,0x98
	mla	r0,r1,r2,r3
	ldrb	r0,[r0,0x6D]
	and	r0,0xC
	cmp	r0,0x0
	beq	ForceRankHelipadEnd
	ldr	r0,=CurrentPlayerTurn
	ldrb	r0,[r0]	
	ldr	r2,=0x027C027C
	ldr	r1,=0x027C0284
	ldr	r3,[r2]
	ldr	r2,[r1]
	mov	r1,0x98
	add	r2,r3,r2,lsl 0x2
	mul	r3,r0,r1
	ldr	r2,[r2,0x48]
	add	r0,r2,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r3
	add	r0,r0,0x74
	mov	r1,ForceRankHelipad
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,0x2
ForceRankHelipadEnd:
	orr	r0,r4,r5
	ldmfd	r13!,{r1-r5,r14}
	ands	r0,r10,r0
	b	ForceRankUnitBuildingReturn	
	.pool
	
ForceRankUnitBuildingExpansionAI:
	cmp	r10,0x13	;B-Copter
	beq	ForceRankHelipadAITrue
;	cmp	r10,0x14	;T-Copter
;	beq	ForceRankHelipadAITrue
	ands	r1,r3,0x7
	b	ForceRankUnitBuildingAIReturn
	
ForceRankHelipadAITrue:
	stmfd	r13!,{r1,r2,r4,r5,r6,r14}
	ldr	r0,=CurrentPlayerTurn
	ldrb	r0,[r0]
	mov	r5,0x0
	mov	r6,r3
	
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

	ldrb	r1,[r0,0x6D]
	and	r1,0xC
	cmp	r1,0x0
	beq	ForceRankHelipadAIEnd
	
	add	r0,0x74
	mov	r1,ForceRankHelipad
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,0x2	
	
ForceRankHelipadAIEnd:
	orr	r3,r5,r6
	ldmfd	r13!,{r1,r2,r4,r5,r6,r14}
	ands	r1,r3,0x7
	b	ForceRankUnitBuildingAIReturn	
	.pool
	
