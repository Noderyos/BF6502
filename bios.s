.setcpu "65C02"
.segment "BIOS"
.debuginfo

ACIA_DATA	= $5000
ACIA_STATUS	= $5001
ACIA_CMD	= $5002
ACIA_CTRL	= $5003

ACIA_INIT:
	LDA     #$1F           ; 8-N-1, 19200 baud.
    STA     ACIA_CTRL
    LDA     #$0B           ; No parity, no echo, no interrupts.
    STA     ACIA_CMD
	RTS

CHRIN:
	LDA ACIA_STATUS
	AND #$08
	BEQ CHRIN
	LDA ACIA_DATA
	RTS

CHROUT:
	PHY
	STA ACIA_DATA
	LDY #$FF
@txdelay:
	DEY
	BNE @txdelay
	PLY
	RTS