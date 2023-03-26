;HookForceRankFuelCostReduction.asm
;Changes the fuel cost of units.

.org 0x020E60D0
	stmfd	r13!,{r4-r8,r14}
	sub	r13,r13,0x4
	ldr	r4,=0x027C027C
	ldr	r3,=0x027C0284
	ldr	r5,[r4]
	ldr	r4,[r3]
	mov	r3,0x98
	add	r4,r5,r4,lsl 0x2
	ldr	r5,[r4,0x48]
	mul	r4,r0,r3
	add	r0,r5,0x5000
	ldr	r0,[r0,0xA58]
	mov	r7,r1
	add	r0,r0,r4
	add	r0,r0,0x74
	mov	r6,r2
	mov	r5,0x0
	mov	r8,0x0
	
	mov	r1,SpecialSkillReducedAirFuelCost
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	SkillAirFuelSaverFalse;0x020E6144
	mov	r0,0x6C
	mul	r1,r7,r0
	ldr	r0,=0x22F4FD4
	ldrb	r0,[r0,r1]
	add	r0,r0,0xFD
	and	r0,r0,0xFF
	cmp	r0,0x1
	addls	r8,r8,SpecialStatAirFuelSaver
	
SkillAirFuelSaverFalse:	
	cmp	r6,0x0
	beq	FuelCostDiveHideForceEnd
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSneaky
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatSneaky
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankStealthy
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatStealthy
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankBanshee
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatBanshee
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	
FuelCostDiveHideForceEnd:
	add	r0,r5,r8
	add	r13,r13,0x4
	ldmfd	r13!,{r4-r8,r15}
	.pool
	
