;CoreForceRankWeatherChangePowerExpansion.asm

ForceRankWeatherChangePower:
	ldr	r0,=CurrentPlayerTurn
	ldrb	r0,[r0]
	mov	r5,0x0
	mov	r6,0x1
	
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
	add	r0,0x74	

	mov	r1,ForceRankDesertLord
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,0x3	
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankRainDance
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,0x2
	
	mov	r0,r4
	bl	ForceRankGenericSetup	
	mov	r1,ForceRankFlurry
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,0x1

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r6,r6,lsl 0x1
	
	cmp	r5,0x0
	bne	ForceRankInvokeWeather

ForceRankInvokeWeatherEnd:	
	ldmfd	r13!,{r4-r6,r14}
	bx	r14
	.pool
	
ForceRankInvokeWeather:
	mov	r0,r5
	mov	r1,r6
	bl	ForceRankSpecialWeather
	b	ForceRankInvokeWeatherEnd
	
ForceRankSpecialWeather:
	stmfd	r13!,{r14}
	sub	r13,r13,0x4
	bl	ForceRankCustomWeatherSetup
	bl	0x020D5684
	add	r13,r13,0x4
	ldmfd	r13!,{r14}
	bx	r14
	
ForceRankCustomWeatherSetup:
	stmfd	r13!,{r4,r5,r14}
	sub	r13,r13,0x4
	mov	r5,r0
	bl	ForceRankCustomWeatherTimer
	b	0x020D2AB8
	
ForceRankCustomWeatherTimer:	
	stmfd	r13!,{r4-r7,r14}
	sub	r13,r13,0x4
	mov	r0,r1
	b	0x020D2BA4
	
