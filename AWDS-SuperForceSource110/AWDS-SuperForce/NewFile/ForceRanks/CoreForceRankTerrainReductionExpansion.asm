;CoreForceRankTerrainReductionExpansion.asm

ForceRankTerrainReductionExpansion:
	mov	r0,10
	stmfd	r13!,{r0,r2-r6}
	mov	r6,r1
	mov	r5,0x0
	mov	r0,r9
	
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
	mov	r1,ForceRankEspionage
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatEspionage
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankIntelLeak
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatIntelLeak
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	
;Fixes the Terrain Reduction when no Powers On
	ldr	r0,=0x02183B64
	ldrb	r0,[r0]
	cmp	r0,0x0
	moveq	r6,0x0
	
	add	r1,r5,r6
	ldmfd	r13!,{r0,r2-r6}	
	b	ForceRankTerrainReductionReturn
	.pool
