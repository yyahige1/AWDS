;hookforcerankfirepower.asm
;The entire Force Ranks and +Skills firepower function.

;Teamwork 0x8
;Synergy 0x9
;Check Range
;Bruiser
;Brawler
;Skip
;Sharpshooter
;Sniper
;Check Weather
;Icebreaker
;Olaf's Icebreaker
;High and Dry
;Sand Scorpion

.org 0x020E646C
	stmfd	r13!,{r4-r7,r14}
	sub	r13,r13,0x8
	;First Skill
	mov	r4,0x0
	str	r4,[r13,0x4]
	ldr	r4,=0x027C027C
	ldr	r3,=0x27C0284
	ldr	r5,[r4]
	ldr	r4,[r3]
	mov	r3,0x98
	add	r4,r5,r4,lsl 0x2
	mul	r5,r0,r3
	ldr	r4,[r4,0x48]
	mov	r7,r2
	add	r0,r4,0x5000
	ldr	r0,[r0,0xA58]
	mov	r4,r1,lsl 0x4
	add	r0,r0,r5
	add	r0,r0,0x74
	add	r0,r0,r1,lsl 0x4
	mov	r6,0x0
	mov	r1,0x8	;Partner has Teamwork
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatTeamwork
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankEmpowerer
	bl	ForceRankBitChecker
	cmp	r0,0x0
	strne	r0,[r13,0x4]
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, 0x9	;Partner has Synergy
	bl	ForceRankBitChecker
	cmp	r0,0x0
	ldr	r1,[r13,0x4]
	addne	r6,r6,ForceStatSynergy
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankPurePower
	bl	ForceRankBitChecker
	cmp	r0,0x0
	ldr	r1,[r13,0x4]
	addne	r6,r6,ForceStatPurePowerAttack

	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankUnderpowered
	bl	ForceRankBitChecker
	cmp	r0,0x0
	ldr	r1,[r13,0x4]
	subne	r6,r6,ForceStatUnderpoweredAttack	
	
	mov	r0,r7
	bl	0x020DF7AC
	cmp	r0,0x7	;Ranged/Direct Check
	beq	ForceRankDirectFirepowerSkillStart
	cmp	r0,0x8
	beq	ForceRankIndirectFirepowerSkillStart
	b	ForceRankWeatherFirepowerSkillStart
	;Direct Combat Only Forces
ForceRankDirectFirepowerSkillStart:	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankBruiser
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatBruiser
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankBrawler
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatBrawler
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankSoftie
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r6,r6,ForceStatSoftie
	b	ForceRankWeatherFirepowerSkillStart
	
ForceRankIndirectFirepowerSkillStart:	
	;Indirect Combat Only Forces
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSharpshooter
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatSharpshooter
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSniper
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatSniper
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1, ForceRankGlassEyes
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r6,r6,ForceStatGlassEyes
	
	;Weather Skills Here
ForceRankWeatherFirepowerSkillStart:	
	ldr	r1,=0x027C027C
	ldr	r0,=0x027C0284
	ldr	r1,[r1]
	ldr	r0,[r0]
	add	r0,r1,r0,lsl 0x2
	ldr	r1,[r0,0x48]
	ldr	r0,[r1,0x1C4]
	ldrb	r0,[r0,0x3A]
	cmp	r0,0x1
	beq	ForceRankSnowFirepowerSkill
	cmp	r0,0x2
	beq	ForceRankRainFirepowerSkill
	cmp	r0,0x3
	beq	ForceRankSandstormFirepowerSkill
	b	ForceRankWeatherFirepowerSkillEnd
ForceRankSnowFirepowerSkill:
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankIcebreaker
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatIcebreaker
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankFrostbitten
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r6,r6,ForceStatFrostbitten

	ldr	r0,[r13,0x4]
	cmp	r0,0x0
	movne	r6,r6,lsl 0x1	
	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,SpecialSkillOlafIcebreaker
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,SpecialStatOlafIcebreaker
	b	ForceRankWeatherFirepowerSkillEnd
	
ForceRankRainFirepowerSkill:
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankHighandDry
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatHighAndDry

	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSoppingWet
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r6,r6,ForceStatSoppingWet
	
	b	ForceRankWeatherFirepowerSkillEnd
	
ForceRankSandstormFirepowerSkill:	
	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSandScorpion
	bl	ForceRankBitChecker
	cmp	r0,0x0
	addne	r6,r6,ForceStatSandScorpion

	mov	r0,r5
	bl	ForceRankGenericSetup
	mov	r1,ForceRankSandyEyes
	bl	ForceRankBitChecker
	cmp	r0,0x0
	subne	r6,r6,ForceStatSandyEyes

ForceRankWeatherFirepowerSkillEnd:
	ldr	r0,[r13,0x4]
	cmp	r0,0x0
	movne	r6,r6,lsl 0x1	
	
ForceRankSnowFirepowerSkillEnd:
	mov	r0,r6
	add	r13,r13,0x8
	ldmfd	r13!,{r4-r7,r14}
	bx	r14
	.pool
	;Original subroutine ends at 0x020E6708
	;New one currently ends at 0x020E660C
