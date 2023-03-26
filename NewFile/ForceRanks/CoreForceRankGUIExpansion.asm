;coreforcerankguiexpansion.asm
;Adds more slots to the screen

.align 4
CoreForceRankTableSwitcher:
	ldr	r7,=0x02187EDC
	ldrb	r7,[r7]
	cmp	r7,0x1
	ldr	r7,=#0x22F5ECC	;Default Table
	ldreq	r7,=ExtraForcesTable
	b	ForceRankTableReaderReturn
	.pool
	
CoreForceRankExtraButtonHandler:	;For the Vs Menus
	stmfd	r13!,{r0,r1}
	cmp	r0,0x400
	ldreq	r0,=0x02187EDC
	moveq	r1,0x0
	streqb	r1,[r0]
	cmp	r0,0x800
	ldreq	r0,=0x02187EDC
	moveq	r1,0x1
	streqb	r1,[r0]
	ldmfd	r13!,{r0,r1}
	bl	0x02045680
	b	ForceRankExtraButtonHandlerReturn

CoreForceRankExtraButtonCampaignHandler:
	stmfd	r13!,{r0,r1}
	cmp	r0,0x400
	ldreq	r0,=0x02187EDC
	moveq	r1,0x0
	streqb	r1,[r0]
	cmp	r0,0x800
	ldreq	r0,=0x02187EDC
	moveq	r1,0x1
	streqb	r1,[r0]
	ldmfd	r13!,{r0,r1}
	bl	0x02041944
	b	ForceRankExtraButtonCampaignReturn
;Blank Line
