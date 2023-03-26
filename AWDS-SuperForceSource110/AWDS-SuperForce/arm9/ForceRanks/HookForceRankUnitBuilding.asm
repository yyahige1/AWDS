;HookForceRankUnitBuilding.asm
;Allows for "off-type" unit building.

;Player Menu
.org 0x020BBEC4
	;UID in r8
	;Player in r2
	b	ForceRankUnitBuildingExpansion
ForceRankUnitBuildingReturn:

;AI Check (General/Defence/Assault/Strike)
.org 0x0209591C
	;UID in r10
	b	ForceRankUnitBuildingExpansionAI
ForceRankUnitBuildingAIReturn:	
