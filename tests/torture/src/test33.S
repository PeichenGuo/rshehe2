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
	ori x29, x3, 1116
	mulh x8, x15, x15
	or x18, x7, x18
	sra x26, x14, x14
	bltu x26, x26, crash_forward
	add x10, x23, x23
	la x14, test_memory-1635
	addi x1, x0, -515
	la x12, test_memory-1581
	addi x4, x0, -1858
	la x10, test_memory-993
	addi x3, x0, 1528
	addi x21, x0, 288
	la x29, test_memory+1445
	addi x27, x0, 296
	bne x8, x8, crash_backward
	mul x30, x27, x27
	addi x28, x0, 1413
	remu x7, x21, x21
	addi x22, x1, -1726
	lb x8, 1061(x10)
	mulhsu x11, x21, x28
	ori x1, x10, 2011
	srl x31, x23, x20
	sw x1, 1989(x12)
	addi x6, x0, 959
	remuw x16, x28, x28
	lb x23, 1923(x14)
	addi x30, x0, 781
	addi x26, x0, 1865
	addi x17, x0, -1848
	sub x9, x4, x6
	xor x25, x17, x20
	sraiw x28, x1, 7
	mul x2, x17, x17
	addi x19, x0, 1062
	addi x16, x25, 0
	addi x13, x0, 29
	mulw x24, x3, x19
	addi x31, x0, 1857
	mulw x18, x30, x26
	sh x18, -1375(x29)
	remu x2, x21, x27
	remuw x9, x24, x6
	addi x11, x0, 1125
	addi x6, x0, 1
	addi x23, x16, 0
	sll x6, x6, 63
	blt x0, x0, crash_backward
	mulhsu x15, x13, x13
	mulw x1, x24, x22
	addi x5, x0, -226
	addi x21, x0, -233
	blt x16, x23, crash_forward
	mulh x20, x5, x5
	srlw x25, x25, x25
	slt x1, x25, x27
	addi x19, x0, -1549
	addi x30, x0, -1204
	addi x24, x0, 1
	div x20, x30, x30
	addi x8, x0, 1
	sll x24, x24, 63
	sllw x3, x31, x31
	addi x27, x0, 1529
	sll x8, x8, 63
	xori x28, x8, -487
	addi x17, x0, -1
	addi x13, x0, -1
	xor x13, x13, x8
	mulhsu x22, x31, x11
	sraw x20, x22, x22
	mul x23, x1, x1
	and x15, x30, x13
	addi x29, x0, -812
	addi x12, x0, -1
	addw x30, x27, x22
	sra x10, x29, x29
	or x25, x15, x8
	addi x28, x0, -1958
	xor x17, x17, x24
	addi x31, x23, 0
	addi x20, x31, 0
	sub x30, x17, x4
	addi x11, x0, 0
	la x10, test_memory-572
	addi x29, x0, 577
	mulhsu x3, x28, x28
	addi x13, x0, 0
	la x2, test_memory-1452
	mulhsu x30, x25, x10
	la x18, test_memory+1773
	xor x12, x12, x6
	sh x8, -1545(x18)
	addi x1, x0, 1803
	div x8, x29, x29
	lb x5, 1677(x2)
	addi x15, x0, 0
	sllw x26, x19, x19
	addi x23, x0, 0
	sltu x22, x1, x1
	lb x25, 1242(x10)
	bltu x13, x15, crash_forward
	slt x7, x21, x27
	blt x11, x23, crash_backward
	and x9, x22, x17
	or x16, x24, x24
	and x4, x29, x12
	or x14, x4, x6
	mulhu x30, x22, x22
	addi x1, x0, 1
	addi x11, x0, -1899
	sll x1, x1, 63
	addi x15, x0, -1
	mul x18, x11, x11
	addi x28, x0, -480
	addi x13, x0, -1593
	mul x23, x5, x9
	mulw x19, x11, x11
	addi x3, x0, 2044
	addi x7, x0, 1
	xor x15, x15, x1
	mulhsu x27, x28, x13
	and x10, x13, x15
	ori x20, x0, 306
	addi x2, x0, 379
	addi x30, x0, -807
	addi x19, x0, -765
	addi x27, x0, -1157
	addi x17, x0, 1260
	addi x14, x0, 1435
	addi x21, x0, -1890
	mulhu x5, x2, x17
	sll x7, x7, 63
	addi x8, x3, 1573
	addi x25, x0, -1
	xor x25, x25, x7
	addi x23, x0, -1473
	or x26, x10, x1
	beq x10, x26, crash_backward
	bgeu x3, x8, crash_backward
	sll x13, x8, x8
	sltu x28, x15, x19
	sll x20, x30, x27
	addi x16, x0, 933
	xor x29, x16, x16
	srlw x24, x21, x21
	sltu x9, x19, x14
	addi x4, x0, -1924
	and x31, x24, x25
	or x22, x5, x7
	sltu x16, x10, x19
	sllw x12, x4, x4
	addi x28, x0, -652
	mulw x14, x31, x31
	addi x29, x0, 1343
	addi x11, x0, 1432
	subw x9, x19, x21
	addi x15, x0, 1541
	addi x10, x0, 481
	addi x21, x28, -140
	la x8, test_memory+1329
	remu x6, x15, x15
	mulhu x1, x1, x28
	addi x16, x0, 906
	beq x28, x21, crash_backward
	addi x25, x0, 842
	srai x17, x10, 4
	addi x3, x23, -1741
	mulhsu x31, x16, x25
	addi x20, x0, 1371
	la x26, test_memory+1805
	srli x9, x20, 40
	sltu x18, x23, x11
	srl x2, x10, x10
	ld x13, -965(x26)
	addi x24, x0, -1817
	remuw x5, x29, x29
	addi x22, x20, 997
	addi x30, x0, 1311
	addi x7, x0, 1961
	blt x22, x20, crash_backward
	la x15, test_memory+1086
	addi x14, x7, 362
	blt x14, x7, crash_backward
	addi x1, x0, 296
	lw x27, -1017(x8)
	xor x19, x24, x30
	sb x11, -243(x15)
	addi x6, x1, 264
	bgeu x1, x6, crash_forward
	addi x9, x0, 1209
	or x7, x9, x9
	addi x14, x0, -969
	addi x27, x0, -369
	addi x21, x0, -1526
	mulhsu x16, x0, x15
	sraw x5, x4, x7
	or x18, x21, x21
	mulw x5, x3, x3
	addi x7, x0, -1618
	addi x11, x0, -1525
	addi x13, x0, -382
	srl x3, x27, x11
	addi x25, x0, 357
	srlw x8, x18, x4
	addi x1, x0, -1132
	addi x10, x1, -1559
	mul x29, x17, x17
	addi x28, x0, 1
	sraiw x22, x22, 18
	addi x9, x0, -885
	addi x31, x0, 791
	sll x28, x28, 63
	mulhu x17, x20, x20
	addi x15, x0, 1953
	addi x2, x0, -1201
	addi x26, x0, -1
	beq x1, x10, crash_forward
	addi x6, x0, -2039
	mulw x16, x7, x9
	xor x26, x26, x28
	div x20, x14, x25
	and x12, x19, x26
	mulh x4, x15, x15
	mulhu x24, x13, x6
	srl x19, x2, x2
	add x23, x31, x31
	or x30, x1, x28
	remu x31, x8, x8
	la x3, test_memory+2411
	lw x5, -2011(x3)
	addi x6, x0, 1439
	addi x9, x0, -1712
	slt x21, x24, x7
	addi x4, x0, 1
	addi x30, x0, 788
	addi x22, x0, 508
	mul x16, x28, x28
	addi x13, x0, 15
	sll x4, x4, 63
	addi x15, x0, -1119
	sraw x8, x9, x9
	sub x20, x13, x13
	mul x23, x11, x30
	addi x10, x0, -1120
	sub x23, x27, x0
	addi x19, x0, -1
	bltu x0, x0, crash_forward
	sltu x1, x9, x22
	addi x27, x0, 1
	addi x21, x0, 0
	mulh x2, x19, x25
	la x11, test_memory+2448
	addi x8, x0, -1450
	sd x5, -2016(x11)
	addi x28, x0, 1109
	addi x3, x0, -1458
	addi x14, x0, 180
	and x20, x3, x3
	addi x13, x0, -325
	sraw x24, x30, x28
	xor x19, x19, x4
	and x17, x17, x19
	sraw x31, x13, x13
	remw x26, x15, x14
	and x16, x8, x8
	la x28, test_memory+1466
	subw x16, x12, x6
	addi x22, x0, 1380
	addi x23, x0, 887
	addi x30, x0, 990
	mulhu x9, x22, x22
	sll x8, x1, x1
	srlw x2, x30, x30
	addi x26, x0, 3
	or x12, x17, x4
	or x11, x31, x31
	addi x20, x26, 1267
	addi x22, x0, -284
	lwu x3, -934(x28)
	addi x24, x0, -328
	mulh x9, x29, x29
	sra x2, x19, x19
	sraw x29, x6, x10
	addi x13, x0, -1804
	addi x5, x0, 0
	sraw x15, x27, x9
	srlw x11, x15, x15
	addi x3, x0, 1
	addi x28, x0, 1
	mulhsu x31, x13, x13
	sll x28, x28, 63
	sraw x14, x23, x24
	addi x10, x0, -1
	la x6, test_memory-1316
	sll x27, x27, 63
	addi x24, x0, 1950
	div x1, x17, x17
	blt x17, x12, crash_forward
	addi x30, x0, -334
	sllw x13, x7, x19
	add x8, x30, x30
	addi x23, x0, 172
	sh x8, 1734(x6)
	subw x13, x6, x23
	mulw x16, x22, x22
	sll x3, x3, 63
	xor x10, x10, x28
	and x29, x13, x10
	mulhsu x11, x23, x23
	div x20, x24, x24
	la x6, test_memory+1377
	addi x17, x0, 758
	addi x14, x0, -1863
	or x9, x29, x28
	lwu x4, -1125(x6)
	sraw x12, x17, x17
	and x2, x1, x1
	la x31, test_memory+452
	addi x1, x0, 1389
	addi x8, x0, -66
	lhu x26, 104(x31)
	addi x25, x0, -1
	xor x25, x25, x27
	or x19, x14, x1
	addi x30, x8, -1113
	and x7, x7, x25
	bgeu x30, x8, crash_backward
	or x18, x7, x27
	addi x20, x0, -709
	addw x6, x11, x11
	addi x9, x0, 1756
	addi x21, x0, -1
	andi x22, x8, -616
	addi x29, x0, -433
	la x30, test_memory+1437
	addi x10, x0, 1458
	subw x8, x20, x9
	div x12, x1, x1
	remu x31, x8, x28
	addi x26, x0, -1003
	srl x24, x29, x29
	addi x19, x0, 753
	addi x13, x0, 167
	xor x2, x13, x13
	addi x31, x0, -675
	add x9, x31, x31
	addi x23, x0, -114
	sraiw x28, x21, 6
	divu x17, x10, x10
	addi x1, x0, -864
	subw x4, x19, x23
	blt x0, x0, crash_forward
	lwu x16, -645(x30)
	addiw x8, x17, 1318
	addi x22, x0, 662
	addi x6, x22, 2014
	remuw x11, x1, x1
	mul x19, x13, x13
	rem x14, x26, x26
	remw x13, x5, x31
	xor x21, x21, x3
	remu x13, x26, x26
	addi x10, x0, 48
	addi x2, x0, 1916
	addi x14, x0, 1616
	addi x19, x0, 1710
	addi x30, x0, 139
	addi x1, x30, 457
	addi x23, x0, 1154
	addi x28, x0, 11
	addi x26, x0, 401
	sub x17, x2, x28
	addi x29, x0, -1148
	and x15, x6, x21
	addi x9, x19, 697
	addi x4, x23, 928
	addi x31, x0, 1638
	addi x22, x0, 1474
	addi x8, x0, 1840
	xor x11, x26, x8
	rem x20, x10, x31
	bgeu x30, x1, crash_backward
	blt x4, x23, crash_forward
	addi x16, x0, 628
	addi x18, x0, 1621
	mulhsu x7, x14, x18
	or x5, x12, x3
	addi x28, x0, -276
	mul x17, x22, x22
	addi x27, x0, -994
	addi x12, x0, -1057
	addi x6, x0, -1032
	addi x20, x0, -1750
	and x24, x29, x12
	div x2, x28, x6
	addi x11, x0, 1891
	and x13, x16, x27
	sraw x8, x20, x11
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
reg_x0_init:	.dword 0xffffffffffffffff
reg_x1_init:	.dword 0x70d989ae9e2e2cd3
reg_x2_init:	.dword 0x2218041f94fcac66
reg_x3_init:	.dword 0xffffffffffffffff
reg_x4_init:	.dword 0x233945ca34044b5f
reg_x5_init:	.dword 0xc93fc0e14c5f5f6f
reg_x6_init:	.dword 0x98191cf1f15ff19a
reg_x7_init:	.dword 0x0000000000000005
reg_x8_init:	.dword 0x73f96c03d9959051
reg_x9_init:	.dword 0x0000000000000000
reg_x10_init:	.dword 0x6aa75948047cf607
reg_x11_init:	.dword 0x73de4e887b9eff7c
reg_x12_init:	.dword 0x0000000000000000
reg_x13_init:	.dword 0xfe15f7d101d5a361
reg_x14_init:	.dword 0x0800000000000001
reg_x15_init:	.dword 0xb16bea93814f1cff
reg_x16_init:	.dword 0x0000000000000000
reg_x17_init:	.dword 0x925a7dbf72601325
reg_x18_init:	.dword 0xb76a51c246b05a57
reg_x19_init:	.dword 0xfbafe32f7979ad96
reg_x20_init:	.dword 0xffffffffffff8001
reg_x21_init:	.dword 0x0000000000000008
reg_x22_init:	.dword 0x67e7d6c4faf30cf0
reg_x23_init:	.dword 0xffffffffffffff89
reg_x24_init:	.dword 0xffffffffffffffff
reg_x25_init:	.dword 0x3f93c1b3d50a67d7
reg_x26_init:	.dword 0xffffffff80000009
reg_x27_init:	.dword 0x3072615ce9716f33
reg_x28_init:	.dword 0xffffffffffffffff
reg_x29_init:	.dword 0xffffffffffffffff
reg_x30_init:	.dword 0x24bd5f6a4348855e
reg_x31_init:	.dword 0x0000000000000004

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x85b5572c587c27a4
reg_x1_output:	.dword 0x6a0a28e04331c7fb
reg_x2_output:	.dword 0xa5075345e2e21ab5
reg_x3_output:	.dword 0x7cd646c52e964886
reg_x4_output:	.dword 0xf702d378d41a0091
reg_x5_output:	.dword 0x17968deb5453e140
reg_x6_output:	.dword 0xe250797f6dbcf9c7
reg_x7_output:	.dword 0xd90e08cddbf002f8
reg_x8_output:	.dword 0x40abf1849d7bf251
reg_x9_output:	.dword 0xae2fa081d63cc867
reg_x10_output:	.dword 0xaddd1c429b74841d
reg_x11_output:	.dword 0xc97526e64083064d
reg_x12_output:	.dword 0xc451464c3892fdc8
reg_x13_output:	.dword 0x49605019587ab9d9
reg_x14_output:	.dword 0x8d4000a5b94791ac
reg_x15_output:	.dword 0xef8d4f2ad5f1794d
reg_x16_output:	.dword 0xa4ec6e9c88b0f11c
reg_x17_output:	.dword 0xcc060a171ad4cae2
reg_x18_output:	.dword 0xcb4d1cd339bed7ee
reg_x19_output:	.dword 0xd80018f1255085e8
reg_x20_output:	.dword 0x0b71b59bc2f34c39
reg_x21_output:	.dword 0xc71f045b580fa231
reg_x22_output:	.dword 0x219f26883e91965f
reg_x23_output:	.dword 0x29f7773cf4b019af
reg_x24_output:	.dword 0xf6900b3f9876354d
reg_x25_output:	.dword 0x9f2757b44260c05c
reg_x26_output:	.dword 0x9ed07194d4c35301
reg_x27_output:	.dword 0xbd21fb49c8aa3659
reg_x28_output:	.dword 0x5d094ad623417d4c
reg_x29_output:	.dword 0x850eea6822d2585a
reg_x30_output:	.dword 0x4e811e60eb0ca6d8
reg_x31_output:	.dword 0x320ce707bd5bd240

// Memory Blocks
	.align 8
test_memory:
	.dword 0x1f5cd17bcd21b46d, 0xaf122aae3319b807
	.dword 0xf18498653ae11a6f, 0xb3be0f98046948e1
	.dword 0x62be64a75bdf4eab, 0xbcff993477a240a3
	.dword 0xc5d064ae54a41252, 0xbcb78fd0a7f05b60
	.dword 0x7493689c8a85d844, 0x5ab4239915ceef53
	.dword 0xf706405ebfdecb92, 0x14cf4abd8c89c101
	.dword 0x42f066fc1bad3a3e, 0x02d84ef460b4759f
	.dword 0xd1b38f2ca8896844, 0xc0843e1e0ebc47b0
	.dword 0xcbd0e5311cf70edd, 0x3b28324b1ccde1f2
	.dword 0x3ca019e0e2b90c02, 0x45bba4e30283847a
	.dword 0xa2038b022832062e, 0xc2d0411d496dd81e
	.dword 0x4cc61cda26450868, 0x7d0fe9b44dcc1412
	.dword 0xcc049904cad55a80, 0xf2a8e5d914ee59d5
	.dword 0x01cda68844351998, 0x221b6969d1076b4d
	.dword 0xce40af25e0c654e6, 0xfe5aec647ee11f30
	.dword 0x5a2545f1c00ab2b7, 0x78690595d33937a6
	.dword 0xa779e3249b99e1b6, 0xdcb6bc9691c27f2c
	.dword 0xf7120930a7375a6d, 0xa5f486f9b1204fbb
	.dword 0xe349271523c4350c, 0x5cc864bf0bf0e829
	.dword 0x7a50cbf2b9521769, 0xd764d00c215d33ce
	.dword 0xabf5ffdf3d687f48, 0x5472741bc5eae869
	.dword 0xa022d5f8f3ddecdb, 0xdd69df75f9b81e45
	.dword 0xf21e8bbd1ebab18b, 0xe499a5622215c697
	.dword 0xd9dfc9995cb366f9, 0xb5e8a29803e8a42a
	.dword 0x55e9d8beb225523f, 0x862b593a588eaa3d
	.dword 0xd666e23c765f377a, 0x5ede98051a80e5ab
	.dword 0x7abe8b48d2a5618c, 0xf288e0c27fc8544c
	.dword 0xf70982e12207e21e, 0x6427420178de4e9b
	.dword 0xd3b7d492ad0e4de3, 0x01219808c8f76798
	.dword 0x28c91498d2ac7924, 0xd48d6909e341e6ef
	.dword 0xc452b9285527f877, 0x4345d093858f415a
	.dword 0xfb023508ddce69d1, 0xadd22e4c0e723343
	.dword 0x260da766c9d8c9bf, 0x7e7c8bdc315161ac
	.dword 0x15df34eb65d858f0, 0x5a93ee2b7888a553
	.dword 0xe0f45e0517cdd5f6, 0x24e605cdeab16410
	.dword 0x642be68bd2d40f4d, 0x903ef2bcb6cc9c82
	.dword 0x4a52228a0653119b, 0x92750f49798f87ea
	.dword 0x5d64bc500e417639, 0xb671f64d16bdf656
	.dword 0x6a0447cebe4d95f2, 0x250938a3428bc901
	.dword 0xde1b3729bf20a409, 0x048075da52b12ef9
	.dword 0x1c2704862789f580, 0x3cb3cc254b738802
	.dword 0xe609a5239380f897, 0xacfcd395049f11ba
	.dword 0x421699b24cd0a092, 0xd0b19889c38bc2fd
	.dword 0x64702fdd3d2749bf, 0xc27449677409f98a
	.dword 0xdafec929f37259b7, 0x8ce38b8458b9dde6
	.dword 0xf4953b06271d1fe3, 0xfbc6ab68561aa180
	.dword 0xe9729c1ab73eba42, 0x5ad01c3700ccfb15
	.dword 0x0d8312e4123b0268, 0x21c3fa6919568555
	.dword 0x80c679836816c6c9, 0xd07785bbc469e3c7
	.dword 0xb15cead1b6ffd437, 0xbaf9c66b6091d1e9
	.dword 0x32268cb71a8d93a9, 0x3e84d19f875b809a
	.dword 0x19e52bbb4347403d, 0x7dda612662fee5bc
	.dword 0x56a37bdd5948f97f, 0xfea5b261c049e215
	.dword 0x390f12a40ab135eb, 0x2ca7e083017d6175
	.dword 0x60af6e73291459b0, 0x32132df79019d91e
	.dword 0x25b59f2008cc75b6, 0xc1ccf121838ac85f
	.dword 0x74c563c61dd772e2, 0x5795184aaf771f82
	.dword 0xb5d1d1d9e4562d98, 0x3e8d78d51876b0e7
	.dword 0x0634d97b92e34581, 0xff8a5db6374b1070
	.dword 0x98ca3b0efb20a58d, 0x013909236bbc8520
	.dword 0x1a4bc20b3547083b, 0x6bc01d8b5f21f0fe
	.dword 0x3db5d9109e72fc17, 0x434921c5d5a4d33f
	.dword 0x2158cb3f731f2c84, 0x1821948deac0c8a3
	.dword 0xb2ac46c50ff3f2bb, 0x4315432cf3902e1e

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
