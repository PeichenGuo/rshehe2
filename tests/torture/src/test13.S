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
	div x12, x4, x26
	bne x0, x0, crash_forward
	addi x10, x0, 1063
	mulw x27, x15, x3
	addi x14, x0, -1364
	srlw x8, x12, x2
	addi x12, x14, -276
	addi x2, x0, 0
	remw x29, x14, x14
	addi x30, x0, 290
	sltu x19, x14, x18
	divu x13, x15, x10
	addi x27, x0, -149
	la x4, test_memory+1132
	addi x1, x0, 1
	addi x21, x0, 0
	add x3, x28, x28
	mulh x3, x30, x30
	sll x1, x1, 63
	sh x13, -1010(x4)
	or x19, x17, x30
	la x8, test_memory+1050
	addi x18, x0, 625
	addi x15, x0, -1
	addi x9, x0, 1846
	rem x13, x6, x6
	addi x23, x0, -968
	slt x28, x9, x9
	bgeu x12, x14, crash_backward
	addi x25, x0, -1514
	srlw x29, x27, x27
	sw x14, -142(x8)
	blt x2, x21, crash_backward
	slt x17, x18, x25
	addi x6, x0, -601
	addi x24, x0, -1145
	remu x7, x10, x6
	la x22, test_memory-1303
	xor x15, x15, x1
	and x5, x7, x15
	or x31, x5, x1
	addi x29, x0, 2026
	addi x14, x0, -297
	addi x2, x0, 911
	divuw x26, x24, x24
	addi x12, x0, 830
	mulh x4, x14, x14
	addi x17, x0, -1249
	la x20, test_memory-186
	xor x9, x12, x17
	addi x27, x0, -810
	addi x10, x0, 1759
	sub x21, x2, x2
	mulhu x11, x30, x23
	la x24, test_memory+284
	mulw x7, x29, x10
	addi x28, x0, -491
	addi x6, x0, -1042
	remu x19, x28, x28
	addi x17, x18, 0
	addi x19, x0, 1962
	addi x7, x0, -1536
	addi x26, x28, 0
	addi x12, x0, 1656
	and x8, x2, x6
	subw x8, x24, x24
	addi x3, x0, -353
	la x21, test_memory+189
	divuw x11, x19, x19
	mulhu x28, x6, x31
	sw x26, 914(x20)
	mul x25, x25, x25
	sb x12, -160(x24)
	add x4, x12, x12
	addi x29, x0, -1010
	la x5, test_memory-446
	sw x2, 331(x21)
	lhu x8, 1440(x5)
	addi x1, x0, 1
	addi x30, x26, 0
	lb x16, 2038(x22)
	slt x13, x27, x3
	remuw x18, x26, x12
	sll x1, x1, 63
	remuw x9, x17, x6
	mulhsu x6, x3, x3
	remuw x19, x16, x16
	addi x14, x17, 0
	bltu x17, x14, crash_backward
	mulw x23, x7, x29
	mulw x11, x26, x13
	xor x10, x6, x6
	addi x15, x0, -1
	addi x21, x0, -685
	addi x12, x0, -166
	la x4, test_memory+218
	addi x16, x0, 1
	xor x15, x15, x1
	addi x13, x0, 1
	lb x6, -125(x4)
	addi x22, x12, -641
	and x31, x31, x15
	sll x16, x16, 63
	divw x8, x21, x21
	la x9, test_memory+2711
	or x2, x31, x1
	sll x13, x13, 63
	sllw x5, x14, x14
	beq x31, x2, crash_backward
	addi x20, x0, -1
	xori x24, x2, 470
	xor x20, x20, x16
	and x28, x3, x20
	or x25, x28, x16
	blt x28, x25, crash_forward
	sd x18, -1743(x9)
	addi x18, x0, -1
	xor x18, x18, x13
	and x27, x19, x18
	or x3, x0, x13
	bge x3, x27, crash_backward
	la x6, test_memory+452
	sll x19, x23, x28
	lbu x30, 276(x6)
	addi x8, x0, -1648
	addi x22, x0, -1989
	divuw x29, x29, x6
	addw x11, x10, x20
	addi x21, x0, 246
	addi x2, x0, 1464
	mulhu x15, x28, x31
	addi x31, x0, 1910
	addi x26, x0, -1485
	addi x12, x0, 733
	addi x10, x0, 1835
	addi x5, x0, -1249
	or x14, x8, x2
	sraw x25, x22, x5
	ori x17, x5, 1326
	xori x28, x29, -201
	la x11, test_memory-1232
	sra x1, x31, x12
	div x23, x26, x26
	lhu x19, 1516(x11)
	addi x24, x0, -976
	la x18, test_memory+390
	remuw x20, x10, x24
	addi x27, x0, -280
	rem x2, x15, x15
	sra x15, x27, x27
	addi x5, x0, 1
	sh x27, 616(x18)
	sll x5, x5, 63
	xori x7, x0, -2006
	addi x6, x0, -49
	addi x12, x0, -1
	addi x30, x0, -1199
	subw x9, x21, x21
	addi x26, x0, 1
	sll x26, x26, 63
	addi x28, x0, 182
	addi x11, x0, 519
	addi x8, x0, 297
	addi x4, x0, -1247
	addi x13, x0, -1622
	xor x12, x12, x5
	addi x22, x0, 1644
	divw x24, x11, x8
	remuw x17, x6, x6
	sra x16, x4, x4
	addi x20, x0, -165
	divu x14, x13, x13
	addi x19, x0, -1
	addi x24, x0, 1436
	srlw x13, x17, x17
	la x11, test_memory-244
	slti x23, x8, -2001
	addi x7, x24, 340
	addi x14, x0, 1522
	addi x1, x0, 29
	addi x21, x0, 638
	and x3, x6, x12
	slliw x18, x1, 4
	addi x27, x0, 759
	xor x19, x19, x26
	addi x6, x21, 522
	addi x17, x0, 1
	mulw x2, x20, x1
	mulh x29, x28, x22
	and x25, x12, x19
	or x10, x17, x5
	mulw x16, x5, x21
	lui x2, 130983
	ld x9, 828(x11)
	addw x15, x30, x27
	addiw x8, x5, -1597
	or x31, x13, x26
	mulhu x27, x13, x1
	addi x4, x14, 1358
	addi x7, x0, 1670
	sll x17, x17, 63
	la x9, test_memory-1003
	srai x30, x6, 36
	srlw x20, x3, x3
	lui x29, 6739
	addi x11, x7, 438
	addi x6, x0, -1184
	blt x4, x14, crash_forward
	lb x24, 1579(x9)
	sub x8, x31, x6
	addi x3, x0, -19
	xor x15, x8, x23
	rem x30, x6, x3
	slli x5, x11, 28
	rem x1, x16, x16
	or x12, x1, x1
	addi x15, x0, 106
	addi x29, x0, -420
	la x28, test_memory+272
	xor x4, x21, x23
	addi x12, x0, -603
	rem x11, x24, x24
	addi x7, x0, 0
	addi x27, x0, -1500
	addi x14, x0, 0
	mulh x2, x15, x15
	addi x21, x0, 1694
	sb x16, 194(x28)
	mulhsu x20, x29, x21
	bne x7, x14, crash_forward
	addi x8, x0, 1832
	addi x3, x0, -577
	addi x9, x12, -118
	addi x10, x27, -942
	la x22, test_memory+2659
	sll x24, x8, x8
	addi x2, x0, -625
	lbu x16, -1874(x22)
	beq x27, x10, crash_backward
	addi x4, x0, -958
	add x1, x3, x3
	sllw x11, x2, x4
	sra x6, x16, x5
	addi x18, x0, -1
	divw x5, x15, x15
	remw x30, x12, x12
	xor x18, x18, x17
	and x13, x0, x18
	or x23, x13, x17
	bgeu x13, x23, crash_backward
	addi x13, x0, 1
	la x22, test_memory+2357
	addi x7, x0, 302
	addi x31, x0, -38
	div x28, x3, x24
	addi x16, x0, -1203
	addi x24, x0, 1880
	lui x17, 10141
	xor x14, x16, x24
	addi x4, x0, 1900
	sb x27, -1350(x22)
	addi x1, x0, 530
	addi x5, x0, 1
	xor x8, x21, x13
	addi x17, x0, -1402
	addi x28, x17, -1816
	slt x26, x31, x1
	srl x22, x5, x5
	addi x14, x0, -1493
	addi x10, x0, -1363
	addi x19, x0, -292
	beq x17, x28, crash_backward
	addi x15, x0, 167
	mulhu x12, x19, x15
	sra x16, x7, x8
	sll x13, x13, 63
	sll x5, x5, 63
	addi x2, x0, -1
	xor x2, x2, x5
	and x29, x30, x2
	addi x27, x0, -1736
	remuw x24, x14, x14
	divu x3, x7, x10
	addi x6, x0, -1003
	or x20, x29, x5
	bltu x20, x29, crash_backward
	mulhu x9, x9, x7
	addi x18, x0, -1
	sll x7, x7, x7
	xor x18, x18, x13
	la x19, test_memory-1120
	mulhsu x28, x2, x27
	addi x23, x0, 750
	and x21, x0, x18
	addi x9, x0, 1463
	addi x31, x0, -275
	addi x15, x0, 1518
	addi x1, x0, 2025
	la x26, test_memory+2557
	lwu x29, 2024(x19)
	addi x3, x0, 396
	addi x22, x0, 356
	addi x8, x0, -1711
	slliw x29, x21, 20
	xor x25, x4, x6
	la x4, test_memory-1055
	sra x11, x27, x23
	lw x6, 1895(x4)
	sub x20, x3, x22
	addi x28, x0, 566
	sra x16, x1, x1
	and x10, x15, x8
	addi x14, x0, 1309
	srl x19, x16, x26
	sub x7, x28, x28
	la x12, test_memory-1102
	rem x5, x9, x31
	addi x17, x0, -135
	lhu x2, -1807(x26)
	sb x15, 1846(x12)
	addi x20, x0, 860
	addi x23, x0, 1266
	la x22, test_memory+1138
	and x1, x11, x26
	addi x27, x0, -1666
	sub x28, x20, x20
	lhu x31, -132(x22)
	divu x10, x5, x5
	rem x5, x22, x28
	addi x16, x0, -1259
	or x30, x21, x13
	addw x26, x23, x23
	srlw x2, x1, x27
	srl x29, x27, x27
	addi x8, x0, 1
	sll x8, x8, 63
	addi x3, x0, 880
	sllw x9, x16, x3
	addi x25, x0, 1192
	addi x19, x0, 29
	sraw x11, x25, x25
	addi x18, x0, 1024
	addi x12, x0, -1
	addi x22, x0, 1313
	addi x27, x0, -35
	addi x30, x0, 1330
	addi x16, x25, 0
	or x10, x28, x17
	addi x25, x0, 1994
	sltu x24, x14, x17
	div x1, x21, x21
	mulhu x6, x22, x25
	addi x21, x0, 1101
	addi x29, x16, 0
	bltu x16, x29, crash_backward
	addi x15, x19, 353
	mulh x28, x27, x30
	xor x12, x12, x8
	and x7, x5, x12
	slti x13, x6, 2042
	la x23, test_memory-1050
	mulw x31, x1, x1
	div x26, x18, x21
	addi x2, x0, 1
	addi x14, x0, 1136
	la x29, test_memory-930
	addi x19, x0, 847
	addi x6, x0, -1277
	addi x17, x0, -380
	addi x28, x0, 1116
	rem x22, x17, x17
	sll x2, x2, 63
	sh x27, 1764(x23)
	addi x11, x0, -1
	add x13, x28, x28
	or x4, x7, x8
	xor x31, x23, x23
	div x26, x6, x6
	addi x17, x0, 0
	addi x13, x0, 1998
	addi x26, x13, 2000
	addi x22, x0, 1496
	addi x15, x0, 1
	addi x23, x0, 0
	bltu x17, x23, crash_forward
	sll x15, x15, 63
	addi x6, x0, -99
	slt x18, x0, x0
	and x31, x6, x6
	addi x27, x0, -1
	addi x21, x0, -162
	ld x25, 986(x29)
	addi x6, x0, -55
	addi x25, x0, 0
	rem x12, x11, x20
	div x18, x3, x3
	addi x29, x0, 0
	xor x27, x27, x15
	rem x30, x14, x19
	sll x28, x22, x21
	mulh x7, x3, x3
	and x16, x9, x27
	remu x17, x6, x6
	la x25, test_memory+2114
	addi x31, x0, -1377
	addi x8, x0, 947
	addi x9, x0, 1
	addi x17, x0, 235
	bltu x26, x13, crash_backward
	sra x23, x31, x8
	la x21, test_memory+214
	sb x27, -1764(x25)
	addi x22, x0, 118
	xor x11, x11, x2
	mulh x6, x17, x22
	la x28, test_memory-1208
	sll x9, x9, 63
	addi x10, x0, -1
	and x20, x2, x11
	or x3, x17, x2
	beq x20, x3, crash_forward
	addi x30, x0, 1076
	xor x10, x10, x9
	and x24, x7, x10
	sh x14, 1946(x28)
	or x1, x31, x15
	addi x12, x0, -1676
	or x5, x22, x9
	div x29, x22, x22
	addi x19, x0, 1253
	lh x4, 526(x21)
	sll x18, x30, x12
	beq x24, x5, crash_forward
	addi x7, x0, 218
	mulhu x14, x19, x7
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
	sd x11, 88(x1)
	sd x12, 96(x1)
	sd x13, 104(x1)
	sd x14, 112(x1)
	sd x15, 120(x1)
	sd x16, 128(x1)
	sd x17, 136(x1)
	sd x18, 144(x1)
	sd x19, 152(x1)
	sd x20, 160(x1)
	sd x22, 176(x1)
	sd x23, 184(x1)
	sd x24, 192(x1)
	sd x26, 208(x1)
	sd x27, 216(x1)
	sd x29, 232(x1)
	sd x30, 240(x1)
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
reg_x0_init:	.dword 0xf60aa67b78cd8f65
reg_x1_init:	.dword 0x8decd5ca5b71e77b
reg_x2_init:	.dword 0xac859d0faeeeda2f
reg_x3_init:	.dword 0x23b2d4c14888e861
reg_x4_init:	.dword 0x18dd06d021f153f5
reg_x5_init:	.dword 0xffffffffffffffff
reg_x6_init:	.dword 0x4d5fba018381cce4
reg_x7_init:	.dword 0xae99aeee59235e99
reg_x8_init:	.dword 0x0000000000000000
reg_x9_init:	.dword 0xf75d4ba0bf1070b0
reg_x10_init:	.dword 0xffffffffffffff84
reg_x11_init:	.dword 0xffffffff80000008
reg_x12_init:	.dword 0x8ca5cb1fc11ff03a
reg_x13_init:	.dword 0x0000000000000002
reg_x14_init:	.dword 0x0000000000000000
reg_x15_init:	.dword 0x0000000000000000
reg_x16_init:	.dword 0xc15643efb33a7ac8
reg_x17_init:	.dword 0x404a67cd5bd3356f
reg_x18_init:	.dword 0x16cfdd3d5464ca21
reg_x19_init:	.dword 0xffffffffffff8005
reg_x20_init:	.dword 0xffffffff80000003
reg_x21_init:	.dword 0x92d69de66ab473ff
reg_x22_init:	.dword 0xcc45925a3fc8cd5b
reg_x23_init:	.dword 0xffffffffffff8002
reg_x24_init:	.dword 0xffffffffffff8006
reg_x25_init:	.dword 0xffffffffffff8002
reg_x26_init:	.dword 0xffffffffffffffff
reg_x27_init:	.dword 0xb53e7c88228ec177
reg_x28_init:	.dword 0x492456cf91a92e99
reg_x29_init:	.dword 0x640f70ae7f17564c
reg_x30_init:	.dword 0x94fbd0734436ae54
reg_x31_init:	.dword 0x0000000000000002

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0xafa64fd6a02df400
reg_x1_output:	.dword 0xbec9f1c21bdea557
reg_x2_output:	.dword 0x387398f79d50caea
reg_x3_output:	.dword 0x0573f167c6eb7588
reg_x4_output:	.dword 0x2a86830916708429
reg_x5_output:	.dword 0xc1c2d3adbb67868d
reg_x6_output:	.dword 0xc5a1cec5ee2aecf8
reg_x7_output:	.dword 0x336e76afdde9d127
reg_x8_output:	.dword 0xdb783ccb435924f9
reg_x9_output:	.dword 0x2b1578704cae2d5c
reg_x10_output:	.dword 0x6e18226b9804747d
reg_x11_output:	.dword 0x17ad89c413dfdc56
reg_x12_output:	.dword 0x41baf7c1b2dbc303
reg_x13_output:	.dword 0x47b17c917ee84c8b
reg_x14_output:	.dword 0x48b73305e9ab71ff
reg_x15_output:	.dword 0xf16581392ba37c1d
reg_x16_output:	.dword 0x4d64052143319fdb
reg_x17_output:	.dword 0x8e1d4751268d9d82
reg_x18_output:	.dword 0xf2a3cb82dbc51742
reg_x19_output:	.dword 0x3af6f5974213e267
reg_x20_output:	.dword 0x39c34b3342e56e9b
reg_x21_output:	.dword 0x91392d22b96c90d1
reg_x22_output:	.dword 0xb0a90925f42f1bd3
reg_x23_output:	.dword 0xa0b18bda8ef8c685
reg_x24_output:	.dword 0x4f3153d57496805f
reg_x25_output:	.dword 0xfa54622c29748eaa
reg_x26_output:	.dword 0xc348d20919793181
reg_x27_output:	.dword 0x90358ff590602dac
reg_x28_output:	.dword 0x7220aaf7b24500c9
reg_x29_output:	.dword 0x54fdbcc68957c762
reg_x30_output:	.dword 0x16f49b949b6888de
reg_x31_output:	.dword 0x277e5f4b5bbcc372

// Memory Blocks
	.align 8
test_memory:
	.dword 0x868c8d239239427e, 0x9a3a4803686693f4
	.dword 0x6f28810ba1b765c2, 0x61dfa3353646c255
	.dword 0xb81ee5efdfd81ba6, 0xb40ba6235d46667d
	.dword 0x8862a9ff6682c3c8, 0x207f5b7e84616c34
	.dword 0xa8a79e8af2f65270, 0xa570431cc9664ac1
	.dword 0x723100d81e180ad0, 0x1316b8e9960712d4
	.dword 0x5fbf3c35f07d198c, 0x9e47571c7952f6a5
	.dword 0x8fcf39523214d37b, 0x9503c7a9d47db05c
	.dword 0x97aecec7c7719caf, 0x05c2b8ff684c6ab3
	.dword 0x430f26fa820abbb2, 0x49f5e9e95bd60fd9
	.dword 0xacf72f294db19d12, 0x715080d697bf2299
	.dword 0x428563b8b0194b20, 0xa4bf224318f785bb
	.dword 0x07118dd737f71df4, 0x91267a6b9d82d5aa
	.dword 0x013446421c2fe7b3, 0x8a142e491b3a3856
	.dword 0x4a435163c8f52113, 0x56d967b94600c75b
	.dword 0x5b2f28a214e9da1f, 0xf04570fde6d1f862
	.dword 0x039f44f4fb9f7337, 0xfdaa136c69a3a7c7
	.dword 0xefeffeb8f136625b, 0xb43aad5d3b8ba97c
	.dword 0xc98e16c49cef88a8, 0x27723366df33042c
	.dword 0x30593cbb3a3edc21, 0xdb3b90d0f19f3aa3
	.dword 0xfc7826a041b869b2, 0xf45b1b4246fc476c
	.dword 0x2b9e0dadc93cf372, 0x204f0dba44982ebb
	.dword 0x6c6aa468455baf28, 0xd6c83ec644eb4a8d
	.dword 0x938ad9eec132e910, 0xfb3b85ef2296b50d
	.dword 0x29d1fe9406718edf, 0xe81f8472a1f47539
	.dword 0x45e81dac98b7e703, 0x4671c536dc6b51c5
	.dword 0xb0a3a0ac66b5f82e, 0xae5967fab7726e3f
	.dword 0xe5f18f6cfc4a6515, 0x486ccbcee14f1673
	.dword 0x6e9101ce2bccc074, 0x9582ecc579595c10
	.dword 0xb61b96842dda9d56, 0x2c5068e7073a6a8b
	.dword 0x5e1e032c3eaedf92, 0xdb9b606b6e61b543
	.dword 0xefa1119faa7f1098, 0xe4d0a5253f1c63e5
	.dword 0x11b49e8befd2bc6d, 0x5077ed3be78ca111
	.dword 0x4a936d404b851af3, 0x0babfd207a74af3d
	.dword 0x130fe4c65661896e, 0x1696fcbad2a3e7d9
	.dword 0x46670a36cc4f9843, 0x8f426be5f61208b4
	.dword 0xec984c49990bb101, 0x850d6a1d9597739d
	.dword 0x0835f42c9ab598a5, 0xe713457613f7444d
	.dword 0x8b8b4f976f4e5219, 0x65f784cf7ada6084
	.dword 0x5132e81e1bd324fe, 0x172be1476ca8e671
	.dword 0xeb085bc5723bccaa, 0x1017e2ef59219d56
	.dword 0x2506aad91b7e1374, 0x01d114bfc6654c6c
	.dword 0x215d0efbe4195e2e, 0x458e03ce4b261c03
	.dword 0x3511af80f0d0ebf2, 0x65ed7dbd2f0964ed
	.dword 0xfa2ac6fb6e63ce21, 0x54cec2747e4c921c
	.dword 0x0acc0e0ffe7ddca9, 0x700e9d108ba3f88a
	.dword 0x413f7f91f60d2a85, 0xb448981c5954c958
	.dword 0x38bdc9ce99dbbe89, 0xf2fac0fd8ef9823a
	.dword 0xc33c01280e05945f, 0x345daeb37e728011
	.dword 0x8ec967e00fdf29cc, 0x3429bfbe2e7a97d9
	.dword 0xd2615f35c0611c38, 0xee9dc35d7671d9c5
	.dword 0x6bc2d5b473719a6c, 0xb7aa81fe5b6ee2a7
	.dword 0xcf1fc6c95eacae9c, 0x4c69d8f124c95f95
	.dword 0xcb8c9f951cd8a4a8, 0x9e3f5d5dfc56a7c9
	.dword 0xcd409d03ca44109e, 0xda6bba787ebb90c9
	.dword 0x9e35771e461f3983, 0xf7bb3ef1e0c4e0c7
	.dword 0xefc5ed9c2dbaec53, 0x218b4db161ea0349
	.dword 0x49d009bcfcb2fb45, 0xe2e9a5c3b033e40c
	.dword 0x7ed9295a70aaed52, 0x694bb58fd0fc1425
	.dword 0xf5ff2737b4a7a1f8, 0x738b6d4ea2969d6a
	.dword 0x0c63349cc778ed3b, 0x1aba44bb4f3b280f
	.dword 0x6570382526526fec, 0x1e32680527a85693
	.dword 0x3527c5d4a0e3302d, 0x7659400b8e467bdc
	.dword 0xaebe046fc32fb633, 0xd905c9ca803d0fa1

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
