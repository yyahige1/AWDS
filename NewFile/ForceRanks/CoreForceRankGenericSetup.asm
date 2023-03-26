;coreForceRankGenericSetup.asm
;Sets up for the Force Rank check.

ForceRankGenericSetup:
	;input of r0 = Player Number Offset
	stmfd	r13!,{r2-r7}
	mov	r5,r0
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r2,[r1]
	ldr	r0,[r0]
	add	r0,r2,r0,lsl 0x2
	ldr	r0,[r0,0x48]
	add	r0,r0,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r5 ;0x98 x Player Number
	add	r0,r0,0x74
	
	ldmfd	r13!,{r2-r7}
	bx	r14
	.pool

