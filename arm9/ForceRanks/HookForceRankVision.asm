;hookforcerankvision.asm
;Handles vision adjustments

.org 0x020DF870
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r2,[r1]
	ldr	r1,[r0]
	mov	r0,0x98
	add	r1,r2,r1,lsl 0x2
	mul	r4,r6,r0
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankScout
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatScout
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEagleEye
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatEagleEye
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankLightMist
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatLightMist
	b	ForceRankVisionExpansion
	.pool
	
.org 0x020DF8E8
ForceRankVisionReturn:
	mov	r0,r5
	ldmfd	r13!,{r4-r6,r14}
	bx	r14

	;Original Routine
;	ldr	r1,=0x027C027C
;	ldr	r0,=0x027CO284
;	ldr	r2,[r1]
;	ldr	r1,[r0]
;	mov	r0,0x98
;	add	r1,r2,r1,lsl 0x2
;	mul	r4,r6,r0
;	ldr	r1,[r1,0x48]
;	add	r0,r1,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0x3B		;Scout
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,0x1
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
;	mov	r1,0x3C		;Eagle Eye
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,0x2

;	mov	r0,r5
;	ldmfd	r13!,{r4-r6,r14}
;	bx	r14
;.org 0x020DF8F4
;	.pool

;Blank Line
