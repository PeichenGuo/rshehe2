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
	la x14, test_memory+1288
	sb x7, -424(x14)
	addi x5, x0, 1
	ori x28, x2, 1240
	la x22, test_memory-32
	slliw x26, x13, 0
	la x24, test_memory-144
	addi x23, x0, 1774
	lw x11, 400(x24)
	addi x13, x0, 1
	addw x1, x0, x0
	remu x3, x23, x23
	sllw x27, x7, x7
	addi x15, x0, 1861
	sraiw x11, x2, 26
	addi x30, x0, 1371
	mulhu x21, x15, x15
	lb x7, 276(x22)
	mulw x8, x6, x6
	addi x16, x0, -1285
	addi x14, x0, 0
	sll x13, x13, 63
	remu x28, x28, x28
	addi x29, x0, 1249
	addw x19, x17, x4
	remuw x10, x4, x24
	addi x26, x0, 0
	addi x12, x0, -75
	sllw x6, x30, x16
	sll x5, x5, 63
	mulh x9, x8, x8
	sllw x2, x29, x12
	addi x7, x0, 1
	addi x21, x0, 1
	bne x14, x26, crash_backward
	or x22, x7, x7
	divuw x8, x28, x28
	sll x21, x21, 63
	la x27, test_memory+38
	addi x25, x0, -1
	addi x14, x0, -268
	srliw x12, x1, 7
	mulhu x1, x9, x9
	addi x28, x0, -1
	sll x7, x7, 63
	addi x8, x0, -1144
	divw x3, x20, x20
	addw x22, x14, x8
	la x16, test_memory+1488
	addi x6, x0, 0
	addi x15, x0, 0
	addi x4, x0, -1
	xor x4, x4, x5
	addi x8, x0, 409
	xor x28, x28, x21
	addi x26, x0, 620
	xor x25, x25, x13
	addi x11, x0, -1
	bne x6, x15, crash_backward
	lwu x10, 626(x27)
	and x19, x30, x28
	addi x29, x26, 1559
	xor x11, x11, x7
	mulw x3, x27, x17
	or x30, x19, x21
	sb x26, -823(x16)
	addi x9, x0, -1018
	and x18, x8, x4
	sll x2, x9, x9
	rem x1, x15, x19
	addi x6, x0, 1449
	beq x19, x30, crash_forward
	addi x22, x0, -72
	addi x12, x0, -629
	and x31, x18, x25
	remu x15, x6, x12
	la x19, test_memory-319
	addi x6, x0, 1071
	lh x9, 365(x19)
	addi x2, x0, 1329
	or x17, x0, x13
	addi x30, x0, -1433
	srlw x28, x30, x30
	rem x1, x18, x23
	and x23, x18, x11
	sraw x14, x8, x22
	or x24, x17, x7
	remw x29, x20, x14
	or x20, x15, x5
	addi x12, x0, 201
	add x27, x21, x6
	la x26, test_memory-1925
	mulw x15, x2, x12
	sw x7, 1933(x26)
	addi x12, x0, 1
	sllw x20, x9, x9
	sll x12, x12, 63
	addi x14, x0, 1962
	addi x24, x0, 1
	addi x15, x0, 1782
	slliw x29, x18, 14
	addi x7, x0, 1805
	rem x23, x15, x7
	sll x24, x24, 63
	addi x13, x0, -1
	addi x21, x0, -1838
	remw x3, x6, x21
	mulh x17, x1, x1
	addi x4, x0, -1
	xor x4, x4, x24
	addi x31, x0, 1489
	addi x21, x0, -1496
	xor x13, x13, x12
	and x18, x4, x4
	add x10, x25, x25
	la x20, test_memory-1119
	la x6, test_memory+1404
	lbu x3, 1262(x20)
	and x2, x26, x13
	addi x17, x0, -1187
	addi x9, x0, 1
	divu x10, x9, x30
	sll x9, x9, 63
	srlw x15, x29, x11
	addi x19, x0, -1
	xor x19, x19, x9
	or x11, x8, x24
	la x23, test_memory+189
	sh x28, -1264(x6)
	la x20, test_memory+2257
	sltu x5, x14, x14
	xor x18, x29, x29
	lhu x29, 527(x23)
	addi x30, x0, 85
	addi x28, x0, 543
	addi x10, x0, -474
	divu x7, x21, x17
	and x16, x14, x19
	divuw x27, x14, x14
	or x25, x19, x12
	mulhsu x7, x6, x6
	rem x21, x1, x1
	addi x11, x0, -1992
	la x5, test_memory-1186
	addw x26, x31, x31
	lwu x15, -1425(x20)
	divuw x22, x14, x14
	or x8, x16, x9
	sh x18, 1488(x5)
	blt x2, x25, crash_backward
	remw x6, x10, x10
	addi x27, x0, 1
	sll x27, x27, 63
	ori x29, x7, 2036
	la x24, test_memory-1225
	or x1, x30, x28
	and x3, x11, x11
	addi x17, x0, -1
	lw x4, 1341(x24)
	xor x17, x17, x27
	and x23, x19, x17
	or x18, x23, x27
	blt x23, x18, crash_forward
	addi x2, x0, 1
	remu x12, x0, x0
	addi x19, x0, 1
	addi x1, x0, 1
	addi x15, x0, 604
	addi x22, x0, -940
	addi x5, x0, 0
	addi x6, x0, 774
	addi x31, x0, 912
	addi x26, x0, -1048
	la x16, test_memory+1847
	sll x2, x2, 63
	or x21, x1, x8
	addi x17, x0, 0
	la x24, test_memory+1505
	sll x11, x22, x26
	addi x27, x0, -1
	sraw x8, x6, x6
	sltu x3, x31, x31
	blt x0, x0, crash_backward
	addi x12, x15, 298
	sll x28, x19, x13
	bne x5, x17, crash_forward
	la x10, test_memory+289
	lb x29, -146(x10)
	lh x20, -505(x24)
	sll x1, x1, 63
	lhu x25, -1311(x16)
	addi x4, x0, -1
	xor x27, x27, x2
	sll x19, x19, 63
	div x26, x21, x21
	addi x31, x0, 491
	addi x10, x0, -450
	mulhu x25, x24, x24
	addi x28, x0, -1354
	addi x13, x0, -1
	xor x29, x10, x28
	addi x3, x0, 172
	addi x16, x0, 1999
	addi x11, x0, -65
	mul x17, x31, x31
	addi x22, x0, 1433
	addi x15, x0, 460
	sub x20, x22, x15
	and x5, x16, x16
	addi x24, x0, -1823
	and x30, x26, x27
	xor x4, x4, x1
	remuw x6, x11, x24
	xor x13, x13, x19
	and x9, x17, x4
	and x7, x11, x13
	addi x29, x1, 0
	addi x21, x0, 1016
	la x24, test_memory-237
	addi x28, x29, 0
	or x11, x22, x22
	sub x20, x8, x13
	addi x16, x27, 0
	or x14, x30, x19
	addi x25, x16, 0
	or x23, x30, x2
	or x18, x9, x1
	or x20, x22, x22
	addi x10, x0, 489
	addi x1, x0, 1
	addi x14, x0, 1421
	la x4, test_memory-1145
	addi x15, x0, 747
	remuw x8, x3, x21
	addi x26, x10, 1903
	addi x30, x0, -149
	addi x17, x0, 1842
	addiw x18, x27, 409
	lbu x19, 1196(x4)
	srlw x13, x14, x14
	slli x7, x14, 10
	subw x21, x22, x22
	addi x2, x0, -259
	remw x7, x13, x26
	addi x13, x0, 249
	mulhsu x27, x8, x8
	addi x12, x0, -1809
	bgeu x10, x26, crash_forward
	sll x1, x1, 63
	sh x14, 789(x24)
	la x22, test_memory+80
	rem x31, x15, x17
	addi x6, x0, -545
	divuw x7, x11, x11
	remw x25, x2, x2
	addi x4, x0, 415
	addi x19, x0, -1077
	addi x16, x0, -306
	addi x11, x0, -1
	addi x15, x0, 1393
	addi x27, x0, -1355
	xor x11, x11, x1
	addi x7, x2, 0
	addi x8, x0, 1294
	addi x14, x0, 1178
	divw x5, x12, x6
	and x9, x23, x11
	sw x8, 908(x22)
	addi x26, x0, 1
	addi x17, x7, 0
	srlw x23, x30, x30
	addi x5, x0, 1659
	slt x10, x13, x22
	addi x31, x0, 1021
	slt x25, x31, x31
	divw x3, x8, x14
	sll x21, x4, x19
	remu x18, x13, x16
	addi x12, x0, 908
	addi x31, x0, 561
	addi x22, x0, -439
	slt x6, x5, x12
	addi x16, x0, 1
	sub x30, x23, x28
	or x19, x31, x31
	remuw x10, x22, x22
	rem x13, x11, x1
	addi x18, x0, -871
	bne x0, x0, crash_backward
	sll x16, x16, 63
	sll x26, x26, 63
	or x20, x9, x1
	addi x4, x18, -1841
	slti x3, x25, -1204
	addi x24, x0, -1
	xor x24, x24, x26
	addi x8, x0, -1
	addi x14, x0, 472
	bltu x11, x11, crash_backward
	la x10, test_memory+2257
	and x29, x0, x24
	sll x19, x10, x10
	addi x3, x0, 1
	remuw x28, x15, x27
	lh x1, -1505(x10)
	addi x5, x0, 1908
	la x22, test_memory+1709
	la x20, test_memory+1673
	addi x13, x0, -176
	addi x19, x0, -116
	addi x27, x19, -1469
	addi x31, x13, -52
	lhu x7, -1547(x20)
	srl x25, x14, x14
	and x28, x11, x11
	addi x15, x0, -1800
	addi x1, x0, 1327
	sh x29, -889(x22)
	sll x3, x3, 63
	addi x9, x0, 0
	or x2, x25, x26
	addi x6, x0, -1
	bltu x2, x29, crash_forward
	addi x30, x0, 0
	xor x8, x8, x16
	xor x6, x6, x3
	divuw x10, x15, x1
	addw x17, x5, x5
	and x23, x27, x8
	or x21, x23, x16
	addi x26, x0, 1
	sll x26, x26, 63
	blt x9, x30, crash_forward
	and x11, x15, x6
	or x12, x11, x3
	addi x13, x0, -1
	xor x13, x13, x26
	and x14, x3, x13
	or x22, x26, x26
	la x5, test_memory+823
	sltiu x6, x2, 1812
	addi x3, x0, -1475
	divu x30, x25, x25
	ld x9, -679(x5)
	addi x29, x0, -524
	xor x9, x13, x24
	la x19, test_memory+2415
	divw x30, x25, x25
	addi x27, x31, 0
	addi x15, x0, -1631
	la x10, test_memory+1124
	mulw x1, x31, x31
	addi x17, x27, 0
	addi x28, x0, 588
	addi x6, x0, -1129
	srl x9, x6, x6
	remu x12, x3, x3
	sltu x5, x11, x21
	mulw x17, x2, x2
	addi x7, x15, -1681
	mulhsu x31, x16, x16
	add x2, x26, x26
	bne x0, x0, crash_backward
	addi x4, x0, 924
	lbu x25, -528(x10)
	addi x5, x0, 1
	sub x30, x22, x29
	srlw x1, x19, x1
	lb x24, -1613(x19)
	addi x9, x0, 1352
	beq x14, x22, crash_backward
	sltu x20, x29, x4
	addi x11, x0, 1308
	addi x19, x0, 925
	bltu x21, x23, crash_backward
	divu x24, x20, x20
	addi x6, x9, 1133
	sraw x18, x28, x11
	la x15, test_memory+1341
	sraiw x27, x1, 25
	divw x25, x20, x17
	addi x24, x0, 1328
	remw x23, x20, x20
	or x21, x21, x21
	la x4, test_memory+39
	addi x18, x0, -1815
	sll x7, x21, x21
	sll x5, x5, 63
	sd x3, 585(x4)
	addi x31, x0, 1345
	addi x9, x0, 1
	sll x7, x24, x24
	divw x25, x7, x7
	sltu x11, x18, x18
	sh x24, -641(x15)
	mulhu x2, x19, x31
	addi x10, x0, 926
	addi x14, x0, -861
	sll x9, x9, 63
	addi x16, x0, -1915
	addi x17, x0, -1
	addi x28, x0, -1
	addi x30, x0, 758
	mul x27, x24, x14
	sub x21, x9, x9
	rem x1, x10, x30
	la x8, test_memory+1758
	xor x28, x28, x9
	and x6, x16, x28
	la x22, test_memory-1051
	or x29, x14, x9
	xor x17, x17, x5
	lb x26, -975(x8)
	divw x20, x16, x16
	bge x29, x6, crash_forward
	lh x13, 1171(x22)
	la x11, test_memory+2047
	remuw x2, x28, x30
	addi x16, x0, 1
	addi x29, x0, 1
	sltu x25, x7, x23
	sll x29, x29, 63
	sll x16, x16, 63
	addi x4, x0, 1309
	and x3, x19, x17
	or x12, x3, x5
	sw x19, -1071(x11)
	addi x6, x0, -1
	addi x1, x0, -1
	srlw x21, x16, x23
	xor x6, x6, x29
	xor x1, x1, x16
	and x24, x9, x1
	and x26, x28, x6
	or x28, x26, x29
	addi x27, x0, 1009
	addi x8, x0, -1682
	addi x18, x0, 1269
	or x10, x24, x16
	addw x7, x27, x18
	beq x26, x28, crash_forward
	divu x23, x4, x8
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
	sd x12, 96(x1)
	sd x13, 104(x1)
	sd x14, 112(x1)
	sd x16, 128(x1)
	sd x17, 136(x1)
	sd x18, 144(x1)
	sd x19, 152(x1)
	sd x20, 160(x1)
	sd x21, 168(x1)
	sd x23, 184(x1)
	sd x24, 192(x1)
	sd x25, 200(x1)
	sd x26, 208(x1)
	sd x27, 216(x1)
	sd x28, 224(x1)
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
reg_x0_init:	.dword 0x0000000000000000
reg_x1_init:	.dword 0xe39e3c145eb67868
reg_x2_init:	.dword 0x8d05df0058a114b8
reg_x3_init:	.dword 0xc2ee2f64f37bcd18
reg_x4_init:	.dword 0xffffffffffff8000
reg_x5_init:	.dword 0x263f4da773a94da0
reg_x6_init:	.dword 0xffffffffffffff83
reg_x7_init:	.dword 0xffffffffffff8006
reg_x8_init:	.dword 0x0000000000000005
reg_x9_init:	.dword 0xffffffffffffffff
reg_x10_init:	.dword 0x0000000000000000
reg_x11_init:	.dword 0xf83b817bd2957574
reg_x12_init:	.dword 0xf61f0bb59e0a3197
reg_x13_init:	.dword 0xffffffffffff8001
reg_x14_init:	.dword 0x58139ec3bc6e1e48
reg_x15_init:	.dword 0xffffffff80000000
reg_x16_init:	.dword 0xb4e662d71157503d
reg_x17_init:	.dword 0xb5c9c48ebb5551b4
reg_x18_init:	.dword 0xffffffff80000006
reg_x19_init:	.dword 0x0000000000000000
reg_x20_init:	.dword 0xffffffffffffff87
reg_x21_init:	.dword 0x10fe4dcd43d5af18
reg_x22_init:	.dword 0x23cdf7692a370fa5
reg_x23_init:	.dword 0x0000000000000000
reg_x24_init:	.dword 0xffffffffffffffff
reg_x25_init:	.dword 0xffffffffffffffff
reg_x26_init:	.dword 0xffffffff80000005
reg_x27_init:	.dword 0xffffffffffffff87
reg_x28_init:	.dword 0x7b904751dfc6e16f
reg_x29_init:	.dword 0x0000000000000004
reg_x30_init:	.dword 0x0000000000000004
reg_x31_init:	.dword 0x9afc46de0aa39a44

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x21e8ae43eb2f4f41
reg_x1_output:	.dword 0xd3567e19ed11f1e5
reg_x2_output:	.dword 0xbd512ca44bf87da5
reg_x3_output:	.dword 0xb42238acd8c08d2e
reg_x4_output:	.dword 0x35da796fed8a6343
reg_x5_output:	.dword 0x20dbf410a339c875
reg_x6_output:	.dword 0x1e1515eb1025cf33
reg_x7_output:	.dword 0x124ec5e589e5094b
reg_x8_output:	.dword 0x86faaf2e77128521
reg_x9_output:	.dword 0xf43732000dc9c623
reg_x10_output:	.dword 0xbcb11b6f69e02b40
reg_x11_output:	.dword 0x78a1b349cbfca76c
reg_x12_output:	.dword 0x4f29678633f3a37e
reg_x13_output:	.dword 0x392e6ee6579525e1
reg_x14_output:	.dword 0x5963b8ac91f443f8
reg_x15_output:	.dword 0x123a75991b2e3a1f
reg_x16_output:	.dword 0x576906871defa2af
reg_x17_output:	.dword 0x391137660d09f177
reg_x18_output:	.dword 0xdc97f1637541e87c
reg_x19_output:	.dword 0x2b4f0d77fa18fc05
reg_x20_output:	.dword 0xa1f238c0a1bbdf41
reg_x21_output:	.dword 0xd4c7fe4406a48801
reg_x22_output:	.dword 0xf2ec9613d15f2f61
reg_x23_output:	.dword 0x28d41fee0069fe54
reg_x24_output:	.dword 0xbf1affc8e09c8071
reg_x25_output:	.dword 0x0e153cec52dd746e
reg_x26_output:	.dword 0x142f9886e186712f
reg_x27_output:	.dword 0xe6df9ee90440e756
reg_x28_output:	.dword 0x8e62ceb80a279ab2
reg_x29_output:	.dword 0x5eaa23ea968b9402
reg_x30_output:	.dword 0x39bf70482c5912e3
reg_x31_output:	.dword 0x048801b70afe00e8

// Memory Blocks
	.align 8
test_memory:
	.dword 0x4535b6ac9d5a222b, 0xcdf0db737ff48cd4
	.dword 0xe5048f25ca41206d, 0xfa420d8ce75396fc
	.dword 0x7538a3465b68ad36, 0x30ae53dc76059451
	.dword 0xbaf4e5b2eb7bb733, 0xb5ff2e038bb4a617
	.dword 0x7430a72ad9f606e3, 0x7fdda61ca26e85b7
	.dword 0xe5d377c87c16408c, 0xde8e5d96217ad9d3
	.dword 0xf7d75883ed999172, 0xbe670456d299489b
	.dword 0xa29e00fd83687c46, 0xce019e24e65ddb5e
	.dword 0xf02e3d7c98df78dd, 0x77943a4b70b78764
	.dword 0xdbdaa93543d55b21, 0xc91a0174ab15effa
	.dword 0xab2348c8c72cb54c, 0x7a64bdde0360b5cd
	.dword 0x77b7c9112edca952, 0xf7fc41ac8f43e77b
	.dword 0x1498661bde30dd9e, 0x18234f9c377a6767
	.dword 0x0bafbe7878c78901, 0x2aafe9db3ff85acc
	.dword 0x762016b01bcfc9e7, 0xd6df2b337564f614
	.dword 0xfc22d1157679bccb, 0x822b0e6c8f743a6a
	.dword 0x72011dc0c9ad05ec, 0x3aaac7f367a6788d
	.dword 0xaa9926d7f731c240, 0xacec95b7b5fcace7
	.dword 0x15533d108ac313a9, 0x02c22954a68e08de
	.dword 0x399ec8747b41bc66, 0x84671073ecdc3d69
	.dword 0xc54701656ab07dcb, 0xf9fabf70f1895ae5
	.dword 0x996bb5df800b2e34, 0x7ebe223d5deb5a28
	.dword 0x7bea9f04e1a4ba37, 0x441ed785fc26a2d6
	.dword 0x04ca0ad718c78518, 0x96987a13933a22f3
	.dword 0x40fdde3fb316dc81, 0xe4169c75d9fccbb9
	.dword 0xd1ec3357b2e77372, 0x01085adcabb587ac
	.dword 0x0ba717e668b01876, 0x1100a74681f3fdeb
	.dword 0x7f25302634131b17, 0x47ccb3de9ae1b6c7
	.dword 0x421b41cc2e141492, 0xd29c1fa2b6a87599
	.dword 0x2fb4eb47971507ce, 0x246cc946a303dbcf
	.dword 0xdc8b0b4bfd710c8a, 0x47a66c57dee1a948
	.dword 0x611a9c89cc39f9d6, 0xc6f06ca50a552de2
	.dword 0xc8e709c26001c3c4, 0xeb0e73d9fe57c050
	.dword 0x7d9f3dfae8ef805e, 0x0936c56bc5194e30
	.dword 0x8d4cf50f80eb47da, 0x271f6cbc0c41595c
	.dword 0x150a106da1ab640c, 0x6e2da9766fb1f67f
	.dword 0x4f2ff419f420831b, 0x88053e3b5a63a0eb
	.dword 0xf0b12ff8a065e177, 0xb26b857f7d09f7aa
	.dword 0x558df94b5e359f0a, 0xe94c70b29c9eb7d2
	.dword 0xec5838778930b3ad, 0x21edd5a4eef1881d
	.dword 0xd4c42f0f1d4d36dd, 0x0c3fae27663069b8
	.dword 0x798efa0b65b4eeae, 0xdcfe2def4745e25b
	.dword 0x52d474572e8959ff, 0x1f44d2bc9f273399
	.dword 0xf7823d92bfa1a9ee, 0xb47fd2c1a1fe3379
	.dword 0x3b2de917ceaa5e8e, 0xe09b8d3f89bf9a44
	.dword 0x95709938e9557ad7, 0x4c27e16d1177d9a0
	.dword 0x494a8acbbfc583de, 0x311f8f9d6ca5d0dd
	.dword 0x4a3554e7d34cbf45, 0xbf62089f679bf28e
	.dword 0x49b3e0eeb13d64f4, 0x1df04f65dc55af5b
	.dword 0x879b5ece541eb808, 0x1be3d0ea8fb83a15
	.dword 0x5140b98302663b0b, 0xa2205651eb12f90b
	.dword 0xb46a4fdef8137365, 0xa330754b7e25389b
	.dword 0xf29df58cfb7ff013, 0xa3ce22bb3c33f30b
	.dword 0x245f8052449c8796, 0xea8f4b998413c199
	.dword 0x2a746594a3f0012d, 0xfa48981e14b84ad0
	.dword 0x39852c21db3a9d45, 0x9f36bd18871bc21d
	.dword 0xb2bdb6298fe53130, 0x9d20ff9e08664ca1
	.dword 0x9699a78e0e99ca15, 0xeaadceeb35665f47
	.dword 0x2e1a6c5c5acf0b27, 0x764c9881cfe86a19
	.dword 0xce78a3994beebb19, 0x31a63a97d08d64cf
	.dword 0x243af240075334d1, 0xb3b7b8b329a510a9
	.dword 0xc8b8828a31deaf5b, 0x2dd1168d928a037e
	.dword 0x18adb37028aa9120, 0xdeec7d3f644ad013
	.dword 0x27edbc6d4d7c4257, 0x31700e9b014cdfb0

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
