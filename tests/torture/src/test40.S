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
	addi x4, x0, -875
	sll x16, x8, x2
	addi x29, x0, 0
	xor x26, x3, x18
	bne x0, x0, crash_forward
	blt x12, x12, crash_forward
	addi x12, x0, -183
	divu x9, x15, x15
	addi x8, x0, 182
	sltu x1, x12, x8
	sll x14, x31, x0
	addi x20, x0, 1
	addi x6, x0, 0
	sll x20, x20, 63
	addi x21, x0, 357
	addi x15, x0, -423
	mul x16, x6, x21
	addi x5, x0, -291
	addi x18, x0, 1105
	addi x28, x0, -1
	addi x27, x18, 754
	xor x28, x28, x20
	beq x18, x27, crash_backward
	addi x1, x0, 0
	sllw x13, x2, x2
	sll x17, x21, x21
	sll x21, x2, x2
	addi x8, x0, 1
	and x31, x14, x28
	divw x16, x7, x7
	addi x10, x0, 1
	addi x19, x0, 1303
	mul x22, x4, x15
	addi x3, x0, -357
	sltu x13, x25, x25
	sll x10, x10, 63
	addi x30, x0, -1
	addi x26, x0, 0
	addi x9, x0, -1036
	xor x30, x30, x10
	or x24, x12, x20
	sraw x11, x5, x19
	bgeu x31, x24, crash_forward
	and x2, x4, x30
	or x25, x2, x10
	bne x1, x26, crash_forward
	addi x7, x0, 709
	addw x17, x21, x0
	sraw x23, x3, x7
	sll x8, x8, 63
	xori x22, x10, 1706
	addi x5, x0, 1
	addi x1, x0, 1
	sll x5, x5, 63
	addi x3, x0, -1
	addi x14, x0, -1
	div x19, x9, x9
	addi x4, x0, 1
	sll x1, x1, 63
	addi x6, x0, -1
	sll x4, x4, 63
	addi x11, x0, -1
	xor x14, x14, x8
	addw x24, x7, x15
	xor x6, x6, x1
	ori x30, x18, -1264
	divw x12, x9, x9
	mulh x19, x17, x17
	rem x25, x3, x18
	mulh x7, x8, x14
	mulhu x29, x15, x15
	mulhu x22, x9, x9
	xor x3, x3, x5
	mulhsu x10, x12, x12
	la x28, test_memory+1537
	sltu x31, x16, x31
	xor x11, x11, x4
	and x21, x1, x3
	la x13, test_memory-935
	and x27, x12, x14
	and x20, x18, x6
	and x17, x2, x11
	lw x16, -1117(x28)
	sd x22, 1351(x13)
	or x26, x20, x1
	beq x20, x26, crash_forward
	or x18, x5, x8
	or x23, x21, x5
	bge x18, x27, crash_forward
	or x15, x10, x4
	bgeu x21, x23, crash_forward
	slt x10, x25, x25
	addi x4, x0, 807
	addi x27, x0, 1803
	addi x18, x0, -81
	addi x15, x0, 1511
	addi x23, x0, 986
	addi x14, x0, 1561
	addi x6, x0, -1604
	addi x9, x0, -372
	sraw x31, x14, x14
	addi x22, x0, 1578
	addi x19, x22, 127
	xor x25, x15, x15
	addi x8, x0, -1099
	sraiw x30, x10, 14
	remu x20, x4, x8
	addi x5, x0, -489
	srl x1, x27, x6
	divw x24, x18, x18
	addi x27, x0, -538
	la x29, test_memory+103
	add x1, x21, x21
	addi x15, x0, 760
	addi x7, x0, 1
	addi x14, x0, -786
	la x24, test_memory-318
	ori x8, x20, 1096
	mul x18, x4, x30
	addi x30, x0, 1
	addi x19, x0, 0
	addi x20, x0, 0
	addi x17, x0, 508
	sll x30, x30, 63
	sw x3, 678(x24)
	addi x21, x0, -598
	lwu x11, 213(x29)
	sltu x10, x15, x14
	addi x31, x0, -1
	addw x26, x23, x17
	xor x31, x31, x30
	addi x22, x0, 590
	sra x3, x5, x21
	subw x25, x27, x22
	addi x14, x0, 445
	addi x1, x0, 1912
	addi x5, x0, 1575
	addi x27, x0, -170
	ori x29, x8, -523
	div x3, x29, x30
	remuw x11, x1, x1
	addi x26, x0, -1748
	srlw x22, x2, x2
	divw x15, x20, x20
	div x23, x14, x14
	and x18, x1, x26
	sll x17, x5, x5
	sub x20, x7, x7
	and x4, x20, x31
	sll x7, x7, 63
	sll x8, x27, x27
	addi x25, x0, 1
	sll x25, x25, 63
	or x6, x4, x30
	addi x12, x0, 385
	addi x3, x0, 1113
	mulhu x2, x9, x12
	addi x19, x0, -1
	xor x19, x19, x25
	bltu x11, x11, crash_backward
	beq x4, x6, crash_forward
	addi x17, x0, 410
	sll x23, x17, x17
	and x24, x18, x19
	addi x14, x0, -1357
	srlw x4, x8, x8
	addi x1, x0, 1
	addi x15, x0, 1000
	addi x18, x15, 670
	la x23, test_memory+1858
	subw x2, x5, x5
	la x17, test_memory+1820
	or x10, x29, x25
	srli x27, x18, 27
	addi x21, x0, -2012
	beq x15, x18, crash_backward
	sll x1, x1, 63
	addi x9, x0, 920
	addi x5, x0, -1
	addi x26, x14, -540
	addi x8, x0, 358
	or x31, x27, x21
	remu x11, x3, x21
	addi x12, x9, 621
	addi x20, x8, 509
	addi x13, x0, -1
	ld x4, -1746(x23)
	xor x13, x13, x7
	bltu x12, x9, crash_backward
	addi x6, x12, 0
	addi x30, x6, 0
	bge x10, x24, crash_forward
	bgeu x8, x20, crash_backward
	sh x18, -1708(x17)
	xor x5, x5, x1
	and x22, x19, x5
	or x29, x22, x1
	and x28, x14, x13
	or x16, x28, x7
	addi x11, x0, 0
	addi x30, x0, 1988
	div x18, x30, x30
	addi x2, x0, -1516
	and x21, x2, x2
	addi x7, x0, 1318
	addi x26, x0, 0
	addi x10, x7, 752
	addi x14, x2, -684
	sll x9, x11, x11
	addi x1, x0, 472
	and x12, x16, x16
	divuw x25, x10, x22
	addi x3, x0, 918
	addi x4, x0, -1463
	addi x18, x0, -1118
	addi x13, x0, -748
	addi x5, x0, 1887
	la x9, test_memory-1144
	remw x29, x1, x1
	addi x30, x0, 1
	divw x6, x13, x13
	mulw x27, x3, x3
	srlw x17, x26, x18
	addi x20, x0, -427
	sll x30, x30, 63
	mulhsu x28, x18, x18
	sllw x8, x15, x15
	addi x10, x0, -1
	addi x15, x0, -1994
	la x13, test_memory+2151
	or x26, x21, x21
	or x23, x4, x4
	addiw x3, x28, 1278
	addi x25, x0, 1765
	xor x10, x10, x30
	sh x8, -1457(x13)
	addi x27, x0, 1847
	sltiu x12, x27, -1969
	sd x30, 1888(x9)
	mul x24, x3, x4
	addi x17, x0, 952
	sltu x1, x27, x27
	addi x21, x0, 1273
	addi x26, x0, 1796
	addi x14, x0, -110
	addw x18, x11, x16
	remuw x29, x25, x27
	sub x6, x23, x2
	addi x3, x0, 90
	mulh x7, x21, x21
	addi x19, x15, -1142
	addi x23, x0, -1570
	and x16, x11, x10
	addi x12, x0, 363
	mul x25, x13, x13
	sllw x31, x5, x20
	addi x24, x0, -253
	blt x15, x19, crash_forward
	srai x6, x8, 46
	addi x19, x0, 1
	or x22, x17, x30
	la x18, test_memory+2112
	rem x2, x17, x14
	lbu x29, -1272(x18)
	addi x9, x0, 1315
	sll x19, x19, 63
	add x8, x26, x26
	addi x13, x12, 1439
	mulw x21, x16, x16
	la x29, test_memory-1568
	lw x6, 1944(x29)
	la x5, test_memory+198
	addi x20, x0, -1
	srlw x1, x3, x24
	xor x20, x20, x19
	addi x18, x0, 641
	sub x14, x16, x16
	la x2, test_memory+1294
	addi x11, x0, -1012
	div x25, x18, x18
	sh x19, -956(x2)
	sltu x4, x23, x23
	addi x1, x0, 85
	la x17, test_memory-1198
	subw x24, x21, x19
	and x12, x1, x1
	addi x16, x0, 1
	sll x16, x16, 63
	addi x4, x0, 1518
	sra x21, x21, x21
	addi x26, x0, 1519
	xor x27, x16, x16
	addw x23, x19, x19
	and x15, x18, x20
	subw x14, x13, x21
	sd x3, 386(x5)
	mulh x24, x21, x9
	or x31, x4, x19
	mul x28, x11, x11
	addi x6, x26, 545
	add x3, x9, x9
	la x10, test_memory+39
	srl x18, x4, x4
	lwu x29, 157(x10)
	sb x27, 1979(x17)
	addi x26, x0, -560
	divw x2, x30, x30
	add x17, x26, x26
	addi x4, x0, 1552
	addi x11, x0, -1874
	remu x30, x26, x4
	addi x7, x9, 1223
	srl x28, x11, x11
	addi x21, x0, -1262
	addi x25, x0, -1
	addi x27, x0, 1485
	mulh x12, x28, x28
	remuw x6, x21, x27
	mulhu x1, x14, x14
	la x5, test_memory+2302
	la x3, test_memory+886
	addi x18, x0, 1701
	lh x14, -454(x3)
	divuw x19, x3, x3
	xor x25, x25, x16
	divuw x9, x1, x1
	or x10, x4, x18
	srliw x15, x9, 31
	and x8, x11, x25
	lhu x29, -1442(x5)
	srli x13, x9, 30
	addi x21, x0, 841
	addi x1, x0, 1037
	addiw x3, x7, 573
	addi x5, x0, 1066
	addi x4, x5, 1901
	addi x14, x6, 0
	mulh x2, x8, x8
	la x31, test_memory+1755
	addi x7, x0, -1742
	addi x15, x0, 955
	xor x27, x6, x6
	or x22, x8, x16
	la x17, test_memory+2490
	addi x23, x0, 1226
	beq x5, x4, crash_forward
	sd x18, -1563(x31)
	sltiu x9, x17, 534
	blt x8, x22, crash_forward
	addi x20, x0, 1821
	addi x26, x1, 309
	addi x11, x7, -509
	mulhu x12, x21, x21
	la x29, test_memory+1071
	lh x30, -1978(x17)
	addi x6, x14, 0
	blt x11, x11, crash_forward
	la x31, test_memory-1437
	addi x3, x0, -252
	la x16, test_memory-1327
	lw x21, 1903(x16)
	sb x8, -1028(x29)
	addi x12, x0, -790
	addi x9, x0, 567
	sw x11, 1513(x31)
	addi x18, x20, 961
	addi x30, x0, -477
	or x11, x0, x0
	addi x24, x23, 2024
	addi x5, x0, 803
	sll x2, x15, x3
	remu x7, x30, x30
	addi x4, x0, -1394
	addi x10, x0, -771
	addi x6, x0, -1419
	mulhu x30, x8, x8
	add x21, x27, x12
	rem x22, x12, x5
	sll x27, x10, x10
	sltiu x28, x4, -119
	addi x13, x0, 1861
	addi x3, x0, -1043
	divw x25, x9, x9
	addi x5, x0, -244
	addi x1, x0, -107
	addi x17, x0, 683
	addi x11, x0, -865
	add x19, x13, x13
	remw x18, x11, x11
	sltu x24, x3, x5
	divw x31, x6, x6
	addi x9, x11, 0
	addi x27, x9, 0
	addi x26, x24, 0
	addw x29, x23, x12
	addi x23, x0, 1232
	addi x12, x0, 1
	addi x8, x4, -815
	addi x2, x0, 0
	sra x14, x1, x17
	addi x15, x0, 0
	beq x4, x8, crash_forward
	sll x12, x12, 63
	addi x22, x0, -430
	divuw x20, x23, x22
	addi x16, x26, 0
	blt x9, x27, crash_backward
	addi x30, x0, -1
	bne x26, x16, crash_forward
	xor x30, x30, x12
	and x21, x22, x30
	or x7, x21, x12
	blt x21, x7, crash_backward
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
reg_x0_init:	.dword 0xc211e63e3e076a97
reg_x1_init:	.dword 0x0000000000000000
reg_x2_init:	.dword 0x92d9b7cd04194aba
reg_x3_init:	.dword 0xa3be063922eec01e
reg_x4_init:	.dword 0x3e903ed4000e4139
reg_x5_init:	.dword 0x37693c43e9a87c11
reg_x6_init:	.dword 0xd0a48488d96b8c6a
reg_x7_init:	.dword 0x0000000000000006
reg_x8_init:	.dword 0xb8b2ef0d0132e927
reg_x9_init:	.dword 0xffffffffffffffff
reg_x10_init:	.dword 0xffffffffffffffff
reg_x11_init:	.dword 0xffffffffffffff85
reg_x12_init:	.dword 0xffffffffffffff81
reg_x13_init:	.dword 0x5f20bd8c2252eff7
reg_x14_init:	.dword 0x0000000000000002
reg_x15_init:	.dword 0x04892ac687e14929
reg_x16_init:	.dword 0xd2d116afceca41bf
reg_x17_init:	.dword 0x0000000000000004
reg_x18_init:	.dword 0x0243a8cfe076ee5c
reg_x19_init:	.dword 0xffffffffffffff89
reg_x20_init:	.dword 0xffffffffffffffff
reg_x21_init:	.dword 0x6537d9c50d8e8c91
reg_x22_init:	.dword 0x0800000000000005
reg_x23_init:	.dword 0x7901215fbcd72583
reg_x24_init:	.dword 0x0000000000000008
reg_x25_init:	.dword 0x0800000000000008
reg_x26_init:	.dword 0xffffffffffffffff
reg_x27_init:	.dword 0xffffffffffffff86
reg_x28_init:	.dword 0xa2a510b307951315
reg_x29_init:	.dword 0xffffffffffffffff
reg_x30_init:	.dword 0x0800000000000009
reg_x31_init:	.dword 0xffffffffffff8003

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x2ef0cd99383867cd
reg_x1_output:	.dword 0x672f327e8244f5d5
reg_x2_output:	.dword 0x4e72e45937abbe20
reg_x3_output:	.dword 0xa0fb5640b6571331
reg_x4_output:	.dword 0x83507114b9e0ec6f
reg_x5_output:	.dword 0xf0439e512cc030e7
reg_x6_output:	.dword 0xe955abf3b7641a9c
reg_x7_output:	.dword 0xdbd438ba0a4d0407
reg_x8_output:	.dword 0xb4715d30069badae
reg_x9_output:	.dword 0x803eed756348bfff
reg_x10_output:	.dword 0x3159c8a052178dd3
reg_x11_output:	.dword 0xac33861f6c3cf640
reg_x12_output:	.dword 0x4d5c3e91c38048a7
reg_x13_output:	.dword 0x0fca7ceb96dd4c21
reg_x14_output:	.dword 0x125465dd9adf93b6
reg_x15_output:	.dword 0x955726db355e2b04
reg_x16_output:	.dword 0xae059336ed8ff33f
reg_x17_output:	.dword 0xb1f5cd2a80c3ceb7
reg_x18_output:	.dword 0x24e1c1c408b9893b
reg_x19_output:	.dword 0xc65d6a0c4fa9561b
reg_x20_output:	.dword 0x8cef00edbd1e509d
reg_x21_output:	.dword 0x7cc3fc9a30d5ba0a
reg_x22_output:	.dword 0x87356b7afd5848da
reg_x23_output:	.dword 0x9a1fa805e1eece76
reg_x24_output:	.dword 0xe22cfbdb48d055aa
reg_x25_output:	.dword 0x96fe12158cf8b1cd
reg_x26_output:	.dword 0xaf43d1c1f4dcd710
reg_x27_output:	.dword 0xd9ceb4cec9524ea4
reg_x28_output:	.dword 0x460abcf65ee33d98
reg_x29_output:	.dword 0xe114176ee4c5d393
reg_x30_output:	.dword 0x6a1f2168ce481edf
reg_x31_output:	.dword 0x8abb22a0714e455d

// Memory Blocks
	.align 8
test_memory:
	.dword 0x1ac6888a6fad8e58, 0xde1703eadaa18f54
	.dword 0x1da173d684b7be4c, 0xf2f35469dda0b5fb
	.dword 0x8e2044b6108c2d22, 0x591576c109c60fec
	.dword 0x2abe4d84e1bfe2e0, 0x8ba1604e03c3a8fc
	.dword 0x9cb45fee92ad82f1, 0xc265419f7f02339c
	.dword 0x00156c80a9743628, 0xcb52c223e3d32c82
	.dword 0xc65d077c656cb104, 0x67a3c325502f1487
	.dword 0x05a0e6eb80f1da35, 0x0d93ddf52b02e4d3
	.dword 0x1013adf8802ed55f, 0x787711685c9e2136
	.dword 0x0b98997c587c761d, 0x608952808c052cd9
	.dword 0x450ce1d4dbf45f48, 0x4159f46f8701c515
	.dword 0x4fe4e5fb72805278, 0xac711bba6405c6a2
	.dword 0x260873d4191073ca, 0x24fcb0b88792a0f4
	.dword 0x7ebac1c6390b85e3, 0x7c358546b51a1be1
	.dword 0x5b0fed8cc9b86235, 0xa404a1b5cb735386
	.dword 0x4c3b144df3903180, 0xa97bed01f9490e6b
	.dword 0x891d57ec7e5d289c, 0x3234a448b494d1e5
	.dword 0x662f659a1701cd75, 0x51d9557ad38c58bb
	.dword 0xe26451b19d010855, 0xaf48514cf39d500c
	.dword 0x863ddcc45a9f8568, 0xc616c8722e6d7e70
	.dword 0xe53775f040fb2a7d, 0x190c080ca393b95c
	.dword 0x5e2e8e77f3fda50a, 0x97af895fea204cca
	.dword 0xc2c4128fdcdb5472, 0x737bc8c94551b918
	.dword 0xf11c1b785d201489, 0x83f317eed63ceb30
	.dword 0x141e2ecc1c5fac57, 0xf2f2df37b6fe52e8
	.dword 0xada99f19cfb7e51b, 0xbf75027e557b7bac
	.dword 0x1956e1b490ae8d93, 0x2bb65d00ca130b5a
	.dword 0x4697edc830d5ed7a, 0x0fb4889db4134b6d
	.dword 0xbb96f8ad05466d52, 0x6964644128ada05c
	.dword 0xd854237e80a47663, 0x34260d96eb9f9344
	.dword 0xf077edecf855cf02, 0x58124207d13051c4
	.dword 0x6359825101f9f716, 0x5b085ae449abc828
	.dword 0xea152eff956d48d8, 0xd82358da8d72b9c8
	.dword 0x0480a0e335d6e1d9, 0xc1afb2b230497bb2
	.dword 0xb48fb345bdbd9849, 0x2d22db3471053586
	.dword 0x9d95e8ef77208075, 0x2b30b264f251cca1
	.dword 0x7efde2721d53c691, 0xb72a55fc9848dd7e
	.dword 0xd1d165c37b2ae0b7, 0x8b9505139f346758
	.dword 0xd301cb0d09055d2f, 0x0d9f0b19185e0e12
	.dword 0x5309e2c13be3d0f0, 0x2103e6086c76165b
	.dword 0x6b7fa8efe4feaa67, 0xa1501bdc4e2b800d
	.dword 0x7dbd59dcd8b0ec76, 0x378873414d40e2d6
	.dword 0x302ebbce202515bf, 0x033f838c80fff119
	.dword 0x2b48b221cb52b821, 0xff5fcff132a7c516
	.dword 0x18fe6da864bf8482, 0x8c9fe1eb1b905c47
	.dword 0x72e8ce2d665ececf, 0x30f916fe617fe50d
	.dword 0x6189c9567b16ce40, 0x6bd115a49454c28b
	.dword 0xcb5eeaaff3231de0, 0xb5111d8444f16ad2
	.dword 0x821341057f00414c, 0x0965a6e17c85833e
	.dword 0xa0524cf0ed0431ba, 0x2a9405512721df1f
	.dword 0xd8c2c4b47584373c, 0x4f7b01b6133b449a
	.dword 0xf7c94147c8a89246, 0xef2e9f68439a1bd1
	.dword 0xcb2028b60412b96d, 0x9cee80b128736c42
	.dword 0x355369a46d832f71, 0x42b99e7eb949cc6c
	.dword 0x6d03dc3206f8357d, 0x1539475411fb27b7
	.dword 0x61bf5c07088eddac, 0x38e8997ffc4a7e95
	.dword 0x6777efa6090441cf, 0x8cfcec91f28304e3
	.dword 0x9f759105274ce26d, 0x6fe6de0b89c44295
	.dword 0xef436b602a94720a, 0x8a8af554995d1a92
	.dword 0x9cd2a24a1a5890ac, 0xedcc12f2ca95dbdd
	.dword 0x1819f603da753b9a, 0xb0f11ef8cfa7c0f4
	.dword 0xe71ad9117721f567, 0x1a12aabd43a2817c
	.dword 0xb6a9cb08df4aea2e, 0x735479cdfde6da1d
	.dword 0xf9e10cad30a1941e, 0x837a26246ce72eab

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
