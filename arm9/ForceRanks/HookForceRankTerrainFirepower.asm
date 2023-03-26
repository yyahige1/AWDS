;HookForceRankTerrainFirepower.asm
;For the Terrain Specific Buff/Nerfs
;Also includes the default CO Functions
;Terrain Bonus On-Tile
;Terrain To Firepower
;Terrain Bonus On-Tile Force Ranks

.org 0x20E68D0
	stmfd	r13!,{r4-r8,r14}
	mov	r8,r0	;Player ID
	mov	r7,r1	;Unit ID
	ldr	r5,=0x027C027C
	ldr	r4,=0x027C0284
	ldr	r5,[r5]
	ldr	r4,[r4]	
	add	r1,r5,r4,lsl 0x2
	ldr	r1,[r1,0x48]
	add	r1,r1,0x4000
	ldr	r4,[r1,0x3D0]
	add	r1,r4,r3,lsl 0x1
	add	r1,r1,0x4100
	ldrh	r1,[r1,0x68]
	add	r1,r2,r1
	add	r1,r4,r1
	add	r1,r1,0x1000
	ldrb	r1,[r1,0x420]
	and	r6,r1,0x1F	;Terrain ID
	mov	r5,0x0
	
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	mov	r1,0x98
	ldr	r3,[r3]
	ldr	r2,[r2]
	mul	r4,r8,r1
	add	r1,r3,r2,lsl 0x2
	ldr	r1,[r1,0x48]
	add	r0,r1,0x500
	ldr	r0,[r0,0xA58]
	add	r0,r0,r4
	add	r0,r0,0x74
	
	cmp	r6,0x7
	addls	r15,r15,r6,lsl 0x2
	b	ForceRankTerrainEnd		;0x020E6AD0
	b	ForceRankTerrainEnd		;0x020E6AD0	Nothing
	b	ForceRankTerrainEnd		;0x020E6AD0	Plain
	b	ForceRankTerrainEnd		;0x020E6AD0	River
	b	ForceRankTerrainMountain	;0x020E6A5C	Mtn
	b	ForceRankTerrainForest		;0x020E6A98	Forest
	b	ForceRankTerrainRoad		;0x020E69E4	Road
	b	ForceRankTerrainCity		;0x020E6A20	City
	b	ForceRankTerrainSea		;0x020E69A8	Sea
ForceRankTerrainMountain:
	mov	r1,ForceRankMountaineer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,ForceStatMountaineer
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankNoSherpa
	bl	ForceRankBitChecker
	subne	r5,ForceStatNoSherpa
	b	ForceRankTerrainEnd
	
ForceRankTerrainForest:	
	mov	r1,ForceRankRanger
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,ForceStatRanger
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSickly
	bl	ForceRankBitChecker
	subne	r5,ForceStatSickly
	b	ForceRankTerrainEnd	

ForceRankTerrainRoad:	
	mov	r1,ForceRankRoadRage
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,ForceStatRoadRage
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankDrunkDriver
	bl	ForceRankBitChecker
	subne	r5,ForceStatDrunkDriver
	b	ForceRankTerrainEnd	

ForceRankTerrainCity:
	mov	r1,ForceRankUrbanFighter
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,ForceStatUrbanFighter
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankCountryHick
	bl	ForceRankBitChecker
	subne	r5,ForceStatCountryHick
	b	ForceRankTerrainEnd

ForceRankTerrainSea:	
	mov	r1,ForceRankSeamanship
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,ForceStatSeamanship
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSeasick
	bl	ForceRankBitChecker
	subne	r5,ForceStatSeasick
	b	ForceRankTerrainEnd
	
ForceRankTerrainEnd:	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	movne	r5,r5,lsl 0x1
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillLashTerrainAttack
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	SpecialSkillTerrainAttackFalse
	
	mov	r0,r8
	mov	r1,r7
	mov	r2,r6
	bl	0x020C3A50
	add	r5,r5,r0,SpecialStatLashTerrainFirepower;asr 0x1
	
SpecialSkillTerrainAttackFalse:
	b	ForceRankTerrainFirepowerExpansion
ForceRankTerrainReturn:	
	mov	r0,r8
	mov	r1,r6
	bl	0x020DFCF8
	add	r5,r5,r0
	
	mov	r0,r5
	ldmfd	r13!,{r4-r8,r14}
	bx	r14
	.pool
	
;	;Original Subroutine
;	stmfd	r13!,{r4-r8,r14}
;	ldr	r5,=0x027C027C
;	ldr	r4,=0x027C0284
;	ldr	r5,[r5]
;	ldr	r4,[r4]
;	mov	r7,r1
;	add	r1,r5,r4,lsl 0x2
;	ldr	r1,[r1,0x48]
;	mov	r8,r0
;	add	r1,r1,0x4000
;	ldr	r4,[r1,0x3D0]
;	add	r1,r4,r3,lsl 0x1
;	add	r1,r1,0x4100
;	ldrh	r1,[r1,0x68]
;	add	r1,r2,r1
;	add	r1,r4,r1
;	add	r1,r1,0x1000
;	ldrb	r1,[r1,0x420]
;	and	r6,r1,0x1F
;	mov	r1,r6
;	bl	0x020DFCF8
;	add	r5,r0,0x0	;r5 is temp register for Boost
;	
;	ldr	r3,=0x027C027C
;	ldr	r2,=0x027C0284
;	mov	r1,0x98
;	ldr	r3,[r3]
;	ldr	r2,[r2]
;	mul	r4,r8,r1
;	add	r1,r3,r2,lsl 0x2
;	ldr	r1,[r1,0x48]
;	add	r0,r1,0x5000
;	ldr	r0,[r0,0xA58]
;	add	r0,r0,r4
;	add	r0,r0,0x74
;	mov	r1,SpecialSkillLashTerrainAttack
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	beq	SpecialSkillTerrainAttackFalse	;0x020E697C
;	mov	r0,r8
;	mov	r1,r7
;	mov	r2,r6
;	bl	0x020C3A50
;	add	r5,r5,r0, asr 0x1
;SpecialSkillTerrainAttackFalse:	
;	cmp	r6,0x7
;	addls	r15,r15,r6,lsl 0x2
;	b	ForceRankTerrainEnd		;0x020E6AD0
;	b	ForceRankTerrainEnd		;0x020E6AD0	Nothing
;	b	ForceRankTerrainEnd		;0x020E6AD0	Plain
;	b	ForceRankTerrainEnd		;0x020E6AD0	River
;	b	ForceRankTerrainMountain	;0x020E6A5C	Mtn
;	b	ForceRankTerrainForest		;0x020E6A98	Forest
;	b	ForceRankTerrainRoad		;0x020E69E4	Road
;	b	ForceRankTerrainCity		;0x020E6A20	City
;	b	ForceRankTerrainSea		;0x020E69A8	Sea
;ForceRankTerrainSea:
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
;	mov	r1,0x30	;SeaManShip
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,10
;	b	ForceRankTerrainEnd
;ForceRankTerrainRoad:
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
;	mov	r1,0x2C	;Road Rage
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,10
;	b	ForceRankTerrainEnd	
;ForceRankTerrainSea:
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
;	mov	r1,0x30	;Mountaineer
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,10
;	b	ForceRankTerrainEnd	
;ForceRankTerrainCity:
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
;	mov	r1,0x2E	;Urban Fighter
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,10
;	b	ForceRankTerrainEnd
;ForceRankTerrainMountain:
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
;	mov	r1,0x2F	;Mountaineer
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,10
;	b	ForceRankTerrainEnd	
;ForceRankTerrainForest:
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
;	mov	r1,0x2D	;Ranger
;	bl	ForceRankBitChecker
;	cmp	r0,0x0
;	addne	r5,r5,10
;ForceRankTerrainEnd:
;	mov	r0,r5
;	ldmfd	r13!,{r4-r8,r14}
;	bx	r14
;	.pool
