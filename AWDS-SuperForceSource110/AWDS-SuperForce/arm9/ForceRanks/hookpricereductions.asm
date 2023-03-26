;hookpricereductions.asm

.org 0x020E5FD4
	stmfd	r13!,{r4-r6,r14}
	ldr	r3,=0x027C027C
	ldr	r2,=0x027C0284
	ldr	r4,[r3]
	ldr	r3,[r2]
	mov	r2,0x98
	add	r3,r4,r3,lsl 0x2
	mul	r5,r0,r2
	ldr	r3,[r3,0x48]
	mov	r4,r1,lsl 0x4
	add	r0,r3,0x5000
	ldr	r0,[r0,0xA58]
	mov	r6,0x0
	add	r0,r0,r5
	add	r0,r0,0x74
	add	r0,r0,r1,lsl 0x4
	mov	r1,ForceRankSalePrice
	bl	ForceRankBitChecker

	cmp	r0,0x0
	subne	r6,r6,ForceStatSalePrice
	
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r2,[r1]
	ldr	r0,[r0]
	mov	r1,ForceRankFireSale
	add	r0,r2,r0,lsl 0x2
	ldr	r0,[r0,0x48]
	add	r0,r0,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r5
	add	r0,r0,0x74
	add	r0,r0,r4
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r6,r6,ForceStatFiresale
;	mov	r0,r6
	b	ForceRankExpansionCostChange
;	ldmfd	r13!,{r4-r6,r14}
;	bx	r14
	.pool	
;blank line
