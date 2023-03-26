;main.asm
;Main File for assembling

.NDS
.ARM

.include "common/commonoffsets.asm"
.include "common/commonfunctions.asm"
.include "common/forcerankpower.asm"

.include "main_arm9.asm"
.include "main_arm7.asm"
.include "main_overlay_0.asm"
.include "main_newfile.asm"
.include "main_other.asm"

.include "main_fat.asm"
.include "main_fnt.asm"
.include "main_header.asm"

;Blank Line
