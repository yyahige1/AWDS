;hookluckskillchanges.asm
;Contains the changes for the Luck Skill

.org 0x020E671C
	stmfd	r13!,{r4,r5,r14}
;	ldr	r3,=0x027C027C
;	ldr	r2,=0x027C0284
;	ldr	r12,[r3]
;	ldr	r2,[r2]
;	mov	r3,0x98	
;	add	r2,r12,r2,lsl 0x2
;	ldr	r2,[r2,0x48]
;	mov	r4,0x0
;	add	r2,r2,0x5000
;	ldr	r2,[r2,0xA58]
;	mla	r2,r0,r3,r2
;	add	r0,r2,0x74
;	add	r0,r0,r1,lsl 0x4
	ldr	r4,=0x027C027C
	ldr	r3,=0x027C0284
	ldr	r5,[r4]
	ldr	r4,[r3]
	mov	r3,0x98
	add	r4,r5,r4,lsl 0x2
	mul	r5,r0,r3
	ldr	r4,[r4,0x48]
	add	r0,r4,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r5
	add	r0,r0,0x74
	add	r0,r0,r1,lsl 0x4
	mov	r4,0x0

	mov	r1,ForceRankLuck
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r4,r4,ForceStatLuck
	b	ForceRankExpansionPositiveLuckChange
;	mov	r0,r4
;	ldmfd	r13!,{r4,r14}
;	bx	r14
	.pool
	
.org 0x020E00F0
;Fix to prevent underruns
	b	LuckGathererUnderflowFix	
;Blank Line	
