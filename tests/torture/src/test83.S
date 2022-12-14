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
	addi x15, x0, -274
	addi x23, x0, 1
	lui x9, 425677
	sub x29, x8, x8
	addi x6, x15, -8
	addi x18, x0, -1310
	la x16, test_memory-929
	addi x4, x18, -755
	sll x7, x6, x2
	sb x18, 1250(x16)
	addi x5, x0, 1
	addw x26, x16, x24
	remuw x17, x7, x7
	sll x23, x23, 63
	sll x5, x5, 63
	addi x28, x0, -1209
	addi x27, x0, -1
	addi x3, x0, 1307
	addi x30, x0, -196
	xor x27, x27, x23
	addi x12, x0, 1
	sub x13, x30, x30
	and x19, x12, x27
	xor x14, x28, x3
	remuw x11, x31, x31
	addi x31, x0, -1
	xor x31, x31, x5
	or x2, x19, x23
	bge x2, x19, crash_backward
	and x25, x12, x31
	or x21, x16, x5
	sraw x8, x22, x22
	bge x21, x25, crash_forward
	sll x12, x12, 63
	addi x20, x0, -1
	xor x20, x20, x12
	and x10, x24, x20
	or x24, x10, x12
	addi x20, x0, -376
	mulh x24, x2, x18
	addi x1, x0, 1842
	addi x27, x0, -1244
	addi x26, x0, -271
	addi x16, x27, -1851
	bltu x27, x16, crash_forward
	la x31, test_memory+797
	la x11, test_memory+265
	addi x29, x26, -1016
	addi x17, x0, -785
	addi x21, x17, -323
	rem x30, x30, x20
	addi x9, x0, -853
	slt x2, x9, x9
	remu x6, x19, x19
	slliw x22, x12, 9
	addi x19, x0, 1806
	la x13, test_memory-1247
	addi x23, x0, 1
	addi x9, x0, 1510
	or x16, x9, x9
	sraw x3, x1, x1
	remw x2, x18, x18
	bge x21, x17, crash_forward
	mulhsu x4, x19, x19
	lh x14, 37(x31)
	mulhu x24, x17, x17
	subw x6, x20, x20
	addi x16, x0, 337
	la x28, test_memory-1353
	addi x27, x0, -1269
	sll x23, x23, 63
	addi x10, x0, -209
	addw x5, x5, x5
	srl x7, x20, x10
	addi x8, x0, 1620
	addw x30, x29, x17
	sb x19, 567(x11)
	la x3, test_memory-712
	bge x29, x26, crash_forward
	sw x12, 1937(x28)
	sraw x22, x27, x8
	addi x25, x0, -1
	lwu x15, 1835(x13)
	xor x25, x25, x23
	mul x1, x16, x16
	and x18, x9, x25
	lh x9, 1608(x3)
	remw x31, x25, x26
	la x7, test_memory-263
	slt x11, x18, x9
	addi x6, x0, 1
	mulw x22, x11, x11
	ld x19, 1079(x7)
	addi x29, x0, -1790
	addi x16, x0, 949
	addi x11, x0, 554
	sllw x14, x29, x29
	addi x9, x0, -285
	slli x26, x14, 3
	addi x15, x0, -1680
	sll x6, x6, 63
	div x7, x29, x26
	addi x4, x0, -1
	srl x13, x16, x16
	or x12, x6, x23
	addi x21, x0, -1649
	addi x3, x0, -1531
	addi x17, x0, 0
	addi x24, x0, -1853
	mulh x27, x9, x21
	mulh x30, x15, x3
	sra x20, x25, x3
	bne x0, x0, crash_backward
	addi x31, x11, 783
	mulw x30, x15, x22
	la x21, test_memory+2909
	addi x30, x0, -2002
	addi x5, x0, 1367
	sraw x13, x19, x6
	xori x3, x26, -983
	addi x9, x30, -1886
	divw x1, x26, x28
	addi x7, x0, -912
	addi x10, x0, 0
	addi x16, x0, 20
	la x19, test_memory-894
	srlw x2, x24, x5
	la x31, test_memory+1900
	addi x14, x0, 495
	la x20, test_memory+2135
	andi x13, x21, 1861
	remw x15, x29, x29
	sw x23, -1615(x20)
	lwu x27, -1917(x21)
	sra x29, x7, x16
	addi x26, x14, 1845
	blt x26, x14, crash_backward
	addi x13, x0, 218
	addi x15, x0, 513
	mulhu x16, x28, x28
	addi x20, x0, 582
	addi x10, x13, 518
	addi x11, x0, -1050
	bgeu x18, x12, crash_backward
	srlw x24, x15, x15
	xor x7, x11, x11
	xor x29, x20, x20
	lwu x3, -988(x31)
	addi x21, x0, -441
	addi x16, x0, 1559
	or x1, x11, x11
	remu x10, x23, x23
	remuw x2, x1, x1
	xor x4, x4, x6
	la x25, test_memory+1568
	addi x23, x0, -417
	divu x24, x23, x23
	srlw x18, x2, x17
	addi x14, x0, 367
	la x23, test_memory-1263
	la x27, test_memory+573
	la x13, test_memory-1193
	addw x15, x16, x16
	addi x17, x0, 1054
	addi x29, x0, -1964
	sllw x5, x21, x17
	and x8, x30, x4
	addi x24, x0, 593
	sd x4, -445(x27)
	sw x11, 1911(x23)
	div x26, x14, x14
	addi x5, x0, 0
	addi x18, x0, 562
	srl x7, x4, x25
	addi x2, x0, 0
	addi x15, x0, 1707
	rem x21, x18, x8
	addi x23, x18, 0
	addi x14, x23, 0
	addi x3, x0, 147
	remu x20, x8, x8
	xori x17, x10, -1426
	mulhsu x11, x24, x24
	or x28, x8, x6
	subw x26, x3, x22
	srl x31, x29, x3
	addi x10, x0, -23
	addi x11, x0, -349
	beq x8, x28, crash_backward
	subw x27, x18, x18
	add x7, x7, x11
	addi x1, x10, -321
	and x20, x5, x5
	sltu x16, x15, x15
	mulw x24, x3, x3
	divw x21, x11, x11
	sb x3, 1446(x13)
	lbu x12, -1318(x25)
	lb x22, 995(x19)
	addi x25, x0, 1706
	add x23, x12, x12
	srl x19, x9, x8
	sllw x11, x4, x18
	addi x9, x0, -609
	addi x26, x0, -1586
	addi x8, x0, -469
	addi x14, x0, 1207
	addi x27, x0, -1469
	la x13, test_memory-1102
	sw x26, 1546(x13)
	addi x30, x0, 1857
	addi x19, x0, 190
	divw x18, x7, x7
	srl x16, x8, x8
	la x15, test_memory-149
	mulhu x28, x25, x30
	addi x17, x0, 1796
	lb x12, 248(x15)
	addi x10, x17, 177
	la x11, test_memory+747
	addi x22, x0, 2015
	srai x25, x4, 16
	addi x18, x0, 1550
	addi x6, x0, 0
	mulw x25, x2, x2
	remuw x4, x9, x22
	addi x30, x0, -961
	sb x8, -416(x11)
	addi x12, x0, 579
	la x28, test_memory-387
	addi x21, x0, 0
	addi x31, x0, 153
	addi x23, x0, 1058
	divw x16, x18, x18
	remw x15, x6, x26
	addi x5, x0, 301
	and x8, x30, x12
	remw x3, x19, x23
	addi x29, x0, 90
	addi x2, x0, -1735
	sw x29, 1227(x28)
	addi x9, x0, -1358
	addi x18, x0, 1
	addi x4, x0, -1677
	srlw x25, x9, x4
	sll x18, x18, 63
	remu x1, x14, x31
	or x20, x26, x29
	div x24, x5, x5
	addi x22, x0, 844
	addi x11, x0, -1723
	remw x15, x22, x11
	addw x7, x27, x2
	addi x21, x0, -1
	addi x9, x0, -1832
	addi x27, x9, -1059
	addi x26, x0, -1406
	remu x25, x9, x4
	xor x21, x21, x18
	bgeu x27, x9, crash_backward
	and x6, x3, x21
	addi x14, x0, 1
	blt x7, x7, crash_forward
	or x16, x23, x18
	addiw x10, x25, 496
	la x24, test_memory-634
	xor x13, x22, x21
	remw x17, x26, x26
	andi x12, x19, -848
	addi x1, x0, -12
	addi x8, x0, -1784
	slt x23, x1, x0
	la x30, test_memory+124
	la x20, test_memory+852
	bge x16, x6, crash_backward
	sll x14, x14, 63
	addi x2, x0, -697
	sltu x5, x6, x6
	addi x29, x0, 1918
	sb x18, 1232(x24)
	sll x28, x1, x8
	divu x27, x2, x2
	sllw x21, x3, x3
	addi x13, x0, 1
	lhu x31, 354(x30)
	addi x4, x0, 2036
	sb x21, -171(x20)
	addi x17, x0, 1
	addi x9, x0, 289
	sll x13, x13, 63
	remu x3, x21, x21
	addi x7, x0, -1
	mulw x11, x2, x4
	sll x17, x17, 63
	addi x5, x0, -1
	addi x1, x0, 1
	xor x7, x7, x14
	addi x26, x0, -1
	xor x5, x5, x17
	xor x26, x26, x13
	srlw x16, x6, x3
	addi x23, x0, -126
	srlw x12, x9, x23
	addi x27, x0, 1
	and x25, x18, x26
	remuw x20, x12, x12
	sltu x22, x29, x29
	and x24, x25, x5
	and x15, x9, x7
	lui x16, 59462
	or x19, x10, x14
	addi x23, x0, 1174
	addi x11, x0, -1105
	addi x19, x0, -63
	sll x27, x27, 63
	or x6, x24, x17
	addi x30, x0, -1
	or x10, x25, x13
	addi x2, x0, 569
	sub x3, x11, x2
	addi x16, x0, -1161
	addi x22, x23, 296
	blt x22, x23, crash_backward
	addi x15, x0, 1919
	rem x14, x19, x15
	la x20, test_memory-702
	sll x1, x1, 63
	addi x18, x0, -1
	sub x31, x21, x6
	addi x3, x0, -1273
	xor x18, x18, x1
	addi x11, x0, -546
	blt x25, x10, crash_backward
	addw x24, x3, x3
	addi x17, x0, -794
	addi x6, x0, -168
	and x28, x21, x18
	addi x5, x0, 969
	or x8, x28, x1
	sllw x22, x6, x6
	la x23, test_memory+1902
	addi x12, x0, -1348
	divu x7, x17, x17
	xor x30, x30, x27
	add x29, x16, x12
	addi x10, x0, 969
	or x13, x16, x14
	addi x19, x0, 1249
	addi x17, x0, 67
	la x12, test_memory+1947
	addi x16, x0, -650
	mulhsu x31, x17, x16
	lb x9, 1465(x20)
	addi x28, x0, 1
	sll x28, x28, 63
	la x24, test_memory+112
	addi x15, x0, 0
	sb x25, -1693(x23)
	addi x13, x0, -1
	srliw x8, x26, 8
	sub x6, x18, x15
	mulhu x14, x11, x19
	addi x29, x0, 0
	lh x7, 700(x24)
	xor x13, x13, x28
	and x21, x6, x30
	addi x26, x10, 876
	xor x6, x14, x12
	addi x8, x0, 1
	sltu x16, x23, x3
	bgeu x10, x26, crash_backward
	and x18, x14, x13
	or x1, x18, x28
	or x4, x9, x27
	addi x25, x0, 952
	rem x19, x7, x7
	addi x22, x25, 409
	addi x11, x0, -1840
	addi x17, x0, 1158
	mul x10, x20, x20
	addi x3, x17, 675
	sd x28, -1459(x12)
	bltu x4, x21, crash_backward
	sll x2, x5, x5
	addi x23, x0, -1278
	la x29, test_memory+2106
	remu x31, x11, x11
	sll x8, x8, 63
	addi x9, x0, -1
	la x7, test_memory+366
	sraw x26, x23, x23
	sb x14, -1357(x29)
	la x16, test_memory-891
	lh x15, 522(x7)
	sw x14, 1779(x16)
	addi x15, x9, 0
	addi x1, x15, 0
	ori x12, x20, 369
	sraw x29, x14, x26
	lui x30, 318208
	addi x20, x17, 1045
	addi x3, x0, -712
	la x5, test_memory-1600
	la x18, test_memory+1063
	slliw x21, x22, 25
	addi x6, x0, 1749
	xor x9, x9, x8
	blt x0, x0, crash_forward
	and x24, x3, x9
	addi x27, x0, 0
	addi x10, x0, 0
	or x14, x26, x8
	lhu x7, 1728(x5)
	bltu x27, x10, crash_forward
	blt x15, x1, crash_backward
	srlw x4, x3, x3
	mulhu x19, x6, x6
	sb x17, -935(x18)
	bgeu x24, x14, crash_forward
	addi x31, x0, 1811
	srl x23, x1, x1
	addi x11, x0, -1118
	sllw x13, x31, x11
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
	sd x17, 136(x1)
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
reg_x0_init:	.dword 0xa6c7e46e7a37f36f
reg_x1_init:	.dword 0x0000000000000004
reg_x2_init:	.dword 0x409ea6846757d43f
reg_x3_init:	.dword 0xb61c80a350b367e3
reg_x4_init:	.dword 0xffffffff80000007
reg_x5_init:	.dword 0xfffffffffffffffb
reg_x6_init:	.dword 0xb6c9d549d45d5ee9
reg_x7_init:	.dword 0xad6936245f48db50
reg_x8_init:	.dword 0xffffffff80000008
reg_x9_init:	.dword 0xffffffffffffff85
reg_x10_init:	.dword 0xffffffffffff8003
reg_x11_init:	.dword 0x871c1db5e9b5a6da
reg_x12_init:	.dword 0xffffffffffff8007
reg_x13_init:	.dword 0xffffffffffffff81
reg_x14_init:	.dword 0x0000000000000005
reg_x15_init:	.dword 0xffffffff80000001
reg_x16_init:	.dword 0x0000000000000000
reg_x17_init:	.dword 0xffffffff80000008
reg_x18_init:	.dword 0x72d5f4d8873ee933
reg_x19_init:	.dword 0x3267caf6200b3676
reg_x20_init:	.dword 0xffffffff80000003
reg_x21_init:	.dword 0x1f98ee4d0a47f28b
reg_x22_init:	.dword 0x9c47cf95976b655f
reg_x23_init:	.dword 0x04a5dcf1b7cef322
reg_x24_init:	.dword 0xaf58a8b6121c35e9
reg_x25_init:	.dword 0x78ea1934d0610c79
reg_x26_init:	.dword 0x0b2295d32881c648
reg_x27_init:	.dword 0xdf3ecd80450c6c44
reg_x28_init:	.dword 0x9e0bba960ea2fc2f
reg_x29_init:	.dword 0x2625aa233d63391b
reg_x30_init:	.dword 0xffffffffffffff82
reg_x31_init:	.dword 0x0000000000000000

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0xd87d8da83b0abc26
reg_x1_output:	.dword 0x79f16a960a45732d
reg_x2_output:	.dword 0x761c4804eafaf1b3
reg_x3_output:	.dword 0xe690bf24b1d0d163
reg_x4_output:	.dword 0x95726e3e24480128
reg_x5_output:	.dword 0x62c48503f13f59ad
reg_x6_output:	.dword 0xe638824e333b9192
reg_x7_output:	.dword 0x3edf4fe6524084e0
reg_x8_output:	.dword 0xc6bf9d4ae0660282
reg_x9_output:	.dword 0xe548c8966672c3c9
reg_x10_output:	.dword 0xa8295ceac9832547
reg_x11_output:	.dword 0x063540162fef7d84
reg_x12_output:	.dword 0xa5f2a5482a54d55e
reg_x13_output:	.dword 0xa4a0d10ac8681f0e
reg_x14_output:	.dword 0x7dc23ae771aa2429
reg_x15_output:	.dword 0x5d90b357bc4c1019
reg_x16_output:	.dword 0x03f878f5ff010bdf
reg_x17_output:	.dword 0xfda3a606ce98a11f
reg_x18_output:	.dword 0x258da7d4e99bddc4
reg_x19_output:	.dword 0x362493705a7146ba
reg_x20_output:	.dword 0xc4a0b7d749c2df99
reg_x21_output:	.dword 0x8060d3938aafb631
reg_x22_output:	.dword 0x8af064486b7dcc54
reg_x23_output:	.dword 0x1e35b0c93a80b755
reg_x24_output:	.dword 0xb89502b1ce982c14
reg_x25_output:	.dword 0xafdf129bae1bbf8e
reg_x26_output:	.dword 0x0df1825c4d7eb74e
reg_x27_output:	.dword 0x334b72f1ecf0aa30
reg_x28_output:	.dword 0x0a36601312b3394c
reg_x29_output:	.dword 0xfed7817070882213
reg_x30_output:	.dword 0xac39922bbe77a5d8
reg_x31_output:	.dword 0x9a96191bfa089061

// Memory Blocks
	.align 8
test_memory:
	.dword 0xce12b0c7cb285634, 0x566f6c43ad1aa4b1
	.dword 0xb51ade5899c8a14c, 0x5aac8a9e5705ca55
	.dword 0xebe43464c8c4432e, 0x5232a5afed8e1eef
	.dword 0x5ab4b88a701b47b9, 0xf403b77187a2be4a
	.dword 0x814d1dc16f556c94, 0xc2d06f3023847766
	.dword 0xe283d5e62df52e62, 0x9fc188b497fa3ed4
	.dword 0x13c1377685f1f533, 0xf75cf1a4c1a9f244
	.dword 0x6ff1bb9b3c44143d, 0xaecd6129e001415c
	.dword 0x634f9865950490cb, 0xc31945d2bf83cfca
	.dword 0x63b53b5a924de474, 0x1d402db7af10e49c
	.dword 0x743e6832162a2e90, 0x34040ce0d4043ace
	.dword 0x1315ffd9f3ae88e8, 0x109605e7933ac724
	.dword 0x71aab3c0712a73ac, 0x74b498dbdc3d873a
	.dword 0x2a652950804d8ca9, 0xa1435c67ed61add9
	.dword 0x5f9e51be209505ba, 0x6242a532f4cec08b
	.dword 0x663cf9fdcf758e7f, 0x028fbf89e8507a70
	.dword 0x2f4dd7185fcda54d, 0xf53c9f3c45e38852
	.dword 0x6f5992a20a778364, 0xd5d829c4b64971f7
	.dword 0xac709b8473911867, 0xbaee7eade2e144b7
	.dword 0x8d1cbf00de83c908, 0x389ae2332dc7d34d
	.dword 0xe6e4cdf7f53ce502, 0x427b2e25681b9ef1
	.dword 0x930ed265a8a3084c, 0xe6eeed127b6dbda5
	.dword 0x3011992d8863db8b, 0x8f8a83a2322a51cf
	.dword 0xe5ee941bf1f8e7c7, 0x9e490c42a4586707
	.dword 0x7fb9582709797161, 0x5a8dc90823ba4832
	.dword 0xb5223bf62dba8e44, 0xc6b04fce0154a2cf
	.dword 0x182ddaa4939deb5b, 0x24dcd49feff40b90
	.dword 0x8d9b7ec7ad82f542, 0x4ac4365bb0adb82c
	.dword 0x8e18b9aeb2d5583f, 0xed2db195c8d18273
	.dword 0x3b80aaeaebef0b73, 0x71365dbb399088a2
	.dword 0xec49bc10b7335b4c, 0x9f28d87921fcfef8
	.dword 0x882cd4bca0aba73d, 0x7c99c35e413d0689
	.dword 0x883d4ad964c5c6b1, 0x2f1bf7bef2139d51
	.dword 0xc259131e8c5f493c, 0xd0a994db3f7ffb8b
	.dword 0x404cf5db2b480613, 0xb10d4c3f7d64f243
	.dword 0x2680cbf48e19aebe, 0x5e69906a952f1f2a
	.dword 0x48bc082da7e9590b, 0xa0b189b53e8a09a9
	.dword 0x2dd310a95f333445, 0x22c1f56d44a17d38
	.dword 0x61122cad72afdda6, 0xfe065340f26db4ef
	.dword 0x82430aa945c60809, 0x957904e2d15e2c5c
	.dword 0x4776227720426ae3, 0xd89343e826a02997
	.dword 0xd68977e5292b2c74, 0x00ac11f3797b5494
	.dword 0x83fa816ff0233b38, 0x61938711ea0fefb8
	.dword 0x29293751b7254aa4, 0xdb2a2267106785ae
	.dword 0x320e8ebdd6a5670e, 0xa38a010a6982207a
	.dword 0x09c8e568b3a354ec, 0x6a521f2e40175dcd
	.dword 0x4285214c71272f40, 0x8c0207825263f49b
	.dword 0x507388a82044f953, 0x225694d8dad17fea
	.dword 0xcce39649fa5b17a0, 0x0a7eaa0bcfcfa2ed
	.dword 0x56924e0fa40ae413, 0x7609041e3512da51
	.dword 0x6aead5aa83a9d173, 0xa5da8aa0d6de8ed5
	.dword 0x29b155a57edcd21b, 0x098ec25934453d20
	.dword 0x458c66a48ff6f5f0, 0x0f9a461e40a2c6ce
	.dword 0x60618ef25fcf738e, 0x85a16a05dc4240cb
	.dword 0x6ebd9434ab5290c4, 0xeaf36cc1e161d2e4
	.dword 0x31c9a581a8541e42, 0x9b3cdb47aadc7c9b
	.dword 0x5fdaa197c2617a90, 0x338a0ab265ead33a
	.dword 0x30b7fd6801bc5042, 0x21dccc65fde90d2a
	.dword 0xf88c0ed2cb868369, 0x6e26c0764121ee84
	.dword 0x9347bfb7adbb024c, 0x9cabea4815836ae8
	.dword 0x265fed2ccb166d58, 0x13e76b795d1b108d
	.dword 0x406af70aa5cdca54, 0xdd4688fe01859099
	.dword 0x718943b05b20b6d8, 0x76ac5e8b945df8b3
	.dword 0xf4ebbbff70b7cdff, 0xecf2e438ee6e71d5

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
