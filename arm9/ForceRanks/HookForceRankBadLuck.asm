;HookForceRankBadLuck.asm

.org 0x020DFF88
	stmfd	r13!,{r4-r6,r14}
	
.org 0x020DFFA0
	mov	r6,r0

.org 0x020DFFFC
	mla	r1,r6,r1,r12
	
.org 0x020E0028
	b	ForceRankBadLuckExpansion
