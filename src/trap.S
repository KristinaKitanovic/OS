.extern interrupt
.extern getRunningThreadContext
.align 4
.global handle_interrupt
.global restore_context_kernel_mode
.global mem_alloc_trap
.global thread_create_trap
.global thread_dispatch_trap
.global thread_exit_trap
.global mem_free_trap
.global mem_get_free_space_trap
.global mem_get_largest_free_block_trap
.global sem_open_trap
.global sem_wait_trap
.global sem_signal_trap
.global sem_close_trap
.global thread_wrapper
.global context_switch
.global putc_trap
.global getc_trap
.type context_switch, @function

handle_interrupt:
            mv t0, a0                     # t0 = kod prekida
            csrw sscratch, ra
            # Ubaci running thread context u a1
            call getRunningThreadContext
            mv a1, a0                     # a1 = context
            csrr ra, sscratch
            # Vrati a0 nazad
            mv a0, t0


    	    addi sp, sp, -240

            sd ra, 0(sp)
        	sd s0, 8(sp)
        	sd s1, 16(sp)

        	sd s2, 24(sp)
        	sd s3, 32(sp)
        	sd s4, 40(sp)
        	sd s5, 48(sp)
        	sd s6, 56(sp)
        	sd s7, 64(sp)
        	sd s8, 72(sp)
        	sd s9, 80(sp)
        	sd s10, 88(sp)
        	sd s11, 96(sp)
        	sd a1, 104(sp)
        	sd a2, 112(sp)
        	sd a3, 120(sp)
        	sd a4, 128(sp)
        	sd a5, 136(sp)

        	sd a6, 144(sp)
        	sd a7, 152(sp)
        	sd t0, 160(sp)
        	sd t1, 168(sp)
        	sd t2, 176(sp)
        	sd t3, 184(sp)
        	sd t4, 192(sp)
        	sd t5, 200(sp)
        	sd t6, 208(sp)
        	sd gp, 216(sp)

        	sd tp, 224(sp)

        	sd sp, 24(a1)

        	ld sp, 32(a1)


        	call interrupt
        	mv t0, a0                     # t0 = kod prekida

            # Ubaci running thread context u a1
            call getRunningThreadContext
            mv a1, a0                     # a1 = context

            # Vrati a0 nazad
            mv a0, t0


            ld sp, 24(a1)
            ld ra, 0(sp)


            ld s0, 8(sp)
            ld s1, 16(sp)
            ld s2, 24(sp)
            ld s3, 32(sp)
            ld s4, 40(sp)
            ld s5, 48(sp)
            ld s6, 56(sp)
            ld s7, 64(sp)
            ld s8, 72(sp)
            ld s9, 80(sp)
            ld s10, 88(sp)
            ld s11, 96(sp)

            ld a2, 112(sp)
            ld a3, 120(sp)
            ld a4, 128(sp)
            ld a5, 136(sp)
            ld a6, 144(sp)
            ld a7, 152(sp)
            ld t0, 160(sp)
            ld t1, 168(sp)
            ld t2, 176(sp)
            ld t3, 184(sp)
            ld t4, 192(sp)
            ld t5, 200(sp)
            ld t6, 208(sp)
            ld gp, 216(sp)
            ld tp, 224(sp)


            ld a1, 104(sp)

        	addi sp, sp, 240
        	sret




restore_context_kernel_mode:
     ld sp, 24(a0)
                 ld ra, 0(sp)


                 ld s0, 8(sp)
                 ld s1, 16(sp)
                 ld s2, 24(sp)
                 ld s3, 32(sp)
                 ld s4, 40(sp)
                 ld s5, 48(sp)
                 ld s6, 56(sp)
                 ld s7, 64(sp)
                 ld s8, 72(sp)
                 ld s9, 80(sp)
                 ld s10, 88(sp)
                 ld s11, 96(sp)

                 ld a2, 112(sp)
                 ld a3, 120(sp)
                 ld a4, 128(sp)
                 ld a5, 136(sp)
                 ld a6, 144(sp)
                 ld a7, 152(sp)
                 ld t0, 160(sp)
                 ld t1, 168(sp)
                 ld t2, 176(sp)
                 ld t3, 184(sp)
                 ld t4, 192(sp)
                 ld t5, 200(sp)
                 ld t6, 208(sp)
                 ld gp, 216(sp)
                 ld tp, 224(sp)


                 ld a1, 104(sp)

             	addi sp, sp, 240
             	sret


mem_alloc_trap:
    mv a2, a1
    mv a1, a0
    li a0, 0x01
    ecall
    ret
mem_free_trap:
    mv a2, a1
    mv a1, a0
    li a0, 0x02
    ecall
    ret
thread_exit_trap:
    mv a1, a0
    li a0, 0x12
     ecall
    ret
thread_create_trap:
   mv a5, a4
   mv a4, a3
   mv a3, a2
   mv a2, a1
   mv a1, a0
   li a0, 0x11
    ecall
   ret
thread_dispatch_trap:
    mv a1, a0
    li a0, 0x13
     ecall
    ret

mem_get_free_space_trap:
    li a0, 0x03
     ecall
    ret

mem_get_largest_free_block_trap:
    li a0, 0x04
    ecall
    ret
sem_open_trap:
    mv a3, a2
    mv a2, a1
    mv a1, a0
    li a0, 0x21
    ecall
    ret

sem_wait_trap:
    mv a2, a1
    mv a1, a0
    li a0, 0x23
    ecall
    ret
thread_wrapper:
    ld sp, 24(a0)
   ld t0, 40(a0)
   csrw sstatus, t0
   ld t0, 0(a1)
   csrw sscratch, a0
   ld a0, 8(a1)
   jalr ra, t0, 0
   csrr a0, sscratch
   j thread_exit_trap
   ret


sem_signal_trap:
    mv a2,a1
    mv a1, a0
    li a0, 0x24
    ecall
    ret
sem_close_trap:
    mv a2, a1
    mv a1, a0
    li a0, 0x22
    ecall
    ret


context_switch:

    ld ra, 48(a1)
    ld sp, 24(a1)

    ret

getc_trap:
        mv a1, a0
        li a0, 0x41
        ecall
        ret

putc_trap:
    mv a2, a1
    mv a1, a0
    li a0, 0x42
    ecall
    ret