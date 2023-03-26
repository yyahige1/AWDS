;HookForceRankCapture.asm
;Capture Stuff

.org 0x020E6778
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
	mov	r1,ForceRankInvader
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatInvader
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankConqueror
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatConqueror
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankHippy
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatHippy
	b	ForceRankCaptureExpansion
	.pool
	
;Prevent Underflow Fix
.org 0x020DE650
	b	CaptureUnderflowCheck
CaptureUnderFlowCheckReturn:	
	
	;original, 36 Words
;	stmfd	r13!,{r4-r6,r14}
;	ldr	r3,=0x027C027C
;	ldr	r2,=0x027C0284
;	ldr	r4,[r3]
;	ldr	r3,[r2]
;	mov	r2,0x98
;	add	r3,r4,r3,lsl 0x2
;	mul	r5,r0,r2
;	ldr	r3,[r3,0x48]
;	mov	r4,r1,lsl 0x4
;	add	r0,r3,0x5000
;	ldr	r0,[r0,0xA58]
;	mov	r6,0x0
;	add	r0,r0,r5
;	add	r0,r0,0x74
;	add	r0,r0,r1,lsl 0x4
;	mov	r1,0x3F			;Invader
;	bl	0x20E7EE0
;	cmp	r0,0x0
;	addne	r6,r6,0x1
;	ldr	r1,=0x27C027C
;	ldr	r0,=0x27C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r5
;	add	r0,r0,r4
;	mov	r1,0x40			;Conqueror
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r6,r6,0x2
;	mov	r0,r6
;	ldmfd	r13!,{r4-r6,r14}
;	bx	r14
;	.pool
