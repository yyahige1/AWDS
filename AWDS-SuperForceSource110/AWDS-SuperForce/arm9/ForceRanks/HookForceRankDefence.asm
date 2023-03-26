;hookForceRankDefence.asm
;Defence-related skills handled here.
;Slam Guard 0x25
;Slam Shield 0x26
;Snipe Guard 0x27
;Snipe Shield 0x28
;Javier D2D 0xC
;Javier COP 0xD
;Javier SCOP 0xE

.org 0x020E61D8	;New Routine
	stmfd	r13!,{r4-r8,r14}
	sub	r13,r13,0x4
	mov	r6,r0		;Player Number
	mov	r7,r2		;Unit ID (Attacker)
	mov	r8,r1		;Unit ID (Defender)
	mov	r5,0x0
	mov	r0,0x0
	str	r0,[r13]
	;First Skill, Offset in r4
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r2,[r1]
	ldr	r1,[r0]
	mov	r0,0x98
	add	r1,r2,r1,lsl 0x2
	mul	r4,r6,r0
	ldr	r1,[r1,0x48]
	add	r0,r1,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r4
	add	r0,r0,0x74
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	strne	r0,[r13]

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankTrueGrit
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatTrueGritDefence

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankFlimsy
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatFlimsyDefence
	
	b	ForceRankGeneralDefenceTwo
	
ForceRankGeneralDefenceReturn:	
	mov	r0,r7
	bl	0x020DF7AC	;Returns Unit Class Direct/indirect
	mov	r7,r0
	cmp	r0,0x7
	beq	ForceRankDirectDefence
	cmp	r0,0x8
	beq	ForceRankIndirectDefence
	b	ForceRankGeneralDefence
	
ForceRankDirectDefence:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSlamGuard
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatSlamGuard

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSlamShield
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatSlamShield

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankGlassJaw
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatGlassJaw	
	
	b	ForceRankGeneralDefence
	
ForceRankIndirectDefence:	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSnipeGuard
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatSnipeGuard

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSnipeShield
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatSnipeShield

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankUnusualHat
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatUnusualHat

ForceRankGeneralDefence:
	ldr	r0,[r13]		;End of Forces, Empowerer
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	
	cmp	r7,0x8
	bne	ForceRankDefenceEnd	;This appends Javier's Skills here

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillIndirectDefA
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,SpecialStatJavierIndDefA
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillIndirectDefB
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,SpecialStatJavierIndDefB

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillIndirectDefC
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,SpecialStatJavierIndDefC

ForceRankDefenceEnd:	
	mov	r0,r5
	add	r13,r13,0x4
	ldmfd	r13!,{r4-r8,r15}
	.pool

.org 0x020E63B0
	mov	r0,0x0
	bx	r14	
ForceRankGeneralDefenceTwo:	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillTagHasBodyguard
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatBodyGuard

	mov	r0,r8
	bl	0x020DF7AC
	cmp	r0,0x9
	bne	ForceRankDefenceTransportFalse
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankAPCGuard
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatAPCGuard
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankClassicAPC
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatClassicAPC
	
ForceRankDefenceTransportFalse:	
	b	ForceRankGeneralDefenceReturn	
	;Original Routine.
;	stmfd	r13!,{r4-r6,r14}
;	mov	r6,r0
;	mov	r0,r2
;	mov	r5,0x0
;	bl	0x020DF7AC
;	cmp	r0,0x7
;	beq	ForceRankDirectDefence;0x020E6200	;Directs
;	cmp	r0,0x8
;	beq	ForceRankIndirectDefence;0x020E627C	;Indirects
;	b	ForceRankDefenceEnd
;ForceRankDirectDefence:	
;	ldr	r1,=0x027C027C
;	ldr	r0,=0x027C0284
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
;	mov	r1,0x25		;Slam Guard
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x8
;	ldr	r1,=0x27C027C
;	ldr	r0,=0x27C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r2,r0,lsl 0x2
;	ldr	r0,[r0,0x48]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0x26		;Slam Shield
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0xC
;	b	ForceRankDirectDefenceEnd;0x020E639C
;ForceRankIndirectDefence:	
;	ldr	r1,=0x27C027C
;	ldr	r0,=0x27C0284
;	ldr	r2,[r1]
;	ldr	r1,[r0]
;	add	r0,0x98
;	add	r1,r2,r1,lsl 0x2
;	ldr	r1,[r1,0x48]
;	add	r0,r1,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0x27		;Snipe Guard
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x8
;	
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
;	mov	r1,0x28		;Snipe Shield
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0xC
;	
;	ldr	r1,=0x27C027C
;	ldr	r0,=0x27C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r2,r0,lsl 0x2
;	ldr	r0,[r0,0x48]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0xC		;Javier D2D
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x14
;	
;	ldr	r1,=0x27C027C
;	ldr	r0,=0x27C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r2,r0,lsl 0x2
;	ldr	r0,[r0,0x48]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0xD		;Javier COP
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x28	
;	
;	ldr	r1,=0x27C027C
;	ldr	r0,=0x27C0284
;	ldr	r2,[r1]
;	ldr	r0,[r0]
;	add	r0,r2,r0,lsl 0x2
;	ldr	r0,[r0,0x48]
;	add	r0,r0,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,0xE		;Javier SCOP
;	bl	0x020E7EE0
;	cmp	r0,0x0
;	addne	r5,r5,0x50
;ForceRankDirectDefenceEnd:
;ForceRankDefenceEnd:
;	mov	r0,r5
;	ldmfd	r13!,{r4-r6,r14}
;	bx	r14
;	.pool	
	
	
;Blank Line
