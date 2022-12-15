.section .text
.globl _start
_start:
    addi t0, x0, 0x1
    addi t1, x0, 0x0
    li   t2, 0
    addi t3, x0, 10
    li   t4, 10
loop:
    add t1, t1, t0
    add t0, t0, 0x1
    add t3, t3, -1
    bne t3, x0, loop
    li t3, 10
    add t4, t4, -1
    bne t4, x0, loop
write_to_host:
    lui	t5,0x80001
    li t6, 1 
    sw	t6,0(t5) # 80001000 <toh
    lui	t0,0x90
    addiw	t0,t0,1
    slli	t0,t0,0xc
    lw	t6,0(t0) # 90000 <_start-0
    j write_to_host