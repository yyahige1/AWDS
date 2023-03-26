;HookForceRankTowerFirepower.asm
;Alters a Tower's Firepower

.org 0x020E6074
	stmfd	r13!,{r4,r5,r14}
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
	mov	r1,ForceRankTowerPower
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatTowerPower
	b	ForceRankTowerFirepowerExpansion
	.pool	

;	Original
;	stmfd	r13!,{r4,r14}
;	mov	r4,0x0
;	ldr	r3,=0x027C027C
;	ldr	r2,=0x027C0284
;	ldr	r12,[r3]
;	ldr	r2,[r2]
;	mov	r3,0x98
;	add	r2,r12,r2,lsl 0x2
;	ldr	r2,[r2,0x48]
;	add	r2,r2,0x5000
;	ldr	r2,[r2,0xA58]
;	mla	r2,r0,r3,r2
;	add	r0,r2,0x74
;	add	r0,r0,r1,lsl 0x4
;	mov	r1,0x3A	;Tower Power
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r4,r4,0x5
;	mov	r0,r4
;	ldmfd	r13!,{r4,r14}
;	bx	r14
;	.pool
