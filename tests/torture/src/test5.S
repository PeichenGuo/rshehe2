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
	srai x22, x4, 38
	addi x10, x6, 0
	la x29, test_memory+299
	mulhu x5, x18, x6
	addi x13, x0, 0
	remw x22, x16, x2
	ori x2, x18, 644
	blt x0, x0, crash_backward
	addi x7, x0, 375
	addi x1, x0, 0
	sltu x20, x21, x16
	mulh x25, x7, x7
	la x15, test_memory-420
	addi x2, x0, -1004
	bne x13, x1, crash_forward
	addi x21, x0, 1225
	addi x6, x0, 449
	addi x20, x0, 0
	la x7, test_memory-365
	add x31, x14, x5
	addi x25, x0, 0
	addi x18, x0, -1686
	bltu x20, x25, crash_backward
	ld x14, 261(x29)
	divuw x27, x19, x26
	addi x5, x0, -591
	addi x26, x0, 632
	addi x23, x0, 325
	addi x17, x0, -411
	addi x8, x0, -1895
	mul x22, x2, x5
	addi x4, x10, 0
	or x24, x21, x21
	addi x19, x0, 1182
	addi x9, x0, -1262
	blt x10, x4, crash_backward
	sltu x3, x26, x26
	mulhu x12, x18, x8
	mulhu x16, x17, x19
	srlw x11, x9, x9
	addi x29, x0, 1716
	addi x24, x0, 1
	remuw x25, x21, x21
	or x28, x6, x23
	addi x4, x0, 625
	sll x24, x24, 63
	addi x3, x0, -1
	addi x20, x0, 211
	srlw x14, x16, x16
	addi x8, x0, -1302
	mulhu x16, x8, x8
	addi x31, x0, -254
	addi x1, x0, 0
	lhu x30, 952(x15)
	sd x6, 1029(x7)
	srl x17, x5, x26
	xor x3, x3, x24
	and x5, x5, x3
	slti x27, x11, 1299
	addi x9, x0, 1
	addi x2, x0, 0
	mulhsu x26, x29, x20
	addi x25, x0, 0
	remw x13, x31, x31
	remu x22, x4, x4
	addi x30, x0, 1669
	addi x8, x25, 0
	or x21, x5, x24
	bltu x2, x25, crash_forward
	mul x27, x30, x30
	srl x12, x16, x16
	addi x17, x8, 0
	addi x10, x0, 0
	addi x28, x0, -958
	blt x8, x17, crash_backward
	blt x1, x10, crash_forward
	sll x9, x9, 63
	addi x19, x0, -1
	sraw x14, x14, x6
	la x10, test_memory-524
	mulw x14, x20, x23
	addi x27, x3, 0
	addi x17, x0, -533
	remw x29, x2, x2
	addi x21, x0, -815
	sh x18, 1482(x10)
	divw x12, x18, x18
	mul x24, x3, x22
	blt x21, x21, crash_forward
	addi x31, x0, 93
	xor x19, x19, x9
	addi x16, x0, -1342
	addi x13, x0, 0
	la x24, test_memory+1839
	sw x13, -987(x24)
	addi x15, x0, 1222
	addi x1, x27, 0
	divuw x22, x26, x3
	addi x14, x0, -1122
	addi x3, x0, 207
	bne x0, x0, crash_backward
	sub x2, x21, x3
	addi x30, x0, 0
	divu x25, x17, x17
	addi x6, x0, 1643
	and x23, x21, x19
	addi x4, x14, -1618
	sra x10, x12, x12
	bltu x13, x30, crash_backward
	addi x8, x0, -663
	bltu x14, x4, crash_backward
	or x18, x28, x9
	mulhu x20, x20, x28
	sraw x24, x12, x0
	bne x27, x1, crash_forward
	mul x5, x31, x8
	addi x26, x0, 1906
	remuw x11, x28, x6
	addi x12, x0, 402
	slt x29, x26, x12
	divuw x7, x16, x15
	addi x18, x0, 1108
	addi x19, x0, -1057
	addi x29, x0, 1837
	slt x20, x20, x9
	addi x15, x0, 1295
	addi x26, x15, 172
	addi x7, x0, 236
	divuw x16, x31, x31
	and x11, x7, x7
	addi x17, x0, 298
	addi x13, x0, -425
	addi x14, x0, 755
	addi x31, x0, -533
	addi x2, x18, 427
	addi x20, x0, -743
	la x27, test_memory-642
	addi x11, x0, -1396
	slt x21, x19, x19
	la x9, test_memory+2073
	divw x24, x29, x31
	bgeu x18, x2, crash_forward
	addi x7, x20, -1022
	bgeu x7, x20, crash_forward
	and x6, x19, x10
	slliw x8, x15, 14
	addi x28, x0, -1248
	add x23, x28, x28
	lbu x4, 1015(x27)
	la x25, test_memory+1852
	sb x1, -1701(x9)
	sra x7, x1, x1
	addi x31, x0, 1698
	remw x19, x31, x31
	sltu x30, x13, x13
	addi x6, x0, -166
	sll x5, x14, x14
	mulhsu x29, x6, x6
	addi x10, x17, 1558
	remu x8, x27, x27
	sll x1, x3, x9
	mulw x23, x2, x2
	addi x26, x0, -224
	srl x15, x31, x25
	divuw x16, x11, x26
	xor x3, x28, x28
	addw x2, x31, x31
	la x12, test_memory-909
	addi x21, x0, -213
	sh x24, 1217(x12)
	addi x24, x21, -1875
	sltu x18, x1, x1
	mulhu x20, x12, x16
	la x6, test_memory-1242
	addi x29, x0, 1318
	addi x3, x0, 1265
	addi x7, x0, -760
	addi x11, x0, 1290
	lw x22, -1548(x25)
	blt x21, x24, crash_backward
	la x21, test_memory-1536
	addi x19, x0, -1678
	sraw x1, x5, x19
	addi x9, x0, 1
	addi x28, x0, -1668
	and x8, x11, x11
	addi x24, x17, 0
	addi x1, x0, -1509
	sw x22, 1450(x6)
	lh x20, 2022(x21)
	addw x10, x14, x25
	addi x21, x0, -536
	addi x18, x24, 0
	addi x11, x0, 1
	slt x26, x3, x28
	mulhsu x30, x1, x27
	sll x11, x11, 63
	add x22, x1, x1
	and x12, x31, x31
	mulhu x8, x21, x21
	addi x14, x0, 0
	add x31, x29, x7
	addi x16, x0, 436
	addi x10, x0, -1
	la x2, test_memory+2389
	lh x27, -1657(x2)
	xor x10, x10, x11
	remuw x25, x9, x2
	sllw x13, x19, x16
	addi x5, x0, 0
	sll x9, x9, 63
	addi x2, x0, 1732
	addi x15, x0, -1
	addi x7, x2, 204
	xor x15, x15, x9
	and x4, x1, x15
	srlw x22, x19, x27
	and x20, x20, x10
	or x6, x29, x11
	addi x31, x0, 1
	la x26, test_memory-1223
	addi x13, x0, 1
	srl x17, x13, x13
	sll x31, x31, 63
	or x23, x4, x9
	divw x3, x7, x28
	beq x20, x6, crash_forward
	addi x16, x0, -1
	addi x1, x0, -502
	ld x21, 1855(x26)
	addi x28, x0, 434
	addi x25, x0, 1744
	addi x27, x0, -1872
	remw x24, x25, x27
	subw x19, x1, x28
	xor x16, x16, x31
	and x18, x21, x16
	sll x13, x13, 63
	or x29, x18, x31
	blt x18, x29, crash_forward
	addi x8, x0, -1
	srliw x14, x9, 5
	addi x23, x0, 1867
	addi x7, x0, -1769
	addi x2, x0, 1738
	addi x24, x0, -1343
	addi x20, x0, 1837
	addi x9, x0, -324
	addi x4, x0, 0
	addi x31, x0, 0
	mulhsu x1, x9, x1
	la x6, test_memory-1316
	remuw x26, x7, x9
	addi x17, x0, -510
	remu x27, x20, x17
	addi x16, x0, 762
	divuw x29, x28, x28
	divw x3, x17, x1
	remuw x22, x21, x28
	mulw x10, x23, x23
	addi x5, x0, 232
	xor x8, x8, x13
	and x30, x4, x8
	or x12, x0, x13
	sltu x28, x2, x5
	rem x22, x19, x19
	addi x11, x0, -957
	remw x26, x31, x18
	la x20, test_memory-808
	addi x3, x17, -455
	srai x27, x8, 46
	sllw x19, x11, x11
	addi x9, x0, -1621
	la x31, test_memory+108
	divu x10, x9, x9
	mulhsu x5, x7, x7
	subw x23, x13, x20
	srl x17, x11, x21
	remu x25, x16, x16
	sllw x14, x1, x1
	la x28, test_memory+2553
	sh x16, -1725(x28)
	addi x29, x0, 14
	lhu x15, 1356(x6)
	addi x7, x0, 405
	mulh x2, x29, x29
	beq x30, x12, crash_forward
	addi x1, x7, 176
	sb x25, 145(x31)
	addi x10, x0, -1223
	addi x11, x0, -977
	srlw x4, x22, x22
	la x5, test_memory+374
	addi x27, x0, 1995
	addi x3, x0, 1331
	la x2, test_memory-1024
	divu x22, x24, x24
	sh x22, 122(x5)
	addi x15, x0, -78
	subw x21, x24, x24
	remu x4, x16, x11
	lb x18, 1063(x20)
	remu x5, x28, x7
	addi x16, x0, 1599
	div x26, x27, x16
	slli x29, x19, 14
	blt x0, x0, crash_backward
	addi x23, x0, -663
	sll x21, x2, x30
	addi x4, x0, -1067
	bgeu x7, x1, crash_backward
	addi x21, x0, 820
	srlw x8, x10, x15
	sllw x18, x7, x28
	slt x29, x21, x21
	addi x25, x3, 1098
	addi x17, x0, -867
	xor x14, x14, x14
	addi x9, x23, -846
	bgeu x9, x23, crash_forward
	addi x26, x0, -1775
	remuw x16, x3, x3
	addi x22, x2, 1481
	la x31, test_memory+1955
	addi x28, x0, -9
	addi x27, x26, -1850
	bltu x26, x27, crash_forward
	lw x24, -1615(x31)
	slt x20, x4, x4
	la x12, test_memory-1733
	remw x13, x11, x28
	mulhu x5, x24, x0
	sb x22, 1824(x12)
	lhu x6, 1112(x2)
	addi x30, x0, 164
	div x19, x17, x30
	sllw x15, x29, x29
	addi x7, x0, 129
	sub x23, x22, x22
	la x18, test_memory+1220
	addi x10, x0, 840
	andi x20, x6, -1475
	la x27, test_memory+89
	addi x11, x0, -1517
	addi x26, x0, -1202
	sraw x14, x26, x26
	or x30, x28, x4
	addi x4, x0, -210
	la x2, test_memory+1453
	sraw x6, x4, x4
	la x24, test_memory-1341
	andi x28, x31, 767
	andi x12, x11, -1937
	mul x3, x25, x25
	sh x10, 1841(x24)
	sub x29, x11, x11
	mulhsu x22, x14, x6
	lbu x5, -470(x18)
	sb x28, 655(x27)
	addi x30, x0, -1288
	srl x13, x10, x10
	or x15, x7, x17
	mul x6, x28, x1
	la x20, test_memory+2336
	addi x4, x0, -2040
	addi x19, x0, -1356
	ori x5, x22, 698
	addi x14, x0, 1917
	mul x9, x21, x21
	srl x3, x4, x4
	addi x31, x0, 1873
	sra x16, x19, x19
	la x18, test_memory+331
	addi x17, x7, 932
	addi x24, x0, -1941
	la x13, test_memory-243
	sh x12, 337(x18)
	sllw x21, x19, x31
	la x10, test_memory+2492
	lb x27, -1667(x20)
	slli x25, x17, 26
	addi x28, x0, 1971
	la x8, test_memory+844
	sltu x16, x9, x9
	remu x23, x28, x28
	sraw x22, x24, x28
	addi x29, x0, -1527
	remu x12, x30, x29
	sh x23, -1840(x10)
	ld x1, -1285(x2)
	sb x23, -670(x8)
	lwu x3, 891(x13)
	addi x26, x0, -726
	sll x11, x14, x26
	xor x15, x26, x26
	j reg_dump

reg_dump:
	la x1, loop_count
	lw x2, 0(x1)
	addi x3, x2, -1
	sw x3, 0(x1)
	bnez x2, pseg_0
	la x1, xreg_output_data
	sd x0, 0(x1)
	sd x3, 24(x1)
	sd x4, 32(x1)
	sd x5, 40(x1)
	sd x6, 48(x1)
	sd x7, 56(x1)
	sd x9, 72(x1)
	sd x11, 88(x1)
	sd x12, 96(x1)
	sd x14, 112(x1)
	sd x15, 120(x1)
	sd x16, 128(x1)
	sd x17, 136(x1)
	sd x19, 152(x1)
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
reg_x0_init:	.dword 0xffffffffffffffff
reg_x1_init:	.dword 0x0000000000000008
reg_x2_init:	.dword 0xfa4c91f22e20496f
reg_x3_init:	.dword 0x0000000000000001
reg_x4_init:	.dword 0x3a694c4f7bdf15a3
reg_x5_init:	.dword 0x1f3289e2e06bb8b1
reg_x6_init:	.dword 0x06a79bb66b280dfd
reg_x7_init:	.dword 0xe3e2655b151f6c83
reg_x8_init:	.dword 0x0000000000000000
reg_x9_init:	.dword 0xffffffffffff8004
reg_x10_init:	.dword 0xd261736c64947cc9
reg_x11_init:	.dword 0x993c5069058f1928
reg_x12_init:	.dword 0x0000000000000003
reg_x13_init:	.dword 0x4757ef7a69851d96
reg_x14_init:	.dword 0xffffffffffffff88
reg_x15_init:	.dword 0x29ea530d8d8488db
reg_x16_init:	.dword 0x33bdbaace02c1f90
reg_x17_init:	.dword 0xffffffffffff8008
reg_x18_init:	.dword 0xffffffffffffffff
reg_x19_init:	.dword 0x4cb13efc63b76a8d
reg_x20_init:	.dword 0xfdadcbd76838a66e
reg_x21_init:	.dword 0xffffffffffffff81
reg_x22_init:	.dword 0x6ef14a91141ff2ab
reg_x23_init:	.dword 0x30be2d11a9cdd500
reg_x24_init:	.dword 0x0000000000000000
reg_x25_init:	.dword 0xffffffffffffffff
reg_x26_init:	.dword 0x726c5142770cf905
reg_x27_init:	.dword 0x50aa13d46f31ffb5
reg_x28_init:	.dword 0x09cd0e9d5861ef12
reg_x29_init:	.dword 0x830d87e9659a9ebc
reg_x30_init:	.dword 0xffffffff80000002
reg_x31_init:	.dword 0x0000000000000000

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0xee0beb6949f7e547
reg_x1_output:	.dword 0x38d1678938ca3be6
reg_x2_output:	.dword 0xd10121485173a71e
reg_x3_output:	.dword 0xacf43b931be376ec
reg_x4_output:	.dword 0x12c8c5fa320e0570
reg_x5_output:	.dword 0xb415a1bc6165aebf
reg_x6_output:	.dword 0xa8621bda3532c026
reg_x7_output:	.dword 0xff54ce94a6e92521
reg_x8_output:	.dword 0x5138e6f2b4d9f58c
reg_x9_output:	.dword 0x7b3b1f4b6640c7dd
reg_x10_output:	.dword 0x6871ade6457c9b68
reg_x11_output:	.dword 0xc80b9f2f2efaa1fa
reg_x12_output:	.dword 0x3a3ea51053aef54e
reg_x13_output:	.dword 0x0846e170c2d9ac2d
reg_x14_output:	.dword 0x57f5a7eb4fbb9c33
reg_x15_output:	.dword 0x0eec332eee37b08f
reg_x16_output:	.dword 0xae41e4b5342eeb3f
reg_x17_output:	.dword 0x180d69ae08f5358f
reg_x18_output:	.dword 0x29521e4e72ebe5e6
reg_x19_output:	.dword 0xf3dad0e65c88a429
reg_x20_output:	.dword 0x158ea8664c60eb39
reg_x21_output:	.dword 0xaaa0fe43471d1d57
reg_x22_output:	.dword 0x267081d70703ca78
reg_x23_output:	.dword 0xe78a8ba89dc4b2c8
reg_x24_output:	.dword 0xc2c5314dffa20cec
reg_x25_output:	.dword 0xf493feb93fc8f6cf
reg_x26_output:	.dword 0x6c414830c68b88f3
reg_x27_output:	.dword 0x54406051ee60179d
reg_x28_output:	.dword 0x79fdafbc6f6a925c
reg_x29_output:	.dword 0x61814859adbbf9b3
reg_x30_output:	.dword 0xf89a246d72fe5bf4
reg_x31_output:	.dword 0x2c2d61be49cc0591

// Memory Blocks
	.align 8
test_memory:
	.dword 0x098183a268215e61, 0xa48caab619619cb3
	.dword 0x2372cf7ee5ced82d, 0x3331f54d00f269bd
	.dword 0xdb3c0d14df77bb25, 0xf7cd6c1fb232fff4
	.dword 0x7ac260c021289ae4, 0x021c1f649a777df0
	.dword 0x68450cd06f0770aa, 0x17d4de2f366f278f
	.dword 0xde7f366a7cc94871, 0xb1b2dfef21ab2b2d
	.dword 0x822694b0132d2b42, 0x3cc3023e32b00611
	.dword 0x28836e1f7c8adac4, 0xd4209ed7fc543c29
	.dword 0x77c08838bb593215, 0x4e9b3deaca2656fa
	.dword 0xa257ed6337793fdc, 0xe38ea8927abf5fd1
	.dword 0x35ebad0ee6506d9e, 0xd6cb1f9ac786493e
	.dword 0x0927fa1d778d4851, 0x9503ba8f98bbfbc2
	.dword 0xa63e4b7d9a17be2e, 0xbd1532f4edeef9c7
	.dword 0xe65f6319e366e5cb, 0x8ed79fccd170ced0
	.dword 0xb8945ef38483a268, 0xb251e5636056bdf0
	.dword 0x91b5388994a0b988, 0xda4ddd467b326380
	.dword 0xb63d5680f6a62dc3, 0x47b87a947d463e0b
	.dword 0x47a514817696f2da, 0x08296e7adbc5528d
	.dword 0xb7f1655dba954f0c, 0x15a210fcbbec5fdd
	.dword 0x5d98f376aabb7da7, 0x684b91f208b65566
	.dword 0x59f06363784366e1, 0x00f8b652eed5011d
	.dword 0xc3459cc8f8d180e7, 0xe4afa5b3b2b228ae
	.dword 0x13ec3d8e7b642e36, 0xa2c48c11cfcc81f8
	.dword 0xaefb9b3602aa2d2a, 0x085613cf2e073ebb
	.dword 0xeca0f6833197ecd4, 0x1188fbf8dfba1f90
	.dword 0x88eec5618c3cdb10, 0x7af04ed265bb4219
	.dword 0x9b3c3706a556ffd5, 0xd063fc8c747b1e78
	.dword 0xe7b65655aa3479ce, 0xc25fde53e9de6804
	.dword 0x8af66e838f57b02a, 0x742165914608c53a
	.dword 0xb68795fe124c4daf, 0x6b5a7b6cf50692f1
	.dword 0x9f7f838955685915, 0xa2b45492eb7326d1
	.dword 0x6bed11aa1a15fe91, 0xd2c53d3a181c4505
	.dword 0x0b21144772f7deaf, 0x6dc8a1627f7abd2f
	.dword 0x8dfc648e2a02f664, 0xa998d55e36e3629c
	.dword 0x01b8471554c67463, 0xad5e629113d2d3b8
	.dword 0x9f4c90408bcb0faf, 0xf560dc7ba2e9c4c4
	.dword 0x95e92aeba678b371, 0xeba181f6b156c1c5
	.dword 0xf62ee541848a940b, 0xbfa82ebe6dc59bbf
	.dword 0x982da7eb6e07016c, 0xa76f612f62bbf523
	.dword 0xedec7b6d9c318aa5, 0xdee458517ecda185
	.dword 0xe1a1ffd4164346bc, 0x2f3c8e182e8acc91
	.dword 0x580a3a8acd1e56c0, 0x43b211e593b51c3f
	.dword 0x0eb0de8cb6eef51d, 0x1a4c8754f4684245
	.dword 0x11d572c117fda631, 0xfd74cd3316b5b0cd
	.dword 0x5000faa17e1b5e1e, 0x726d90ccd8fa6668
	.dword 0x28bb051ba149afe1, 0xb9ab516fa0310541
	.dword 0xa24645bd1bce59a3, 0xf4aa982c4af1a995
	.dword 0x062b1c0b0f02c24f, 0xd98b67db0cf43362
	.dword 0x6fd8ad3376253c64, 0x6ba52960b300f75e
	.dword 0xb20b73e4567b220c, 0x59b698344d870b2a
	.dword 0x59326a79b9701e6c, 0x0a89731d8fcea0c7
	.dword 0x58fa335d8b50383c, 0xb019f54176312549
	.dword 0xa3b7e3ab0cff719a, 0xdbce5b5c162816c9
	.dword 0xe9e3541489eb111b, 0x744af94b229ec59f
	.dword 0x986b1c05d29de823, 0xcb33a3d46d0274d1
	.dword 0xccaa9b0889222a76, 0x1ef3729ff34f8dc5
	.dword 0xee6cb46b5bf0ab0e, 0x8eb01e864411db3e
	.dword 0x69ec211eb7d6922e, 0x6d1e800ec638ff85
	.dword 0x376c7be26e37e0b7, 0xb641f235d30199e6
	.dword 0x7a156b9f0ca654b9, 0xfc789d6f4f46cf5e
	.dword 0x266b9012c229834c, 0x76d2eeea46972a91
	.dword 0xd85914b4570e3ba1, 0x85d4c017e0a30701
	.dword 0x73720dceeae08753, 0x58a2f26d4049fb7d
	.dword 0xe43f03ef7294dc02, 0xb388836785eff7d6

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
