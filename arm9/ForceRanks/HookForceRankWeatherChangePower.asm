;HookForceRankWeatherChangePower.asm
;Invokes Weather Changes on CO Power

.org 0x020E1BB0
	b	ForceRankWeatherChangePower
	;ldmfd	r13!,{r4-r6,r14}
