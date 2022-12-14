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
	slti x23, x2, -1173
	divw x20, x13, x10
	addi x13, x0, 0
	srlw x22, x6, x31
	addi x7, x0, 781
	la x23, test_memory+2678
	ori x17, x3, 1066
	addi x19, x0, 186
	addi x21, x0, -2023
	addi x20, x0, -544
	sltu x8, x7, x7
	sltu x6, x15, x29
	addi x15, x3, 0
	xor x16, x22, x12
	la x28, test_memory+1299
	addi x12, x15, 0
	addi x6, x0, 532
	addi x7, x6, 465
	bltu x2, x2, crash_forward
	slt x16, x18, x18
	addi x31, x0, 1
	srai x25, x24, 52
	sh x20, -1732(x23)
	mul x10, x21, x20
	la x17, test_memory+1361
	addi x5, x0, -1906
	addi x4, x0, 0
	ld x29, -515(x28)
	srli x22, x4, 38
	beq x6, x7, crash_backward
	addi x27, x0, 920
	lh x8, -1079(x17)
	sraw x3, x19, x5
	sll x31, x31, 63
	addi x24, x0, -1
	addi x26, x27, 9
	bltu x15, x12, crash_backward
	addi x11, x0, -741
	addi x18, x11, -1719
	la x14, test_memory-1046
	la x4, test_memory+2167
	addi x23, x0, -599
	addi x10, x0, 1
	sll x10, x10, 63
	lw x6, -1159(x4)
	mulh x25, x9, x28
	addi x17, x23, -1448
	addi x7, x0, -1917
	addi x3, x0, -1
	slliw x8, x30, 10
	lhu x30, 1464(x14)
	addi x6, x0, -960
	xor x3, x3, x10
	la x16, test_memory-1059
	xor x24, x24, x31
	and x9, x21, x24
	or x2, x12, x31
	remuw x28, x9, x9
	beq x11, x18, crash_forward
	beq x23, x17, crash_forward
	or x15, x7, x7
	addi x25, x0, 870
	and x21, x28, x3
	bge x2, x9, crash_forward
	bgeu x27, x26, crash_forward
	add x4, x6, x25
	addw x14, x23, x23
	lh x20, 1823(x16)
	la x29, test_memory+1782
	addi x30, x0, 1735
	addi x8, x30, 1009
	lbu x22, -1020(x29)
	bgeu x30, x8, crash_forward
	addi x5, x0, 1
	sll x5, x5, 63
	or x12, x21, x10
	addi x13, x0, -1
	xor x13, x13, x5
	sra x21, x23, x21
	addi x28, x10, 0
	la x24, test_memory+2186
	addi x15, x28, 0
	addi x26, x0, 1684
	addi x27, x0, 367
	rem x3, x11, x11
	addw x20, x15, x7
	addi x2, x0, -263
	sll x17, x10, x10
	sub x25, x20, x26
	sd x6, -1786(x24)
	addi x10, x0, 1149
	addi x4, x0, 536
	addi x6, x0, -1549
	srli x31, x7, 53
	remu x7, x4, x4
	addi x11, x0, 1937
	addi x9, x0, 2031
	addi x4, x0, 1561
	remu x14, x6, x6
	addi x20, x0, 1251
	and x19, x21, x13
	or x1, x19, x5
	la x15, test_memory+730
	sll x18, x9, x9
	mul x29, x27, x27
	addi x17, x0, 1
	addw x16, x11, x11
	slt x23, x10, x10
	la x31, test_memory-1133
	div x12, x26, x2
	la x28, test_memory-240
	addi x22, x0, -846
	addi x30, x0, -1268
	lbu x21, 1293(x31)
	addi x3, x20, 1346
	bltu x17, x17, crash_backward
	lwu x25, -338(x15)
	add x8, x22, x30
	addi x2, x0, 526
	la x1, test_memory+1630
	sd x25, -1606(x1)
	sw x21, 400(x28)
	addi x9, x0, 1082
	addi x5, x0, -1727
	addi x25, x0, -436
	add x13, x9, x9
	sll x17, x17, 63
	slt x27, x2, x2
	addi x22, x0, 1998
	addi x7, x0, -1
	addi x16, x0, -1377
	xor x7, x7, x17
	addi x20, x0, -827
	addi x9, x0, -1502
	mul x8, x24, x24
	addi x30, x0, 1
	xori x29, x6, 1374
	subw x18, x5, x5
	sll x30, x30, 63
	addi x1, x0, -1
	and x6, x9, x7
	sra x31, x30, x19
	addi x23, x0, 363
	addi x19, x16, -93
	and x3, x22, x20
	addi x26, x0, -373
	xor x1, x1, x30
	or x14, x6, x17
	sltu x2, x9, x9
	addi x27, x0, -166
	and x21, x18, x1
	remuw x24, x4, x4
	sltu x2, x29, x29
	addi x31, x0, 1
	sll x31, x31, 63
	xor x3, x19, x16
	divuw x29, x31, x3
	divuw x11, x23, x26
	bgeu x6, x14, crash_backward
	addi x22, x0, -1
	or x13, x22, x30
	slt x10, x20, x11
	addi x4, x0, -594
	remu x28, x27, x27
	addi x18, x0, 642
	addi x27, x0, -1810
	addi x24, x0, -1128
	addi x12, x0, 1971
	subw x15, x25, x12
	addi x23, x0, 1654
	mulhsu x28, x27, x24
	la x8, test_memory+128
	addi x16, x0, -709
	sh x20, -28(x8)
	la x7, test_memory-936
	sll x9, x4, x16
	sw x3, 1432(x7)
	addi x10, x0, 1
	addi x29, x0, 26
	remuw x17, x18, x29
	addi x11, x0, 1
	sll x11, x11, 63
	sll x10, x10, 63
	addi x19, x0, -1
	la x13, test_memory-661
	srai x9, x23, 5
	xor x22, x22, x31
	lbu x30, 695(x13)
	la x29, test_memory+1817
	lh x18, -1111(x29)
	sltu x6, x25, x25
	la x24, test_memory+1916
	addi x2, x0, 742
	and x20, x30, x22
	lb x21, -990(x24)
	add x26, x23, x2
	rem x12, x24, x24
	or x5, x20, x31
	addi x7, x0, -1092
	bltu x5, x20, crash_forward
	addi x25, x0, -1265
	addi x16, x0, -537
	subw x8, x7, x16
	xor x19, x19, x11
	add x17, x26, x26
	addi x1, x0, -1
	xor x1, x1, x10
	addi x15, x25, -130
	and x14, x23, x19
	or x3, x23, x11
	and x28, x18, x1
	or x27, x23, x10
	blt x28, x27, crash_backward
	add x29, x21, x18
	addi x24, x0, 1301
	addi x22, x0, -1677
	addi x15, x0, 0
	addi x2, x0, 0
	div x31, x31, x31
	addi x19, x0, -124
	addi x23, x0, 236
	sllw x8, x24, x24
	sraw x20, x22, x19
	addi x6, x0, -196
	addi x1, x0, 0
	bne x15, x2, crash_backward
	la x28, test_memory+597
	slti x7, x22, 719
	addi x17, x0, 495
	addw x27, x9, x9
	lhu x12, -287(x28)
	addi x4, x0, 824
	addi x3, x0, -1653
	srl x24, x24, x24
	addi x21, x0, -394
	addi x2, x0, 1
	addi x11, x0, -249
	addi x29, x0, 1
	sll x29, x29, 63
	la x13, test_memory-894
	sb x19, 1269(x13)
	addi x10, x0, 0
	sll x2, x2, 63
	la x25, test_memory+1577
	addi x15, x0, -1
	xor x15, x15, x2
	mul x26, x17, x21
	bltu x1, x10, crash_forward
	and x31, x23, x15
	sb x10, -892(x25)
	addi x18, x6, -2017
	sltu x5, x23, x23
	and x9, x3, x11
	addi x11, x0, 692
	addi x1, x0, 1728
	xori x26, x16, 1067
	addi x9, x11, 250
	or x19, x31, x2
	mulhsu x14, x4, x21
	addi x28, x0, -1882
	addi x27, x0, -1343
	addi x12, x0, 507
	bltu x9, x11, crash_backward
	addi x16, x0, -1
	addi x7, x0, -1535
	addi x21, x0, -1821
	addi x22, x7, -149
	mulh x30, x4, x4
	subw x10, x1, x1
	addi x23, x21, -1702
	divw x24, x12, x12
	xor x16, x16, x29
	addi x5, x0, 448
	addi x19, x0, 1
	addi x25, x0, 231
	and x8, x24, x16
	sll x19, x19, 63
	addi x30, x0, 821
	addi x3, x0, -1811
	or x20, x8, x29
	bgeu x8, x20, crash_forward
	mulh x17, x5, x5
	addi x10, x0, 0
	and x11, x18, x15
	addi x14, x0, -131
	sraw x18, x3, x3
	subw x13, x28, x27
	bgeu x23, x21, crash_forward
	addi x12, x0, -1
	add x26, x4, x21
	divu x1, x25, x30
	addi x6, x0, -916
	divw x22, x6, x6
	addi x4, x0, 0
	addi x15, x0, 1293
	xor x12, x12, x19
	addi x23, x0, 4
	srliw x5, x3, 30
	and x7, x31, x12
	addi x8, x0, 1
	sll x9, x14, x14
	sll x8, x8, 63
	addi x1, x0, -1
	addi x20, x0, 741
	addi x18, x0, -1736
	xor x1, x1, x8
	mulw x6, x23, x23
	addi x3, x0, 1980
	or x4, x11, x11
	la x13, test_memory+1035
	addi x23, x0, 0
	ld x28, -515(x13)
	slli x6, x1, 6
	or x24, x1, x19
	blt x7, x24, crash_forward
	addi x2, x0, 621
	mulw x30, x3, x3
	mul x31, x15, x2
	xor x27, x20, x20
	mulh x12, x31, x27
	mulhu x24, x5, x3
	mulw x26, x27, x27
	la x25, test_memory-910
	addi x13, x0, 1
	and x21, x6, x1
	rem x5, x28, x28
	slt x28, x28, x28
	or x11, x28, x8
	sll x13, x13, 63
	addi x29, x0, -1858
	la x17, test_memory-811
	addi x6, x0, -1
	sub x22, x18, x29
	addi x9, x0, 0
	xor x6, x6, x13
	and x19, x22, x6
	sw x28, 1083(x17)
	srlw x7, x24, x24
	bltu x23, x9, crash_forward
	lb x16, 1185(x25)
	addi x14, x8, 0
	or x4, x3, x13
	addi x10, x14, 0
	bne x14, x10, crash_forward
	addi x28, x0, 1
	addi x9, x0, 941
	la x24, test_memory-537
	addi x29, x0, 403
	sllw x15, x4, x11
	sraw x6, x15, x26
	sb x7, 952(x24)
	sll x28, x28, 63
	addi x10, x0, -1195
	addi x5, x0, -1138
	addi x23, x0, 113
	rem x17, x10, x10
	addi x18, x0, 1051
	srai x31, x18, 54
	addi x19, x0, -1
	subw x2, x23, x23
	addi x21, x0, 21
	xor x19, x19, x28
	addi x15, x0, 219
	srlw x3, x9, x18
	addi x17, x0, 254
	addi x16, x0, 1647
	and x25, x11, x19
	addw x23, x8, x8
	addi x10, x0, 17
	slli x6, x1, 60
	addi x12, x0, 862
	sraw x2, x15, x15
	la x13, test_memory+314
	or x26, x29, x21
	divuw x15, x25, x4
	la x31, test_memory-1295
	sllw x2, x23, x23
	or x22, x25, x28
	add x14, x28, x28
	la x23, test_memory+2203
	sb x3, 1844(x31)
	addi x29, x0, -1416
	sltu x6, x8, x8
	addi x7, x0, -1243
	la x11, test_memory+1392
	ld x3, -1915(x23)
	addi x4, x0, -1107
	sraw x24, x17, x10
	sraw x30, x16, x7
	divw x3, x13, x9
	addi x23, x0, -1069
	sub x2, x5, x5
	sw x9, -644(x11)
	rem x27, x12, x12
	lb x8, -252(x13)
	sllw x9, x0, x0
	sllw x20, x5, x5
	addi x6, x0, 1109
	la x18, test_memory+1353
	addi x9, x0, 1
	divw x24, x23, x23
	srai x12, x10, 40
	slti x13, x18, -190
	sw x0, -1209(x18)
	rem x30, x0, x0
	addi x27, x0, -445
	addi x8, x0, -779
	xor x7, x27, x27
	la x5, test_memory+452
	addi x2, x0, 1759
	addi x1, x4, -1078
	rem x14, x27, x27
	addi x31, x0, -1337
	la x17, test_memory+2713
	sd x16, -1977(x17)
	addi x15, x6, 408
	addi x18, x0, -1893
	remw x10, x8, x2
	remuw x26, x29, x31
	xor x21, x6, x12
	addi x12, x0, -388
	divuw x7, x18, x12
	sll x9, x9, 63
	ld x3, -60(x5)
	addi x11, x0, -1
	xor x11, x11, x9
	and x20, x24, x11
	or x16, x15, x9
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
	sd x15, 120(x1)
	sd x16, 128(x1)
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
reg_x0_init:	.dword 0xffffffffffff8004
reg_x1_init:	.dword 0x61a36c703749be75
reg_x2_init:	.dword 0xffffffffffff8005
reg_x3_init:	.dword 0xffffffffffffff82
reg_x4_init:	.dword 0x7f41e52e0be7d397
reg_x5_init:	.dword 0xffffffffffffffff
reg_x6_init:	.dword 0xd293faed930f21fe
reg_x7_init:	.dword 0x397ca7a0c82ca0ed
reg_x8_init:	.dword 0xe1feab7924b713e2
reg_x9_init:	.dword 0x538f504ea17f7382
reg_x10_init:	.dword 0x0000000000000000
reg_x11_init:	.dword 0x0000000000000007
reg_x12_init:	.dword 0xf27e9ff39919253a
reg_x13_init:	.dword 0x0000000000000000
reg_x14_init:	.dword 0x0000000000000000
reg_x15_init:	.dword 0x1b8a192c1dd4566a
reg_x16_init:	.dword 0x3d04bba6820808f4
reg_x17_init:	.dword 0x50e035cd2ca9fbed
reg_x18_init:	.dword 0x273249d10f99619f
reg_x19_init:	.dword 0x0800000000000001
reg_x20_init:	.dword 0xf8de99cae4a29ac1
reg_x21_init:	.dword 0xffffffffffffffff
reg_x22_init:	.dword 0x5edbf7666ca6a00f
reg_x23_init:	.dword 0xffffffffffff8002
reg_x24_init:	.dword 0xffffffffffffff89
reg_x25_init:	.dword 0x0800000000000001
reg_x26_init:	.dword 0x370ba4d27a6e3100
reg_x27_init:	.dword 0xffffffffffffffff
reg_x28_init:	.dword 0x949177f7381cc902
reg_x29_init:	.dword 0xffffffff80000003
reg_x30_init:	.dword 0x4cfe73e1c85e10ad
reg_x31_init:	.dword 0xffffffffffffffff

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x31926e4b8871b773
reg_x1_output:	.dword 0xb0fa6e1f227a458e
reg_x2_output:	.dword 0x70e4ed5ed712e9b7
reg_x3_output:	.dword 0xde42a3b6167ca467
reg_x4_output:	.dword 0x5cb189eb417c90f1
reg_x5_output:	.dword 0xeeb3c8c7595ed194
reg_x6_output:	.dword 0x9e68ebfc480e2298
reg_x7_output:	.dword 0x83bcb02d7d0a2069
reg_x8_output:	.dword 0x5841bb7b5593801e
reg_x9_output:	.dword 0x2518e2419d4ffec5
reg_x10_output:	.dword 0x23d7d5f6bc0cf365
reg_x11_output:	.dword 0xe1b7523c194d08a7
reg_x12_output:	.dword 0x69629ca70495fe71
reg_x13_output:	.dword 0x458c85d3d0b14106
reg_x14_output:	.dword 0x95f39eaf43bcf25f
reg_x15_output:	.dword 0xb56d1328531283e1
reg_x16_output:	.dword 0xd67f23a192488196
reg_x17_output:	.dword 0x3c7798e0842b8593
reg_x18_output:	.dword 0xd9845a47b087c13b
reg_x19_output:	.dword 0xe5639497d33af36c
reg_x20_output:	.dword 0x3a432f9fbb1c4dea
reg_x21_output:	.dword 0x3f7cbb749adb897e
reg_x22_output:	.dword 0x6aca12272af587a2
reg_x23_output:	.dword 0xf168b918fae731b4
reg_x24_output:	.dword 0x86062559ca2f1900
reg_x25_output:	.dword 0xa54f78bd3c848027
reg_x26_output:	.dword 0x7ca4a979f3f43daf
reg_x27_output:	.dword 0xf8dc5c9ae29f20b4
reg_x28_output:	.dword 0xa73c9b8f31ac7c1e
reg_x29_output:	.dword 0xe211078c140109c9
reg_x30_output:	.dword 0x4a23d1addacdc674
reg_x31_output:	.dword 0x7e489cf2494b887f

// Memory Blocks
	.align 8
test_memory:
	.dword 0xe3c3177cc1fb36c0, 0xfd549ad6a56c79ee
	.dword 0xd9710ef6a0d6da75, 0x2d8ab2563c1d45bb
	.dword 0xe913d96bff604114, 0x992d4238bcbe6df5
	.dword 0x9b45cccadb20c22a, 0x900e57e289bbc821
	.dword 0x3ab9b922a101ae7d, 0x6be75a6f92d2b393
	.dword 0xc65f8266e1b7e082, 0xc8ddc41a4454e0ff
	.dword 0x24921270f7736011, 0xe04f8dde4c177f4e
	.dword 0x0aa3e74903390d5b, 0x2888315daf67e1b5
	.dword 0x95afc1a5d437871b, 0x6aa96508e15bf304
	.dword 0x3be737b382c7c00b, 0xa720f677f7660a3b
	.dword 0x50f130168edcf799, 0x02b7671b5878f463
	.dword 0xe086892eddaf09da, 0x18d92f13fa82479a
	.dword 0xb09b709cefa54abe, 0x1d76ca626fce536e
	.dword 0x24482f0675376085, 0x3ff5f4423b4a426e
	.dword 0xd28c6c161adcd171, 0x7370b4d084ce40fe
	.dword 0x8c342ec7007b38bd, 0xb52524f4cee2bd6b
	.dword 0x62d61de3134e56cd, 0xdac30c7d8b11153f
	.dword 0xec56c4c7194470a6, 0xfd72be86ba0143d5
	.dword 0x62d4e0690d7cb29f, 0x7e42d8225eab662f
	.dword 0x8c9ef89ace3c8a59, 0x0b60c532b8fd2806
	.dword 0x3b12c98f988c2beb, 0xc55a2f9b99c06e22
	.dword 0x1e4b419f63f9b662, 0xd6e3bc99e091d1ec
	.dword 0x1e8a17469505ab68, 0x5283bc6e5a8ac240
	.dword 0x1f963b7255b2ae42, 0xae45b03ede2c5d88
	.dword 0x4618abfe0cddbdff, 0x9885ca3e14555905
	.dword 0x8f956a7835a35eee, 0x6031cc0adfde8970
	.dword 0xd3369b2a43696750, 0xa8cee7569b1ee0c1
	.dword 0x607c1057446c634e, 0x656a84c95550f54d
	.dword 0x3941c5c3bf2ac42c, 0x0796152516e16616
	.dword 0xeab4107a75f74ebf, 0xbeec50aacc4eb05e
	.dword 0xe4f086c9a29f7d1c, 0x84a088bc70b84a7d
	.dword 0xbf7ee49121a9c791, 0x537eefc324c417f4
	.dword 0x79bd6fbd647b08d9, 0x51cefb52195e8ac1
	.dword 0x9e10a10ecaf1718a, 0x35f7448b394b05f4
	.dword 0x655e1521daf6bed2, 0xd2d48ac0bdbf5581
	.dword 0xfa5709ab4672a862, 0x63abbc5de29e4f58
	.dword 0xb996eb009921b9a9, 0xebb92a059b92f1b3
	.dword 0x78deb5dfff640a45, 0x38dd47fbed8e92ae
	.dword 0x34fe3168d05a89b6, 0xe609a1c4ad41f51c
	.dword 0xff88456c47e0d254, 0x0f16e40a34525697
	.dword 0x237ff0ea435cb782, 0x5ed720c1d188cad8
	.dword 0x7effa4d56e3c0324, 0x37c5b18f8d4b7849
	.dword 0x47b507195b8c164e, 0x11e85c69689589d8
	.dword 0x652761dec89e613d, 0xcb8b9e78aa9bea0e
	.dword 0x4e5f430f1c67e68a, 0xc0be41469d9a1b5f
	.dword 0xbcea101707793d9c, 0x950e9e165723c1c3
	.dword 0x659c91ea844fc85e, 0xe64e338db90cb185
	.dword 0x5c23bd4be6981031, 0xb446719ab6c2975a
	.dword 0x71a33b4ae5047e24, 0x6293df9565108db4
	.dword 0x2495760fc3dae262, 0x758b00a150f63358
	.dword 0x01192dd6e18e7eeb, 0xcb5c9a55c2c1172e
	.dword 0x4914da3ab9e38986, 0x3de541a2b6308d57
	.dword 0x93585bb70a7458f6, 0x99ee51ee8c594184
	.dword 0xbc69c1679c3fb16b, 0x5c64b280817f1a85
	.dword 0xfb322716846ae43b, 0xff6c0e2145714320
	.dword 0x6b8bef7699d9b6d1, 0x067b60ff515d6c24
	.dword 0xa903dea9c0e944e5, 0xc41a00d3a7cc9bbc
	.dword 0xa932d90959ba51ed, 0xc3a2834713cd1e08
	.dword 0x6f2e4a24134abdd3, 0x37e3269110726ae9
	.dword 0x3ce978071d6510e7, 0x12c9a062ab0d151c
	.dword 0xe44246bed8685316, 0xe4c27705ae0a168a
	.dword 0xdc18301bd359a25c, 0x225248c3818a0ddd
	.dword 0xde7473b6f9d43c77, 0x65f1a58596b64156
	.dword 0x6fb6c3360b83efdc, 0x099a5ebe1ce27add

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
