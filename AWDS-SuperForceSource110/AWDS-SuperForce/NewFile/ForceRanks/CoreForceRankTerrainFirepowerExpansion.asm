;CoreForceRankTerrainFirepowerExpansion.asm

ForceRankTerrainFirepowerExpansion:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankTerrainStar
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	ForceRankTerrainStarFalse
	
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	beq	ForceRankTerrainStarNormal
	
	mov	r0,r8
	mov	r1,r7
	mov	r2,r6
	bl	0x020C3A50
	add	r5,r5,r0,ForceStatTerrainStarEmpoweredFirepower;asr 0x0
	b	ForceRankTerrainStarEnd
ForceRankTerrainStarNormal:	
	mov	r0,r8
	mov	r1,r7
	mov	r2,r6
	bl	0x020C3A50
	add	r5,r5,r0,ForceStatTerrainStarFirepower;asr 0x1
	b	ForceRankTerrainStarEnd	
	
ForceRankTerrainStarFalse:
ForceRankTerrainStarEnd:
	b	ForceRankTerrainReturn
