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
	la x20, test_memory-845
	sraw x9, x16, x10
	addi x19, x0, 1528
	addi x27, x0, -1309
	addi x22, x0, -966
	addi x5, x0, 1555
	addi x6, x0, -955
	rem x14, x19, x19
	addi x28, x0, -1537
	remuw x17, x6, x6
	la x9, test_memory+1696
	sll x30, x30, x30
	addi x25, x0, -921
	lb x13, -926(x9)
	remw x16, x5, x5
	sraw x10, x27, x27
	blt x13, x13, crash_backward
	lw x1, 977(x20)
	addi x18, x0, -696
	la x21, test_memory+563
	addw x3, x18, x18
	addi x7, x0, -1207
	addi x19, x0, 422
	la x2, test_memory-722
	lb x4, -397(x21)
	sd x24, 882(x2)
	slt x3, x10, x10
	addi x16, x0, -1628
	xor x29, x28, x28
	sra x3, x3, x3
	bltu x8, x8, crash_backward
	addi x11, x0, 1
	remw x21, x16, x16
	addi x14, x0, -983
	addi x13, x0, 598
	sllw x8, x30, x14
	mulhsu x10, x29, x29
	addi x23, x25, -473
	sub x20, x9, x3
	sll x11, x11, 63
	bge x23, x25, crash_forward
	addi x18, x0, 1123
	addi x1, x0, 888
	mulhu x26, x22, x22
	subw x24, x7, x7
	addi x27, x0, 1586
	divu x9, x13, x1
	addi x5, x0, 1964
	addi x30, x19, 703
	addi x17, x0, 631
	addi x12, x0, -1
	addi x4, x27, 844
	addw x6, x14, x17
	bgeu x19, x30, crash_backward
	remu x2, x18, x5
	xor x12, x12, x11
	and x31, x19, x12
	or x15, x31, x11
	bltu x15, x31, crash_forward
	sltu x12, x17, x22
	subw x17, x22, x25
	xor x7, x18, x16
	addi x20, x0, 1
	sra x2, x3, x3
	slt x16, x8, x30
	add x13, x31, x31
	addi x25, x0, -1137
	addi x10, x0, 1
	addi x19, x25, -2020
	sll x5, x17, x26
	addi x4, x0, -1712
	addi x31, x0, 1
	sraw x9, x12, x12
	addi x17, x0, 1214
	addw x16, x17, x17
	addi x5, x0, 119
	sub x29, x4, x4
	srai x9, x15, 34
	sraw x19, x11, x11
	sll x20, x20, 63
	sll x10, x10, 63
	sll x31, x31, 63
	addi x3, x0, -1892
	addi x14, x0, 604
	addi x23, x0, -1178
	addi x27, x0, -1
	addi x12, x0, 1
	addi x17, x0, 0
	addi x15, x5, 984
	bgeu x5, x15, crash_forward
	addi x26, x0, -1
	addi x18, x0, -1180
	remw x11, x3, x14
	la x5, test_memory-1883
	xor x26, x26, x20
	and x6, x11, x26
	addi x4, x0, 520
	addi x16, x0, 0
	or x22, x6, x20
	sll x8, x23, x18
	sll x12, x12, 63
	addi x24, x0, -1
	xor x27, x27, x10
	and x1, x18, x27
	addi x29, x0, 1580
	addi x2, x0, -1
	la x19, test_memory-1358
	or x28, x1, x10
	blt x1, x28, crash_backward
	xor x24, x24, x31
	divuw x9, x4, x29
	mulw x7, x2, x6
	lbu x15, 1937(x5)
	xor x2, x2, x12
	bne x17, x16, crash_forward
	and x21, x1, x24
	or x30, x1, x31
	and x13, x14, x2
	sw x14, 1406(x19)
	or x25, x18, x12
	bgeu x13, x25, crash_backward
	addi x8, x0, 1
	sll x8, x8, 63
	addi x31, x18, -1990
	addi x9, x0, -1
	addi x28, x0, 261
	la x13, test_memory-269
	slt x26, x28, x28
	la x12, test_memory+389
	ori x1, x27, -667
	addi x15, x0, -2003
	addi x2, x0, 1570
	addi x10, x2, 395
	blt x27, x27, crash_backward
	slliw x22, x21, 0
	blt x10, x2, crash_backward
	addi x29, x0, 1
	lhu x24, 135(x12)
	sll x29, x29, 63
	addi x31, x0, 993
	addi x10, x0, 0
	la x28, test_memory+2468
	addi x21, x0, -1
	ld x23, 581(x13)
	addi x7, x0, 1150
	la x2, test_memory-499
	sub x25, x31, x31
	addi x1, x0, 0
	xor x21, x21, x29
	or x14, x7, x7
	mulhsu x5, x15, x15
	remw x4, x27, x30
	remw x11, x20, x20
	and x18, x25, x21
	ori x14, x3, 237
	subw x30, x23, x23
	mulw x12, x13, x13
	addi x7, x0, 0
	or x3, x17, x29
	addi x13, x0, 1694
	sw x18, 795(x2)
	addi x23, x0, 0
	bltu x3, x18, crash_forward
	la x16, test_memory+941
	blt x10, x1, crash_forward
	addi x11, x0, 1744
	addi x12, x0, 1
	xor x9, x9, x8
	addi x17, x0, 468
	mulh x22, x13, x13
	lb x26, -1998(x28)
	divu x1, x15, x15
	slt x4, x11, x11
	sll x12, x12, 63
	and x15, x12, x12
	addi x31, x0, -1490
	la x3, test_memory+1007
	add x6, x17, x17
	sh x29, -707(x16)
	add x27, x1, x1
	addi x24, x0, -35
	sb x23, -173(x3)
	divw x25, x31, x24
	addi x18, x0, 1
	and x19, x4, x9
	sll x2, x14, x14
	la x24, test_memory+300
	or x20, x19, x8
	sll x18, x18, 63
	lhu x7, 30(x24)
	bne x0, x0, crash_forward
	mulw x25, x10, x9
	addi x4, x0, 1583
	addi x15, x0, -1939
	addw x11, x4, x4
	addi x31, x0, 529
	mulw x16, x31, x31
	addi x7, x0, 212
	addi x27, x0, -1085
	addi x11, x0, 561
	addi x13, x0, -86
	addi x17, x0, 1
	add x25, x11, x13
	addi x10, x0, -1
	addi x14, x0, -1
	mulhsu x13, x30, x31
	add x25, x14, x7
	xor x10, x10, x18
	addw x11, x0, x0
	addi x16, x0, -1477
	addi x22, x0, 1751
	xor x14, x14, x12
	and x29, x19, x10
	srl x23, x27, x27
	addi x4, x0, 498
	mul x24, x22, x4
	sll x2, x7, x7
	and x30, x27, x14
	divu x9, x16, x16
	addi x19, x0, 1
	addi x25, x0, -2005
	sll x19, x19, 63
	sll x17, x17, 63
	addi x26, x0, 1326
	divu x3, x15, x26
	addi x20, x0, -1
	addi x1, x0, -1
	xor x1, x1, x17
	xor x20, x20, x19
	and x28, x14, x1
	sraw x13, x25, x25
	or x5, x30, x12
	or x21, x29, x18
	or x6, x2, x17
	and x8, x27, x20
	or x31, x2, x19
	addi x1, x0, 1132
	addi x13, x0, 804
	or x31, x1, x1
	subw x6, x12, x26
	addi x25, x0, 1261
	la x8, test_memory+1434
	la x2, test_memory+2161
	divu x27, x13, x13
	lb x20, -1349(x2)
	la x7, test_memory+1947
	addi x31, x0, 1434
	sllw x26, x13, x13
	sllw x19, x11, x24
	addi x12, x0, -2036
	sltiu x18, x12, 2005
	sllw x4, x12, x12
	remuw x30, x30, x30
	xor x14, x25, x25
	sltiu x17, x30, 1011
	divw x26, x23, x31
	addi x21, x0, 0
	and x1, x31, x31
	addi x27, x0, -993
	addi x24, x0, 0
	addi x15, x0, -2001
	sd x1, -1267(x7)
	addi x16, x0, 1588
	sltu x9, x16, x16
	ld x29, -642(x8)
	addi x25, x0, -382
	addi x2, x0, 678
	addi x10, x5, 0
	addi x5, x10, 0
	addiw x21, x23, -373
	addi x31, x0, -438
	add x20, x4, x4
	remu x13, x27, x27
	addi x16, x0, -1514
	addi x7, x0, -1196
	mulhu x9, x3, x3
	sra x24, x16, x7
	addi x12, x0, 1
	sll x12, x12, 63
	rem x11, x15, x15
	addi x27, x0, 0
	addi x26, x0, -1
	divw x6, x2, x2
	addi x1, x0, 1771
	addi x14, x0, 1188
	addi x29, x0, -1555
	mul x18, x25, x14
	srlw x30, x31, x1
	addi x20, x0, 0
	addi x8, x0, 1003
	la x13, test_memory+813
	xor x26, x26, x12
	lwu x21, -33(x13)
	addi x2, x0, -1697
	xori x27, x15, 1537
	addi x10, x0, -525
	remuw x31, x2, x2
	la x21, test_memory-648
	la x6, test_memory+1932
	bltu x0, x0, crash_forward
	mulhu x19, x29, x8
	and x17, x30, x26
	sllw x20, x10, x10
	addi x28, x0, 0
	addi x3, x0, 0
	addw x15, x2, x2
	addi x23, x0, 0
	addi x22, x3, 0
	addi x16, x0, 1
	or x4, x17, x12
	lhu x24, -1746(x6)
	addi x2, x0, 320
	addi x31, x0, -18
	srlw x20, x29, x28
	sltiu x6, x2, -1699
	addi x18, x0, 1
	bltu x28, x23, crash_forward
	mulh x14, x10, x8
	sll x18, x18, 63
	mulhsu x27, x24, x6
	mul x30, x25, x25
	blt x3, x22, crash_backward
	sub x15, x2, x31
	addi x2, x0, 92
	sw x9, 1016(x21)
	addi x24, x0, 1
	slt x13, x7, x7
	addi x1, x0, -1943
	sll x16, x16, 63
	lui x8, 991912
	addi x19, x0, -1
	remw x27, x2, x2
	addi x6, x12, 0
	addi x7, x0, -1
	addi x26, x0, -1100
	sll x24, x24, 63
	mul x22, x9, x19
	addi x20, x0, 627
	addi x5, x0, 1623
	addi x17, x0, -539
	addi x21, x0, 1468
	xor x19, x19, x16
	srl x23, x17, x21
	xor x7, x7, x18
	sll x4, x26, x20
	sll x11, x1, x5
	addi x12, x0, -1214
	addi x31, x0, -1
	addi x30, x6, 0
	and x10, x3, x19
	xor x31, x31, x24
	or x29, x13, x16
	and x9, x16, x7
	addi x14, x0, -525
	and x3, x23, x31
	div x15, x12, x14
	or x25, x30, x18
	blt x10, x29, crash_forward
	slli x23, x9, 22
	addi x16, x0, 360
	addi x27, x0, 1
	la x22, test_memory-864
	sll x27, x27, 63
	mulh x26, x16, x16
	addi x11, x0, 1860
	or x28, x3, x24
	addi x10, x0, 519
	addi x20, x0, -1638
	la x29, test_memory+874
	addi x21, x0, -1733
	sltu x19, x20, x13
	addi x13, x0, -114
	div x17, x20, x20
	mulh x15, x12, x15
	slt x4, x26, x22
	addi x12, x0, -1777
	addi x18, x11, 1305
	addi x25, x0, -1
	addi x26, x0, 497
	xor x25, x25, x27
	addi x30, x0, -1523
	div x1, x13, x12
	divw x20, x31, x31
	addi x15, x0, 1039
	and x14, x30, x25
	remw x7, x10, x10
	addi x19, x0, 507
	lb x8, -295(x29)
	addi x6, x19, 1245
	remuw x20, x14, x22
	lhu x5, 1418(x22)
	div x23, x26, x30
	sra x1, x30, x26
	sllw x7, x28, x28
	addi x13, x0, -1212
	addi x1, x0, 1
	or x17, x15, x15
	addi x4, x0, -2022
	add x5, x1, x1
	la x12, test_memory+635
	sll x3, x13, x13
	mulhsu x31, x13, x4
	subw x28, x31, x18
	sh x14, -627(x12)
	addi x8, x0, -1418
	sraw x24, x8, x8
	sll x1, x1, 63
	sra x2, x16, x21
	addi x26, x0, -6
	addi x22, x0, -221
	bgeu x19, x6, crash_backward
	addi x10, x0, 1
	addi x23, x0, -1
	addi x17, x16, 0
	addi x12, x0, -2024
	or x21, x12, x12
	addi x15, x17, 0
	or x9, x4, x27
	sll x10, x10, 63
	xor x23, x23, x1
	and x20, x24, x23
	addi x19, x0, 1385
	slliw x13, x23, 28
	andi x24, x20, -7
	mulh x7, x26, x22
	addi x18, x0, -1
	addi x5, x0, 767
	xor x18, x18, x10
	and x29, x30, x18
	or x11, x29, x10
	and x28, x19, x5
	or x30, x24, x1
	bge x30, x20, crash_forward
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
	sd x21, 168(x1)
	sd x22, 176(x1)
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
reg_x0_init:	.dword 0xc1a560031ef4c087
reg_x1_init:	.dword 0xffffffffffffff80
reg_x2_init:	.dword 0x0000000000000000
reg_x3_init:	.dword 0x448d7501405f9d86
reg_x4_init:	.dword 0xffffffffffffffff
reg_x5_init:	.dword 0xffffffffffff8000
reg_x6_init:	.dword 0x9f6fb9095ab60d6c
reg_x7_init:	.dword 0xaf1c99747c665d6e
reg_x8_init:	.dword 0x7a81140984f7d689
reg_x9_init:	.dword 0xf02a16ca6ea98655
reg_x10_init:	.dword 0x0800000000000007
reg_x11_init:	.dword 0x0000000000000005
reg_x12_init:	.dword 0xffffffffffff8004
reg_x13_init:	.dword 0xffffffffffff8007
reg_x14_init:	.dword 0x96e756d43e3e39fd
reg_x15_init:	.dword 0xbc8bae7bb219896e
reg_x16_init:	.dword 0x1ab218d59406db71
reg_x17_init:	.dword 0xc77644916c1b48d4
reg_x18_init:	.dword 0x804912282c05f391
reg_x19_init:	.dword 0x7da58819d740ebc5
reg_x20_init:	.dword 0xffffffffffff8009
reg_x21_init:	.dword 0xc15cbb8d76c5802c
reg_x22_init:	.dword 0xdfeaeb5bd19c619c
reg_x23_init:	.dword 0x0000000000000001
reg_x24_init:	.dword 0x0800000000000000
reg_x25_init:	.dword 0x8f82e0e12772c437
reg_x26_init:	.dword 0x9e1efe9f65f76311
reg_x27_init:	.dword 0x7b8c96bbdcc5998a
reg_x28_init:	.dword 0x0000000000000000
reg_x29_init:	.dword 0x23a776087626647d
reg_x30_init:	.dword 0x0000000000000000
reg_x31_init:	.dword 0xffffffffffffffff

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0xd101ce766859a4a0
reg_x1_output:	.dword 0xb76cefcfbe2e5ca9
reg_x2_output:	.dword 0xa03d5ee654299846
reg_x3_output:	.dword 0xeb23529abd902869
reg_x4_output:	.dword 0x0ea12faa28297350
reg_x5_output:	.dword 0x89e9f9543db485e7
reg_x6_output:	.dword 0xf0a07a78fe85ffd8
reg_x7_output:	.dword 0x56562bc8ae52c5e4
reg_x8_output:	.dword 0x57714fe42ff6653b
reg_x9_output:	.dword 0x0ae3eca0a13f43db
reg_x10_output:	.dword 0xba90c0de7bfe6d53
reg_x11_output:	.dword 0xec4a287d67cdd053
reg_x12_output:	.dword 0x43a19c7e5df368eb
reg_x13_output:	.dword 0x94c033595e3fec75
reg_x14_output:	.dword 0x3a52c601b306676f
reg_x15_output:	.dword 0x46533837dfa2aadd
reg_x16_output:	.dword 0x4d466715ca8db5e3
reg_x17_output:	.dword 0x83307efffe6949b4
reg_x18_output:	.dword 0x74c38255fef2d916
reg_x19_output:	.dword 0xb9b3aca1ed4ed9fe
reg_x20_output:	.dword 0x708faa115a497716
reg_x21_output:	.dword 0xbd56617c81da8830
reg_x22_output:	.dword 0x73e6df4f90e6e3e6
reg_x23_output:	.dword 0x6f90da043b875a05
reg_x24_output:	.dword 0xbd63dd15bd99456e
reg_x25_output:	.dword 0x2a91759ca9497591
reg_x26_output:	.dword 0x6d0b53e7f19882b2
reg_x27_output:	.dword 0x1dab47cc20384595
reg_x28_output:	.dword 0x7cd0d98f753a7246
reg_x29_output:	.dword 0x26ba17904ac60f15
reg_x30_output:	.dword 0xe814911bd916fc01
reg_x31_output:	.dword 0xbebc710ccd62cc28

// Memory Blocks
	.align 8
test_memory:
	.dword 0xa904cf2af8e021f1, 0x20caad69ccf1600e
	.dword 0x9fbf3e6c4cfd248e, 0xe39c14fb9a537887
	.dword 0xdac1485f4d373631, 0x2d397fa2c5c1b062
	.dword 0x3aefc65dd8b971c6, 0x788f1773d9eac753
	.dword 0x7b7a3ee02d8d08c0, 0x7b852197832e0309
	.dword 0x2f5e32fabed5dc4d, 0x2461f172cff20d80
	.dword 0xff93402a6ca2f5cb, 0x4cb56a07f55ae493
	.dword 0x16311a5035699279, 0xb930b19adcb6aed4
	.dword 0x286ca1fc5778b671, 0x3ed2fb970b2289a0
	.dword 0x7b599aee1b1e7ad5, 0x88fe8cb1e365a46d
	.dword 0xd232c6d9b4178b48, 0x7f975d4e13123d65
	.dword 0xb8c2686b157486a0, 0xd27efe2244e15338
	.dword 0x9da1728a6da836d9, 0xbed7a3191c37202d
	.dword 0xbea3e7deb42cd44c, 0xe4b27878860bb27b
	.dword 0xda2d2e971e5dc81f, 0x876ba647a35435d6
	.dword 0xc28f5c680906a1ff, 0x0a38a5e9ddbec24b
	.dword 0x7144bed26eff350c, 0xfb93ce0e125bc450
	.dword 0xaf0323a61e381015, 0xc77a38cb73ed5217
	.dword 0x379ca5cab319c505, 0xd01f6804b9460222
	.dword 0xd59a023ed94cb39c, 0x790c4c1510a6171b
	.dword 0xf5b6b95c40264b61, 0xc7d590a8f09f14e5
	.dword 0xd627805c2353f8d6, 0xe9ef53e756f312ee
	.dword 0xad17c71ebd2b31ed, 0xdee2abd807665fc6
	.dword 0xe553562aa28955bb, 0x0b8b9e036ccf49f5
	.dword 0x1bdd48f30fa5536a, 0xcc4c6d5877192208
	.dword 0x9d85e85aece04c74, 0x938d62501eacc9ed
	.dword 0x44a5297a99c1a60e, 0x7dae71509a026580
	.dword 0x4d37d4a2de1e3de1, 0xe602635622450065
	.dword 0xccf9989e3531b5ff, 0xb7c164cec92a3d17
	.dword 0x45f68e3aa76c0c14, 0x5c5b1ec519ad6141
	.dword 0x58b2f007b524efdb, 0x146ebe41587e534c
	.dword 0x07b00a6041898cd4, 0xac318dee5cea5d39
	.dword 0xa501a7a7c130bb33, 0x2d7305fd610dc8af
	.dword 0x44177cd5260ccc1b, 0xeaf776485d7aa857
	.dword 0x0a125a2f8a31650c, 0xe0d0aeb9aa726267
	.dword 0x9e35245c97571e98, 0x6dee49ecac94d07d
	.dword 0x367dd999316dda5c, 0x42957e144dc108ad
	.dword 0xba7327424a2a042e, 0x900a981a4a1123dd
	.dword 0x6bf7539bb9883293, 0xfdb4850add9b954f
	.dword 0xabb97fd0f705da73, 0x39a50db2e739e77f
	.dword 0x40ea863900050a0f, 0x9bf6a883f83df22e
	.dword 0x0a6af8dc34bc5f32, 0xe01b05bc35fbddbe
	.dword 0xeefc04338d73aca6, 0x6b43b9c629a087c0
	.dword 0x0a553a3600e102e9, 0x95c0a9e132311ccb
	.dword 0x829d899301811021, 0x7cc61efeed09fb8f
	.dword 0xb4e5e53986010b4c, 0xacc6a2ee90003529
	.dword 0xd42860217f7f9ebb, 0x88ab0bbd6eaa3eb7
	.dword 0x0536c14502cd85c0, 0x61f559581f89a82f
	.dword 0x0f2fd3eec72dd1a6, 0x578149756718ec6c
	.dword 0x03c2f83830a109e1, 0xfe5fc5b4035dae89
	.dword 0xb0fdb7cd94c59b86, 0xb07890000bd0f872
	.dword 0x27d762f72b0b4bfc, 0xe16fd13a0c744eb7
	.dword 0x536af9d57a9ea2f4, 0xb2036e189903ada3
	.dword 0x350fe5eba54c7f96, 0xeeee464b6ba1c38d
	.dword 0x4d8647e0a5ed4cfc, 0xe89dc1e06a5cfc6d
	.dword 0x8373dd842dea89e3, 0xeee850e82dc132b2
	.dword 0x2fbac40fe768979f, 0x6db9c159f1931951
	.dword 0x21039ab05bca044f, 0x87948f36a50fb321
	.dword 0x6568c944e7e0c452, 0xd71592ee1adb6b65
	.dword 0x83c8ef6603750ef9, 0x9b99b201f771a3aa
	.dword 0xd222bfa7a810d27d, 0xc4fb75e8d89ecad3
	.dword 0x93bccb1dfe79f333, 0x0158ad36869c5172
	.dword 0x150001234a34c9fd, 0x6c2e7afaa1070f58
	.dword 0xac13e755a20b9604, 0xba1c7868cc5dee6e

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
