;hookforcedamagetofunds.asm
;Used for Combat Pay and War Bonds

.org 0x020C86CC
	stmfd	r13!,{r4-r8,r14}
	ldr	r4,=#0x27C027C
	ldr	r3,=#0x27C0284
	ldr	r4,[r4]
	ldr	r3,[r3]
	mov	r8,r1
	add	r1,r4,r3,lsl #0x2
	ldr	r1,[r1,#0x48]
	ldr	r3,=#0x92492493
	add	r5,r1,#0x5000
	ldr	r1,[r5,#0x75C]
	mov	r4,#0x98
	sub	r6,r0,r1
	smull	r0,r7,r3,r6
	sub	r12,r8,r1
	add	r7,r6,r7
	smull	r1,r0,r3,r12
	add	r0,r12,r0
	mov	r7,r7,asr #0x3
	mov	r1,r6,lsr #0x1F
	add	r7,r1,r7
	mov	r1,r7,asr #0x6
	add	r6,r1,#0x1
	mul	r4,r6,r4
	ldr	r3,[r5,#0xA58]
	mov	r0,r0,asr #0x3
	mov	r7,r2
	mov	r1,r12,lsr #0x1F
	add	r0,r1,r0
	mov	r0,r0,asr #0x6
	add	r5,r0,#0x1
	add	r0,r3,r4
	add	r0,r0,#0x74
	mov	r1,ForceRankCombatPay
	bl	ForceRankBitChecker

	cmp	r0,#0x0
	beq	ForceDamagetoFunds1;#0x20C878C

	ldrb	r1,[r8]
	mov	r0,r5
	bl	#0x20E0314

	mul	r0,r7,r0
	b	ForceDamagetoFundsExpansion1
;	mov	r0,r0,lsl #0x1
ForceDamageToFundsReturn1:
	mov	r1,100
	bl	DivisionSubroutine;#0x2002FA4

	mov	r2,r6,lsl #0x10
	mov	r1,r0
	mov	r0,r2,lsr #0x10
	bl	#0x20C83D0
	
ForceDamagetoFunds1:
	b	ForceDamageToFundsExpansion2
ForceDamageToFundsReturn2:
;	ldr	r1,=#0x27C027C
;	ldr	r0,=#0x27C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r2,r0,lsl #0x2
;	ldr	r0,[r0,#0x48]
;	add	r0,r0,#0x5000
;	ldr	r0,[r0,#0xA58]
;	add	r0,r0,r4
;	add	r0,r0,#0x74
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillWarbonds
	bl	ForceRankBitChecker

	cmp	r0,#0x0
	ldmeqfd	r13!,{r4-r8,r14}
	bxeq	r14
	ldrb	r1,[r8]
	mov	r0,r5
	bl	#0x20E0314

	mul	r1,r7,r0
	mov	r0,#0x32
	mul	r0,r1,r0
	mov	r1,#0x64
	bl	DivisionSubroutine;#0x2002FA4

	mov	r2,r6,lsl #0x10
	mov	r1,r0
	mov	r0,r2,lsr #0x10
	bl	#0x20C83D0

	ldmfd	r13!,{r4-r8,r14}
	bx	r14
	.pool

.org	0x020C8434
;Underflow Fixer - Prevents Underflow
	adds	r0,r0,r1
	strpl	r0,[r12,r2]
;Blank Line
