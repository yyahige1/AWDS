;ForceRankExpansionCostChange.asm

.align 4
ForceRankExpansionCostChange:
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r2,[r1]
	ldr	r0,[r0]
	add	r0,r2,r0,lsl 0x2
	ldr	r0,[r0,0x48]
	add	r0,r0,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r5
	add	r0,r0,0x74
	add	r0,r0,r4
	mov	r1,ForceRankTaxHike
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatTaxHike
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r6,r6,lsl 0x1
	
	mov	r0,r6
	ldmfd	r13!,{r4-r6,r15}
	.pool	

