;hookpowerchargeratechanger.asm
;Changes the power charging rates

.org 0x020E2E98
;	ldr	r2,[r1]
	b	CoreForceRankChargeRateExpansion
PowerChargeRateReturn:	
	mul	r0,r7,r0
	mov	r1,100
	bl	0x02002FA4	;Division Subroutine
	mov	r7,r0
	b	PowerChargeRate1

.org	0x020E2EE8	
PowerChargeRate1:
