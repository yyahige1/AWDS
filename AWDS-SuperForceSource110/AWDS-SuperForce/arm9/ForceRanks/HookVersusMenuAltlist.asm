;hookversusmenualtlist.asm
;Adds the Y Button to the input list to allow for alternate force rank selection
;Y = 0x800
;X = 0x400

.org	0x0206872C
	ands	r0,r0,0xC00	;Allows on X AND Y.
	beq	0x02068750
;	bl	0x02045680
	b	CoreForceRankExtraButtonHandler
ForceRankExtraButtonHandlerReturn:
	cmp	r0,0x0
	bne	0x02068750
	mov	r0,0x0
	bl	0x02069378
	ldmfd	r13!,{r4-r6,r14}
	bx	r14
	
.org	0x02042AD4
	ands	r0,r2,0xC00	;ands	r0,r2,0x400
	beq	0x02042AEC
	b	CoreForceRankExtraButtonCampaignHandler	;bl	0x02041944
ForceRankExtraButtonCampaignReturn:	
;Blank Line	
