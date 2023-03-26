;hookforcerankscreentablereader.asm
ForceRankSelectionTableRows equ 6

.org 0x02041428
	stmfd	r13!,{r4-r10,r14}
	mov	r6,#0x0
	mov	r5,r6
	ldr	r0,=#0x229C738
	mov	r2,r6
	mov	r4,r6
	mov	r3,#0x1
ForceRankTableReaderTwo:	
	cmp	r6,#0xB
	ldrne	r1,[r0]
	addne	r1,r1,r5
	strneb	r2,[r1,#0x6]
	bne	ForceRankTableReaderOne;#0x204146C

	ldr	r1,[r0]
	strb	r4,[r1,r5]
	ldr	r1,[r0]
	add	r1,r1,r5
	strb	r3,[r1,#0x6]
	
ForceRankTableReaderOne:	
	add	r6,r6,#0x1
	cmp	r6,#0xC
	add	r5,r5,#0x7
	blt	ForceRankTableReaderTwo;#0x2041444

;	ldr	r7,=#0x22F5ECC
	b	CoreForceRankTableSwitcher
ForceRankTableReaderReturn:
	mov	r6,#0x0
	ldr	r10,=#0x229C738	;Replace this for longer
	mov	r5,#0x21
	mov	r4,#0x22
	mov	r9,#0x7

ForceRankTableReaderNine:	
	ldrb	r8,[r7]
	cmp	r8,#0x0
	beq	ForceRankTableReaderThree;#0x2041574

	cmp	r8,#0xA
	bne	ForceRankTableReaderFour;#0x2041540

	cmp	r6,#0x49
	bgt	ForceRankTableReaderFive;#0x20414E4

	cmp	r6,#0x49
	bge	ForceRankTableReaderSix;#0x2041504

	cmp	r6,#0x40
	bgt	ForceRankTableReaderSeven;#0x2041514

	cmp	r6,#0x3C
	blt	ForceRankTableReaderSeven;#0x2041514

	cmp	r6,#0x3C
	beq	ForceRankTableReaderEight;#0x20414F0

	cmp	r6,#0x3E
	beq	ForceRankTableReaderEight;#0x20414F0

	cmp	r6,#0x40
	beq	ForceRankTableReaderEight;#0x20414F0

	b	ForceRankTableReaderSeven;#0x2041514

ForceRankTableReaderFive:	
	cmp	r6,#0x4A
	beq	ForceRankTableReaderSix;#0x2041504

	b	ForceRankTableReaderSeven;#0x2041514

ForceRankTableReaderEight:	
	mov	r0,r5
	bl	#0x2101744

	cmp	r0,#0x0
	bne	ForceRankTableReaderSeven;#0x2041514

	b	ForceRankTableReaderThree;#0x2041574

ForceRankTableReaderSix:	
	mov	r0,r4
	bl	#0x2101744

	cmp	r0,#0x0
	beq	ForceRankTableReaderThree;#0x2041574

ForceRankTableReaderSeven:	
	mul	r2,r8,r9
	ldr	r0,[r10]
	add	r1,r0,r2
	ldrb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	strb	r6,[r1,r0]
	ldr	r0,[r10]
	add	r1,r0,r2
	ldrb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	add	r0,r0,#0x1
	strb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	b	ForceRankTableReaderThree;#0x2041574

ForceRankTableReaderFour:	
	ldr	r1,[r10]
	ldrb	r0,[r1,#0x7A]
	cmp	r8,r0
	bgt	ForceRankTableReaderThree;#0x2041574

	mul	r2,r8,r9
	add	r1,r1,r2
	ldrb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	strb	r6,[r1,r0]
	ldr	r0,[r10]
	add	r1,r0,r2
	ldrb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	add	r0,r0,#0x1
	strb	r0,[r1,ForceRankSelectionTableRows]	;0x6
	
ForceRankTableReaderThree:	
	add	r6,r6,#0x1
	cmp	r6,#0x80
	add	r7,r7,#0xC
	blt	ForceRankTableReaderNine;#0x2041494

	ldmfd	r13!,{r4-r10,r14}
	bx	r14
	.pool
;Blank line
