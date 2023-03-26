;hookgoldrush.asm
;Handles the +Income Skills
;Gold Rush: +100G (Skill 0x46)
;Sasha's Daily Ability: +100G (Skill 0xF)

.org 0x020E0158
	stmfd	r13!,{r4-r6,r14}
	sub	r13,r13,0x4
	ldr	r2,=0x022F45D8
	and	r1,r1,0x1F
	ldrsb	r1,[r2,r1]
	mov	r5,0x0
	cmp	r1,0x0
	beq	ForceRankGoldRush1
	
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
	ldr	r2,[r2,0x78]
	add	r0,r0,r4
	add	r0,r0,0x74
	add	r6,r5,r2
	mov	r1,ForceRankGoldRush
	bl	ForceRankBitChecker
	
	cmp	r0,0x0
	addne	r5,r5,ForceStatGoldrush	

	mov	r0,r4
	bl	ForceRankGenericSetup	
	mov	r1,ForceRankIncomeTax
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatIncomeTax
	
	b	ForceRankExpansionIncomeBoost
ForceRankGoldRush1:	
	mov	r0,r5
	add	r13,r13,0x4
	ldmfd	r13!,{r4-r6,r15}
;	bx	r14
	.pool
	
;Blank Line	
