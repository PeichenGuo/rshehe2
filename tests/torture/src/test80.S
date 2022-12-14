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
	addi x18, x0, -1038
	mul x28, x24, x9
	mul x23, x18, x18
	remuw x29, x30, x30
	addi x13, x0, 1
	la x3, test_memory+253
	la x12, test_memory-370
	addi x2, x0, -716
	addi x11, x0, -458
	divu x4, x11, x11
	la x15, test_memory-1789
	sraw x14, x1, x17
	sll x13, x13, 63
	srlw x20, x30, x30
	addi x19, x0, 983
	addi x26, x0, 1501
	addi x30, x19, 930
	div x21, x2, x2
	addi x8, x0, -385
	bltu x0, x0, crash_forward
	addi x16, x0, -1331
	addi x9, x0, -1291
	addi x29, x0, -1627
	bltu x30, x19, crash_forward
	addi x27, x0, -52
	lw x22, -193(x3)
	sb x17, 428(x12)
	la x10, test_memory+1715
	srl x7, x21, x29
	addi x5, x0, -1
	sb x27, -1683(x10)
	sub x17, x26, x27
	addi x18, x0, 476
	lhu x1, 1823(x15)
	addi x28, x0, 277
	divu x6, x2, x9
	addi x21, x0, 1006
	addi x11, x0, -1943
	mulw x25, x8, x16
	xor x5, x5, x13
	addi x19, x0, 1375
	addi x27, x0, -903
	and x31, x3, x5
	mulhsu x4, x18, x11
	addi x6, x0, 1417
	srl x22, x31, x31
	mul x11, x18, x18
	sllw x14, x21, x19
	addi x12, x0, 1
	addi x20, x0, 1589
	mulh x19, x1, x1
	addi x4, x0, -1662
	addi x1, x0, -98
	addi x8, x6, 1799
	addi x2, x0, 0
	addi x17, x0, 699
	la x14, test_memory+1142
	addi x10, x0, 0
	addi x21, x0, -371
	sltu x23, x29, x28
	mul x18, x4, x1
	addi x7, x27, -1109
	sraw x11, x20, x21
	or x24, x16, x13
	la x19, test_memory+2217
	addi x26, x0, -885
	lbu x22, -664(x14)
	la x4, test_memory-619
	addi x28, x0, 977
	la x2, test_memory+437
	sltiu x31, x14, -866
	mulhu x25, x26, x26
	addi x21, x0, 460
	lhu x23, -365(x2)
	addi x24, x0, -185
	addi x30, x0, -1482
	addi x11, x0, 1664
	sub x29, x28, x24
	sd x20, 1387(x4)
	addi x5, x0, 1303
	sd x0, -1745(x19)
	or x6, x14, x14
	sraw x8, x10, x10
	addi x27, x0, 128
	sll x12, x12, 63
	srl x23, x2, x5
	addi x2, x0, 1
	mulhu x16, x17, x30
	la x10, test_memory-973
	la x14, test_memory-1447
	addi x22, x15, -1414
	addi x7, x0, 659
	rem x20, x5, x27
	mulhu x29, x9, x4
	addi x4, x0, -975
	mulhu x23, x31, x31
	addi x13, x2, 0
	mulhu x18, x21, x11
	addi x1, x13, 0
	slli x26, x11, 28
	divw x6, x4, x4
	addi x31, x7, 547
	addi x27, x0, 1
	addiw x19, x23, -931
	mulh x6, x2, x2
	bge x7, x31, crash_forward
	sll x27, x27, 63
	addi x22, x0, 565
	addi x11, x0, -144
	lwu x8, 1763(x14)
	xor x29, x22, x22
	addi x21, x0, 1657
	addi x9, x0, -1
	addi x23, x0, 1562
	divuw x30, x23, x23
	addi x4, x11, -310
	addi x16, x0, -1
	sd x28, 1509(x10)
	xor x9, x9, x12
	beq x11, x4, crash_forward
	xor x16, x16, x27
	addi x14, x0, -414
	divw x20, x8, x8
	and x5, x5, x16
	divu x30, x18, x18
	sltu x20, x17, x17
	addi x31, x3, -1072
	sll x2, x2, 63
	srlw x26, x18, x18
	addi x19, x0, -683
	addi x28, x0, -1
	addi x29, x0, 1115
	addi x13, x0, 511
	addi x31, x0, 1
	addi x23, x0, 199
	addi x22, x23, 2003
	xor x6, x17, x17
	sll x31, x31, 63
	and x3, x22, x9
	or x15, x3, x12
	slti x30, x6, 721
	addw x1, x19, x13
	addi x4, x0, -1
	beq x3, x15, crash_forward
	or x17, x5, x27
	srlw x10, x14, x29
	xor x28, x28, x2
	xor x4, x4, x31
	addi x12, x0, -9
	and x11, x16, x4
	divuw x15, x24, x7
	addi x6, x0, 0
	addi x9, x0, -1780
	sltu x27, x12, x12
	la x20, test_memory+2422
	and x25, x25, x28
	or x24, x7, x2
	addi x7, x0, 1622
	lw x14, -1650(x20)
	bgeu x25, x24, crash_backward
	addi x19, x0, 1374
	addi x22, x0, 0
	srl x8, x7, x7
	addi x24, x0, 763
	srl x30, x9, x9
	addi x3, x0, 1215
	bltu x6, x22, crash_backward
	addi x14, x0, 1
	addi x5, x0, 0
	addi x30, x0, -127
	addi x13, x0, -602
	addi x17, x0, 2018
	sltu x23, x19, x19
	div x18, x21, x21
	or x9, x31, x31
	sltu x10, x13, x13
	slt x2, x24, x3
	or x26, x4, x31
	la x13, test_memory-625
	lhu x10, 981(x13)
	bge x26, x11, crash_forward
	divuw x21, x7, x29
	addi x25, x0, -1542
	addi x16, x0, 0
	srlw x12, x18, x18
	addi x6, x0, -522
	sll x14, x14, 63
	addi x27, x0, -1
	addi x22, x0, -1400
	mulh x23, x2, x11
	addi x4, x0, 1539
	bltu x5, x16, crash_forward
	xor x27, x27, x14
	and x8, x30, x30
	addi x24, x0, 1
	remw x7, x6, x22
	addi x31, x0, -1829
	sub x1, x14, x17
	mulhu x21, x31, x31
	la x19, test_memory-28
	la x18, test_memory-249
	addi x26, x0, 1070
	sll x24, x24, 63
	addi x16, x0, 0
	slt x29, x10, x10
	addi x12, x0, -1
	la x22, test_memory+1985
	lbu x6, -1495(x22)
	ld x13, 1028(x19)
	or x10, x4, x26
	and x20, x17, x27
	xor x12, x12, x24
	addi x8, x0, -315
	mul x28, x17, x25
	or x15, x20, x14
	and x11, x26, x12
	sub x26, x3, x2
	addi x4, x0, -71
	addi x31, x0, 1622
	addi x13, x4, -1217
	addi x21, x0, 0
	divw x5, x8, x8
	addi x23, x0, -769
	addi x10, x0, -1539
	srlw x6, x18, x18
	bgeu x13, x4, crash_backward
	subw x2, x23, x23
	srai x7, x16, 4
	srlw x22, x10, x10
	addw x20, x1, x1
	la x5, test_memory+1272
	la x4, test_memory+2454
	addi x2, x0, -1696
	lw x9, 593(x18)
	la x29, test_memory+42
	slli x26, x15, 57
	addi x10, x0, 1362
	mulhu x8, x18, x18
	mulhu x13, x21, x10
	lbu x28, 214(x29)
	or x3, x9, x24
	ld x22, -616(x5)
	mulhu x23, x2, x10
	addi x30, x0, -149
	sltu x27, x2, x3
	addi x15, x0, 0
	addi x10, x0, 1780
	addi x2, x0, 1138
	addi x13, x0, -499
	sub x9, x31, x31
	mulhsu x12, x26, x7
	srlw x1, x31, x30
	addi x24, x13, -86
	addi x8, x10, 1549
	addi x25, x0, -1184
	bltu x13, x24, crash_forward
	slti x11, x10, 1684
	addi x26, x0, -1492
	addi x19, x0, 50
	mulhu x21, x17, x7
	addi x28, x0, -1070
	addi x18, x0, 1771
	remuw x20, x28, x18
	bgeu x10, x8, crash_forward
	sw x27, -1798(x4)
	addi x14, x0, -1736
	addi x9, x0, -1315
	addi x29, x0, 0
	slt x6, x14, x14
	remw x17, x25, x19
	addi x1, x0, -1361
	addi x23, x0, -957
	sllw x27, x26, x26
	divu x25, x18, x18
	blt x15, x29, crash_backward
	xor x3, x2, x23
	addi x14, x0, -584
	sllw x16, x19, x19
	addi x17, x0, 612
	addi x8, x0, 801
	divu x6, x17, x17
	addi x11, x0, 1055
	mulhsu x7, x6, x6
	xor x15, x7, x7
	addi x23, x0, -1029
	srlw x12, x11, x11
	mulhu x16, x23, x23
	and x22, x8, x8
	addi x5, x0, 1074
	srlw x6, x28, x16
	mulhsu x19, x14, x5
	addi x7, x0, 1872
	la x28, test_memory+267
	addi x31, x0, 1826
	sltu x30, x9, x1
	addi x17, x0, -992
	addi x27, x0, 3
	bne x30, x30, crash_forward
	addi x13, x0, 82
	addi x5, x0, 1054
	divu x29, x27, x27
	div x24, x31, x13
	addi x18, x0, 207
	addi x22, x5, 848
	remu x1, x17, x13
	mulw x20, x18, x18
	addi x14, x0, 1
	sll x14, x14, 63
	addi x8, x0, 0
	slliw x9, x3, 22
	lwu x4, 693(x28)
	or x11, x23, x23
	beq x5, x22, crash_backward
	addi x19, x0, -1
	addi x21, x0, -1812
	xor x19, x19, x14
	mulw x3, x7, x17
	slli x2, x0, 16
	sraw x6, x16, x22
	addi x16, x8, 0
	addi x20, x0, -1498
	and x25, x28, x19
	addi x11, x0, 1731
	addi x15, x14, 115
	rem x4, x20, x11
	addi x7, x0, -730
	sraw x9, x28, x24
	addi x20, x0, 982
	addi x17, x0, 338
	addi x13, x0, -2004
	or x12, x12, x14
	divuw x28, x19, x19
	addi x15, x20, 798
	remuw x23, x1, x1
	blt x15, x20, crash_backward
	addi x27, x0, 1750
	remw x24, x1, x1
	divu x11, x27, x4
	srl x30, x17, x17
	addi x10, x21, -788
	ori x26, x4, 292
	sub x2, x13, x13
	bltu x27, x27, crash_backward
	addi x9, x0, 1274
	add x22, x17, x17
	srliw x12, x2, 4
	addi x11, x9, 541
	addi x8, x0, 1704
	slti x26, x9, 292
	addi x10, x0, 911
	addi x2, x0, -120
	srai x13, x20, 19
	sub x23, x10, x2
	addi x25, x0, 1981
	la x15, test_memory+596
	addi x26, x0, 1463
	rem x23, x22, x30
	la x29, test_memory+768
	xori x13, x9, -37
	div x5, x7, x27
	addi x10, x0, -732
	xor x2, x10, x10
	addi x6, x0, 399
	addw x20, x8, x8
	addi x11, x0, 0
	mulh x12, x26, x26
	sllw x24, x25, x25
	addi x14, x0, -998
	addi x22, x0, -1374
	slt x17, x22, x22
	srli x30, x13, 10
	addi x28, x0, -580
	remuw x10, x14, x0
	addi x27, x11, 0
	addi x3, x0, -511
	addi x4, x0, -2045
	addi x10, x0, -1731
	addi x24, x0, 1037
	sb x3, 33(x15)
	add x12, x10, x24
	addi x9, x0, -446
	addi x25, x0, -892
	addi x19, x0, 943
	addi x30, x0, 1830
	sllw x18, x6, x3
	la x31, test_memory-1387
	addi x2, x9, -1110
	sll x17, x19, x13
	la x5, test_memory-10
	add x26, x25, x30
	sra x21, x14, x19
	remu x22, x22, x19
	sra x16, x28, x4
	addi x20, x0, -629
	sh x11, 412(x5)
	addi x21, x0, 1071
	addi x7, x0, 1252
	sb x24, 1767(x31)
	addi x23, x0, 815
	remw x24, x21, x21
	sltu x8, x20, x23
	ld x1, -392(x29)
	addi x30, x0, -863
	xor x13, x7, x7
	addi x16, x0, -857
	add x25, x30, x16
	mul x2, x0, x4
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
	sd x6, 48(x1)
	sd x7, 56(x1)
	sd x8, 64(x1)
	sd x9, 72(x1)
	sd x10, 80(x1)
	sd x11, 88(x1)
	sd x12, 96(x1)
	sd x13, 104(x1)
	sd x14, 112(x1)
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
	sd x30, 240(x1)

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
reg_x0_init:	.dword 0xffffffff80000007
reg_x1_init:	.dword 0xffffffffffffffff
reg_x2_init:	.dword 0xffffffffffff8006
reg_x3_init:	.dword 0x0800000000000000
reg_x4_init:	.dword 0x0800000000000006
reg_x5_init:	.dword 0x2dfd4401496bd3b3
reg_x6_init:	.dword 0x816091155f658ee2
reg_x7_init:	.dword 0xdb31b56b7a3a70c4
reg_x8_init:	.dword 0x0800000000000009
reg_x9_init:	.dword 0xad6e24f544835182
reg_x10_init:	.dword 0x0000000000000000
reg_x11_init:	.dword 0xb37d4c8d5366da5a
reg_x12_init:	.dword 0x0000000000000000
reg_x13_init:	.dword 0xc055584e3fd989d6
reg_x14_init:	.dword 0xffffffff80000007
reg_x15_init:	.dword 0x0000000000000008
reg_x16_init:	.dword 0xffffffffffffffff
reg_x17_init:	.dword 0x11f74ccb0cf8ead6
reg_x18_init:	.dword 0x6bf82595665b3a07
reg_x19_init:	.dword 0xb055932ee39ad14a
reg_x20_init:	.dword 0xf73d66f10801a69d
reg_x21_init:	.dword 0x0000000000000000
reg_x22_init:	.dword 0xcb0862c588f5a47e
reg_x23_init:	.dword 0x0000000000000000
reg_x24_init:	.dword 0xd07a18ebdc5016bf
reg_x25_init:	.dword 0xffffffffffffff82
reg_x26_init:	.dword 0x0000000000000007
reg_x27_init:	.dword 0xffffffffffff8007
reg_x28_init:	.dword 0xb64abe7d32c9a8f2
reg_x29_init:	.dword 0xffffffffffff8003
reg_x30_init:	.dword 0xffffffff80000006
reg_x31_init:	.dword 0x19b1750f27af72a2

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x641fb85d43d02704
reg_x1_output:	.dword 0x3a54ab728229b33f
reg_x2_output:	.dword 0x0482284a8f9c18b9
reg_x3_output:	.dword 0x4667ba3ba7c40e02
reg_x4_output:	.dword 0xd308b8d357e1fc23
reg_x5_output:	.dword 0x67c0a91d656cb752
reg_x6_output:	.dword 0x50b85d9b7cd26e8b
reg_x7_output:	.dword 0x8c5b6695eeb29419
reg_x8_output:	.dword 0x32f26ddc2acff195
reg_x9_output:	.dword 0x2f74643c589ea3f1
reg_x10_output:	.dword 0x53e4c4332634f07d
reg_x11_output:	.dword 0x5843eca933a0d20d
reg_x12_output:	.dword 0x4a3b87b3d31e55a4
reg_x13_output:	.dword 0x3b4464b388fe7058
reg_x14_output:	.dword 0x50fdf244f60b744b
reg_x15_output:	.dword 0x62feebe0950ac0de
reg_x16_output:	.dword 0xbd40a8281fec4a9d
reg_x17_output:	.dword 0xd51d101b3914316b
reg_x18_output:	.dword 0xd6ed74d95a435ff2
reg_x19_output:	.dword 0xa93588a011772d71
reg_x20_output:	.dword 0x5d898118f690c351
reg_x21_output:	.dword 0x93b52c3bf7f1aa2e
reg_x22_output:	.dword 0x7ee0564a238fee37
reg_x23_output:	.dword 0x0fa496b97e60d10e
reg_x24_output:	.dword 0x4d0b42fce32a8f96
reg_x25_output:	.dword 0xd91e31953cc46c4d
reg_x26_output:	.dword 0x68b1f4c9399e8320
reg_x27_output:	.dword 0x074f93f52cf9f9e0
reg_x28_output:	.dword 0x44da5b5d817578c4
reg_x29_output:	.dword 0x331c6dd9695b8895
reg_x30_output:	.dword 0x206b28d90cd11078
reg_x31_output:	.dword 0x16287290878cc378

// Memory Blocks
	.align 8
test_memory:
	.dword 0x1fe58357fb766e39, 0x0070f6702882cf79
	.dword 0x3d0fbbd10a308a4f, 0x6ff633bdc879df4b
	.dword 0x83941e1f3bd0c1d5, 0x397f6af21755a18e
	.dword 0x16342e5d7a896b78, 0xba8452204a17ed2f
	.dword 0x2161e77699d6747f, 0xddf987afaaeb500f
	.dword 0x6315cefca1e44a0a, 0xaf64fc4fd4f563e2
	.dword 0x95d1f239b5a5929e, 0x547a882b4dff0d59
	.dword 0x732f2084a8cc7be0, 0x8cd01f59c03f0983
	.dword 0x5a52f6d5f2e4a0a0, 0xfc3c599ac4756d70
	.dword 0xf582909bd516cb19, 0x2e69413fae4cfc17
	.dword 0x98eef1cb80f01776, 0x4c509d68fce17679
	.dword 0xf1157e3cdc1a3a98, 0x35f62b752d984a05
	.dword 0xf1e01232278af116, 0x1f077bb49a6b413e
	.dword 0xa6559037a48cda85, 0xe35065618c9b1a9b
	.dword 0x6c64f8321f6444f8, 0x336e45d0abba29ad
	.dword 0x8e625bb1a276acca, 0x1a1b7ee3bd5d6687
	.dword 0xdd6e43891603f49a, 0x820fe8c335c48f59
	.dword 0x92755aa113ec9996, 0x9b0a2acc3bb0405e
	.dword 0x07ff72091cf067fc, 0xbd612fc773a725f8
	.dword 0xe2e23250c98573de, 0xa5bc295d8759ad18
	.dword 0x9c5d0e16ac1f5a25, 0x3982d6caeee5d5e3
	.dword 0x8a6949e0d1bb0dd7, 0x0f7f02d1e9b30c92
	.dword 0x04622d2d1003b59c, 0x82436cf1ddb82c99
	.dword 0xf7d6b0c752a95d7d, 0x5a7b91d6ec7c120b
	.dword 0x9c973e5893ca80ef, 0x198b071187435d3c
	.dword 0x3d27554819ddb110, 0x801a5e0b1de44ca7
	.dword 0x92e428bd7898db2f, 0x339ac234c7e3d112
	.dword 0xb0ae8b00ee27f392, 0xf0a8c6847c0d3fef
	.dword 0x24f7ba0d52dd0872, 0xc9ca161c31e84805
	.dword 0xf1f5e1617ba0014a, 0xc188fc4a28870c4f
	.dword 0x61be6513b7048e50, 0x07abf7b6b1608924
	.dword 0x11514a2bc6510c43, 0x2276ccd9d289a797
	.dword 0xe282502f37296067, 0xe9c5cbae0be1a320
	.dword 0xbe618ff96c3d10cd, 0xf9ab3ca49ceca57b
	.dword 0x298eb3cf93881cd8, 0xe04228db0f61bcd0
	.dword 0xeeff1cb4a3aa59fb, 0xf5e8f18e231f9013
	.dword 0x757088fba7d158c7, 0x6b496acdc58d75ad
	.dword 0x6547101eceed1624, 0x7cbb6d6fa6a4d05b
	.dword 0xe12e87ce0fa7fcde, 0xf1ea14478b38d656
	.dword 0xd8c4a648b31efb63, 0x9a7318965cd126b4
	.dword 0x9b1275f1b4deb1ca, 0x87bb01c07dcdd10d
	.dword 0x4bf0ee1cdb76fc17, 0x80a81c414ad1b361
	.dword 0xd4ddc52a7a465cbd, 0xf0a16be14ada5239
	.dword 0x4482cfd677330b63, 0x2f4e0d261c3a8f0b
	.dword 0xd18381ccfe1fabeb, 0xf564ba0a101fe0e2
	.dword 0x324963830c45f1af, 0x9ba265ece69ff33e
	.dword 0x1dc19142ff81b30d, 0x06fa24cba4c6cf38
	.dword 0x4d8a9786ad3b3125, 0x077fd1b2dafbf2ea
	.dword 0x9233408a4a4797e1, 0x41b228705696fb0d
	.dword 0x9b20271afd02fa35, 0x42e046897be2c2e2
	.dword 0x36b722b42d574ea7, 0x1cb1c76ee0581e56
	.dword 0x91cce0cb2f983011, 0x4097eff20dc79260
	.dword 0x80423f67675366a5, 0x75619cf720bbafad
	.dword 0x11843cf562b27d32, 0xbe92e9689cd3f37f
	.dword 0xab7a915b2609e6a5, 0x31bcbf6ce37252d2
	.dword 0xfa9e444d1df677d1, 0xc11fc8d92213d3c0
	.dword 0x27b2d4e02d323972, 0x67a972e5e04ed926
	.dword 0xb831c65b8655d66f, 0x4810f92307f80486
	.dword 0x1f21a655794c2a5f, 0xd2c5ababee98d22e
	.dword 0x7e0edffbd491b44d, 0xf3bee49b8c71539a
	.dword 0x2a6df0b1bbb1f1bf, 0x655160bf4cf0ac16
	.dword 0xd013d1ddeb10e5f5, 0x4734ef8c452633a7
	.dword 0x26eaabfedd2f516e, 0xec20ae50c867642b
	.dword 0x25d627047b7c5daf, 0xd41342af5884f4bf

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
