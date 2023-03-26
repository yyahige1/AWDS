;HookForceRankHiddenHP.asm

.org 0x01FFCB88
	b	ForceRankHiddenHPExpansion
	;mov	r1,0x1
ForceRankHiddenHPReturn:
	bl	ForceRankBitChecker
