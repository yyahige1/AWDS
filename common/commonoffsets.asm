;commonoffset.asm

;File Load
RamLocationRamOne		equ	0x22783AC;0x0226B3AC to 0x228FF54
RamLengthRamOne			equ	0x17BA8;0x24BA8

RamLocationRamTwo		equ	0x027D8350
RamLengthRamTwo			equ	0x7CB4


;General
CurrentPlayerTurn		equ	0x2183B0A

;Force Rank IDs and Special Skill Bits
SpecialSkillHiddenHP 		equ	0x1
SpecialSkillCityDeployment 	equ	0x2
SpecialSkillFirstCounter 	equ	0x3
SpecialSkillPiercingVision 	equ	0x4
SpecialSkillDoubleTerrainStars 	equ	0x5
SpecialSkillOlafIcebreaker 	equ	0x6
SpecialSkillReducedAirFuelCost 	equ	0x7

SpecialSkillTagHasTeamwork 	equ	0x8
SpecialSkillTagHasSynergy	equ	0x9
SpecialSkillTagHasBodyguard 	equ	0xA

SpecialSkillWarbonds	 	equ	0xB
SpecialSkillIndirectDefA 	equ	0xC
SpecialSkillIndirectDefB 	equ	0xD
SpecialSkillIndirectDefC 	equ	0xE
SpecialSkillSashaIncomeBoost 	equ	0xF

SpecialSkillLashTerrainAttack	equ	0x10

ForceRankBruiser		equ	0x20
ForceRankBrawler		equ	0x21
ForceRankSharpshooter		equ	0x22
ForceRankSniper			equ	0x23
ForceRankAPCBoost		equ	0x24
ForceRankSlamGuard		equ	0x25
ForceRankSlamShield		equ	0x26
ForceRankSnipeGuard		equ	0x27
ForceRankSnipeShield		equ	0x28

ForceRankAPCGuard		equ	0x29
ForceRankMissileGuard		equ	0x2A
ForceRankCannonGuard		equ	0x2B
ForceRankRoadRage		equ	0x2C
ForceRankRanger			equ	0x2D
ForceRankUrbanFighter		equ	0x2E
ForceRankMountaineer		equ	0x2F
ForceRankSeamanship		equ	0x30

ForceRankBackstab		equ	0x31
ForceRankHighandDry		equ	0x32
ForceRankIcebreaker		equ	0x33
ForceRankSandScorpion		equ	0x34
ForceRankTeamwork		equ	0x35
ForceRankSynergy		equ	0x36
ForceRankBodyguard		equ	0x37
ForceRankPrairieDog		equ	0x38

ForceRankPathfinder		equ	0x39
ForceRankTowerPower		equ	0x3A
ForceRankScout			equ	0x3B
ForceRankEagleEye		equ	0x3C
ForceRankMechanic		equ	0x3D
ForceRankGearhead		equ	0x3E
ForceRankInvader		equ	0x3F
ForceRankConqueror		equ	0x40

ForceRankSneaky			equ	0x41
ForceRankStealthy		equ	0x42
ForceRankSalePrice		equ	0x43
ForceRankFireSale		equ	0x44
ForceRankCombatPay		equ	0x45
ForceRankGoldRush		equ	0x46
ForceRankLuck			equ	0x47
ForceRankStarPower		equ	0x48

ForceRankMistwalker		equ	0x49
ForceRankSoulofHachi		equ	0x4A

;Customs
ForceRankIncomeTax		equ	0x4B	;43
ForceRankTaxHike		equ	0x4C	;44
ForceRankNullLuck		equ	0x4D	;45
ForceRankStarDrain		equ	0x4E	;46

ForceRankFrostbitten		equ	0x4F	;47
ForceRankSoppingWet		equ	0x50	;48
ForceRankSandyEyes		equ	0x51	;49

ForceRankSoftie			equ	0x52	;50
ForceRankGlassEyes		equ	0x53	;51

ForceRankReparations		equ	0x54	;52
ForceRankPurePower		equ	0x55	;53
ForceRankTrueGrit		equ	0x56	;54
ForceRankUnderpowered		equ	0x57	;55
ForceRankFlimsy			equ	0x58	;56

ForceRankGlassJaw		equ	0x59	;57
ForceRankUnusualHat		equ	0x5A	;58
ForceRankLightMist		equ	0x5B	;59
ForceRankDuctTape		equ	0x5C	;60

ForceRankHippy			equ	0x5D	;61
ForceRankPacifist		equ	0x5E	;62

ForceRankDrunkDriver		equ	0x5F	;63
ForceRankSickly			equ	0x60	;64
ForceRankCountryHick		equ	0x61	;65
ForceRankNoSherpa		equ	0x62	;66
ForceRankSeasick		equ	0x63	;67

ForceRankFlatTires		equ	0x64	;68
ForceRankSignalLoss		equ	0x65	;69
ForceRankFacestab		equ	0x66	;70
ForceRankBanshee		equ	0x67	;71

ForceRankClassicAPC		equ	0x68	;72

ForceRankCommando		equ	0x69	;73
ForceRankTankOps		equ	0x6A	;74
ForceRankCoverFire		equ	0x6B	;75
ForceRankPilot			equ	0x6C	;76
ForceRankAdmiral		equ	0x6D	;77

ForceRankCursed			equ	0x6E	;78
ForceRankCoverIdentity		equ	0x6F	;79

ForceRankFlakenator		equ	0x70	;80
ForceRankSpeedDemon		equ	0x71	;81
ForceRankEspionage		equ	0x72	;82

ForceRankRainDance		equ	0x73	;83
ForceRankFlurry			equ	0x74	;84
ForceRankDesertLord		equ	0x75	;85

ForceRankStumbler		equ	0x76	;86
ForceRankIntelLeak		equ	0x77	;87
ForceRankTrickShot		equ	0x78	;88
ForceRankTerrainStar		equ	0x79	;89

ForceRankRevenge		equ	0x7A	;90
ForceRankSurrender		equ	0x7B	;91

ForceRankHelipad		equ	0x7C	;92

ForceRankRandomDebuff		equ	0x7D	;93
ForceRankRandomBuff		equ	0x7E	;94
ForceRankEmpowerer		equ	0x7F	;95


;Blank Line
