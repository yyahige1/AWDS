;CoreForceRankDamageAdderExpansion.asm
;Adds support for damage-adding Force Ranks

ForceRankDamageAdderExpansion:
	cmp	r0,0x0
	addeq	r13,r13,0xC
	ldmeqfd	r13!,{r4-r11,r15}
	
	stmfd	r13!,{r0}
	mov	r7,0x0
	mov	r0,r6

	ldr	r2,=0x027C027C
	ldr	r1,=0x027C0284
	ldr	r3,[r2]
	ldr	r2,[r1]
	mov	r1,0x98
	add	r2,r3,r2,lsl 0x2
	mul	r4,r0,r1
	ldr	r2,[r2,0x48]
	add	r0,r2,0x5000
	ldr	r0,[r0,0xA58]
	add	r0,r0,r4
	add	r0,r0,0x74
	cmp	r5,0x1B
	bge	ForceRankAddDamageCheckEnd
	add	r15,r15,r5,lsl 0x2
	
	;Jump Table
	nop
	b	ForceRankAddDamageCheckEnd
	b	ForceRankCheckCommando		;Infantry
	b	ForceRankCheckCommando		;Mech
	b	ForceRankCheckTankOps		;MdTank
	b	ForceRankCheckTankOps		;MegaTank
	b	ForceRankCheckTankOps		;Tank
	b	ForceRankAddDamageCheckEnd	;Recon
	b	ForceRankAddDamageCheckEnd	;APC
	b	ForceRankCheckTankOps		;Neotank
	b	ForceRankCheckCoverFire		;Pipey
	b	ForceRankCheckCoverFire		;Arty
	b	ForceRankCheckCoverFire		;Rocket
	b	ForceRankCheckPilot		;Stealth
	b	ForceRankAddDamageCheckEnd	;Black Bomb
	b	ForceRankAddDamageCheckEnd	;Anti-Air
	b	ForceRankCheckCoverFire		;Missile
	b	ForceRankCheckPilot		;Fighter
	b	ForceRankCheckPilot		;Bomber
	b	ForceRankAddDamageCheckEnd	;Black Boat
	b	ForceRankCheckPilot		;B Copter
	b	ForceRankAddDamageCheckEnd	;T Copter
	b	ForceRankCheckAdmiral		;BShip
	b	ForceRankCheckAdmiral		;Cruiser
	b	ForceRankAddDamageCheckEnd	;Lander
	b	ForceRankCheckAdmiral		;Sub
	b	ForceRankAddDamageCheckEnd	;Ooozium

ForceRankCheckCommando:	
	mov	r1,ForceRankCommando
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r7,r7,ForceStatCommando
	b	ForceRankAddDamageCheckEnd
	
ForceRankCheckTankOps:	
	mov	r1,ForceRankTankOps
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r7,r7,ForceStatTankOps
	b	ForceRankAddDamageCheckEnd	
	
ForceRankCheckCoverFire:	
	mov	r1,ForceRankCoverFire
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r7,r7,ForceStatCoverFire
	b	ForceRankAddDamageCheckEnd

ForceRankCheckPilot:	
	mov	r1,ForceRankPilot
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r7,r7,ForceStatPilot
	b	ForceRankAddDamageCheckEnd

ForceRankCheckAdmiral:	
	mov	r1,ForceRankAdmiral
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r7,r7,ForceStatAdmiral
	b	ForceRankAddDamageCheckEnd

ForceRankAddDamageCheckEnd:
	mov	r0,r4
	bl	ForceRankGenericSetup
	mov	r1,ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	movne	r7,r7,lsl 0x1
	
	ldmfd	r13!,{r0}
	cmp	r0,0x1
	addgt	r0,r0,r7
	add	r13,r13,0xC
	ldmfd	r13!,{r4-r11,r14}
	bx	r14
	.pool
