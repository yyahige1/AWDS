;HookForceRankScreenGUISetup.asm

.org 0x02041370
	stmfd	r13!,{r4-r11,r14}
	sub	r13,r13,#0xC
	mov	r10,#0x1
	mov	r8,#0x7
	mov	r7,#0x3
	ldr	r4,=#0x229C738
	str	r8,[r13,#0x8]
	mov	r0,#0x0
	str	r0,[r13,#0x4]
	mov	r11,#0x1E
	mov	r0,#0x11
	str	r0,[r13]
	
ForceRankGuiSetupFour:	
	cmp	r10,#0xB
	bne	ForceRankGuiSetupOne	;#0x20413B8

	ldr	r1,[r13]
	mov	r0,r11
	bl	#0x204171C

	b	ForceRankGuiSetupTwo	;#0x2041404
	
ForceRankGuiSetupOne:
	ldr	r0,[r4]
	ldr	r9,[r13,#0x4]
	add	r1,r0,r8
	ldrb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	cmp	r0,#0x0
	ble	ForceRankGuiSetupTwo	;#0x2041404

	ldr	r6,[r13,#0x8]
	sub	r5,r7,#0x3
	
ForceRankGuiSetupThree:	
	ldrb	r2,[r1,r9]
	mov	r0,r5
	mov	r1,r6
	bl	#0x20417A8

	ldr	r0,[r4]
	add	r9,r9,#0x1
	add	r1,r8,r0
	add	r6,r6,#0x2
	ldrb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	cmp	r9,r0
	blt	ForceRankGuiSetupThree	;#0x20413D8

ForceRankGuiSetupTwo:	
	add	r10,r10,#0x1
	cmp	r10,#0xC
	add	r8,r8,ForceRankSelectionTableRows+1	;#0x7
	add	r7,r7,#0x3
	blt	ForceRankGuiSetupFour	;#0x20413A0

	add	r13,r13,#0xC
	ldmfd	r13!,{r4-r11,r14}
	bx	r14
	.pool
;Blank Line	
