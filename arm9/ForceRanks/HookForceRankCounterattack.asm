;HookForceRankCounterattack.asm
.org 0x020DFDC0
	ldr	r2,=0x27C0284
	ldr	r1,=0x27C027C
	ldr	r2,[r2]
	ldr	r1,[r1]
	add	r1,r1,r2,lsl 0x2
	ldr	r2,[r1,0x48]
	ldrb	r1,[r2,0x5D]
	cmp	r1,0x0
	moveq	r0,0x0
	bxeq	r14
	
	;New
	stmfd	r13!,{r4-r6,r14}
	mov	r5,r0
	;Old
	add	r1,r2,0x5000
	ldr	r2,[r1,0xA58]
	mov	r1,0x98
	mla	r1,r0,r1,r2
	ldrb	r0,[r1,0x6C]
	ldr	r1,[r1,0x6C]
	ldr	r2,=0x021536CC
	and	r3,r0,0x7F
	mov	r0,0x220
	mla	r0,r3,r0,r2
	
	b	ForceRankCounterattackExpansion
	
	;mov	r1,r1,lsl 0x14
	;mov	r1,r1,lsr 0x1E
	;mov	r1,r1,lsl 0x7
	;ldrsh	r0,[r1,r1]
	;bx	r14
	.pool
