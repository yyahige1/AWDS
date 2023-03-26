;hookForceRankRepair.asm

.org 0x020E5EC4
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
	mov	r1,ForceRankMechanic
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatMechanic
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankGearHead
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatGearHead
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankDuctTape
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatDuctTape
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	
	b ForceRankRepairExpansion
	.pool
	
.org 0x020E5A08
	;Adds an Underflow check to prevent negative repairs.
	adds	r0,r0,2
	movmi	r0,0
	add	r13,r13,0x4
	ldmfd	r13!,{r15}

	;Original Subroutine
;	stmfd	r13!,{r4,r5,r14}	;39 Words
;	sub	r13,r13,0x4
;	ldr	r2,=0x027C027C
;	ldr	r1,=0x027C0284
;	ldr	r3,[r2]
;	ldr	r2,[r1]
;	mov	r1,0x98
;	add	r2,r3,r2,lsl 0x2
;	mul	r4,r0,r1
;	ldr	r2,[r2,0x48]
;	add	r0,r2,0x5000
;	ldr	r0,[r0,0xA58]
;	mov	r5,0x0
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0x3D		;Mechanic
;	bl	0x20E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x1
;	
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
;	mov	r1,0x3E		;Gear Head
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x2
;	
;	mov	r0,r5
;	add	r13,r13,0x4
;	ldmfd	r13!,{r4,r5,r14}
;	bx	r14
;	.pool
;Blank Line
