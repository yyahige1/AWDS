;CoreForceRankRandomiserButton.asm

ForceRankBuffLength equ	59
ForceRankBuffTable:
	.db	ForceRankBruiser,ForceRankBrawler,ForceRankSharpshooter,ForceRankSniper	
	.db	ForceRankAPCBoost,ForceRankSlamGuard,ForceRankSlamShield,ForceRankSnipeGuard
	.db	ForceRankSnipeShield,ForceRankAPCGuard,ForceRankMissileGuard,ForceRankCannonGuard
	.db	ForceRankRoadRage,ForceRankRanger,ForceRankUrbanFighter,ForceRankMountaineer
	.db	ForceRankSeamanship,ForceRankBackstab,ForceRankHighandDry,ForceRankIcebreaker
	.db	ForceRankSandScorpion,ForceRankPrairieDog,ForceRankPathfinder,ForceRankTowerPower
	.db	ForceRankScout,ForceRankEagleEye,ForceRankMechanic,ForceRankGearhead
	.db	ForceRankInvader,ForceRankConqueror,ForceRankSneaky,ForceRankStealthy
	.db	ForceRankSalePrice,ForceRankFireSale,ForceRankCombatPay,ForceRankGoldRush
	.db	ForceRankLuck,ForceRankStarPower,ForceRankMistwalker,ForceRankSoulofHachi
	.db	ForceRankPurePower,ForceRankTrueGrit,ForceRankCommando,ForceRankTankOps
	.db	ForceRankCoverFire,ForceRankPilot,ForceRankAdmiral,ForceRankCoverIdentity
	.db	ForceRankFlakenator,ForceRankSpeedDemon,ForceRankEspionage,ForceRankRainDance
	.db	ForceRankFlurry,ForceRankDesertLord,ForceRankTrickShot,ForceRankTerrainStar
	.db	ForceRankRevenge,ForceRankHelipad,ForceRankEmpowerer,0
	
ForceRankDebuffLength equ 33
ForceRankDebuffTable:
	.db	ForceRankIncomeTax,ForceRankTaxHike,ForceRankNullLuck,ForceRankStarDrain
	.db	ForceRankFrostbitten,ForceRankSoppingWet,ForceRankSandyEyes,ForceRankSoftie
	.db	ForceRankGlassEyes,ForceRankReparations,ForceRankUnderpowered,ForceRankFlimsy
	.db	ForceRankGlassJaw,ForceRankUnusualHat,ForceRankLightMist,ForceRankDuctTape
	.db	ForceRankPacifist,ForceRankDrunkDriver,ForceRankSickly,ForceRankCountryHick
	.db	ForceRankNoSherpa,ForceRankSeasick,ForceRankFlatTires,ForceRankSignalLoss
	.db	ForceRankFaceStab,ForceRankBanshee,ForceRankClassicAPC,ForceRankCursed
	.db	ForceRankStumbler,ForceRankIntelLeak,ForceRankSurrender,ForceRankFlakenator
	.db	ForceRankEmpowerer,0,0,0

ForceRankRandomiserButton:
	cmp	r2,ForceRankRandomBuff
	beq	RandomiserPositiveBuff
	cmp	r2,ForceRankRandomDebuff
	beq	RandomiserNegativeDebuff
	ldr	r0,=0x027C0288
	b	ForceRankRandomiserButtonReturn
RandomiserPositiveBuff:
	stmfd	r13!,{r1-r7}
	stmfd	r13!,{r0}
RandomiserPositiveBuffLoop:	
	bl	0x02004470
	mov	r1,ForceRankBuffLength	
	bl	0x02002F4C
	ldr	r2,=ForceRankBuffTable
	ldrb	r1,[r2,r0]
	ldr	r0,[r13]
	ldrb	r2,[r0]
	cmp	r1,r0
	beq	RandomiserPositiveBuffLoop
	ldrb	r2,[r0,0x1]
	cmp	r1,r0
	beq	RandomiserPositiveBuffLoop
	ldrb	r2,[r0,0x2]
	cmp	r1,r0
	beq	RandomiserPositiveBuffLoop
	ldrb	r2,[r0,0x3]
	cmp	r1,r0
	beq	RandomiserPositiveBuffLoop
	mov	r0,r1
	ldmfd	r13!,{r1}
	ldmfd	r13!,{r1-r7}
	mov	r2,r0
	ldr	r0,=0x027C0288
	b	ForceRankRandomiserButtonReturn
	
RandomiserNegativeDebuff:
	stmfd	r13!,{r1-r7}
	stmfd	r13!,{r0}
RandomiserNegativeDebuffLoop:	
	bl	0x02004470
	mov	r1,ForceRankDebuffLength	
	bl	0x02002F4C
	ldr	r2,=ForceRankDebuffTable
	ldrb	r1,[r2,r0]
	ldr	r0,[r13]
	ldrb	r2,[r0]
	cmp	r1,r0
	beq	RandomiserNegativeDebuffLoop
	ldrb	r2,[r0,0x1]
	cmp	r1,r0
	beq	RandomiserNegativeDebuffLoop
	ldrb	r2,[r0,0x2]
	cmp	r1,r0
	beq	RandomiserNegativeDebuffLoop
	ldrb	r2,[r0,0x3]
	cmp	r1,r0
	beq	RandomiserNegativeDebuffLoop
	mov	r0,r1
	ldmfd	r13!,{r1}
	ldmfd	r13!,{r1-r7}
	mov	r2,r0
	ldr	r0,=0x027C0288
	b	ForceRankRandomiserButtonReturn	
	.pool


