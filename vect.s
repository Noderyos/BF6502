.setcpu "65C02"
.segment "VECTORS"
.import _init

	.word $0000
	.word _init
	.word $0000