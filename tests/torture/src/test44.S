// random assembly code generated by RISC-V torture test generator
// nseqs = 200
// memsize = 1024

#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

	j test_start

crash_backward:
	RVTEST_FAIL

test_start:

xreg_init:
	la x31, xreg_init_data
	ld x0, 0(x31)
	ld x1, 8(x31)
	ld x2, 16(x31)
	ld x3, 24(x31)
	ld x4, 32(x31)
	ld x5, 40(x31)
	ld x6, 48(x31)
	ld x7, 56(x31)
	ld x8, 64(x31)
	ld x9, 72(x31)
	ld x10, 80(x31)
	ld x11, 88(x31)
	ld x12, 96(x31)
	ld x13, 104(x31)
	ld x14, 112(x31)
	ld x15, 120(x31)
	ld x16, 128(x31)
	ld x17, 136(x31)
	ld x18, 144(x31)
	ld x19, 152(x31)
	ld x20, 160(x31)
	ld x21, 168(x31)
	ld x22, 176(x31)
	ld x23, 184(x31)
	ld x24, 192(x31)
	ld x25, 200(x31)
	ld x26, 208(x31)
	ld x27, 216(x31)
	ld x28, 224(x31)
	ld x29, 232(x31)
	ld x30, 240(x31)
	ld x31, 248(x31)

	j pseg_0

pseg_0:
	sll x30, x25, x1
	la x6, test_memory-1114
	or x2, x23, x6
	ld x3, 1698(x6)
	addi x19, x0, 1
	sll x4, x19, x14
	la x27, test_memory+1778
	bne x0, x0, crash_backward
	addi x28, x0, 1
	divw x3, x6, x6
	addi x2, x0, 0
	mulw x18, x0, x0
	srlw x1, x25, x18
	sra x31, x28, x28
	sllw x11, x8, x26
	remuw x30, x0, x19
	sllw x21, x10, x3
	srlw x3, x5, x5
	addi x30, x0, 440
	addi x12, x0, -1451
	remuw x22, x18, x18
	addi x17, x0, -300
	or x21, x8, x19
	addi x7, x0, 1303
	srl x18, x30, x30
	addi x6, x0, 0
	bltu x2, x6, crash_forward
	divw x26, x12, x7
	lh x20, -1520(x27)
	la x13, test_memory-394
	addw x23, x30, x20
	sb x25, 483(x13)
	sll x28, x28, 63
	addi x14, x0, -1
	sll x19, x19, 63
	addi x25, x0, -1
	addi x1, x0, 134
	remw x24, x17, x17
	addi x29, x0, 1816
	addi x11, x0, -880
	addi x8, x0, -393
	xor x14, x14, x28
	slt x4, x1, x11
	and x5, x27, x14
	xor x25, x25, x19
	and x16, x16, x25
	remuw x9, x29, x8
	or x10, x5, x28
	or x15, x16, x19
	addi x20, x0, 1348
	srai x25, x8, 10
	addi x15, x16, 0
	sraiw x17, x31, 1
	addi x26, x0, -2001
	remu x12, x27, x27
	sltu x5, x0, x0
	addi x31, x0, -625
	addi x11, x15, 0
	addi x1, x0, -1899
	bne x15, x11, crash_forward
	addi x27, x0, 2003
	la x3, test_memory+2231
	addi x2, x0, -1237
	addi x16, x0, -182
	srlw x4, x31, x1
	addi x28, x0, -1654
	addi x9, x0, -402
	sltu x30, x26, x14
	divuw x13, x27, x16
	srliw x22, x10, 10
	la x7, test_memory+284
	addi x10, x0, 1165
	xor x29, x17, x15
	addi x6, x0, -1079
	sll x18, x20, x26
	ld x8, -2039(x3)
	div x25, x28, x28
	srliw x27, x3, 3
	addi x31, x0, -632
	addi x4, x0, 1084
	sra x30, x14, x14
	sraw x5, x30, x30
	addi x12, x0, 568
	addi x1, x9, 0
	mul x25, x12, x12
	slt x16, x27, x5
	mulw x18, x31, x31
	addi x5, x0, -1725
	remw x23, x2, x9
	la x24, test_memory+266
	addi x27, x5, -215
	addi x13, x0, -154
	divu x21, x10, x6
	bgeu x27, x5, crash_backward
	addi x8, x0, 1997
	addi x22, x0, 951
	addi x20, x0, 1737
	mulh x17, x4, x4
	divw x26, x8, x20
	addi x3, x0, 1386
	sltu x17, x7, x27
	subw x15, x22, x3
	lhu x19, -218(x24)
	la x16, test_memory-960
	la x30, test_memory+1635
	addi x4, x0, 170
	div x26, x0, x21
	addi x22, x0, 1
	la x20, test_memory-397
	ld x17, 885(x20)
	addi x29, x1, 0
	addi x10, x0, -170
	add x15, x28, x0
	addi x6, x0, 0
	addi x23, x0, -1548
	addi x5, x0, 125
	addi x11, x0, -294
	sll x22, x22, 63
	addi x24, x0, -1
	xor x24, x24, x22
	addi x31, x0, -1245
	lhu x14, 156(x7)
	sd x5, -1027(x30)
	la x2, test_memory+1725
	addi x18, x0, 0
	lbu x21, 1045(x16)
	srlw x7, x17, x21
	addi x9, x31, -2002
	sw x11, -1641(x2)
	mul x28, x13, x11
	addi x26, x0, 1455
	and x8, x15, x24
	or x19, x17, x22
	beq x31, x9, crash_backward
	rem x12, x3, x3
	remuw x7, x10, x15
	addi x29, x0, -207
	addi x13, x0, -1239
	mulhu x25, x23, x5
	addi x25, x0, -2016
	addi x3, x26, 667
	addi x24, x0, -1085
	addi x28, x0, 1001
	mul x8, x3, x29
	mulw x9, x29, x28
	addi x22, x0, 1649
	addi x21, x0, -11
	and x7, x0, x0
	sra x19, x24, x22
	divuw x23, x25, x25
	xor x27, x4, x10
	addi x12, x0, -40
	addi x31, x0, -143
	srlw x18, x21, x21
	addi x6, x0, -1785
	addi x17, x0, -1656
	addi x20, x0, 1846
	divu x1, x17, x20
	sraw x5, x12, x12
	subw x2, x31, x6
	addi x15, x0, 1706
	addi x16, x0, -1222
	xor x11, x13, x16
	addi x14, x0, -723
	mulhu x30, x15, x14
	slliw x7, x17, 29
	srl x20, x0, x2
	sub x18, x28, x12
	la x17, test_memory+803
	sb x0, -226(x17)
	sraiw x1, x19, 1
	addi x24, x0, 464
	addi x20, x0, -226
	rem x30, x0, x0
	addi x12, x0, -394
	addi x7, x20, -1104
	or x31, x16, x20
	remw x9, x24, x24
	slt x6, x28, x28
	divu x23, x28, x19
	addi x14, x0, 1
	addi x29, x24, 1041
	sll x14, x14, 63
	addi x13, x0, -1
	bgeu x7, x20, crash_forward
	and x25, x3, x6
	addi x8, x0, -2036
	addi x11, x0, -493
	addi x16, x0, -625
	xor x13, x13, x14
	addi x26, x0, 751
	addi x21, x0, -1549
	addi x10, x0, -545
	add x31, x5, x29
	divu x20, x19, x19
	addi x17, x0, 1713
	mulhsu x25, x17, x17
	mul x3, x11, x26
	addi x17, x0, 1
	rem x19, x12, x10
	bltu x29, x24, crash_forward
	mulhu x9, x24, x24
	addi x29, x0, -1805
	la x24, test_memory+2261
	sll x17, x17, 63
	addi x22, x8, -44
	slt x4, x16, x21
	addi x25, x0, -1
	remuw x19, x14, x14
	la x9, test_memory+513
	addi x7, x0, 1853
	addi x15, x0, -8
	la x1, test_memory+1888
	mulhu x31, x31, x10
	xor x25, x25, x17
	divu x23, x7, x7
	addi x18, x0, 917
	sll x10, x29, x29
	remuw x11, x0, x10
	sw x14, -1780(x1)
	sh x0, -35(x9)
	sub x30, x18, x18
	lhu x20, -1787(x24)
	addi x2, x0, 1636
	addi x12, x0, -1954
	and x26, x20, x25
	mulhsu x21, x4, x4
	sll x27, x15, x2
	add x7, x4, x4
	srai x18, x12, 17
	or x3, x27, x17
	slli x19, x11, 62
	addi x24, x20, 0
	addi x11, x0, 1691
	subw x9, x25, x31
	addi x2, x0, -721
	addi x8, x22, 0
	addi x27, x2, -1730
	and x28, x12, x13
	addi x4, x0, 1
	sll x4, x4, 63
	addi x26, x0, 0
	srl x25, x13, x13
	or x5, x22, x14
	addi x20, x0, -1
	addi x31, x12, -427
	addi x10, x0, 1236
	divu x6, x7, x12
	addi x30, x0, -1199
	xor x20, x20, x4
	bltu x12, x31, crash_backward
	addi x18, x0, 110
	addi x15, x0, -2032
	divuw x1, x11, x30
	beq x28, x5, crash_backward
	addi x27, x0, 1
	sraw x21, x10, x15
	and x16, x14, x20
	addi x19, x0, 0
	or x29, x16, x4
	addi x23, x8, 0
	sll x27, x27, 63
	addi x6, x0, 1201
	divuw x7, x18, x18
	addi x22, x24, 0
	addi x25, x0, -1
	xor x25, x25, x27
	blt x24, x22, crash_backward
	and x2, x21, x25
	addi x3, x0, 1016
	or x9, x1, x27
	add x17, x6, x3
	addi x22, x0, -1397
	addi x15, x0, -785
	addi x1, x0, -1387
	addi x5, x0, 2009
	mulhu x18, x30, x30
	slti x12, x1, -1678
	addi x29, x0, 1
	addi x23, x0, -1111
	slliw x31, x1, 8
	la x11, test_memory-730
	remu x26, x25, x25
	addi x6, x0, 133
	addi x3, x1, -867
	srl x31, x17, x22
	srl x13, x16, x16
	subw x17, x23, x23
	mulhu x27, x15, x4
	slt x18, x4, x4
	ld x28, 1170(x11)
	remu x14, x22, x5
	addi x25, x0, -1608
	sll x29, x29, 63
	divuw x2, x8, x5
	mulh x21, x27, x31
	remw x16, x30, x30
	addi x24, x0, -1
	addi x4, x25, -291
	addi x27, x0, -1121
	sll x5, x30, x30
	addi x2, x0, 1385
	sllw x10, x15, x6
	addi x11, x0, -299
	andi x31, x3, -2041
	xor x24, x24, x29
	addiw x23, x18, -998
	remuw x12, x19, x5
	addi x10, x0, 1452
	addi x7, x0, -1089
	srl x6, x10, x10
	addi x17, x0, 520
	and x9, x29, x24
	addi x3, x0, -1783
	mulhsu x30, x7, x5
	subw x16, x1, x1
	remu x31, x20, x8
	remw x13, x19, x19
	sub x18, x2, x2
	addi x15, x0, -372
	la x14, test_memory+429
	addi x13, x28, 0
	sll x28, x3, x3
	ld x22, 363(x14)
	bgeu x4, x25, crash_backward
	addi x2, x13, 0
	addi x6, x0, 749
	sll x30, x6, x6
	sltu x19, x7, x7
	sub x21, x11, x17
	sltu x8, x20, x31
	bltu x13, x2, crash_backward
	srl x1, x27, x27
	subw x17, x0, x0
	srl x23, x7, x7
	addi x21, x0, -681
	xor x28, x20, x20
	slti x26, x0, 1581
	addi x2, x0, 1
	addi x5, x0, -1406
	addi x11, x0, 1298
	divu x1, x11, x23
	addi x25, x0, -1454
	addi x17, x0, -650
	addi x28, x0, -1238
	addi x13, x0, -959
	mulh x4, x21, x13
	addw x23, x25, x17
	and x26, x28, x28
	sltiu x18, x23, -404
	addi x1, x0, -1760
	or x20, x9, x29
	sll x2, x2, 63
	andi x27, x19, 827
	addi x4, x1, -280
	addi x23, x0, 111
	addi x21, x25, 0
	blt x9, x20, crash_backward
	addi x8, x0, -1
	xor x9, x23, x10
	addi x28, x21, 0
	addi x24, x0, 1175
	xor x8, x8, x2
	remw x20, x24, x24
	la x12, test_memory+142
	and x6, x14, x8
	addi x3, x0, -1449
	la x10, test_memory+1763
	remu x17, x23, x23
	addi x26, x0, -1476
	remuw x31, x15, x5
	sh x6, -995(x10)
	lbu x16, 628(x12)
	or x7, x6, x2
	addi x30, x0, 730
	remu x19, x11, x30
	addi x13, x0, 475
	la x30, test_memory+1165
	sh x1, -395(x30)
	addi x16, x0, 283
	subw x18, x26, x26
	srl x20, x25, x3
	sraiw x28, x9, 4
	addi x9, x0, 476
	addi x22, x0, -766
	la x11, test_memory+789
	and x27, x16, x9
	addi x24, x0, 1
	sd x13, -165(x11)
	addi x23, x0, 1923
	sll x24, x24, 63
	subw x14, x3, x22
	addi x17, x0, -1
	addi x15, x0, -1594
	xor x17, x17, x24
	and x19, x12, x17
	or x29, x10, x24
	addw x25, x13, x13
	remw x10, x23, x15
	bgeu x19, x29, crash_forward
	j reg_dump

reg_dump:
	la x1, loop_count
	lw x2, 0(x1)
	addi x3, x2, -1
	sw x3, 0(x1)
	bnez x2, pseg_0
	la x1, xreg_output_data
	sd x0, 0(x1)
	sd x2, 16(x1)
	sd x3, 24(x1)
	sd x4, 32(x1)
	sd x5, 40(x1)
	sd x6, 48(x1)
	sd x7, 56(x1)
	sd x8, 64(x1)
	sd x9, 72(x1)
	sd x10, 80(x1)
	sd x13, 104(x1)
	sd x14, 112(x1)
	sd x15, 120(x1)
	sd x16, 128(x1)
	sd x17, 136(x1)
	sd x18, 144(x1)
	sd x19, 152(x1)
	sd x20, 160(x1)
	sd x21, 168(x1)
	sd x22, 176(x1)
	sd x23, 184(x1)
	sd x24, 192(x1)
	sd x25, 200(x1)
	sd x26, 208(x1)
	sd x27, 216(x1)
	sd x28, 224(x1)
	sd x29, 232(x1)
	sd x31, 248(x1)

	j test_end

crash_forward:
	RVTEST_FAIL

test_end:
	RVTEST_PASS

RVTEST_CODE_END


	.data

hidden_data:
	.align 8
xreg_init_data:
reg_x0_init:	.dword 0xffffffff80000001
reg_x1_init:	.dword 0xffffffffffffff80
reg_x2_init:	.dword 0x0000000000000005
reg_x3_init:	.dword 0x5f9c4f7c2eecbd04
reg_x4_init:	.dword 0xbc2eb280f2f1c87d
reg_x5_init:	.dword 0xffffffffffffffff
reg_x6_init:	.dword 0x997c2f218c18e1d6
reg_x7_init:	.dword 0x0000000000000004
reg_x8_init:	.dword 0xffffffffffffffff
reg_x9_init:	.dword 0xffffffffffffffff
reg_x10_init:	.dword 0xa8fc8a911ebd5b26
reg_x11_init:	.dword 0x3091834271212f05
reg_x12_init:	.dword 0x5f33fce852bb2c6c
reg_x13_init:	.dword 0xffffffffffffff82
reg_x14_init:	.dword 0x680fc58616a930d3
reg_x15_init:	.dword 0x0000000000000000
reg_x16_init:	.dword 0x0000000000000000
reg_x17_init:	.dword 0xf7235e7ef8c80d4d
reg_x18_init:	.dword 0x35ecd41622704f2e
reg_x19_init:	.dword 0x0000000000000004
reg_x20_init:	.dword 0xffffffffffffffff
reg_x21_init:	.dword 0x8a0bb81feef3cc2e
reg_x22_init:	.dword 0xdfbf6d71aa994e11
reg_x23_init:	.dword 0x0800000000000007
reg_x24_init:	.dword 0xffffffffffffffff
reg_x25_init:	.dword 0xffffffffffffffff
reg_x26_init:	.dword 0x0000000000000000
reg_x27_init:	.dword 0x0800000000000009
reg_x28_init:	.dword 0xeacab79456cf2179
reg_x29_init:	.dword 0xffffffffffffffff
reg_x30_init:	.dword 0xffffffffffffffff
reg_x31_init:	.dword 0xffffffffffffff83

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0xa0f2c336782731b9
reg_x1_output:	.dword 0x71dd5b1fbd49280d
reg_x2_output:	.dword 0xf9bbe88fc16f1331
reg_x3_output:	.dword 0x54d96d0ae9afa2c9
reg_x4_output:	.dword 0xe1b3de199638cfd1
reg_x5_output:	.dword 0xa0a2f8d508686d92
reg_x6_output:	.dword 0x1a347535b7c57f86
reg_x7_output:	.dword 0x098a3331f13b197a
reg_x8_output:	.dword 0x5029deefa9fbd1a8
reg_x9_output:	.dword 0xe3dd3e95469c78a6
reg_x10_output:	.dword 0xf2e833767af4f15b
reg_x11_output:	.dword 0xf44741bfc4e43356
reg_x12_output:	.dword 0xe98d7cc80948cc39
reg_x13_output:	.dword 0x3cf1d39ddfd82922
reg_x14_output:	.dword 0x836d38ab5d859f2d
reg_x15_output:	.dword 0x1830d05045b62285
reg_x16_output:	.dword 0x165d85e32b98eda1
reg_x17_output:	.dword 0xad6deb850a68969f
reg_x18_output:	.dword 0x168d709f94ae46db
reg_x19_output:	.dword 0x528a940e351b8936
reg_x20_output:	.dword 0x420f12381b6a7da4
reg_x21_output:	.dword 0x4043fcb16a32c4fd
reg_x22_output:	.dword 0xe5b77815a1b0362a
reg_x23_output:	.dword 0xbc8e5e3c33f2f619
reg_x24_output:	.dword 0xa4a185f19284ee27
reg_x25_output:	.dword 0x6f99c6dc814368e0
reg_x26_output:	.dword 0x56c04741ca7be341
reg_x27_output:	.dword 0x80840ab0dc0670e3
reg_x28_output:	.dword 0x08c063eec77e7bb3
reg_x29_output:	.dword 0xaae0a99a63e2bc2e
reg_x30_output:	.dword 0x5f3fac4b6c20152d
reg_x31_output:	.dword 0x2778be54173816cd

// Memory Blocks
	.align 8
test_memory:
	.dword 0x445cf0429d255df9, 0xbe324aca769e6292
	.dword 0xf81195cfffc59c5e, 0xf62f75a62ff5c716
	.dword 0x2ce9a2b296ae8849, 0x412b8d2598fb5dfc
	.dword 0x92c62d6141399b28, 0x6924e33636c5df7c
	.dword 0x0ba1693aadcbfa19, 0x00bfd6ba03c2131f
	.dword 0x320ac20104485e44, 0x40c09e2a40ff08c7
	.dword 0xf984ba87ea0c9f84, 0x8cbea7644e165df2
	.dword 0x1d5582aaec6ac54c, 0xd80da0bbb4fd133f
	.dword 0x15f6787f6327c1c8, 0xaf057f5780cdb630
	.dword 0x275e08ca68883b42, 0xb19416bb5064e330
	.dword 0x3e22a2b42a1607c7, 0x9798159ddbb563d8
	.dword 0x262cb2bf0acf3f09, 0x3f2e7c05d5496d6d
	.dword 0xc698d8f46f1a0687, 0xf618de91f4bac3ad
	.dword 0x8acace5d92e67beb, 0xeaf40b155343c3ca
	.dword 0xbbc4adbc1d1a61b2, 0x0e5be26425279bb6
	.dword 0xfddd9370c6f87211, 0x50927b6fd1d031a1
	.dword 0x592dc8bf0cef7c17, 0x130de395cd647fbf
	.dword 0x85b5ee33865baf0e, 0x67b11034b982684e
	.dword 0xbaa9d962e586b827, 0xb6a9d580d3f345d7
	.dword 0x019f19d756d99655, 0x1936f695b9e2bbb3
	.dword 0x45ea5943b7fd4878, 0xf036a2cfe8938ad0
	.dword 0xb5760b000bd5b9be, 0x5a8ef45912066eb5
	.dword 0xee101eb069149046, 0x6687440180c346c3
	.dword 0x37d3aa460cd7c205, 0x7342665612350fbd
	.dword 0x3e2ebf2a03a213ed, 0xd1f725ec370d7189
	.dword 0x5453deb72f39e74b, 0x82858efd652ce537
	.dword 0x0ae9c1e821dcf970, 0xe9dce03532d8b742
	.dword 0x5ac368520cfdf993, 0xb38f34cd2fd86a16
	.dword 0xc695a254b5ab18f5, 0x202d3bd882a83cd2
	.dword 0xe33e8a8e410af946, 0xd0d590de5e86da4e
	.dword 0xb686a28e9a4f9d47, 0x830889a6df00745f
	.dword 0x468a86d1f7553fb0, 0x0f8a8d5786f9cf59
	.dword 0xb3776de9841d3453, 0x992c48c3206201d5
	.dword 0xe933e6f9cdb33780, 0xfdf153f99ed9ecb3
	.dword 0xb2318b6b150dcfab, 0xf3831d23cf0caf62
	.dword 0xff3b97d91860a54c, 0x78672c9466649c5e
	.dword 0x0ce1a04d1761f506, 0x7b4d1616977c71fa
	.dword 0x9d5cd3b13b72800b, 0x6a39ab8ccf64db5f
	.dword 0x68c1828021a99ebe, 0x399a44ba1ad27dd4
	.dword 0xc435dcbbf0bd5999, 0xe8a4305cd8c9163f
	.dword 0x1f021b2531d8ac50, 0x7211a281869c6aeb
	.dword 0x90dd87a6fff05736, 0xe78eb4144f68158a
	.dword 0x431f19131f48e2e0, 0x703e47b49bab697e
	.dword 0xe5af961224e6ba07, 0x60e7e7d1a4c6fa53
	.dword 0xbc0673551dcb7db2, 0x53dcf1f14fed8690
	.dword 0xad59e1109e71f794, 0x48b4a34c94f24aaf
	.dword 0x68bdbba9ee2c4eb2, 0x7de3daa3037b0068
	.dword 0x517453ae261e6248, 0x112ea34da4bc0e35
	.dword 0xf46f4103c2c86eed, 0xfd3edd915549ab12
	.dword 0x1d2db563dfb461f5, 0xd38c983299f0fa85
	.dword 0xd1090209511a7f16, 0x7f79ef51003864dd
	.dword 0x0bd744a525783c4d, 0x6b4d846eef56afbe
	.dword 0xcad76f95035e7802, 0xd6d3e3cecd649adc
	.dword 0xf2592155f46a6d6a, 0xf3216b05ee850505
	.dword 0xcac5ff35bfaf0b2c, 0x1c7384ca94fbdd65
	.dword 0x09d9874e220a9047, 0x1bc94e1189ec6505
	.dword 0xa82f8daf443e9332, 0xd2b8f8597afb8494
	.dword 0xa120d8da735ed744, 0xc6887d40499b3a6a
	.dword 0x5e689175aa8d9456, 0x30e5775f119064c9
	.dword 0x2184793c234214a6, 0x260134529d946c65
	.dword 0x956d1d353dc0ccfd, 0xee935419cf089326
	.dword 0xa3627727643a5314, 0x6996899fb0c8eb2b
	.dword 0x305cb24c7278d633, 0x7ab8509951893a12
	.dword 0x05780744f059fe1b, 0xa0adac9168064c76

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
