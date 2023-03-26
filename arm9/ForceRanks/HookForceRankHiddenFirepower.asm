;HookForceRankHiddenFirepower.asm
;Firepower bonuses for the Hidden Units

.org 0x020E6AE4
	stmfd	r13!,{r4-r6,r14}
	cmp	r1,0x0
	mov	r5,0x0
	beq	ForceRankHiddenFirepowerUnitIsFalse
	
	mov	r6,r0
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
	b	ForceRankHiddenFirepowerExpansion
ForceRankHiddenFirepowerUnitIsFalse:
	mov	r0,r5
	ldmfd	r13!,{r4-r6,r15}
	.pool
	
;	stmfd	r13!,{r4,r14}
;	cmp	r1,0x0
;	mov	r4,0x0
;	beq	ForceRankHiddenUnitIsFalse	;0x020E6B30
;	ldr	r2,=,0x027C027C
;	ldr	r1,=0x027C0284
;	ldr	r2,[r2]
;	ldr	r1,[r1]
;	mov	r3,0x98
;	add	r1,r2,r1,lsl 0x2
;	ldr	r2,[r1,0x48]
;	add	r2,r2,0x5000
;	ldr	r2,[r0,0xA58]
;	mla	r2,r0,r3,r2
;	add	r0,r2,0x74
;	mov	r1,0x31		;BackStab
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r4,r4,15
;ForceRankHiddenUnitIsFalse:
;	mov	r0,r4
;	ldmfd	r13!,{r4,r14{
;	bx	r14
;	.pool
