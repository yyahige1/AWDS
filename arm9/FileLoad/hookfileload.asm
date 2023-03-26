;hookfileload.asm
;Designed to load a file to add further hax to.
;Allocates 226B3AC - 228FF58 (0x00024bac 150444 bytes) as Ram1
;Allocates 23E9916 - 23FF808 (0x0001f7f2 129010 bytes) as Ram2

;hook from one of the early game initialisation subroutines
;This Entrypoint works. Use it!
;Runs once upon loading title screen
;Also runs
.org	0x020230B4
	b	Custom_LoadFile
	;b	AutoUnlockFunction
	;ldmfd	r13!,{r4,r14}
	;bx	r14

.org 0x0215F0E0
Custom_LoadFile:
	stmfd	r13!,{r0-r12}
	;Self-destructs so it's only run-once
	ldr	r0,=Custom_LoadFile_AutoUnlock
	ldr	r1,=Custom_LoadFile
	ldr	r2,[r0]
	str	r2,[r1]
	ldr	r2,[r0,0x4]
	str	r2,[r1,0x4]
	ldr	r2,[r0,0x8]
	str	r2,[r1,0x8]

	;Pointer to Filename to Load
	ldr	r1,=Data_Xen0_Load
	;File Offset to Load
	mov	r2,0x214
	;Length of File to Load
	ldr	r3,=0xFEF + 0x612
	;Address to load file data to
	ldr	r0,=RamLocationRamOne;0x0226b3b0
	bl	0x0200BB18
	
	;Perform wait loop
	ldr	r0,=0x500000
	swi	0x3
	
;	ldr	r1,=Data_Xen0_Load
;	ldr	r2,=0x1204
;	ldr	r3,=0x612
	;Address to load file data to
;	ldr	r0,=RamLocationRamTwo
;	bl	0x0200BB18
;	ldr	r0,=0x500000
;	swi	0x3
	ldmfd	r13!,{r0-r12}
	
Custom_Loadfile_End:
	ldmfd	r13!,{r4,r14}
	bx	r14
	.pool
	
Custom_LoadFile_AutoUnlock:
	ldr	r0,=AutoUnlockFunction
	bx	r0
	.pool
	
Data_Xen0_Load:
	.ascii "/national/004"
;	.ascii "/ohashi/res_skill"
;	.ascii "/ohashi/res_wall_agb2"
	.db	0x0
	

;Blank Line
