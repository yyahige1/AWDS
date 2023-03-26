;CoreForceRankHiddenFirepowerExpansion

ForceRankHiddenFirepowerExpansion:
	mov	r1,ForceRankBackstab
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r5,r5,ForceStatBackstab

	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankFacestab
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r5,r5,ForceStatFaceStab
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r5,r5,lsl 0x1
	mov	r0,r5
	b	ForceRankHiddenFirepowerUnitIsFalse
