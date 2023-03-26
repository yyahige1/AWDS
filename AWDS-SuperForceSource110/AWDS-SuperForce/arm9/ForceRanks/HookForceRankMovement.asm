;HookForceRankMovement.asm

.org 0x020E5F60
	stmfd	r13!,{r4-r7,r14}
	mov	r6,r0
	mov	r0,r2
	mov	r5,r1
	mov	r4,0x0
	bl	0x020DF7AC
	cmp	r0,0x9
	
	mov	r0,r6
	ldr	r2,=0x027C027C
	ldr	r1,=0x027C0284
	ldr	r3,[r2]
	ldr	r2,[r1]
	mov	r1,0x98
	add	r2,r3,r2,lsl 0x2
	mul	r7,r0,r1
	ldr	r2,[r2,0x48]
	add	r0,r2,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r7
	add	r0,r0,0x74
	
	bne	ForceRankMovementNotTransport

	mov	r1,ForceRankAPCBoost
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r4,r4,ForceStatAPCBoost

	b	ForceRankMovementExpansion
	.pool
	
;Overflow Fix. Prevents movement from exceeding 11
.org 0x020E030C
	b	ForceRankMovementOverflowFix
	
	;Original:
;	stmfd	r13!,{r4-r6,r14}
;	mov	r6,r0
;	mov	r0,r2
;	mov	r5,r1
;	mov	r4,0x0
;	bl	0x020DF7AC	;Get unit class
;	cmp	r0,0x9	;Transports
;	bne	ForceRankTransportNotTransport ;0x020E5FC0
;	ldr	r1,=0x027C027C
;	ldr	r0,=0x027C0284
;	ldr	r1,[r1]
;	ldr	r0,[r0]
;	mov	r2,0x98
;	add	r0,r1,r0,lsl 0x2
;	ldr	r0,[r0,0x48]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	mla	r0,r6,r2,r0
;	add	r0,r0,0x74
;	add	r0,r0,r5,lsl 0x4
;	mov	r1,0x24			;APC Boost
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r4,r4,0x1
;ForceRankTransportNotTransport:	
;	mov	r0,r4
;	ldmfd	r13!,{r4-r6,r14}
;	bx	r14
;	.pool
