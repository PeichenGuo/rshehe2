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
	addi x20, x0, -521
	addi x19, x0, 473
	sllw x22, x5, x5
	or x3, x12, x27
	la x18, test_memory-342
	addi x23, x0, 775
	addi x14, x7, 0
	addi x5, x0, -609
	sraw x29, x5, x5
	remuw x26, x23, x30
	addi x21, x0, 1486
	addi x13, x0, -867
	addi x2, x0, 1779
	addi x12, x0, 438
	lbu x9, 343(x18)
	mul x3, x22, x22
	addi x30, x0, -371
	sllw x17, x13, x13
	addi x24, x20, -449
	addi x4, x0, 326
	remw x11, x19, x2
	addi x15, x0, -1752
	addi x25, x14, 0
	addi x22, x0, 346
	addi x6, x22, 1833
	sll x8, x12, x15
	xor x16, x23, x21
	srl x7, x14, x28
	addi x10, x0, 1757
	addi x28, x0, 1675
	remw x31, x10, x28
	mul x27, x30, x4
	addi x4, x0, 1069
	addi x24, x0, -1229
	la x31, test_memory-350
	lh x29, 706(x31)
	addi x23, x0, -1602
	sll x2, x23, x23
	addi x25, x0, -1865
	addi x17, x0, 591
	mulhu x14, x4, x20
	addi x30, x0, -385
	mulh x22, x4, x24
	addi x18, x0, 430
	addi x11, x0, 372
	addi x20, x0, 1996
	andi x12, x20, 325
	addi x8, x0, -341
	addi x19, x30, -425
	addi x21, x0, 2001
	addi x3, x0, -1420
	addi x28, x0, 1
	sll x28, x28, 63
	divw x7, x8, x3
	addw x15, x9, x21
	subw x13, x25, x20
	addi x27, x0, -1976
	sll x9, x18, x27
	addi x13, x0, 324
	div x27, x3, x11
	remw x25, x13, x13
	divuw x18, x31, x11
	slliw x20, x20, 1
	sll x6, x17, x11
	addi x7, x14, 0
	addi x2, x0, 1920
	addi x19, x7, 0
	bltu x7, x19, crash_forward
	sraw x15, x10, x10
	addi x29, x0, -1162
	addi x1, x0, 772
	sllw x31, x2, x2
	addi x5, x0, -1
	subw x4, x2, x2
	addi x24, x0, 0
	sub x12, x13, x30
	srl x26, x21, x1
	addi x9, x0, 0
	xor x5, x5, x28
	and x16, x17, x5
	mulh x14, x29, x29
	bltu x24, x9, crash_backward
	addi x30, x0, 743
	divuw x8, x29, x30
	or x10, x16, x28
	addi x4, x0, 772
	addi x15, x0, 1292
	slliw x30, x1, 24
	addi x3, x0, -1195
	mulhu x9, x15, x15
	la x13, test_memory-225
	addi x11, x0, 164
	addi x10, x0, 837
	slli x8, x9, 17
	subw x5, x6, x13
	addi x25, x0, -1627
	la x9, test_memory-320
	addi x31, x0, -1768
	addi x12, x0, 2039
	remu x29, x25, x25
	sraiw x26, x4, 14
	addi x5, x0, -618
	addi x21, x3, -1240
	divuw x2, x31, x31
	sw x18, 1248(x9)
	addi x8, x0, 1
	addi x22, x4, 100
	bge x21, x3, crash_backward
	sll x8, x8, 63
	sllw x24, x29, x22
	addi x15, x0, -1
	slti x16, x31, 463
	addi x28, x12, 1674
	addi x17, x10, 43
	sltu x6, x11, x11
	andi x18, x4, 1350
	ld x14, 385(x13)
	la x9, test_memory+472
	la x19, test_memory+1577
	addw x11, x19, x4
	bltu x17, x10, crash_forward
	xor x15, x15, x8
	addi x29, x12, -1705
	ld x20, -1017(x19)
	addi x1, x0, -70
	addi x21, x0, -541
	sub x7, x1, x24
	addi x31, x0, -807
	addi x6, x0, 0
	lw x3, -384(x9)
	mulhsu x25, x23, x23
	sltu x16, x31, x31
	sltu x23, x5, x1
	beq x12, x28, crash_forward
	and x27, x31, x15
	or x30, x27, x8
	addi x26, x0, 0
	xor x24, x2, x25
	la x13, test_memory+2468
	slt x2, x21, x21
	addi x19, x0, 356
	addi x8, x0, 1990
	addi x29, x0, 1747
	ld x14, -1580(x13)
	bne x21, x21, crash_forward
	sll x16, x24, x24
	addi x7, x0, -1082
	addi x15, x0, -1000
	remuw x12, x15, x15
	addi x28, x0, 1
	addi x22, x0, -1783
	sll x28, x28, 63
	mulhsu x5, x7, x7
	addi x4, x0, 1625
	srl x2, x0, x31
	andi x16, x30, -890
	addi x25, x0, -1162
	addi x24, x0, 1874
	sub x31, x4, x24
	addi x5, x0, 1262
	addi x26, x0, 1691
	sra x21, x15, x15
	or x3, x19, x26
	addi x20, x25, -159
	addi x2, x0, 486
	addi x17, x0, -950
	addi x10, x0, 998
	sraw x18, x8, x10
	srl x4, x13, x18
	bltu x15, x15, crash_backward
	addi x8, x0, -1148
	or x4, x22, x3
	addi x23, x0, -1
	srl x12, x5, x5
	addi x19, x17, 0
	srai x14, x24, 8
	xori x24, x31, 447
	addw x21, x13, x10
	la x5, test_memory-1608
	lw x20, 1644(x5)
	addi x9, x0, -464
	addi x15, x0, -527
	addi x12, x0, 1670
	sll x27, x22, x17
	xor x23, x23, x28
	srl x26, x2, x2
	la x6, test_memory-336
	srlw x31, x12, x12
	addi x4, x20, 0
	sw x10, 1028(x6)
	remu x18, x8, x8
	bne x11, x11, crash_forward
	addi x16, x15, -821
	addi x10, x4, 0
	srliw x3, x17, 28
	and x11, x0, x23
	addi x7, x19, 0
	addi x25, x12, 557
	or x30, x11, x28
	and x13, x10, x10
	bge x12, x25, crash_forward
	bltu x30, x11, crash_backward
	mulw x1, x29, x9
	la x6, test_memory+380
	addi x3, x0, 1
	addi x1, x0, 1815
	sll x3, x3, 63
	sll x16, x19, x19
	add x22, x4, x4
	sd x16, 508(x6)
	subw x24, x14, x14
	addw x15, x7, x7
	addi x28, x0, -1387
	srl x12, x29, x29
	la x26, test_memory+2188
	rem x8, x28, x28
	addi x7, x0, -1
	addi x23, x0, 312
	xor x14, x15, x5
	xori x2, x2, -276
	addi x31, x0, 244
	addi x5, x0, 1358
	mulw x13, x31, x31
	xor x7, x7, x3
	remuw x24, x28, x28
	addi x28, x0, -1699
	and x19, x4, x7
	addi x21, x0, 555
	addi x2, x0, 2007
	srl x20, x5, x5
	addw x30, x1, x21
	la x6, test_memory-1644
	addi x14, x0, 189
	addi x9, x0, -1745
	la x12, test_memory+127
	blt x0, x0, crash_forward
	remu x29, x4, x2
	remuw x16, x28, x28
	addi x15, x0, -1202
	addi x24, x0, -362
	la x22, test_memory+1947
	lb x31, 583(x12)
	or x25, x28, x3
	remuw x8, x2, x14
	addiw x5, x16, 212
	sb x31, -1584(x22)
	mulh x21, x21, x21
	div x27, x9, x9
	blt x19, x25, crash_forward
	lb x13, 1936(x6)
	srlw x28, x15, x24
	addi x20, x0, 1768
	addi x16, x20, 1662
	lhu x4, -1172(x26)
	addi x10, x23, 1262
	addi x17, x0, -1978
	addi x11, x0, -2021
	addi x1, x0, -1869
	addi x29, x0, 1476
	srlw x18, x17, x11
	remu x30, x1, x29
	la x25, test_memory+772
	srai x11, x8, 26
	addi x8, x0, 1711
	remuw x16, x28, x6
	addi x28, x0, 1578
	la x31, test_memory+2129
	sd x7, -1409(x31)
	lw x5, -52(x25)
	addi x10, x0, 1
	addi x24, x0, -545
	sll x10, x10, 63
	div x19, x7, x15
	div x29, x29, x29
	addi x27, x0, -1
	sll x18, x8, x8
	mulhsu x6, x30, x5
	la x20, test_memory+171
	addi x12, x0, -1529
	addi x23, x0, -425
	addi x7, x0, -1551
	addi x26, x0, -704
	addi x15, x0, 1901
	addi x16, x0, 1598
	addi x5, x0, -1821
	remu x2, x1, x3
	divuw x22, x7, x7
	xor x27, x27, x10
	lw x3, -47(x20)
	mulh x1, x23, x23
	add x8, x5, x5
	remu x21, x12, x15
	and x11, x22, x22
	sraiw x17, x23, 25
	mulhsu x14, x28, x24
	addi x6, x0, 1098
	divw x18, x16, x6
	and x30, x22, x27
	addi x8, x0, 807
	addi x15, x0, -92
	divu x9, x26, x26
	addi x1, x0, -1554
	addi x17, x0, -718
	addi x12, x0, -906
	sub x24, x8, x15
	addi x6, x0, -1651
	la x3, test_memory+46
	or x4, x13, x10
	la x14, test_memory+2642
	add x18, x1, x12
	sll x5, x6, x6
	addi x11, x0, -1236
	and x16, x26, x21
	or x8, x10, x8
	remu x22, x11, x29
	sra x5, x14, x14
	xor x13, x6, x4
	addi x24, x0, -1779
	addi x16, x0, 1050
	addi x8, x0, -1022
	addi x5, x8, -692
	addi x1, x0, -638
	or x4, x16, x16
	la x18, test_memory-1162
	add x28, x17, x17
	mul x27, x13, x18
	lbu x10, 1290(x18)
	addi x12, x0, -356
	sltu x6, x12, x12
	addi x9, x0, 1145
	mulh x26, x1, x1
	add x30, x9, x9
	mul x15, x24, x24
	la x29, test_memory-734
	sw x5, -1718(x14)
	lh x7, 1106(x29)
	addi x20, x0, -165
	lbu x23, 880(x3)
	la x2, test_memory-1401
	sh x1, 2037(x2)
	la x19, test_memory+1003
	sllw x21, x11, x20
	la x25, test_memory-758
	lw x31, -287(x19)
	sb x21, 1473(x25)
	addi x24, x0, 1
	divw x27, x4, x4
	la x23, test_memory-145
	addi x25, x0, -1048
	addi x11, x0, 314
	addi x27, x0, 1402
	mulw x8, x19, x19
	addi x10, x0, 799
	addi x17, x0, -737
	addi x14, x0, -542
	addi x1, x0, -1022
	addi x28, x1, -374
	sll x24, x24, 63
	addi x13, x0, 0
	addi x3, x0, -1
	divuw x4, x11, x11
	xor x3, x3, x24
	addi x5, x0, 1535
	lb x20, 1152(x23)
	xor x22, x27, x27
	addi x21, x0, -345
	addi x30, x0, 174
	addi x15, x0, 0
	mulhu x2, x17, x14
	addi x6, x21, -333
	and x29, x7, x3
	addi x26, x0, 1286
	remuw x18, x26, x26
	addi x19, x0, -1899
	srlw x1, x18, x18
	divw x31, x10, x5
	or x7, x29, x24
	slt x9, x25, x19
	addi x11, x0, 1346
	addi x16, x0, -1821
	bltu x13, x15, crash_forward
	sllw x12, x30, x16
	addi x28, x0, -429
	div x4, x11, x28
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
reg_x1_init:	.dword 0x0000000000000005
reg_x2_init:	.dword 0x111f9e9306a15832
reg_x3_init:	.dword 0x0000000000000000
reg_x4_init:	.dword 0xa9655210d31ec327
reg_x5_init:	.dword 0x0000000000000004
reg_x6_init:	.dword 0xd14a90dd164ce6af
reg_x7_init:	.dword 0xd4e22f467471ead6
reg_x8_init:	.dword 0x6865f79da40594a4
reg_x9_init:	.dword 0xffffffffffffffff
reg_x10_init:	.dword 0xb6fb9af74865e2d5
reg_x11_init:	.dword 0x37d0924ae2daa7ae
reg_x12_init:	.dword 0xffffffffffffff81
reg_x13_init:	.dword 0x0000000000000005
reg_x14_init:	.dword 0x7fbe801b41cf3a64
reg_x15_init:	.dword 0x0000000000000004
reg_x16_init:	.dword 0xffffffffffff8008
reg_x17_init:	.dword 0xffffffffffffffff
reg_x18_init:	.dword 0xffffffff80000001
reg_x19_init:	.dword 0x17f664212207937b
reg_x20_init:	.dword 0x0000000000000004
reg_x21_init:	.dword 0xa74599e0e69d0ea7
reg_x22_init:	.dword 0x292b11a76fa58d93
reg_x23_init:	.dword 0x0000000000000000
reg_x24_init:	.dword 0x1af9050d312e7920
reg_x25_init:	.dword 0xffffffffffffffff
reg_x26_init:	.dword 0x0000000000000000
reg_x27_init:	.dword 0x89b4bde71fcefe7f
reg_x28_init:	.dword 0x2a93f174b8bac11f
reg_x29_init:	.dword 0xffffffff80000003
reg_x30_init:	.dword 0xffffffffffff8005
reg_x31_init:	.dword 0x5903f0fe3684bb8f

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x7eaf04c614ae2872
reg_x1_output:	.dword 0x43bf9769814e6f15
reg_x2_output:	.dword 0xff520ff662e30cf0
reg_x3_output:	.dword 0x9d87783fd594b524
reg_x4_output:	.dword 0x8ec193c09a6dce0b
reg_x5_output:	.dword 0x900c33aa515b129f
reg_x6_output:	.dword 0x6c959672cd0798f4
reg_x7_output:	.dword 0x3b24e2b2e28873a1
reg_x8_output:	.dword 0x393b5388371bcd0c
reg_x9_output:	.dword 0x40873cdf638846f6
reg_x10_output:	.dword 0x85b7b84f50c265ba
reg_x11_output:	.dword 0x60eb1f6e19a22e15
reg_x12_output:	.dword 0x340286c99816ad7d
reg_x13_output:	.dword 0xf648c4e14d08384c
reg_x14_output:	.dword 0xaa3642d840dd8e44
reg_x15_output:	.dword 0x0f4470bd02b11d3d
reg_x16_output:	.dword 0x7fef4d9570d012fd
reg_x17_output:	.dword 0xd7c2938e47772a88
reg_x18_output:	.dword 0x7df6d300f813ee6b
reg_x19_output:	.dword 0x90cbab2e2e4bd8c9
reg_x20_output:	.dword 0x1afc6ddf03b51b3c
reg_x21_output:	.dword 0xbe976346dbdb3bc4
reg_x22_output:	.dword 0xceeba5dee990e95a
reg_x23_output:	.dword 0x4b0aba1567f9c1df
reg_x24_output:	.dword 0xbf98abfe43540c81
reg_x25_output:	.dword 0x0d6d2d7063e9f6d0
reg_x26_output:	.dword 0x2f51f92d4e328011
reg_x27_output:	.dword 0xa1d53408cb2f3d96
reg_x28_output:	.dword 0x5e9ab33038195424
reg_x29_output:	.dword 0x6c0c86f2967db5ac
reg_x30_output:	.dword 0x082bfbc94687b7e3
reg_x31_output:	.dword 0x7eb0ff6514a6bf7c

// Memory Blocks
	.align 8
test_memory:
	.dword 0x6f998e14c83dd515, 0x605f0cbe4764d411
	.dword 0xf9d84e338ec550f8, 0x09ff06c870e0a411
	.dword 0x29abaf2f58c08654, 0x3b1ee03f9df4b1e9
	.dword 0x7ae913158f2acccc, 0x67d5fd9497d3db49
	.dword 0x34ce8968ff856176, 0x174933f0490a85d3
	.dword 0xc79c8fb8a891c4ae, 0xd6c134743d19630e
	.dword 0x6a78b88d27f3a127, 0xbba5e7c5a263ffa0
	.dword 0x5e995c891a219042, 0x62d57dcebb1c91bc
	.dword 0xca18b9cb9cad4fa2, 0x05f635c04679bad9
	.dword 0x79d02599c2613c00, 0x7bce2256671a30a4
	.dword 0xdc82343ae23a253b, 0x279c6e5f61458136
	.dword 0x2ca4fb224b21cfb2, 0x2123e57c2af86689
	.dword 0x5f8bd14fafbfb6d6, 0x63cec526d39e5d28
	.dword 0x12c231fa04fae4fa, 0x035019f6d9417225
	.dword 0x395fa5691c20f46c, 0x2fa72d2260147c50
	.dword 0xc536d420d4538dc9, 0xedadc6442ecb34a5
	.dword 0x61402844c71ef78d, 0x8ca2455e4176e206
	.dword 0x9dc2a13917318ae9, 0x08aad91f9cd58c29
	.dword 0xa1c3bd87df5521d9, 0x365f5569e86ce9d3
	.dword 0xaa719f085848d275, 0x083b6e0fc5a97e46
	.dword 0xd6c8cd3c672a8b86, 0xc4b359dd20cd99f7
	.dword 0x15e939f8f905665c, 0x26c121da0d033283
	.dword 0x8fa46c4a8412c1dd, 0x336120ce8a9ec5e4
	.dword 0xb308f597b9897ae1, 0xe0d87709bcd0bcdf
	.dword 0xcc4d9505f4b7d5bd, 0x5908765e25e600c0
	.dword 0xccc0ad1a2ad9ed1d, 0xc2be4a6e060fb849
	.dword 0xe286efa103e7ba17, 0xb71e612aabb55fe7
	.dword 0xd53e63d1a4b3097c, 0x3c3f579994d3b127
	.dword 0x76492ab46f5ef270, 0xb5006ed9921e0d67
	.dword 0x11d5a5bd4dbfa23c, 0x5c63cd6485bf5fd0
	.dword 0xd6efe3bac2ca9162, 0xc8751095e3f2aa83
	.dword 0xeb4277f7222c75f1, 0x8a48f26a4a7ab312
	.dword 0x00eb1f96989b871b, 0x462b078988838231
	.dword 0x1c29d943a9d1e604, 0xccdad98871efaaac
	.dword 0xf9f7530c0b853fdc, 0x9509e16932be8b9c
	.dword 0x91f9d2883c6dfd2f, 0xf7602663585801d5
	.dword 0x3c1dfb4164c1927b, 0x476584e6f25d3ca2
	.dword 0x768b174f47a8c602, 0x1d09e1e07a65a9b4
	.dword 0x6a00c642bc73fee1, 0x2d66ce3d4d0a2c56
	.dword 0x8326364607dcf162, 0x01f95eac861013e5
	.dword 0x95314b80d2c63c8d, 0xcc3b3ba8d8a8857f
	.dword 0x6fce59bf89decd04, 0xdc6e2db74ad04cfa
	.dword 0xf5975450e1981910, 0xc5dda9ea8b274918
	.dword 0x0bf39831993b89f6, 0x9d0e22b15a55e6f8
	.dword 0x0f27b46987dca68f, 0xa58a20ca578a60ce
	.dword 0x4feed4b773aad317, 0x2179689381feb3d6
	.dword 0xe96db26838feba44, 0x352eaf8d3b138185
	.dword 0x80e92f8bb7acb39a, 0x289ca619449b5001
	.dword 0x2aa9004bcbe6bafd, 0xf86b598290b4ddd3
	.dword 0x53110695098dcd87, 0x9c733241234a7cdb
	.dword 0x9e8243f8de7bbf9c, 0xa9f3127b5c37a884
	.dword 0xd03e85d7574be03a, 0xc92b58cdd3754b37
	.dword 0xee982fb7c3b9fd95, 0xa05fcb4c41c06714
	.dword 0xab69c7fc79149ee2, 0x65deaec7773615df
	.dword 0x19672ab49bb88773, 0xcfcb8e4f099b1438
	.dword 0x939486d22958d703, 0xe75076f78cb44c0f
	.dword 0x824d897f06385b53, 0xb5c0abdfe3791255
	.dword 0x0b095bcbf4ade6f5, 0x7164166e903f0bf7
	.dword 0x4bae568b9996c167, 0xdd52f6e0178aee07
	.dword 0x4212907ecef78462, 0xe03d99003c308d3c
	.dword 0x0a74aab2e93cfa74, 0xd1741136771ff09c
	.dword 0x768a7f267093d2cc, 0xce3e45c1e8e45b77
	.dword 0xc87995b06fe73e54, 0x43d4c848a9b58297
	.dword 0x63e7831f7b83ca05, 0x304f438fce4a60b4

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
