;CoreForceRankCounterattackExpansion.asm

ForceRankCounterattackExpansion:
	mov	r1,r1,lsl 0x14
	mov	r1,r1,lsr 0x1E
	mov	r1,r1,lsl 0x7
	ldrsh	r6,[r1,r0]
	
	mov	r0,r5
	mov	r5,0x0
	
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
	add	r0,r0,0x74
	mov	r1,ForceRankRevenge
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatRevenge

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSurrender
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatSurrender

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1

	add	r0,r5,r6	
	
	ldmfd	r13!,{r4-r6,r14}
	bx	r14
	.pool
