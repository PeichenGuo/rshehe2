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
	la x25, test_memory+1105
	and x27, x9, x9
	remuw x3, x6, x6
	slt x18, x31, x8
	la x23, test_memory-1622
	addi x24, x0, 930
	addi x26, x0, 300
	sh x1, -481(x25)
	addi x2, x0, -1902
	sll x31, x26, x26
	sllw x8, x8, x8
	addi x29, x0, 1
	sra x11, x2, x2
	sraw x20, x6, x6
	mulw x15, x19, x19
	mulhsu x28, x24, x24
	lui x9, 745061
	la x3, test_memory-246
	addi x15, x0, 1
	addi x12, x0, 1348
	srl x6, x26, x26
	la x25, test_memory-584
	sb x29, 1423(x25)
	sll x15, x15, 63
	addi x8, x0, -781
	la x21, test_memory+1279
	addi x27, x0, 1212
	lh x18, 1082(x3)
	divw x28, x27, x27
	add x30, x12, x12
	sll x29, x29, 63
	sub x6, x5, x20
	sraiw x19, x29, 17
	addi x22, x0, -1257
	addi x4, x0, -1
	sra x17, x22, x22
	xori x9, x10, 1439
	lh x5, 1718(x23)
	addi x24, x0, 1188
	sd x18, -1183(x21)
	divu x26, x9, x9
	addi x2, x0, -1
	xor x2, x2, x15
	addi x28, x0, 1956
	addi x1, x0, -1857
	la x9, test_memory+2654
	addi x16, x1, -812
	beq x1, x16, crash_backward
	mul x11, x8, x24
	addi x6, x0, -239
	xor x4, x4, x29
	and x7, x28, x4
	lhu x30, -1650(x9)
	div x22, x28, x28
	mulh x19, x6, x6
	addi x17, x0, 1940
	addi x27, x17, 446
	addi x26, x0, -129
	la x21, test_memory-1635
	blt x27, x17, crash_backward
	and x31, x8, x2
	lb x3, 1680(x21)
	addi x12, x0, 2003
	addi x23, x0, -1890
	addi x17, x0, -1138
	addi x27, x0, -252
	srli x6, x6, 26
	or x10, x27, x29
	sllw x28, x17, x17
	addi x5, x0, 1658
	sub x18, x12, x5
	addi x16, x0, 0
	la x22, test_memory+2330
	addi x1, x0, 0
	addi x14, x0, 0
	sltu x21, x27, x27
	addi x19, x0, -227
	addi x13, x0, 0
	lb x3, -1924(x22)
	bltu x10, x7, crash_backward
	sll x25, x26, x23
	bltu x14, x13, crash_forward
	or x20, x31, x15
	addi x30, x0, 1230
	addi x9, x0, -1704
	beq x31, x20, crash_forward
	div x11, x30, x9
	remu x8, x19, x19
	mulhu x22, x29, x29
	addi x28, x0, 21
	divu x30, x3, x12
	addi x9, x28, 1186
	addi x10, x0, -674
	add x21, x1, x1
	addi x12, x0, 1296
	sub x27, x10, x10
	la x17, test_memory+262
	addi x26, x0, 595
	addi x25, x0, 1
	ori x18, x29, -119
	sraiw x14, x23, 3
	sraw x13, x6, x13
	srliw x29, x6, 24
	addi x24, x0, -1369
	mulhu x3, x11, x11
	addi x27, x0, 1286
	lw x23, 470(x17)
	addi x4, x0, 1728
	srl x21, x9, x5
	divw x28, x5, x5
	addw x7, x21, x21
	div x23, x18, x12
	addi x18, x0, -610
	sraw x6, x24, x4
	mul x2, x6, x6
	addi x31, x26, 361
	sll x25, x25, 63
	addi x10, x0, 409
	addi x11, x0, 1523
	beq x26, x31, crash_forward
	addi x8, x0, -1
	xor x8, x8, x25
	slt x22, x18, x10
	addi x20, x0, 310
	addi x4, x0, -1983
	divuw x14, x27, x27
	addi x21, x0, 240
	sub x6, x21, x21
	sllw x31, x4, x4
	addi x29, x0, -158
	addi x24, x0, -181
	addi x9, x0, 1
	subw x1, x20, x20
	xor x23, x24, x24
	addi x2, x0, 1299
	and x5, x1, x30
	divuw x28, x29, x29
	sub x26, x2, x2
	sltu x30, x27, x27
	and x19, x14, x8
	or x15, x12, x25
	sra x16, x12, x11
	addi x18, x0, -711
	addi x31, x0, 1972
	addi x10, x0, -1744
	sltu x2, x6, x6
	sll x9, x9, 63
	slt x6, x8, x8
	sltu x29, x20, x9
	addi x28, x0, 1014
	addi x17, x0, -1
	la x21, test_memory-450
	lbu x30, 1035(x21)
	addi x23, x0, 700
	addi x4, x0, -1696
	addi x24, x0, 502
	addi x26, x0, 700
	addi x8, x0, -1164
	divu x7, x4, x6
	addi x22, x0, 1334
	mulhu x11, x18, x8
	addi x20, x10, -422
	addi x16, x0, -1109
	bgeu x20, x10, crash_forward
	subw x12, x23, x23
	addi x2, x0, 748
	slliw x15, x12, 13
	sll x27, x23, x22
	srl x5, x4, x26
	xor x17, x17, x9
	mulw x19, x11, x11
	addi x29, x0, -512
	subw x30, x2, x29
	sraw x21, x16, x16
	and x1, x2, x9
	remw x25, x28, x24
	sraw x6, x10, x10
	and x13, x10, x17
	or x3, x27, x9
	or x14, x31, x31
	addi x12, x0, 1
	divuw x5, x8, x8
	addi x3, x0, 1783
	addi x20, x0, -866
	la x25, test_memory-1423
	la x9, test_memory+2384
	addi x11, x0, 690
	sra x15, x7, x7
	addi x1, x0, 0
	addi x23, x0, 1692
	lhu x19, 1729(x25)
	la x16, test_memory-169
	addi x21, x0, -1104
	sraw x10, x23, x23
	lh x13, 1067(x16)
	mulhsu x29, x3, x21
	andi x24, x4, -544
	mul x30, x19, x18
	mul x17, x15, x24
	or x4, x7, x29
	addi x8, x0, 0
	sll x12, x12, 63
	addi x27, x0, -1171
	la x2, test_memory-877
	sraw x6, x27, x27
	addi x5, x0, 1020
	slt x22, x11, x5
	lw x7, -1792(x9)
	addi x31, x0, -1
	sb x30, 1473(x2)
	addi x28, x0, 698
	xor x31, x31, x12
	divu x26, x20, x28
	and x14, x12, x31
	divu x26, x3, x3
	addi x16, x0, -1768
	sltu x20, x29, x29
	addi x1, x0, -940
	addi x13, x0, 1290
	remu x9, x16, x16
	rem x30, x1, x13
	addi x2, x0, 974
	addi x28, x0, 1
	sra x10, x5, x8
	mulhu x3, x11, x4
	addi x6, x0, 1151
	sltu x22, x25, x25
	addi x9, x0, 1602
	lui x17, 354390
	addi x8, x0, 796
	sraw x30, x24, x24
	la x20, test_memory+1113
	remuw x21, x2, x6
	or x18, x14, x12
	la x25, test_memory-1390
	lb x27, 1806(x25)
	bltu x18, x14, crash_forward
	addi x10, x0, 1262
	addi x17, x0, 0
	mulhsu x3, x8, x10
	addi x26, x9, 1152
	subw x19, x9, x9
	lhu x16, -109(x20)
	addi x4, x0, 1
	addi x1, x0, 0
	addi x30, x0, 0
	sll x28, x28, 63
	addi x22, x0, 0
	addi x15, x0, -1
	addi x7, x0, 1479
	subw x29, x7, x7
	xor x15, x15, x28
	sll x4, x4, 63
	and x24, x15, x15
	or x23, x16, x28
	beq x24, x23, crash_forward
	addi x11, x0, -1
	xor x11, x11, x4
	and x5, x8, x11
	or x13, x5, x4
	bltu x13, x5, crash_forward
	addi x28, x0, -746
	or x3, x29, x18
	sra x4, x1, x1
	la x20, test_memory+2448
	addi x12, x0, 1378
	addi x11, x12, 132
	remuw x6, x19, x19
	addi x31, x0, -1567
	addi x9, x0, 92
	div x19, x12, x12
	addi x2, x0, 1747
	addi x6, x0, 864
	addi x21, x9, 2017
	addi x4, x0, -738
	addi x15, x0, -372
	sltu x7, x13, x31
	sub x19, x3, x31
	addw x18, x15, x15
	and x3, x6, x4
	addw x15, x30, x14
	addi x14, x0, -520
	sra x22, x2, x2
	addi x29, x0, 1494
	xor x26, x7, x23
	addi x30, x29, 402
	srlw x19, x3, x24
	addi x17, x31, -258
	addi x13, x0, 1692
	la x6, test_memory-1349
	addi x12, x0, -696
	ld x10, -1504(x20)
	addi x4, x0, 293
	beq x9, x21, crash_forward
	xor x7, x14, x14
	la x9, test_memory-1058
	addi x29, x0, -547
	divuw x18, x2, x21
	addi x5, x0, 949
	addi x22, x0, 566
	ld x3, 1493(x6)
	addi x27, x0, 1134
	addi x23, x10, 0
	addi x11, x12, -1526
	la x30, test_memory-343
	sub x25, x14, x27
	srl x16, x28, x13
	divu x20, x16, x16
	addi x8, x23, 0
	addi x15, x4, 1104
	remuw x10, x29, x29
	addi x21, x0, -1365
	bge x11, x12, crash_forward
	addi x26, x0, 768
	addi x1, x0, 1943
	sraw x31, x21, x26
	bltu x15, x4, crash_forward
	bltu x23, x8, crash_forward
	addi x2, x22, 1746
	sw x27, 935(x30)
	rem x24, x5, x1
	lb x17, 1655(x9)
	remuw x23, x2, x28
	srlw x7, x3, x31
	addi x14, x0, 1
	addi x21, x2, 0
	addw x15, x1, x1
	addi x25, x0, 565
	addi x23, x0, 1199
	addi x29, x0, -1963
	addi x12, x0, 254
	slti x5, x24, 1980
	sub x1, x30, x30
	addi x17, x21, 0
	sltu x6, x29, x29
	ori x3, x10, 1331
	sll x14, x14, 63
	mulhsu x11, x15, x10
	slti x24, x11, -1355
	sra x31, x29, x12
	mul x15, x6, x25
	remuw x7, x29, x2
	la x30, test_memory-1013
	addi x10, x0, -1
	addi x4, x0, -1495
	sd x4, 1261(x30)
	addi x9, x31, 0
	addi x16, x25, 0
	addi x27, x0, 1
	addi x26, x9, 0
	addi x8, x16, 0
	sll x27, x27, 63
	divu x13, x25, x23
	addi x22, x0, -1
	bne x16, x8, crash_forward
	xor x22, x22, x27
	xor x10, x10, x14
	addi x28, x4, -1147
	beq x4, x28, crash_forward
	and x2, x3, x22
	or x20, x31, x27
	and x19, x10, x10
	or x18, x8, x14
	addiw x23, x19, 2039
	addi x2, x0, -1502
	addi x22, x0, 0
	addi x5, x0, 289
	addi x30, x0, -519
	addi x6, x0, 0
	addi x16, x0, 1
	addi x21, x0, 0
	divu x29, x30, x30
	addi x26, x0, 1
	sltu x18, x10, x30
	sll x26, x26, 63
	addi x20, x0, 263
	sll x16, x16, 63
	addi x31, x0, 455
	addi x17, x0, 0
	addi x11, x0, -753
	addi x29, x0, 1
	addi x19, x0, 1980
	subw x24, x5, x5
	addi x10, x0, 1038
	addi x27, x0, -1
	sra x14, x11, x19
	sra x8, x2, x31
	xor x27, x27, x26
	sllw x1, x10, x14
	sll x29, x29, 63
	srlw x4, x22, x0
	la x25, test_memory-254
	addi x2, x0, 1917
	mulw x3, x20, x10
	addi x4, x0, 1431
	and x7, x28, x27
	addi x18, x0, -1
	addi x22, x0, 472
	or x12, x11, x26
	addi x9, x0, -1
	mulh x14, x1, x1
	xor x18, x18, x29
	lw x28, 874(x25)
	and x23, x6, x18
	or x30, x20, x29
	xor x9, x9, x16
	bgeu x23, x30, crash_forward
	and x15, x14, x9
	addi x5, x0, -420
	mulw x17, x2, x5
	or x13, x15, x16
	sllw x1, x4, x22
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
reg_x0_init:	.dword 0xd4e048cd9883fd20
reg_x1_init:	.dword 0xe744cf25a84e7ce2
reg_x2_init:	.dword 0x0000000000000000
reg_x3_init:	.dword 0xe15a5a5f06cc8a25
reg_x4_init:	.dword 0xfffffffffffffffb
reg_x5_init:	.dword 0x42ec6aa6d2ef2c38
reg_x6_init:	.dword 0x0800000000000000
reg_x7_init:	.dword 0xffffffffffffffdf
reg_x8_init:	.dword 0xffffffffffff8004
reg_x9_init:	.dword 0xffffffffffffffff
reg_x10_init:	.dword 0xffffffffffffff86
reg_x11_init:	.dword 0xed479bcda6610637
reg_x12_init:	.dword 0xffffffff80000001
reg_x13_init:	.dword 0x0000000000000000
reg_x14_init:	.dword 0xfb4ce4462c2bac1f
reg_x15_init:	.dword 0x0000000000000002
reg_x16_init:	.dword 0x7712da584e86bea6
reg_x17_init:	.dword 0xac04359996b00ebb
reg_x18_init:	.dword 0x0800000000000002
reg_x19_init:	.dword 0x9ee645f3b3dfd9d2
reg_x20_init:	.dword 0x0000000000000000
reg_x21_init:	.dword 0x705e7e4745c2d902
reg_x22_init:	.dword 0x4af2a78fdcdcf9fb
reg_x23_init:	.dword 0x0800000000000003
reg_x24_init:	.dword 0x4079356a1a3b8ed4
reg_x25_init:	.dword 0xe1004cdfcb59f8a1
reg_x26_init:	.dword 0x73e0100a2110fb0d
reg_x27_init:	.dword 0x0000000000000006
reg_x28_init:	.dword 0xf41a03e2d09dc98c
reg_x29_init:	.dword 0xffffffffffff8003
reg_x30_init:	.dword 0x1547f093e0a2e739
reg_x31_init:	.dword 0x90027cf6ecd7c573

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x27e1ae24a2745434
reg_x1_output:	.dword 0xfbf2e8a0435ca7c7
reg_x2_output:	.dword 0x2eb886dd94789d45
reg_x3_output:	.dword 0x074a8f2bec502156
reg_x4_output:	.dword 0xc8c40e43851e6e9c
reg_x5_output:	.dword 0x50b36f3cbe3d2ef0
reg_x6_output:	.dword 0xa159f37c3a6d22fc
reg_x7_output:	.dword 0xef7f5510491b2e95
reg_x8_output:	.dword 0x2d12e81cf4f9c54d
reg_x9_output:	.dword 0x656c844028d8320c
reg_x10_output:	.dword 0x63462d150446e5b3
reg_x11_output:	.dword 0xab536946967a2c18
reg_x12_output:	.dword 0x1bb689cd1ca42bdc
reg_x13_output:	.dword 0x5c3f5f454c093ce9
reg_x14_output:	.dword 0xacf5118b34c43a99
reg_x15_output:	.dword 0xdd278dffa96dd1d5
reg_x16_output:	.dword 0x81605b17c594b8b0
reg_x17_output:	.dword 0x9f49242ab3e48c47
reg_x18_output:	.dword 0x7ded0ea2434d92ef
reg_x19_output:	.dword 0xa37471eb2d5523f7
reg_x20_output:	.dword 0xa14eede37869cb84
reg_x21_output:	.dword 0xb9b2a7966bf8b85b
reg_x22_output:	.dword 0xf1e7ba80938d6a8c
reg_x23_output:	.dword 0x22c23cbd508f455c
reg_x24_output:	.dword 0x07539eb78d8163e9
reg_x25_output:	.dword 0x0444436c312b2f4d
reg_x26_output:	.dword 0x7fc0fc3675a78658
reg_x27_output:	.dword 0xdd552bb073951a18
reg_x28_output:	.dword 0xebbbc544eed5c7c1
reg_x29_output:	.dword 0xebefbb5903b97fba
reg_x30_output:	.dword 0xfaf2c42f05a982d1
reg_x31_output:	.dword 0x54213dffa3b4b9f0

// Memory Blocks
	.align 8
test_memory:
	.dword 0x6bff74dcb15879c6, 0x3502314b0b297332
	.dword 0xc69f54c0fa0eb289, 0x8cd6f16ee5d8b2e0
	.dword 0xb557ccf579458001, 0x81f029f66d31f8bb
	.dword 0xc76c1aa3d2714ca5, 0x011b0ec0b9051b96
	.dword 0x009ed9a7d228fa53, 0x90eda1500fe6df4c
	.dword 0x47af157420c2eb60, 0x2b3b8640c37475f4
	.dword 0x091b0434409108ef, 0x17c42f163eb16053
	.dword 0x2fb0d031d8a65a86, 0x5cf35c3b507e6192
	.dword 0x7a18137ad8a602de, 0xe1993b45d0df7a30
	.dword 0xaa04e9c1a9c4b5f9, 0xcd0fa58020b21e39
	.dword 0xa96fbc829222fc7a, 0xd69642a2bfd41ab7
	.dword 0x8a3b2d6b6b37d830, 0xd10793e510cede69
	.dword 0xd763c2f667689df3, 0xe1a52b35122219b2
	.dword 0x926b3b59876418b3, 0x07d992c34783e9d4
	.dword 0x166ba9a28aa449cd, 0x3cb2a8c5a01c035d
	.dword 0x025cc11e28db5aa0, 0xd3bf7378ed228fe1
	.dword 0xefd7f2faa1459360, 0x8828b1657da2b2e8
	.dword 0xb14e422ca2236b29, 0xe08ba9e4ebabea2a
	.dword 0xd46cf195033c0557, 0x369301e6c43cbcf9
	.dword 0x519c705e2b79b014, 0x9cc198eed8e46efe
	.dword 0x6a5728aa70b73831, 0x419fb2610fc0aa27
	.dword 0x63cc146d9aee263a, 0x7bbaeefef75753df
	.dword 0xd41b3c988e6338c3, 0xd1eddaaf3f1c0180
	.dword 0xccb8867b2c6fb008, 0x8f6c12822e73c005
	.dword 0x1e637363bd5b3eb5, 0x7f5c46f0f2012304
	.dword 0xf8e8b68bc8a3b401, 0x88999e67f52dceda
	.dword 0x1cccc531914cb300, 0x13ca3c07cb85f227
	.dword 0xf54cc5067aa30b39, 0x7490eea96dcd627c
	.dword 0x20157ccb3c848676, 0x467c4c1cb8fd5053
	.dword 0xebe62b37edf63fdb, 0x9fb5bcbb5cd4c63f
	.dword 0x1a4f681ec6e0d83a, 0xba973b1b5b956764
	.dword 0x011c73d0df6b1ba5, 0xdc76cc1e38292128
	.dword 0xf7f798bec9e0ec43, 0xa762f3303a84c42a
	.dword 0xa4c08364649d8667, 0x0e7ba6d046e6b872
	.dword 0x2f15b461b94d71de, 0xf547894f92d040ea
	.dword 0x080070eacf4db488, 0x421d69d8ad8b020d
	.dword 0xc7c4d56275331a29, 0x46b651b270f3bfde
	.dword 0x8fcdee40badda581, 0xc87ca1c14d5e871a
	.dword 0x6bc7fb3bff297e99, 0x587104513ff7b5b0
	.dword 0xc97940a6838ff25f, 0xc8c6371491489670
	.dword 0x5d0c0b13b2205775, 0x60e0f16c20bd8403
	.dword 0x9d82c9400061ec45, 0x77796ae59d76c71b
	.dword 0x8d39602f492d0258, 0x9a7046062b8ca3ea
	.dword 0x3ae51d93d99b0ae8, 0xacc0e348da824ad7
	.dword 0x72b6ec76571258b3, 0xf1176067352aa06f
	.dword 0x7b59b0113f6bab11, 0xe330c7d87ffd1099
	.dword 0xa1c0e8f88d7cd648, 0xdf903498d007e10e
	.dword 0x4f5a088515351d1f, 0xc07bee2e9590b707
	.dword 0xa275166a582d0fb0, 0xe4e1c0eb094b4437
	.dword 0x16df8ca4df550382, 0x29f2166fdd194efb
	.dword 0xf6f68d9ddd8a78d7, 0x9f359271d0c689cf
	.dword 0xaa23d889e28e0141, 0x8ed937c03b65ee04
	.dword 0xc70b20106b587b7a, 0x85295983121d8daf
	.dword 0x3be3a72eed67b875, 0x82f3dcc6808910e4
	.dword 0x30d4485db387ddb0, 0x6b0e8e3b44aa5224
	.dword 0x2ce64af4352018cc, 0xfbc69033e3e2ce13
	.dword 0xd085aaca025e785e, 0x7dca24f69ee7da6d
	.dword 0x5ecbb61d8907fe07, 0x836e5937234ed83a
	.dword 0xab3b25b9c46f3dc1, 0x214652dc296dd541
	.dword 0x92631353e0651e7c, 0x7c1a4804f82050b9
	.dword 0x4b507238481c8fe9, 0x2ca8624fa4c71746
	.dword 0xe40bee23f0334994, 0x1f7a12587fd56a23
	.dword 0x86dc5471a39ee738, 0x52bc977e94ace59b
	.dword 0x86e3eb7c075ef64e, 0x3db3bfec49acdabd

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
