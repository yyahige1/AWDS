;CoreForceRankIncomeBoost.asm
;Adds expansion to Income Boost

.align 4
ForceRankExpansionIncomeBoost:
;	ldr	r1,=0x027C027C
;	ldr	r0,=0x027C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r2,r0,lsl 0x2
;	ldr	r0,[r0,0x48]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
	mov	r0,r4
	bl	ForceRankGenericSetup	
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5, lsl 0x1
	
	mov	r0,r4
	bl	ForceRankGenericSetup	
	mov	r1,SpecialSkillSashaIncomeBoost
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,100
	
	add	r5,r5,r6
	
	cmp	r5,0x0
	movlt	r5,0x0
	b	ForceRankGoldRush1
	.pool
