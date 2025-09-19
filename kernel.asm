
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	cc813103          	ld	sp,-824(sp) # 8000ccc8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	781060ef          	jal	ra,80006f9c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <handle_interrupt>:
.global getc_trap

.type context_switch, @function

handle_interrupt:
            mv t0, a0                     # t0 = kod prekida
    80001000:	00050293          	mv	t0,a0
            csrw sscratch, ra
    80001004:	14009073          	csrw	sscratch,ra
            # Ubaci running thread context u a1
            call getRunningThreadContext
    80001008:	19d010ef          	jal	ra,800029a4 <getRunningThreadContext>
            mv a1, a0                     # a1 = context
    8000100c:	00050593          	mv	a1,a0
            csrr ra, sscratch
    80001010:	140020f3          	csrr	ra,sscratch
            # Vrati a0 nazad
            mv a0, t0
    80001014:	00028513          	mv	a0,t0


    	    addi sp, sp, -240
    80001018:	f1010113          	addi	sp,sp,-240

            sd ra, 0(sp)
    8000101c:	00113023          	sd	ra,0(sp)
        	sd s0, 8(sp)
    80001020:	00813423          	sd	s0,8(sp)
        	sd s1, 16(sp)
    80001024:	00913823          	sd	s1,16(sp)

        	sd s2, 24(sp)
    80001028:	01213c23          	sd	s2,24(sp)
        	sd s3, 32(sp)
    8000102c:	03313023          	sd	s3,32(sp)
        	sd s4, 40(sp)
    80001030:	03413423          	sd	s4,40(sp)
        	sd s5, 48(sp)
    80001034:	03513823          	sd	s5,48(sp)
        	sd s6, 56(sp)
    80001038:	03613c23          	sd	s6,56(sp)
        	sd s7, 64(sp)
    8000103c:	05713023          	sd	s7,64(sp)
        	sd s8, 72(sp)
    80001040:	05813423          	sd	s8,72(sp)
        	sd s9, 80(sp)
    80001044:	05913823          	sd	s9,80(sp)
        	sd s10, 88(sp)
    80001048:	05a13c23          	sd	s10,88(sp)
        	sd s11, 96(sp)
    8000104c:	07b13023          	sd	s11,96(sp)
        	sd a1, 104(sp)
    80001050:	06b13423          	sd	a1,104(sp)
        	sd a2, 112(sp)
    80001054:	06c13823          	sd	a2,112(sp)
        	sd a3, 120(sp)
    80001058:	06d13c23          	sd	a3,120(sp)
        	sd a4, 128(sp)
    8000105c:	08e13023          	sd	a4,128(sp)
        	sd a5, 136(sp)
    80001060:	08f13423          	sd	a5,136(sp)

        	sd a6, 144(sp)
    80001064:	09013823          	sd	a6,144(sp)
        	sd a7, 152(sp)
    80001068:	09113c23          	sd	a7,152(sp)
        	sd t0, 160(sp)
    8000106c:	0a513023          	sd	t0,160(sp)
        	sd t1, 168(sp)
    80001070:	0a613423          	sd	t1,168(sp)
        	sd t2, 176(sp)
    80001074:	0a713823          	sd	t2,176(sp)
        	sd t3, 184(sp)
    80001078:	0bc13c23          	sd	t3,184(sp)
        	sd t4, 192(sp)
    8000107c:	0dd13023          	sd	t4,192(sp)
        	sd t5, 200(sp)
    80001080:	0de13423          	sd	t5,200(sp)
        	sd t6, 208(sp)
    80001084:	0df13823          	sd	t6,208(sp)
        	sd gp, 216(sp)
    80001088:	0c313c23          	sd	gp,216(sp)

        	sd tp, 224(sp)
    8000108c:	0e413023          	sd	tp,224(sp)

        	sd sp, 24(a1)
    80001090:	0025bc23          	sd	sp,24(a1)

        	ld sp, 32(a1)
    80001094:	0205b103          	ld	sp,32(a1)


        	call interrupt
    80001098:	088020ef          	jal	ra,80003120 <interrupt>
        	mv t0, a0                     # t0 = kod prekida
    8000109c:	00050293          	mv	t0,a0
            csrw sscratch, ra
    800010a0:	14009073          	csrw	sscratch,ra
            # Ubaci running thread context u a1
            call getRunningThreadContext
    800010a4:	101010ef          	jal	ra,800029a4 <getRunningThreadContext>
            mv a1, a0                     # a1 = context
    800010a8:	00050593          	mv	a1,a0
            csrr ra, sscratch
    800010ac:	140020f3          	csrr	ra,sscratch
            # Vrati a0 nazad
            mv a0, t0
    800010b0:	00028513          	mv	a0,t0

            ld sp, 24(a1)
    800010b4:	0185b103          	ld	sp,24(a1)
            ld ra, 0(sp)
    800010b8:	00013083          	ld	ra,0(sp)


            ld s0, 8(sp)
    800010bc:	00813403          	ld	s0,8(sp)
            ld s1, 16(sp)
    800010c0:	01013483          	ld	s1,16(sp)
            ld s2, 24(sp)
    800010c4:	01813903          	ld	s2,24(sp)
            ld s3, 32(sp)
    800010c8:	02013983          	ld	s3,32(sp)
            ld s4, 40(sp)
    800010cc:	02813a03          	ld	s4,40(sp)
            ld s5, 48(sp)
    800010d0:	03013a83          	ld	s5,48(sp)
            ld s6, 56(sp)
    800010d4:	03813b03          	ld	s6,56(sp)
            ld s7, 64(sp)
    800010d8:	04013b83          	ld	s7,64(sp)
            ld s8, 72(sp)
    800010dc:	04813c03          	ld	s8,72(sp)
            ld s9, 80(sp)
    800010e0:	05013c83          	ld	s9,80(sp)
            ld s10, 88(sp)
    800010e4:	05813d03          	ld	s10,88(sp)
            ld s11, 96(sp)
    800010e8:	06013d83          	ld	s11,96(sp)

            ld a2, 112(sp)
    800010ec:	07013603          	ld	a2,112(sp)
            ld a3, 120(sp)
    800010f0:	07813683          	ld	a3,120(sp)
            ld a4, 128(sp)
    800010f4:	08013703          	ld	a4,128(sp)
            ld a5, 136(sp)
    800010f8:	08813783          	ld	a5,136(sp)
            ld a6, 144(sp)
    800010fc:	09013803          	ld	a6,144(sp)
            ld a7, 152(sp)
    80001100:	09813883          	ld	a7,152(sp)
            ld t0, 160(sp)
    80001104:	0a013283          	ld	t0,160(sp)
            ld t1, 168(sp)
    80001108:	0a813303          	ld	t1,168(sp)
            ld t2, 176(sp)
    8000110c:	0b013383          	ld	t2,176(sp)
            ld t3, 184(sp)
    80001110:	0b813e03          	ld	t3,184(sp)
            ld t4, 192(sp)
    80001114:	0c013e83          	ld	t4,192(sp)
            ld t5, 200(sp)
    80001118:	0c813f03          	ld	t5,200(sp)
            ld t6, 208(sp)
    8000111c:	0d013f83          	ld	t6,208(sp)
            ld gp, 216(sp)
    80001120:	0d813183          	ld	gp,216(sp)
            ld tp, 224(sp)
    80001124:	0e013203          	ld	tp,224(sp)


            ld a1, 104(sp)
    80001128:	06813583          	ld	a1,104(sp)

        	addi sp, sp, 240
    8000112c:	0f010113          	addi	sp,sp,240
        	sret
    80001130:	10200073          	sret

0000000080001134 <restore_context_kernel_mode>:




restore_context_kernel_mode:
     ld sp, 24(a0)
    80001134:	01853103          	ld	sp,24(a0) # 1018 <_entry-0x7fffefe8>
                 ld ra, 0(sp)
    80001138:	00013083          	ld	ra,0(sp)


                 ld s0, 8(sp)
    8000113c:	00813403          	ld	s0,8(sp)
                 ld s1, 16(sp)
    80001140:	01013483          	ld	s1,16(sp)
                 ld s2, 24(sp)
    80001144:	01813903          	ld	s2,24(sp)
                 ld s3, 32(sp)
    80001148:	02013983          	ld	s3,32(sp)
                 ld s4, 40(sp)
    8000114c:	02813a03          	ld	s4,40(sp)
                 ld s5, 48(sp)
    80001150:	03013a83          	ld	s5,48(sp)
                 ld s6, 56(sp)
    80001154:	03813b03          	ld	s6,56(sp)
                 ld s7, 64(sp)
    80001158:	04013b83          	ld	s7,64(sp)
                 ld s8, 72(sp)
    8000115c:	04813c03          	ld	s8,72(sp)
                 ld s9, 80(sp)
    80001160:	05013c83          	ld	s9,80(sp)
                 ld s10, 88(sp)
    80001164:	05813d03          	ld	s10,88(sp)
                 ld s11, 96(sp)
    80001168:	06013d83          	ld	s11,96(sp)

                 ld a2, 112(sp)
    8000116c:	07013603          	ld	a2,112(sp)
                 ld a3, 120(sp)
    80001170:	07813683          	ld	a3,120(sp)
                 ld a4, 128(sp)
    80001174:	08013703          	ld	a4,128(sp)
                 ld a5, 136(sp)
    80001178:	08813783          	ld	a5,136(sp)
                 ld a6, 144(sp)
    8000117c:	09013803          	ld	a6,144(sp)
                 ld a7, 152(sp)
    80001180:	09813883          	ld	a7,152(sp)
                 ld t0, 160(sp)
    80001184:	0a013283          	ld	t0,160(sp)
                 ld t1, 168(sp)
    80001188:	0a813303          	ld	t1,168(sp)
                 ld t2, 176(sp)
    8000118c:	0b013383          	ld	t2,176(sp)
                 ld t3, 184(sp)
    80001190:	0b813e03          	ld	t3,184(sp)
                 ld t4, 192(sp)
    80001194:	0c013e83          	ld	t4,192(sp)
                 ld t5, 200(sp)
    80001198:	0c813f03          	ld	t5,200(sp)
                 ld t6, 208(sp)
    8000119c:	0d013f83          	ld	t6,208(sp)
                 ld gp, 216(sp)
    800011a0:	0d813183          	ld	gp,216(sp)
                 ld tp, 224(sp)
    800011a4:	0e013203          	ld	tp,224(sp)


                 ld a1, 104(sp)
    800011a8:	06813583          	ld	a1,104(sp)

             	addi sp, sp, 240
    800011ac:	0f010113          	addi	sp,sp,240
             	sret
    800011b0:	10200073          	sret

00000000800011b4 <mem_alloc_trap>:


mem_alloc_trap:
    mv a2, a1
    800011b4:	00058613          	mv	a2,a1
    mv a1, a0
    800011b8:	00050593          	mv	a1,a0
    li a0, 0x01
    800011bc:	00100513          	li	a0,1
    ecall
    800011c0:	00000073          	ecall
    ret
    800011c4:	00008067          	ret

00000000800011c8 <mem_free_trap>:
mem_free_trap:
    mv a2, a1
    800011c8:	00058613          	mv	a2,a1
    mv a1, a0
    800011cc:	00050593          	mv	a1,a0
    li a0, 0x02
    800011d0:	00200513          	li	a0,2
    ecall
    800011d4:	00000073          	ecall
    ret
    800011d8:	00008067          	ret

00000000800011dc <thread_exit_trap>:
thread_exit_trap:
    mv a1, a0
    800011dc:	00050593          	mv	a1,a0
    li a0, 0x12
    800011e0:	01200513          	li	a0,18
     ecall
    800011e4:	00000073          	ecall
    ret
    800011e8:	00008067          	ret

00000000800011ec <thread_create_trap>:
thread_create_trap:
   mv a5, a4
    800011ec:	00070793          	mv	a5,a4
   mv a4, a3
    800011f0:	00068713          	mv	a4,a3
   mv a3, a2
    800011f4:	00060693          	mv	a3,a2
   mv a2, a1
    800011f8:	00058613          	mv	a2,a1
   mv a1, a0
    800011fc:	00050593          	mv	a1,a0
   li a0, 0x11
    80001200:	01100513          	li	a0,17
    ecall
    80001204:	00000073          	ecall
   ret
    80001208:	00008067          	ret

000000008000120c <thread_dispatch_trap>:
thread_dispatch_trap:
    mv a1, a0
    8000120c:	00050593          	mv	a1,a0
    li a0, 0x13
    80001210:	01300513          	li	a0,19
     ecall
    80001214:	00000073          	ecall
    ret
    80001218:	00008067          	ret

000000008000121c <mem_get_free_space_trap>:

mem_get_free_space_trap:
    li a0, 0x03
    8000121c:	00300513          	li	a0,3
     ecall
    80001220:	00000073          	ecall
    ret
    80001224:	00008067          	ret

0000000080001228 <mem_get_largest_free_block_trap>:

mem_get_largest_free_block_trap:
    li a0, 0x04
    80001228:	00400513          	li	a0,4
    ecall
    8000122c:	00000073          	ecall
    ret
    80001230:	00008067          	ret

0000000080001234 <sem_open_trap>:
sem_open_trap:
    mv a3, a2
    80001234:	00060693          	mv	a3,a2
    mv a2, a1
    80001238:	00058613          	mv	a2,a1
    mv a1, a0
    8000123c:	00050593          	mv	a1,a0
    li a0, 0x21
    80001240:	02100513          	li	a0,33
    ecall
    80001244:	00000073          	ecall
    ret
    80001248:	00008067          	ret

000000008000124c <sem_wait_trap>:

sem_wait_trap:
    mv a2, a1
    8000124c:	00058613          	mv	a2,a1
    mv a1, a0
    80001250:	00050593          	mv	a1,a0
    li a0, 0x23
    80001254:	02300513          	li	a0,35
    ecall
    80001258:	00000073          	ecall
    ret
    8000125c:	00008067          	ret

0000000080001260 <thread_wrapper>:
thread_wrapper:
    ld sp, 24(a0)
    80001260:	01853103          	ld	sp,24(a0)
   ld t0, 40(a0)
    80001264:	02853283          	ld	t0,40(a0)
   csrw sstatus, t0
    80001268:	10029073          	csrw	sstatus,t0
   ld t0, 0(a1)
    8000126c:	0005b283          	ld	t0,0(a1)
   csrw sscratch, a0
    80001270:	14051073          	csrw	sscratch,a0
   ld a0, 8(a1)
    80001274:	0085b503          	ld	a0,8(a1)
   jalr ra, t0, 0
    80001278:	000280e7          	jalr	t0
   csrr a0, sscratch
    8000127c:	14002573          	csrr	a0,sscratch
   j thread_exit_trap
    80001280:	f5dff06f          	j	800011dc <thread_exit_trap>
   ret
    80001284:	00008067          	ret

0000000080001288 <sem_signal_trap>:


sem_signal_trap:
    mv a2,a1
    80001288:	00058613          	mv	a2,a1
    mv a1, a0
    8000128c:	00050593          	mv	a1,a0
    li a0, 0x24
    80001290:	02400513          	li	a0,36
    ecall
    80001294:	00000073          	ecall
    ret
    80001298:	00008067          	ret

000000008000129c <sem_close_trap>:
sem_close_trap:
    mv a2, a1
    8000129c:	00058613          	mv	a2,a1
    mv a1, a0
    800012a0:	00050593          	mv	a1,a0
    li a0, 0x22
    800012a4:	02200513          	li	a0,34
    ecall
    800012a8:	00000073          	ecall
    ret
    800012ac:	00008067          	ret

00000000800012b0 <context_switch>:


context_switch:

    ld ra, 48(a1)
    800012b0:	0305b083          	ld	ra,48(a1)
    ld sp, 24(a1)
    800012b4:	0185b103          	ld	sp,24(a1)

    ret
    800012b8:	00008067          	ret

00000000800012bc <getc_trap>:

getc_trap:
        mv a1, a0
    800012bc:	00050593          	mv	a1,a0
        li a0, 0x41
    800012c0:	04100513          	li	a0,65
        ecall
    800012c4:	00000073          	ecall
        ret
    800012c8:	00008067          	ret

00000000800012cc <putc_trap>:

putc_trap:
    mv a2, a1
    800012cc:	00058613          	mv	a2,a1
    mv a1, a0
    800012d0:	00050593          	mv	a1,a0
    li a0, 0x42
    800012d4:	04200513          	li	a0,66
    ecall
    800012d8:	00000073          	ecall
    ret
    800012dc:	00008067          	ret
	...

00000000800012e8 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    800012e8:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    800012ec:	00b29a63          	bne	t0,a1,80001300 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    800012f0:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    800012f4:	fe029ae3          	bnez	t0,800012e8 <copy_and_swap>
    li a0, 0               # Set return to success.
    800012f8:	00000513          	li	a0,0
    jr ra                  # Return.
    800012fc:	00008067          	ret

0000000080001300 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001300:	00100513          	li	a0,1
    80001304:	00008067          	ret

0000000080001308 <abi_mem_alloc>:
char getc_trap(ThreadContext* t);
void putc_trap(ThreadContext* t, char c);
void time_sleep_trap(ThreadContext* t, time_t slice);


void* abi_mem_alloc(ThreadContext* c, size_t blocks) {
    80001308:	ff010113          	addi	sp,sp,-16
    8000130c:	00113423          	sd	ra,8(sp)
    80001310:	00813023          	sd	s0,0(sp)
    80001314:	01010413          	addi	s0,sp,16

    uint64 result =  mem_alloc_trap(c, blocks);
    80001318:	00000097          	auipc	ra,0x0
    8000131c:	e9c080e7          	jalr	-356(ra) # 800011b4 <mem_alloc_trap>
    void* res = (void*)result;
    return res;

}
    80001320:	00813083          	ld	ra,8(sp)
    80001324:	00013403          	ld	s0,0(sp)
    80001328:	01010113          	addi	sp,sp,16
    8000132c:	00008067          	ret

0000000080001330 <abi_mem_free>:

int abi_mem_free(ThreadContext* c, void* ptr){
    80001330:	ff010113          	addi	sp,sp,-16
    80001334:	00113423          	sd	ra,8(sp)
    80001338:	00813023          	sd	s0,0(sp)
    8000133c:	01010413          	addi	s0,sp,16
    return mem_free_trap(c, ptr);
    80001340:	00000097          	auipc	ra,0x0
    80001344:	e88080e7          	jalr	-376(ra) # 800011c8 <mem_free_trap>
}
    80001348:	00813083          	ld	ra,8(sp)
    8000134c:	00013403          	ld	s0,0(sp)
    80001350:	01010113          	addi	sp,sp,16
    80001354:	00008067          	ret

0000000080001358 <abi_thread_create>:

int abi_thread_create(ThreadContext* c, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space){
    80001358:	ff010113          	addi	sp,sp,-16
    8000135c:	00113423          	sd	ra,8(sp)
    80001360:	00813023          	sd	s0,0(sp)
    80001364:	01010413          	addi	s0,sp,16
    return thread_create_trap(c, handle, startRoutine, args, stack_space);
    80001368:	00000097          	auipc	ra,0x0
    8000136c:	e84080e7          	jalr	-380(ra) # 800011ec <thread_create_trap>
}
    80001370:	00813083          	ld	ra,8(sp)
    80001374:	00013403          	ld	s0,0(sp)
    80001378:	01010113          	addi	sp,sp,16
    8000137c:	00008067          	ret

0000000080001380 <abi_thread_exit>:
int abi_thread_exit(ThreadContext* c){
    80001380:	ff010113          	addi	sp,sp,-16
    80001384:	00113423          	sd	ra,8(sp)
    80001388:	00813023          	sd	s0,0(sp)
    8000138c:	01010413          	addi	s0,sp,16
    return thread_exit_trap(c);
    80001390:	00000097          	auipc	ra,0x0
    80001394:	e4c080e7          	jalr	-436(ra) # 800011dc <thread_exit_trap>
}
    80001398:	00813083          	ld	ra,8(sp)
    8000139c:	00013403          	ld	s0,0(sp)
    800013a0:	01010113          	addi	sp,sp,16
    800013a4:	00008067          	ret

00000000800013a8 <abi_thread_dispatch>:

void abi_thread_dispatch(ThreadContext* c){
    800013a8:	ff010113          	addi	sp,sp,-16
    800013ac:	00113423          	sd	ra,8(sp)
    800013b0:	00813023          	sd	s0,0(sp)
    800013b4:	01010413          	addi	s0,sp,16
   return thread_dispatch_trap(c);
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	e54080e7          	jalr	-428(ra) # 8000120c <thread_dispatch_trap>
}
    800013c0:	00813083          	ld	ra,8(sp)
    800013c4:	00013403          	ld	s0,0(sp)
    800013c8:	01010113          	addi	sp,sp,16
    800013cc:	00008067          	ret

00000000800013d0 <abi_mem_get_free_space>:

size_t abi_mem_get_free_space(){
    800013d0:	ff010113          	addi	sp,sp,-16
    800013d4:	00113423          	sd	ra,8(sp)
    800013d8:	00813023          	sd	s0,0(sp)
    800013dc:	01010413          	addi	s0,sp,16
    return mem_get_free_space_trap();
    800013e0:	00000097          	auipc	ra,0x0
    800013e4:	e3c080e7          	jalr	-452(ra) # 8000121c <mem_get_free_space_trap>
}
    800013e8:	00813083          	ld	ra,8(sp)
    800013ec:	00013403          	ld	s0,0(sp)
    800013f0:	01010113          	addi	sp,sp,16
    800013f4:	00008067          	ret

00000000800013f8 <abi_mem_get_largest_free_block>:
size_t abi_mem_get_largest_free_block(){
    800013f8:	ff010113          	addi	sp,sp,-16
    800013fc:	00113423          	sd	ra,8(sp)
    80001400:	00813023          	sd	s0,0(sp)
    80001404:	01010413          	addi	s0,sp,16
    return mem_get_largest_free_block_trap();
    80001408:	00000097          	auipc	ra,0x0
    8000140c:	e20080e7          	jalr	-480(ra) # 80001228 <mem_get_largest_free_block_trap>
}
    80001410:	00813083          	ld	ra,8(sp)
    80001414:	00013403          	ld	s0,0(sp)
    80001418:	01010113          	addi	sp,sp,16
    8000141c:	00008067          	ret

0000000080001420 <abi_sem_open>:
int abi_sem_open(ThreadContext* t, sem_t* handle, int init){
    80001420:	ff010113          	addi	sp,sp,-16
    80001424:	00113423          	sd	ra,8(sp)
    80001428:	00813023          	sd	s0,0(sp)
    8000142c:	01010413          	addi	s0,sp,16
    return sem_open_trap(t, handle, init);
    80001430:	00000097          	auipc	ra,0x0
    80001434:	e04080e7          	jalr	-508(ra) # 80001234 <sem_open_trap>
}
    80001438:	00813083          	ld	ra,8(sp)
    8000143c:	00013403          	ld	s0,0(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <abi_sem_wait>:
int abi_sem_wait(ThreadContext* t, sem_t id){
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00113423          	sd	ra,8(sp)
    80001450:	00813023          	sd	s0,0(sp)
    80001454:	01010413          	addi	s0,sp,16
    return sem_wait_trap(t, id);
    80001458:	00000097          	auipc	ra,0x0
    8000145c:	df4080e7          	jalr	-524(ra) # 8000124c <sem_wait_trap>
}
    80001460:	00813083          	ld	ra,8(sp)
    80001464:	00013403          	ld	s0,0(sp)
    80001468:	01010113          	addi	sp,sp,16
    8000146c:	00008067          	ret

0000000080001470 <abi_sem_signal>:
int abi_sem_signal(ThreadContext* t, sem_t id){
    80001470:	ff010113          	addi	sp,sp,-16
    80001474:	00113423          	sd	ra,8(sp)
    80001478:	00813023          	sd	s0,0(sp)
    8000147c:	01010413          	addi	s0,sp,16
    return sem_signal_trap(t, id);
    80001480:	00000097          	auipc	ra,0x0
    80001484:	e08080e7          	jalr	-504(ra) # 80001288 <sem_signal_trap>
}
    80001488:	00813083          	ld	ra,8(sp)
    8000148c:	00013403          	ld	s0,0(sp)
    80001490:	01010113          	addi	sp,sp,16
    80001494:	00008067          	ret

0000000080001498 <abi_sem_close>:
int abi_sem_close(ThreadContext* t, sem_t id){
    80001498:	ff010113          	addi	sp,sp,-16
    8000149c:	00113423          	sd	ra,8(sp)
    800014a0:	00813023          	sd	s0,0(sp)
    800014a4:	01010413          	addi	s0,sp,16
    return sem_close_trap(t, id);
    800014a8:	00000097          	auipc	ra,0x0
    800014ac:	df4080e7          	jalr	-524(ra) # 8000129c <sem_close_trap>
}
    800014b0:	00813083          	ld	ra,8(sp)
    800014b4:	00013403          	ld	s0,0(sp)
    800014b8:	01010113          	addi	sp,sp,16
    800014bc:	00008067          	ret

00000000800014c0 <abi_getc>:

char abi_getc(ThreadContext* t){
    800014c0:	ff010113          	addi	sp,sp,-16
    800014c4:	00113423          	sd	ra,8(sp)
    800014c8:	00813023          	sd	s0,0(sp)
    800014cc:	01010413          	addi	s0,sp,16
    return getc_trap(t);
    800014d0:	00000097          	auipc	ra,0x0
    800014d4:	dec080e7          	jalr	-532(ra) # 800012bc <getc_trap>
}
    800014d8:	00813083          	ld	ra,8(sp)
    800014dc:	00013403          	ld	s0,0(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <abi_putc>:
void abi_putc(ThreadContext* t, char c){
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00113423          	sd	ra,8(sp)
    800014f0:	00813023          	sd	s0,0(sp)
    800014f4:	01010413          	addi	s0,sp,16
     putc_trap(t, c);
    800014f8:	00000097          	auipc	ra,0x0
    800014fc:	dd4080e7          	jalr	-556(ra) # 800012cc <putc_trap>
}
    80001500:	00813083          	ld	ra,8(sp)
    80001504:	00013403          	ld	s0,0(sp)
    80001508:	01010113          	addi	sp,sp,16
    8000150c:	00008067          	ret

0000000080001510 <abi_time_sleep>:
void abi_time_sleep(ThreadContext* t, time_t slice){
    80001510:	ff010113          	addi	sp,sp,-16
    80001514:	00813423          	sd	s0,8(sp)
    80001518:	01010413          	addi	s0,sp,16
    //return time_sleep_trap(t, slice);
    8000151c:	00813403          	ld	s0,8(sp)
    80001520:	01010113          	addi	sp,sp,16
    80001524:	00008067          	ret

0000000080001528 <mem_alloc>:


extern "C" ThreadContext * getRunningThreadContext();
extern int getWaitStatusForRunning();

void* mem_alloc(size_t size) {
    80001528:	fe010113          	addi	sp,sp,-32
    8000152c:	00113c23          	sd	ra,24(sp)
    80001530:	00813823          	sd	s0,16(sp)
    80001534:	00913423          	sd	s1,8(sp)
    80001538:	02010413          	addi	s0,sp,32
    size_t numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE ;
    8000153c:	04750493          	addi	s1,a0,71
    80001540:	0064d493          	srli	s1,s1,0x6
    ThreadContext *t = getRunningThreadContext();
    80001544:	00001097          	auipc	ra,0x1
    80001548:	460080e7          	jalr	1120(ra) # 800029a4 <getRunningThreadContext>
    return (char*)abi_mem_alloc(t, numOfBlocks) + sizeof(Header);
    8000154c:	00048593          	mv	a1,s1
    80001550:	00000097          	auipc	ra,0x0
    80001554:	db8080e7          	jalr	-584(ra) # 80001308 <abi_mem_alloc>
}
    80001558:	00850513          	addi	a0,a0,8
    8000155c:	01813083          	ld	ra,24(sp)
    80001560:	01013403          	ld	s0,16(sp)
    80001564:	00813483          	ld	s1,8(sp)
    80001568:	02010113          	addi	sp,sp,32
    8000156c:	00008067          	ret

0000000080001570 <mem_free>:
int mem_free(void* ptr){
    if(!ptr) return 0;
    80001570:	04050263          	beqz	a0,800015b4 <mem_free+0x44>
int mem_free(void* ptr){
    80001574:	fe010113          	addi	sp,sp,-32
    80001578:	00113c23          	sd	ra,24(sp)
    8000157c:	00813823          	sd	s0,16(sp)
    80001580:	00913423          	sd	s1,8(sp)
    80001584:	02010413          	addi	s0,sp,32
    Header* header = (Header*)((char*)ptr - sizeof(Header));
    80001588:	ff850493          	addi	s1,a0,-8
    ThreadContext *t = getRunningThreadContext();
    8000158c:	00001097          	auipc	ra,0x1
    80001590:	418080e7          	jalr	1048(ra) # 800029a4 <getRunningThreadContext>
    return abi_mem_free(t, header);
    80001594:	00048593          	mv	a1,s1
    80001598:	00000097          	auipc	ra,0x0
    8000159c:	d98080e7          	jalr	-616(ra) # 80001330 <abi_mem_free>
}
    800015a0:	01813083          	ld	ra,24(sp)
    800015a4:	01013403          	ld	s0,16(sp)
    800015a8:	00813483          	ld	s1,8(sp)
    800015ac:	02010113          	addi	sp,sp,32
    800015b0:	00008067          	ret
    if(!ptr) return 0;
    800015b4:	00000513          	li	a0,0
}
    800015b8:	00008067          	ret

00000000800015bc <thread_create>:

int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args)
{
    800015bc:	fd010113          	addi	sp,sp,-48
    800015c0:	02113423          	sd	ra,40(sp)
    800015c4:	02813023          	sd	s0,32(sp)
    800015c8:	00913c23          	sd	s1,24(sp)
    800015cc:	01213823          	sd	s2,16(sp)
    800015d0:	01313423          	sd	s3,8(sp)
    800015d4:	01413023          	sd	s4,0(sp)
    800015d8:	03010413          	addi	s0,sp,48
    800015dc:	00050913          	mv	s2,a0
    800015e0:	00058993          	mv	s3,a1
    800015e4:	00060a13          	mv	s4,a2
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    ThreadContext *t = getRunningThreadContext();
    800015e8:	00001097          	auipc	ra,0x1
    800015ec:	3bc080e7          	jalr	956(ra) # 800029a4 <getRunningThreadContext>
    800015f0:	00050493          	mv	s1,a0
    void* result = abi_mem_alloc(t, numOfBlocks);
    800015f4:	08100593          	li	a1,129
    800015f8:	00000097          	auipc	ra,0x0
    800015fc:	d10080e7          	jalr	-752(ra) # 80001308 <abi_mem_alloc>
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    return abi_thread_create(t, handle, startRoutine, args, stack_top);
    80001600:	000027b7          	lui	a5,0x2
    80001604:	00878793          	addi	a5,a5,8 # 2008 <_entry-0x7fffdff8>
    80001608:	00f50733          	add	a4,a0,a5
    8000160c:	000a0693          	mv	a3,s4
    80001610:	00098613          	mv	a2,s3
    80001614:	00090593          	mv	a1,s2
    80001618:	00048513          	mv	a0,s1
    8000161c:	00000097          	auipc	ra,0x0
    80001620:	d3c080e7          	jalr	-708(ra) # 80001358 <abi_thread_create>
}
    80001624:	02813083          	ld	ra,40(sp)
    80001628:	02013403          	ld	s0,32(sp)
    8000162c:	01813483          	ld	s1,24(sp)
    80001630:	01013903          	ld	s2,16(sp)
    80001634:	00813983          	ld	s3,8(sp)
    80001638:	00013a03          	ld	s4,0(sp)
    8000163c:	03010113          	addi	sp,sp,48
    80001640:	00008067          	ret

0000000080001644 <thread_exit>:

int thread_exit(){
    80001644:	ff010113          	addi	sp,sp,-16
    80001648:	00113423          	sd	ra,8(sp)
    8000164c:	00813023          	sd	s0,0(sp)
    80001650:	01010413          	addi	s0,sp,16
    ThreadContext *t = getRunningThreadContext();
    80001654:	00001097          	auipc	ra,0x1
    80001658:	350080e7          	jalr	848(ra) # 800029a4 <getRunningThreadContext>
    return abi_thread_exit(t);
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	d24080e7          	jalr	-732(ra) # 80001380 <abi_thread_exit>
}
    80001664:	00813083          	ld	ra,8(sp)
    80001668:	00013403          	ld	s0,0(sp)
    8000166c:	01010113          	addi	sp,sp,16
    80001670:	00008067          	ret

0000000080001674 <thread_dispatch>:
void thread_dispatch(){
    80001674:	ff010113          	addi	sp,sp,-16
    80001678:	00113423          	sd	ra,8(sp)
    8000167c:	00813023          	sd	s0,0(sp)
    80001680:	01010413          	addi	s0,sp,16
    ThreadContext *t = getRunningThreadContext();
    80001684:	00001097          	auipc	ra,0x1
    80001688:	320080e7          	jalr	800(ra) # 800029a4 <getRunningThreadContext>
    abi_thread_dispatch(t);
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	d1c080e7          	jalr	-740(ra) # 800013a8 <abi_thread_dispatch>
}
    80001694:	00813083          	ld	ra,8(sp)
    80001698:	00013403          	ld	s0,0(sp)
    8000169c:	01010113          	addi	sp,sp,16
    800016a0:	00008067          	ret

00000000800016a4 <mem_get_free_space>:
size_t mem_get_free_space(){
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00113423          	sd	ra,8(sp)
    800016ac:	00813023          	sd	s0,0(sp)
    800016b0:	01010413          	addi	s0,sp,16
    return abi_mem_get_free_space();
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	d1c080e7          	jalr	-740(ra) # 800013d0 <abi_mem_get_free_space>
}
    800016bc:	00813083          	ld	ra,8(sp)
    800016c0:	00013403          	ld	s0,0(sp)
    800016c4:	01010113          	addi	sp,sp,16
    800016c8:	00008067          	ret

00000000800016cc <mem_get_largest_free_block>:
size_t mem_get_largest_free_block(){
    800016cc:	ff010113          	addi	sp,sp,-16
    800016d0:	00113423          	sd	ra,8(sp)
    800016d4:	00813023          	sd	s0,0(sp)
    800016d8:	01010413          	addi	s0,sp,16
    return abi_mem_get_largest_free_block();
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	d1c080e7          	jalr	-740(ra) # 800013f8 <abi_mem_get_largest_free_block>
}
    800016e4:	00813083          	ld	ra,8(sp)
    800016e8:	00013403          	ld	s0,0(sp)
    800016ec:	01010113          	addi	sp,sp,16
    800016f0:	00008067          	ret

00000000800016f4 <sem_open>:

int sem_open(sem_t* handle, unsigned init){
    800016f4:	fe010113          	addi	sp,sp,-32
    800016f8:	00113c23          	sd	ra,24(sp)
    800016fc:	00813823          	sd	s0,16(sp)
    80001700:	00913423          	sd	s1,8(sp)
    80001704:	01213023          	sd	s2,0(sp)
    80001708:	02010413          	addi	s0,sp,32
    8000170c:	00050493          	mv	s1,a0
    80001710:	00058913          	mv	s2,a1
    ThreadContext *t = getRunningThreadContext();
    80001714:	00001097          	auipc	ra,0x1
    80001718:	290080e7          	jalr	656(ra) # 800029a4 <getRunningThreadContext>
    return abi_sem_open(t, handle, init);
    8000171c:	00090613          	mv	a2,s2
    80001720:	00048593          	mv	a1,s1
    80001724:	00000097          	auipc	ra,0x0
    80001728:	cfc080e7          	jalr	-772(ra) # 80001420 <abi_sem_open>
}
    8000172c:	01813083          	ld	ra,24(sp)
    80001730:	01013403          	ld	s0,16(sp)
    80001734:	00813483          	ld	s1,8(sp)
    80001738:	00013903          	ld	s2,0(sp)
    8000173c:	02010113          	addi	sp,sp,32
    80001740:	00008067          	ret

0000000080001744 <sem_wait>:

int sem_wait(sem_t id){
    80001744:	fe010113          	addi	sp,sp,-32
    80001748:	00113c23          	sd	ra,24(sp)
    8000174c:	00813823          	sd	s0,16(sp)
    80001750:	00913423          	sd	s1,8(sp)
    80001754:	02010413          	addi	s0,sp,32
    80001758:	00050493          	mv	s1,a0
    ThreadContext *t = getRunningThreadContext();
    8000175c:	00001097          	auipc	ra,0x1
    80001760:	248080e7          	jalr	584(ra) # 800029a4 <getRunningThreadContext>
    abi_sem_wait(t, id);
    80001764:	00048593          	mv	a1,s1
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	ce0080e7          	jalr	-800(ra) # 80001448 <abi_sem_wait>
    int status = getWaitStatusForRunning();
    80001770:	00002097          	auipc	ra,0x2
    80001774:	e68080e7          	jalr	-408(ra) # 800035d8 <_Z23getWaitStatusForRunningv>
    return status;
}
    80001778:	01813083          	ld	ra,24(sp)
    8000177c:	01013403          	ld	s0,16(sp)
    80001780:	00813483          	ld	s1,8(sp)
    80001784:	02010113          	addi	sp,sp,32
    80001788:	00008067          	ret

000000008000178c <sem_signal>:

int sem_signal(sem_t id){
    8000178c:	fe010113          	addi	sp,sp,-32
    80001790:	00113c23          	sd	ra,24(sp)
    80001794:	00813823          	sd	s0,16(sp)
    80001798:	00913423          	sd	s1,8(sp)
    8000179c:	02010413          	addi	s0,sp,32
    800017a0:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    800017a4:	00001097          	auipc	ra,0x1
    800017a8:	200080e7          	jalr	512(ra) # 800029a4 <getRunningThreadContext>
    return abi_sem_signal(t, id);
    800017ac:	00048593          	mv	a1,s1
    800017b0:	00000097          	auipc	ra,0x0
    800017b4:	cc0080e7          	jalr	-832(ra) # 80001470 <abi_sem_signal>
}
    800017b8:	01813083          	ld	ra,24(sp)
    800017bc:	01013403          	ld	s0,16(sp)
    800017c0:	00813483          	ld	s1,8(sp)
    800017c4:	02010113          	addi	sp,sp,32
    800017c8:	00008067          	ret

00000000800017cc <sem_close>:

int sem_close(sem_t id){
    800017cc:	fe010113          	addi	sp,sp,-32
    800017d0:	00113c23          	sd	ra,24(sp)
    800017d4:	00813823          	sd	s0,16(sp)
    800017d8:	00913423          	sd	s1,8(sp)
    800017dc:	02010413          	addi	s0,sp,32
    800017e0:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    800017e4:	00001097          	auipc	ra,0x1
    800017e8:	1c0080e7          	jalr	448(ra) # 800029a4 <getRunningThreadContext>
    return abi_sem_close(t, id);
    800017ec:	00048593          	mv	a1,s1
    800017f0:	00000097          	auipc	ra,0x0
    800017f4:	ca8080e7          	jalr	-856(ra) # 80001498 <abi_sem_close>
}
    800017f8:	01813083          	ld	ra,24(sp)
    800017fc:	01013403          	ld	s0,16(sp)
    80001800:	00813483          	ld	s1,8(sp)
    80001804:	02010113          	addi	sp,sp,32
    80001808:	00008067          	ret

000000008000180c <getc>:

char getc () {
    8000180c:	ff010113          	addi	sp,sp,-16
    80001810:	00113423          	sd	ra,8(sp)
    80001814:	00813023          	sd	s0,0(sp)
    80001818:	01010413          	addi	s0,sp,16

    ThreadContext* t = getRunningThreadContext();
    8000181c:	00001097          	auipc	ra,0x1
    80001820:	188080e7          	jalr	392(ra) # 800029a4 <getRunningThreadContext>
    return abi_getc(t);
    80001824:	00000097          	auipc	ra,0x0
    80001828:	c9c080e7          	jalr	-868(ra) # 800014c0 <abi_getc>
}
    8000182c:	00813083          	ld	ra,8(sp)
    80001830:	00013403          	ld	s0,0(sp)
    80001834:	01010113          	addi	sp,sp,16
    80001838:	00008067          	ret

000000008000183c <putc>:

void putc (char c){
    8000183c:	fe010113          	addi	sp,sp,-32
    80001840:	00113c23          	sd	ra,24(sp)
    80001844:	00813823          	sd	s0,16(sp)
    80001848:	00913423          	sd	s1,8(sp)
    8000184c:	02010413          	addi	s0,sp,32
    80001850:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    80001854:	00001097          	auipc	ra,0x1
    80001858:	150080e7          	jalr	336(ra) # 800029a4 <getRunningThreadContext>
    abi_putc(t, c);
    8000185c:	00048593          	mv	a1,s1
    80001860:	00000097          	auipc	ra,0x0
    80001864:	c88080e7          	jalr	-888(ra) # 800014e8 <abi_putc>
}
    80001868:	01813083          	ld	ra,24(sp)
    8000186c:	01013403          	ld	s0,16(sp)
    80001870:	00813483          	ld	s1,8(sp)
    80001874:	02010113          	addi	sp,sp,32
    80001878:	00008067          	ret

000000008000187c <time_sleep>:

void time_sleep(time_t slice){
    8000187c:	fe010113          	addi	sp,sp,-32
    80001880:	00113c23          	sd	ra,24(sp)
    80001884:	00813823          	sd	s0,16(sp)
    80001888:	00913423          	sd	s1,8(sp)
    8000188c:	02010413          	addi	s0,sp,32
    80001890:	00050493          	mv	s1,a0
    ThreadContext *t = getRunningThreadContext();
    80001894:	00001097          	auipc	ra,0x1
    80001898:	110080e7          	jalr	272(ra) # 800029a4 <getRunningThreadContext>
    abi_time_sleep(t, slice);
    8000189c:	00048593          	mv	a1,s1
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	c70080e7          	jalr	-912(ra) # 80001510 <abi_time_sleep>
}
    800018a8:	01813083          	ld	ra,24(sp)
    800018ac:	01013403          	ld	s0,16(sp)
    800018b0:	00813483          	ld	s1,8(sp)
    800018b4:	02010113          	addi	sp,sp,32
    800018b8:	00008067          	ret

00000000800018bc <_ZN10ThreadPoolC1Ev>:
#include "../h/ThreadPool.hpp"

ThreadPool::ThreadPool() : pool(nullptr), used(nullptr) {}
    800018bc:	ff010113          	addi	sp,sp,-16
    800018c0:	00813423          	sd	s0,8(sp)
    800018c4:	01010413          	addi	s0,sp,16
    800018c8:	00053023          	sd	zero,0(a0)
    800018cc:	00053423          	sd	zero,8(a0)
    800018d0:	00813403          	ld	s0,8(sp)
    800018d4:	01010113          	addi	sp,sp,16
    800018d8:	00008067          	ret

00000000800018dc <_ZN10ThreadPool4initEPvS0_>:

void ThreadPool::init(void* poolStartAddress, void* usedStartAddress) {
    800018dc:	ff010113          	addi	sp,sp,-16
    800018e0:	00813423          	sd	s0,8(sp)
    800018e4:	01010413          	addi	s0,sp,16
    pool = (Thread*)poolStartAddress;
    800018e8:	00b53023          	sd	a1,0(a0)
    used = (bool*)usedStartAddress;
    800018ec:	00c53423          	sd	a2,8(a0)
    for (int i = 0; i < MAX_THREADS; i++) used[i] = false;
    800018f0:	00000793          	li	a5,0
    800018f4:	00900713          	li	a4,9
    800018f8:	00f74c63          	blt	a4,a5,80001910 <_ZN10ThreadPool4initEPvS0_+0x34>
    800018fc:	00853703          	ld	a4,8(a0)
    80001900:	00f70733          	add	a4,a4,a5
    80001904:	00070023          	sb	zero,0(a4)
    80001908:	0017879b          	addiw	a5,a5,1
    8000190c:	fe9ff06f          	j	800018f4 <_ZN10ThreadPool4initEPvS0_+0x18>
}
    80001910:	00813403          	ld	s0,8(sp)
    80001914:	01010113          	addi	sp,sp,16
    80001918:	00008067          	ret

000000008000191c <_ZN10ThreadPool16getSemaphoreByIdEj>:

Thread* ThreadPool::getSemaphoreById(thread_t id){
    8000191c:	ff010113          	addi	sp,sp,-16
    80001920:	00813423          	sd	s0,8(sp)
    80001924:	01010413          	addi	s0,sp,16
    80001928:	00050693          	mv	a3,a0
    for(int i = 0; i < MAX_THREADS; i++){
    8000192c:	00000793          	li	a5,0
    80001930:	0080006f          	j	80001938 <_ZN10ThreadPool16getSemaphoreByIdEj+0x1c>
    80001934:	0017879b          	addiw	a5,a5,1
    80001938:	00900713          	li	a4,9
    8000193c:	02f74863          	blt	a4,a5,8000196c <_ZN10ThreadPool16getSemaphoreByIdEj+0x50>
        if(used[i] == true && pool[i].threadId == id){
    80001940:	0086b703          	ld	a4,8(a3)
    80001944:	00f70733          	add	a4,a4,a5
    80001948:	00074703          	lbu	a4,0(a4)
    8000194c:	fe0704e3          	beqz	a4,80001934 <_ZN10ThreadPool16getSemaphoreByIdEj+0x18>
    80001950:	0006b503          	ld	a0,0(a3)
    80001954:	0a800713          	li	a4,168
    80001958:	02e78733          	mul	a4,a5,a4
    8000195c:	00e50533          	add	a0,a0,a4
    80001960:	02452703          	lw	a4,36(a0)
    80001964:	fcb718e3          	bne	a4,a1,80001934 <_ZN10ThreadPool16getSemaphoreByIdEj+0x18>
    80001968:	0080006f          	j	80001970 <_ZN10ThreadPool16getSemaphoreByIdEj+0x54>
            return &pool[i];
        }
    }
    return nullptr;
    8000196c:	00000513          	li	a0,0
}
    80001970:	00813403          	ld	s0,8(sp)
    80001974:	01010113          	addi	sp,sp,16
    80001978:	00008067          	ret

000000008000197c <_ZN10ThreadPool8allocateEv>:
Thread* ThreadPool::allocate() {
    8000197c:	ff010113          	addi	sp,sp,-16
    80001980:	00813423          	sd	s0,8(sp)
    80001984:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_THREADS; i++) {
    80001988:	00000793          	li	a5,0
    8000198c:	00900713          	li	a4,9
    80001990:	02f74e63          	blt	a4,a5,800019cc <_ZN10ThreadPool8allocateEv+0x50>
        if (!used[i]) {
    80001994:	00853703          	ld	a4,8(a0)
    80001998:	00078613          	mv	a2,a5
    8000199c:	00f70733          	add	a4,a4,a5
    800019a0:	00074683          	lbu	a3,0(a4)
    800019a4:	00068663          	beqz	a3,800019b0 <_ZN10ThreadPool8allocateEv+0x34>
    for (int i = 0; i < MAX_THREADS; i++) {
    800019a8:	0017879b          	addiw	a5,a5,1
    800019ac:	fe1ff06f          	j	8000198c <_ZN10ThreadPool8allocateEv+0x10>
            used[i] = true;
    800019b0:	00100793          	li	a5,1
    800019b4:	00f70023          	sb	a5,0(a4)
            return &pool[i];
    800019b8:	00053503          	ld	a0,0(a0)
    800019bc:	0a800793          	li	a5,168
    800019c0:	02f60633          	mul	a2,a2,a5
    800019c4:	00c50533          	add	a0,a0,a2
    800019c8:	0080006f          	j	800019d0 <_ZN10ThreadPool8allocateEv+0x54>
        }
    }
    return nullptr;
    800019cc:	00000513          	li	a0,0
}
    800019d0:	00813403          	ld	s0,8(sp)
    800019d4:	01010113          	addi	sp,sp,16
    800019d8:	00008067          	ret

00000000800019dc <_ZN10ThreadPool10deallocateEP6Thread>:

void ThreadPool::deallocate(Thread* obj) {
    800019dc:	ff010113          	addi	sp,sp,-16
    800019e0:	00813423          	sd	s0,8(sp)
    800019e4:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_THREADS; i++) {
    800019e8:	00000793          	li	a5,0
    800019ec:	00900713          	li	a4,9
    800019f0:	02f74863          	blt	a4,a5,80001a20 <_ZN10ThreadPool10deallocateEP6Thread+0x44>
        if (&pool[i] == obj) {
    800019f4:	00053703          	ld	a4,0(a0)
    800019f8:	00078613          	mv	a2,a5
    800019fc:	0a800693          	li	a3,168
    80001a00:	02d786b3          	mul	a3,a5,a3
    80001a04:	00d70733          	add	a4,a4,a3
    80001a08:	00b70663          	beq	a4,a1,80001a14 <_ZN10ThreadPool10deallocateEP6Thread+0x38>
    for (int i = 0; i < MAX_THREADS; i++) {
    80001a0c:	0017879b          	addiw	a5,a5,1
    80001a10:	fddff06f          	j	800019ec <_ZN10ThreadPool10deallocateEP6Thread+0x10>
            used[i] = false;
    80001a14:	00853783          	ld	a5,8(a0)
    80001a18:	00c78633          	add	a2,a5,a2
    80001a1c:	00060023          	sb	zero,0(a2)
            return;
        }
    }
}
    80001a20:	00813403          	ld	s0,8(sp)
    80001a24:	01010113          	addi	sp,sp,16
    80001a28:	00008067          	ret

0000000080001a2c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned init){
    val = init;
    myHandle = cnt++;
}
Semaphore::~Semaphore() {}
    80001a2c:	ff010113          	addi	sp,sp,-16
    80001a30:	00113423          	sd	ra,8(sp)
    80001a34:	00813023          	sd	s0,0(sp)
    80001a38:	01010413          	addi	s0,sp,16
    80001a3c:	0000b797          	auipc	a5,0xb
    80001a40:	08c78793          	addi	a5,a5,140 # 8000cac8 <_ZTV9Semaphore+0x10>
    80001a44:	00f53023          	sd	a5,0(a0)
    80001a48:	01050513          	addi	a0,a0,16
    80001a4c:	00002097          	auipc	ra,0x2
    80001a50:	2a4080e7          	jalr	676(ra) # 80003cf0 <_ZN4ListI6ThreadED1Ev>
    80001a54:	00813083          	ld	ra,8(sp)
    80001a58:	00013403          	ld	s0,0(sp)
    80001a5c:	01010113          	addi	sp,sp,16
    80001a60:	00008067          	ret

0000000080001a64 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init){
    80001a64:	fe010113          	addi	sp,sp,-32
    80001a68:	00113c23          	sd	ra,24(sp)
    80001a6c:	00813823          	sd	s0,16(sp)
    80001a70:	00913423          	sd	s1,8(sp)
    80001a74:	01213023          	sd	s2,0(sp)
    80001a78:	02010413          	addi	s0,sp,32
    80001a7c:	00050493          	mv	s1,a0
    80001a80:	00058913          	mv	s2,a1
    80001a84:	0000b797          	auipc	a5,0xb
    80001a88:	04478793          	addi	a5,a5,68 # 8000cac8 <_ZTV9Semaphore+0x10>
    80001a8c:	00f53023          	sd	a5,0(a0)
    80001a90:	01050513          	addi	a0,a0,16
    80001a94:	00002097          	auipc	ra,0x2
    80001a98:	23c080e7          	jalr	572(ra) # 80003cd0 <_ZN4ListI6ThreadEC1Ev>
    val = init;
    80001a9c:	0124a623          	sw	s2,12(s1)
    myHandle = cnt++;
    80001aa0:	0000b717          	auipc	a4,0xb
    80001aa4:	01070713          	addi	a4,a4,16 # 8000cab0 <_ZN9Semaphore3cntE>
    80001aa8:	00072783          	lw	a5,0(a4)
    80001aac:	0017869b          	addiw	a3,a5,1
    80001ab0:	00d72023          	sw	a3,0(a4)
    80001ab4:	00f4a423          	sw	a5,8(s1)
}
    80001ab8:	01813083          	ld	ra,24(sp)
    80001abc:	01013403          	ld	s0,16(sp)
    80001ac0:	00813483          	ld	s1,8(sp)
    80001ac4:	00013903          	ld	s2,0(sp)
    80001ac8:	02010113          	addi	sp,sp,32
    80001acc:	00008067          	ret

0000000080001ad0 <_ZN9SemaphorenwEm>:
int Semaphore::signal(){
    sem_signal(this->myHandle);
    return 0;
}

void* Semaphore::operator new(size_t size) {
    80001ad0:	ff010113          	addi	sp,sp,-16
    80001ad4:	00113423          	sd	ra,8(sp)
    80001ad8:	00813023          	sd	s0,0(sp)
    80001adc:	01010413          	addi	s0,sp,16
    return MemoryAllocator::Instance()->getSemaphorePool().allocate();
    80001ae0:	00002097          	auipc	ra,0x2
    80001ae4:	e10080e7          	jalr	-496(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80001ae8:	00002097          	auipc	ra,0x2
    80001aec:	b64080e7          	jalr	-1180(ra) # 8000364c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001af0:	00002097          	auipc	ra,0x2
    80001af4:	424080e7          	jalr	1060(ra) # 80003f14 <_ZN13SemaphorePool8allocateEv>
}
    80001af8:	00813083          	ld	ra,8(sp)
    80001afc:	00013403          	ld	s0,0(sp)
    80001b00:	01010113          	addi	sp,sp,16
    80001b04:	00008067          	ret

0000000080001b08 <_ZN9SemaphoredlEPv>:

void Semaphore::operator delete(void *obj) noexcept {
    80001b08:	fe010113          	addi	sp,sp,-32
    80001b0c:	00113c23          	sd	ra,24(sp)
    80001b10:	00813823          	sd	s0,16(sp)
    80001b14:	00913423          	sd	s1,8(sp)
    80001b18:	02010413          	addi	s0,sp,32
    80001b1c:	00050493          	mv	s1,a0
    MemoryAllocator::Instance()->getSemaphorePool().deallocate((Semaphore*)obj);
    80001b20:	00002097          	auipc	ra,0x2
    80001b24:	dd0080e7          	jalr	-560(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80001b28:	00002097          	auipc	ra,0x2
    80001b2c:	b24080e7          	jalr	-1244(ra) # 8000364c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001b30:	00048593          	mv	a1,s1
    80001b34:	00002097          	auipc	ra,0x2
    80001b38:	43c080e7          	jalr	1084(ra) # 80003f70 <_ZN13SemaphorePool10deallocateEP9Semaphore>
}
    80001b3c:	01813083          	ld	ra,24(sp)
    80001b40:	01013403          	ld	s0,16(sp)
    80001b44:	00813483          	ld	s1,8(sp)
    80001b48:	02010113          	addi	sp,sp,32
    80001b4c:	00008067          	ret

0000000080001b50 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {}
    80001b50:	fe010113          	addi	sp,sp,-32
    80001b54:	00113c23          	sd	ra,24(sp)
    80001b58:	00813823          	sd	s0,16(sp)
    80001b5c:	00913423          	sd	s1,8(sp)
    80001b60:	02010413          	addi	s0,sp,32
    80001b64:	00050493          	mv	s1,a0
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	ec4080e7          	jalr	-316(ra) # 80001a2c <_ZN9SemaphoreD1Ev>
    80001b70:	00048513          	mv	a0,s1
    80001b74:	00000097          	auipc	ra,0x0
    80001b78:	f94080e7          	jalr	-108(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80001b7c:	01813083          	ld	ra,24(sp)
    80001b80:	01013403          	ld	s0,16(sp)
    80001b84:	00813483          	ld	s1,8(sp)
    80001b88:	02010113          	addi	sp,sp,32
    80001b8c:	00008067          	ret

0000000080001b90 <_ZN9Semaphore8sem_openEPjj>:
int Semaphore::sem_open(sem_t *handle, unsigned init) {
    80001b90:	fd010113          	addi	sp,sp,-48
    80001b94:	02113423          	sd	ra,40(sp)
    80001b98:	02813023          	sd	s0,32(sp)
    80001b9c:	00913c23          	sd	s1,24(sp)
    80001ba0:	01213823          	sd	s2,16(sp)
    80001ba4:	01313423          	sd	s3,8(sp)
    80001ba8:	03010413          	addi	s0,sp,48
    80001bac:	00050993          	mv	s3,a0
    80001bb0:	00058913          	mv	s2,a1
    Semaphore* semaphore = new Semaphore(init);
    80001bb4:	02000513          	li	a0,32
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	f18080e7          	jalr	-232(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80001bc0:	00050493          	mv	s1,a0
    80001bc4:	00090593          	mv	a1,s2
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	e9c080e7          	jalr	-356(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    if(!semaphore) return -1;
    80001bd0:	02048663          	beqz	s1,80001bfc <_ZN9Semaphore8sem_openEPjj+0x6c>
    *handle = semaphore->myHandle;
    80001bd4:	0084a783          	lw	a5,8(s1)
    80001bd8:	00f9a023          	sw	a5,0(s3)
    return 0;
    80001bdc:	00000513          	li	a0,0
}
    80001be0:	02813083          	ld	ra,40(sp)
    80001be4:	02013403          	ld	s0,32(sp)
    80001be8:	01813483          	ld	s1,24(sp)
    80001bec:	01013903          	ld	s2,16(sp)
    80001bf0:	00813983          	ld	s3,8(sp)
    80001bf4:	03010113          	addi	sp,sp,48
    80001bf8:	00008067          	ret
    if(!semaphore) return -1;
    80001bfc:	fff00513          	li	a0,-1
    80001c00:	fe1ff06f          	j	80001be0 <_ZN9Semaphore8sem_openEPjj+0x50>
    80001c04:	00050913          	mv	s2,a0
    Semaphore* semaphore = new Semaphore(init);
    80001c08:	00048513          	mv	a0,s1
    80001c0c:	00000097          	auipc	ra,0x0
    80001c10:	efc080e7          	jalr	-260(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80001c14:	00090513          	mv	a0,s2
    80001c18:	0000c097          	auipc	ra,0xc
    80001c1c:	740080e7          	jalr	1856(ra) # 8000e358 <_Unwind_Resume>

0000000080001c20 <_ZN9Semaphore9sem_closeEj>:

int Semaphore::sem_close(sem_t id){
    80001c20:	fe010113          	addi	sp,sp,-32
    80001c24:	00113c23          	sd	ra,24(sp)
    80001c28:	00813823          	sd	s0,16(sp)
    80001c2c:	00913423          	sd	s1,8(sp)
    80001c30:	01213023          	sd	s2,0(sp)
    80001c34:	02010413          	addi	s0,sp,32
    80001c38:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001c3c:	00002097          	auipc	ra,0x2
    80001c40:	cb4080e7          	jalr	-844(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80001c44:	00002097          	auipc	ra,0x2
    80001c48:	a08080e7          	jalr	-1528(ra) # 8000364c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001c4c:	00048593          	mv	a1,s1
    80001c50:	00002097          	auipc	ra,0x2
    80001c54:	268080e7          	jalr	616(ra) # 80003eb8 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    80001c58:	00050913          	mv	s2,a0
    if(semaphore == nullptr) return -1;
    80001c5c:	06050863          	beqz	a0,80001ccc <_ZN9Semaphore9sem_closeEj+0xac>

    //take out all threads that were waiting on this semaphore and put them in Scheduler as ready
    while(!semaphore->waiting.empty()){
    80001c60:	01090493          	addi	s1,s2,16
    80001c64:	00048513          	mv	a0,s1
    80001c68:	00002097          	auipc	ra,0x2
    80001c6c:	1d0080e7          	jalr	464(ra) # 80003e38 <_ZN4ListI6ThreadE5emptyEv>
    80001c70:	02051863          	bnez	a0,80001ca0 <_ZN9Semaphore9sem_closeEj+0x80>
        Thread* thread = semaphore->waiting.remove_beginning();
    80001c74:	00048513          	mv	a0,s1
    80001c78:	00002097          	auipc	ra,0x2
    80001c7c:	15c080e7          	jalr	348(ra) # 80003dd4 <_ZN4ListI6ThreadE16remove_beginningEv>
    80001c80:	00050593          	mv	a1,a0
        thread->semWaitStatus = -2;
    80001c84:	ffe00793          	li	a5,-2
    80001c88:	00f52423          	sw	a5,8(a0)
        scheduler.put(thread);
    80001c8c:	0000b517          	auipc	a0,0xb
    80001c90:	04c53503          	ld	a0,76(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c94:	00001097          	auipc	ra,0x1
    80001c98:	fe4080e7          	jalr	-28(ra) # 80002c78 <_ZN9Scheduler3putEP6Thread>
    while(!semaphore->waiting.empty()){
    80001c9c:	fc5ff06f          	j	80001c60 <_ZN9Semaphore9sem_closeEj+0x40>

    }
    delete semaphore;
    80001ca0:	00093783          	ld	a5,0(s2)
    80001ca4:	0087b783          	ld	a5,8(a5)
    80001ca8:	00090513          	mv	a0,s2
    80001cac:	000780e7          	jalr	a5
    return 0;
    80001cb0:	00000513          	li	a0,0
}
    80001cb4:	01813083          	ld	ra,24(sp)
    80001cb8:	01013403          	ld	s0,16(sp)
    80001cbc:	00813483          	ld	s1,8(sp)
    80001cc0:	00013903          	ld	s2,0(sp)
    80001cc4:	02010113          	addi	sp,sp,32
    80001cc8:	00008067          	ret
    if(semaphore == nullptr) return -1;
    80001ccc:	fff00513          	li	a0,-1
    80001cd0:	fe5ff06f          	j	80001cb4 <_ZN9Semaphore9sem_closeEj+0x94>

0000000080001cd4 <_ZN9Semaphore8sem_waitEj>:

int Semaphore::sem_wait(sem_t id) {
    80001cd4:	fe010113          	addi	sp,sp,-32
    80001cd8:	00113c23          	sd	ra,24(sp)
    80001cdc:	00813823          	sd	s0,16(sp)
    80001ce0:	00913423          	sd	s1,8(sp)
    80001ce4:	02010413          	addi	s0,sp,32
    80001ce8:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001cec:	00002097          	auipc	ra,0x2
    80001cf0:	c04080e7          	jalr	-1020(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80001cf4:	00002097          	auipc	ra,0x2
    80001cf8:	958080e7          	jalr	-1704(ra) # 8000364c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001cfc:	00048593          	mv	a1,s1
    80001d00:	00002097          	auipc	ra,0x2
    80001d04:	1b8080e7          	jalr	440(ra) # 80003eb8 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    if(semaphore == nullptr) return -1;
    80001d08:	12050a63          	beqz	a0,80001e3c <_ZN9Semaphore8sem_waitEj+0x168>
    Thread::running->semWaitStatus = 0;
    80001d0c:	0000b797          	auipc	a5,0xb
    80001d10:	fc47b783          	ld	a5,-60(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d14:	0007b483          	ld	s1,0(a5)
    80001d18:	0004a423          	sw	zero,8(s1)
    semaphore->val--;
    80001d1c:	00c52783          	lw	a5,12(a0)
    80001d20:	fff7879b          	addiw	a5,a5,-1
    80001d24:	00f52623          	sw	a5,12(a0)
    if(semaphore->val < 0){
    80001d28:	02079713          	slli	a4,a5,0x20
    80001d2c:	00074e63          	bltz	a4,80001d48 <_ZN9Semaphore8sem_waitEj+0x74>
        else
        {
            context_switch(oldRunning->getContext(), Thread::running->getContext());
        }
    }
    return 0;
    80001d30:	00000513          	li	a0,0
}
    80001d34:	01813083          	ld	ra,24(sp)
    80001d38:	01013403          	ld	s0,16(sp)
    80001d3c:	00813483          	ld	s1,8(sp)
    80001d40:	02010113          	addi	sp,sp,32
    80001d44:	00008067          	ret
        semaphore->waiting.add_end(Thread::running);
    80001d48:	00048593          	mv	a1,s1
    80001d4c:	01050513          	addi	a0,a0,16
    80001d50:	00002097          	auipc	ra,0x2
    80001d54:	fe8080e7          	jalr	-24(ra) # 80003d38 <_ZN4ListI6ThreadE7add_endEPS0_>
        Thread::running = scheduler.get();
    80001d58:	0000b517          	auipc	a0,0xb
    80001d5c:	f8053503          	ld	a0,-128(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d60:	00001097          	auipc	ra,0x1
    80001d64:	f50080e7          	jalr	-176(ra) # 80002cb0 <_ZN9Scheduler3getEv>
    80001d68:	0000b797          	auipc	a5,0xb
    80001d6c:	f687b783          	ld	a5,-152(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d70:	00a7b023          	sd	a0,0(a5)
        if(Thread::running == nullptr) return -1;
    80001d74:	0c050863          	beqz	a0,80001e44 <_ZN9Semaphore8sem_waitEj+0x170>
        if(Thread::running->getContext()->isKernelThread){
    80001d78:	00000097          	auipc	ra,0x0
    80001d7c:	5a0080e7          	jalr	1440(ra) # 80002318 <_ZN6Thread10getContextEv>
    80001d80:	05053783          	ld	a5,80(a0)
    80001d84:	06079063          	bnez	a5,80001de4 <_ZN9Semaphore8sem_waitEj+0x110>
        if(Thread::running->getContext()->wasActive == 1){
    80001d88:	0000b797          	auipc	a5,0xb
    80001d8c:	f487b783          	ld	a5,-184(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d90:	0007b503          	ld	a0,0(a5)
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	584080e7          	jalr	1412(ra) # 80002318 <_ZN6Thread10getContextEv>
    80001d9c:	04053703          	ld	a4,64(a0)
    80001da0:	00100793          	li	a5,1
    80001da4:	06f70263          	beq	a4,a5,80001e08 <_ZN9Semaphore8sem_waitEj+0x134>
            context_switch(oldRunning->getContext(), Thread::running->getContext());
    80001da8:	00048513          	mv	a0,s1
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	56c080e7          	jalr	1388(ra) # 80002318 <_ZN6Thread10getContextEv>
    80001db4:	00050493          	mv	s1,a0
    80001db8:	0000b797          	auipc	a5,0xb
    80001dbc:	f187b783          	ld	a5,-232(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001dc0:	0007b503          	ld	a0,0(a5)
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	554080e7          	jalr	1364(ra) # 80002318 <_ZN6Thread10getContextEv>
    80001dcc:	00050593          	mv	a1,a0
    80001dd0:	00048513          	mv	a0,s1
    80001dd4:	fffff097          	auipc	ra,0xfffff
    80001dd8:	4dc080e7          	jalr	1244(ra) # 800012b0 <context_switch>
    return 0;
    80001ddc:	00000513          	li	a0,0
    80001de0:	f55ff06f          	j	80001d34 <_ZN9Semaphore8sem_waitEj+0x60>
            ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    80001de4:	0000b797          	auipc	a5,0xb
    80001de8:	eec7b783          	ld	a5,-276(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001dec:	0007b503          	ld	a0,0(a5)
    80001df0:	00000097          	auipc	ra,0x0
    80001df4:	7ec080e7          	jalr	2028(ra) # 800025dc <_ZN6Thread14getWrapperArgsEv>
            wa->userFunc(wa->userArgs);
    80001df8:	00053783          	ld	a5,0(a0)
    80001dfc:	00853503          	ld	a0,8(a0)
    80001e00:	000780e7          	jalr	a5
    80001e04:	f85ff06f          	j	80001d88 <_ZN9Semaphore8sem_waitEj+0xb4>
            RiscV::w_last_sstatus();
    80001e08:	00000097          	auipc	ra,0x0
    80001e0c:	330080e7          	jalr	816(ra) # 80002138 <_ZN5RiscV14w_last_sstatusEv>
            RiscV::w_last_sepc();
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	304080e7          	jalr	772(ra) # 80002114 <_ZN5RiscV11w_last_sepcEv>
            restore_context_kernel_mode(Thread::running->getContext());
    80001e18:	0000b797          	auipc	a5,0xb
    80001e1c:	eb87b783          	ld	a5,-328(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001e20:	0007b503          	ld	a0,0(a5)
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	4f4080e7          	jalr	1268(ra) # 80002318 <_ZN6Thread10getContextEv>
    80001e2c:	fffff097          	auipc	ra,0xfffff
    80001e30:	308080e7          	jalr	776(ra) # 80001134 <restore_context_kernel_mode>
    return 0;
    80001e34:	00000513          	li	a0,0
    80001e38:	efdff06f          	j	80001d34 <_ZN9Semaphore8sem_waitEj+0x60>
    if(semaphore == nullptr) return -1;
    80001e3c:	fff00513          	li	a0,-1
    80001e40:	ef5ff06f          	j	80001d34 <_ZN9Semaphore8sem_waitEj+0x60>
        if(Thread::running == nullptr) return -1;
    80001e44:	fff00513          	li	a0,-1
    80001e48:	eedff06f          	j	80001d34 <_ZN9Semaphore8sem_waitEj+0x60>

0000000080001e4c <_ZN9Semaphore4waitEv>:
int  Semaphore::wait(){
    80001e4c:	ff010113          	addi	sp,sp,-16
    80001e50:	00113423          	sd	ra,8(sp)
    80001e54:	00813023          	sd	s0,0(sp)
    80001e58:	01010413          	addi	s0,sp,16
    sem_wait(this->myHandle);
    80001e5c:	00852503          	lw	a0,8(a0)
    80001e60:	00000097          	auipc	ra,0x0
    80001e64:	e74080e7          	jalr	-396(ra) # 80001cd4 <_ZN9Semaphore8sem_waitEj>
}
    80001e68:	00000513          	li	a0,0
    80001e6c:	00813083          	ld	ra,8(sp)
    80001e70:	00013403          	ld	s0,0(sp)
    80001e74:	01010113          	addi	sp,sp,16
    80001e78:	00008067          	ret

0000000080001e7c <_ZN9Semaphore10sem_signalEj>:

int Semaphore::sem_signal(sem_t id) {
    80001e7c:	fe010113          	addi	sp,sp,-32
    80001e80:	00113c23          	sd	ra,24(sp)
    80001e84:	00813823          	sd	s0,16(sp)
    80001e88:	00913423          	sd	s1,8(sp)
    80001e8c:	02010413          	addi	s0,sp,32
    80001e90:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001e94:	00002097          	auipc	ra,0x2
    80001e98:	a5c080e7          	jalr	-1444(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80001e9c:	00001097          	auipc	ra,0x1
    80001ea0:	7b0080e7          	jalr	1968(ra) # 8000364c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001ea4:	00048593          	mv	a1,s1
    80001ea8:	00002097          	auipc	ra,0x2
    80001eac:	010080e7          	jalr	16(ra) # 80003eb8 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    if(semaphore == nullptr) return -1;
    80001eb0:	06050663          	beqz	a0,80001f1c <_ZN9Semaphore10sem_signalEj+0xa0>
    semaphore->val++;
    80001eb4:	00c52783          	lw	a5,12(a0)
    80001eb8:	0017879b          	addiw	a5,a5,1
    80001ebc:	00f52623          	sw	a5,12(a0)
    if(!semaphore->waiting.empty()){
    80001ec0:	01050493          	addi	s1,a0,16
    80001ec4:	00048513          	mv	a0,s1
    80001ec8:	00002097          	auipc	ra,0x2
    80001ecc:	f70080e7          	jalr	-144(ra) # 80003e38 <_ZN4ListI6ThreadE5emptyEv>
    80001ed0:	00050e63          	beqz	a0,80001eec <_ZN9Semaphore10sem_signalEj+0x70>
        //Unblock one thread and put it in Scheduler as ready
        Thread* thread = semaphore->waiting.remove_beginning();
        scheduler.put(thread);
        thread->semWaitStatus = 0;
    }
    return 0;
    80001ed4:	00000513          	li	a0,0
}
    80001ed8:	01813083          	ld	ra,24(sp)
    80001edc:	01013403          	ld	s0,16(sp)
    80001ee0:	00813483          	ld	s1,8(sp)
    80001ee4:	02010113          	addi	sp,sp,32
    80001ee8:	00008067          	ret
        Thread* thread = semaphore->waiting.remove_beginning();
    80001eec:	00048513          	mv	a0,s1
    80001ef0:	00002097          	auipc	ra,0x2
    80001ef4:	ee4080e7          	jalr	-284(ra) # 80003dd4 <_ZN4ListI6ThreadE16remove_beginningEv>
    80001ef8:	00050493          	mv	s1,a0
        scheduler.put(thread);
    80001efc:	00050593          	mv	a1,a0
    80001f00:	0000b517          	auipc	a0,0xb
    80001f04:	dd853503          	ld	a0,-552(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f08:	00001097          	auipc	ra,0x1
    80001f0c:	d70080e7          	jalr	-656(ra) # 80002c78 <_ZN9Scheduler3putEP6Thread>
        thread->semWaitStatus = 0;
    80001f10:	0004a423          	sw	zero,8(s1)
    return 0;
    80001f14:	00000513          	li	a0,0
    80001f18:	fc1ff06f          	j	80001ed8 <_ZN9Semaphore10sem_signalEj+0x5c>
    if(semaphore == nullptr) return -1;
    80001f1c:	fff00513          	li	a0,-1
    80001f20:	fb9ff06f          	j	80001ed8 <_ZN9Semaphore10sem_signalEj+0x5c>

0000000080001f24 <_ZN9Semaphore6signalEv>:
int Semaphore::signal(){
    80001f24:	ff010113          	addi	sp,sp,-16
    80001f28:	00113423          	sd	ra,8(sp)
    80001f2c:	00813023          	sd	s0,0(sp)
    80001f30:	01010413          	addi	s0,sp,16
    sem_signal(this->myHandle);
    80001f34:	00852503          	lw	a0,8(a0)
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	f44080e7          	jalr	-188(ra) # 80001e7c <_ZN9Semaphore10sem_signalEj>
}
    80001f40:	00000513          	li	a0,0
    80001f44:	00813083          	ld	ra,8(sp)
    80001f48:	00013403          	ld	s0,0(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret

0000000080001f54 <_ZN5RiscV23initialSstatusForThreadEv>:

uint64 RiscV::last_sepc = 0;
uint64 RiscV::last_sstatus = 0;

// --- Initial SSTATUS za novu nit ---
uint64 RiscV::initialSstatusForThread() {
    80001f54:	ff010113          	addi	sp,sp,-16
    80001f58:	00813423          	sd	s0,8(sp)
    80001f5c:	01010413          	addi	s0,sp,16

    // SIE = 0 → trenutno maskirani svi prekidi u kernel modu
    sstatus &= ~(1UL << 1);

    return sstatus;
}
    80001f60:	02000513          	li	a0,32
    80001f64:	00813403          	ld	s0,8(sp)
    80001f68:	01010113          	addi	sp,sp,16
    80001f6c:	00008067          	ret

0000000080001f70 <_ZN5RiscV6ms_sipEm>:

// --- SIP manipulacija ---
void RiscV::ms_sip(uint64 mask) {
    80001f70:	ff010113          	addi	sp,sp,-16
    80001f74:	00813423          	sd	s0,8(sp)
    80001f78:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sip, %[mask]" :: [mask] "r"(mask));
    80001f7c:	14452073          	csrs	sip,a0
}
    80001f80:	00813403          	ld	s0,8(sp)
    80001f84:	01010113          	addi	sp,sp,16
    80001f88:	00008067          	ret

0000000080001f8c <_ZN5RiscV6mc_sipEm>:

void RiscV::mc_sip(uint64 mask) {
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00813423          	sd	s0,8(sp)
    80001f94:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sip, %[mask]" :: [mask] "r"(mask));
    80001f98:	14453073          	csrc	sip,a0
}
    80001f9c:	00813403          	ld	s0,8(sp)
    80001fa0:	01010113          	addi	sp,sp,16
    80001fa4:	00008067          	ret

0000000080001fa8 <_ZN5RiscV5r_sipEv>:

uint64 RiscV::r_sip() {
    80001fa8:	ff010113          	addi	sp,sp,-16
    80001fac:	00813423          	sd	s0,8(sp)
    80001fb0:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], sip" : [val] "=r"(val));
    80001fb4:	14402573          	csrr	a0,sip
    return val;
}
    80001fb8:	00813403          	ld	s0,8(sp)
    80001fbc:	01010113          	addi	sp,sp,16
    80001fc0:	00008067          	ret

0000000080001fc4 <_ZN5RiscV7r_stvecEv>:

// --- STVEC manipulacija ---
uint64 RiscV::r_stvec() {
    80001fc4:	ff010113          	addi	sp,sp,-16
    80001fc8:	00813423          	sd	s0,8(sp)
    80001fcc:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], stvec" : [val] "=r"(val));
    80001fd0:	10502573          	csrr	a0,stvec
    return val;
}
    80001fd4:	00813403          	ld	s0,8(sp)
    80001fd8:	01010113          	addi	sp,sp,16
    80001fdc:	00008067          	ret

0000000080001fe0 <_ZN5RiscV7w_stvecEm>:

void RiscV::w_stvec(uint64 val) {
    80001fe0:	ff010113          	addi	sp,sp,-16
    80001fe4:	00813423          	sd	s0,8(sp)
    80001fe8:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[val]" :: [val] "r"(val));
    80001fec:	10551073          	csrw	stvec,a0
}
    80001ff0:	00813403          	ld	s0,8(sp)
    80001ff4:	01010113          	addi	sp,sp,16
    80001ff8:	00008067          	ret

0000000080001ffc <_ZN5RiscV6r_sepcEv>:

// --- SEPC manipulacija ---


 uint64 RiscV::r_sepc() {
    80001ffc:	ff010113          	addi	sp,sp,-16
    80002000:	00813423          	sd	s0,8(sp)
    80002004:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %0, sepc" : "=r"(val));
    80002008:	14102573          	csrr	a0,sepc
    last_sepc = val;
    8000200c:	0000b797          	auipc	a5,0xb
    80002010:	d2a7b223          	sd	a0,-732(a5) # 8000cd30 <_ZN5RiscV9last_sepcE>
    return val;
}
    80002014:	00813403          	ld	s0,8(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_ZN5RiscV9r_sstatusEv>:

 uint64 RiscV::r_sstatus() {
    80002020:	ff010113          	addi	sp,sp,-16
    80002024:	00813423          	sd	s0,8(sp)
    80002028:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %0, sstatus" : "=r"(val));
    8000202c:	10002573          	csrr	a0,sstatus
    last_sstatus = val;
    80002030:	0000b797          	auipc	a5,0xb
    80002034:	d0a7b423          	sd	a0,-760(a5) # 8000cd38 <_ZN5RiscV12last_sstatusE>
    return val;
}
    80002038:	00813403          	ld	s0,8(sp)
    8000203c:	01010113          	addi	sp,sp,16
    80002040:	00008067          	ret

0000000080002044 <_ZN5RiscV10ms_sstatusEm>:
// --- SSTATUS manipulacija ---
void RiscV::ms_sstatus(uint64 mask) {
    80002044:	ff010113          	addi	sp,sp,-16
    80002048:	00813423          	sd	s0,8(sp)
    8000204c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sstatus, %[mask]" :: [mask] "r"(mask));
    80002050:	10052073          	csrs	sstatus,a0
}
    80002054:	00813403          	ld	s0,8(sp)
    80002058:	01010113          	addi	sp,sp,16
    8000205c:	00008067          	ret

0000000080002060 <_ZN5RiscV10mc_sstatusEm>:

void RiscV::mc_sstatus(uint64 mask) {
    80002060:	ff010113          	addi	sp,sp,-16
    80002064:	00813423          	sd	s0,8(sp)
    80002068:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sstatus, %[mask]" :: [mask] "r"(mask));
    8000206c:	10053073          	csrc	sstatus,a0
}
    80002070:	00813403          	ld	s0,8(sp)
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret

000000008000207c <_ZN5RiscV9w_sstatusEm>:



void RiscV::w_sstatus(uint64 val) {
    8000207c:	ff010113          	addi	sp,sp,-16
    80002080:	00813423          	sd	s0,8(sp)
    80002084:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sstatus, %[val]" :: [val] "r"(val));
    80002088:	10051073          	csrw	sstatus,a0
}
    8000208c:	00813403          	ld	s0,8(sp)
    80002090:	01010113          	addi	sp,sp,16
    80002094:	00008067          	ret

0000000080002098 <_ZN5RiscV4r_raEv>:


uint64 RiscV::r_ra() {
    80002098:	ff010113          	addi	sp,sp,-16
    8000209c:	00813423          	sd	s0,8(sp)
    800020a0:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("mv %[val], ra" : [val] "=r"(val));
    800020a4:	00008513          	mv	a0,ra
    return val;
}
    800020a8:	00813403          	ld	s0,8(sp)
    800020ac:	01010113          	addi	sp,sp,16
    800020b0:	00008067          	ret

00000000800020b4 <_ZN5RiscV4w_raEm>:

void RiscV::w_ra(uint64 val) {
    800020b4:	ff010113          	addi	sp,sp,-16
    800020b8:	00813423          	sd	s0,8(sp)
    800020bc:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv ra, %[val]" :: [val] "r"(val));
    800020c0:	00050093          	mv	ra,a0
}
    800020c4:	00813403          	ld	s0,8(sp)
    800020c8:	01010113          	addi	sp,sp,16
    800020cc:	00008067          	ret

00000000800020d0 <_ZN5RiscV6w_sepcEm>:

void RiscV::w_sepc(uint64 val) {
    800020d0:	ff010113          	addi	sp,sp,-16
    800020d4:	00813423          	sd	s0,8(sp)
    800020d8:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, %0" :: "r"(val));
    800020dc:	14151073          	csrw	sepc,a0
}
    800020e0:	00813403          	ld	s0,8(sp)
    800020e4:	01010113          	addi	sp,sp,16
    800020e8:	00008067          	ret

00000000800020ec <_ZN5RiscV16switchToUserModeEv>:


void RiscV::switchToUserMode(){
    800020ec:	ff010113          	addi	sp,sp,-16
    800020f0:	00813423          	sd	s0,8(sp)
    800020f4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sstatus, %0" ::"r"(SSTATUS_SPP)); // prebaci u U-mode
    800020f8:	10000793          	li	a5,256
    800020fc:	1007b073          	csrc	sstatus,a5
    __asm__  volatile("csrw sepc, ra");
    80002100:	14109073          	csrw	sepc,ra
    __asm__  volatile("sret");
    80002104:	10200073          	sret
}
    80002108:	00813403          	ld	s0,8(sp)
    8000210c:	01010113          	addi	sp,sp,16
    80002110:	00008067          	ret

0000000080002114 <_ZN5RiscV11w_last_sepcEv>:

void RiscV::w_last_sepc() {
    80002114:	ff010113          	addi	sp,sp,-16
    80002118:	00813423          	sd	s0,8(sp)
    8000211c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, %0" :: "r"(last_sepc));
    80002120:	0000b797          	auipc	a5,0xb
    80002124:	c107b783          	ld	a5,-1008(a5) # 8000cd30 <_ZN5RiscV9last_sepcE>
    80002128:	14179073          	csrw	sepc,a5
}
    8000212c:	00813403          	ld	s0,8(sp)
    80002130:	01010113          	addi	sp,sp,16
    80002134:	00008067          	ret

0000000080002138 <_ZN5RiscV14w_last_sstatusEv>:

void RiscV::w_last_sstatus() {
    80002138:	ff010113          	addi	sp,sp,-16
    8000213c:	00813423          	sd	s0,8(sp)
    80002140:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sstatus, %0" :: "r"(last_sstatus));
    80002144:	0000b797          	auipc	a5,0xb
    80002148:	bf47b783          	ld	a5,-1036(a5) # 8000cd38 <_ZN5RiscV12last_sstatusE>
    8000214c:	10079073          	csrw	sstatus,a5
}
    80002150:	00813403          	ld	s0,8(sp)
    80002154:	01010113          	addi	sp,sp,16
    80002158:	00008067          	ret

000000008000215c <_ZN5RiscV8r_scauseEv>:
uint64 RiscV::r_scause() {
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00813423          	sd	s0,8(sp)
    80002164:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %0, scause" : "=r"(val));
    80002168:	14202573          	csrr	a0,scause

    return val;
    8000216c:	00813403          	ld	s0,8(sp)
    80002170:	01010113          	addi	sp,sp,16
    80002174:	00008067          	ret

0000000080002178 <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>:
    context.startedOnce = 0;
    context.wasActive = 0;
    context.timeSlice = DEFAULT_TIME_SLICE;
    context.ra = (uint64)&threadWrapper;
    wrapperArgs.userArgs = this;
    wrapperArgs.userFunc = this->body = [](void* obj){
    80002178:	ff010113          	addi	sp,sp,-16
    8000217c:	00113423          	sd	ra,8(sp)
    80002180:	00813023          	sd	s0,0(sp)
    80002184:	01010413          	addi	s0,sp,16
        static_cast<Thread*>(obj)->run();
    80002188:	00053783          	ld	a5,0(a0)
    8000218c:	0107b783          	ld	a5,16(a5)
    80002190:	000780e7          	jalr	a5
    };
    80002194:	00813083          	ld	ra,8(sp)
    80002198:	00013403          	ld	s0,0(sp)
    8000219c:	01010113          	addi	sp,sp,16
    800021a0:	00008067          	ret

00000000800021a4 <_ZN6ThreadD1Ev>:
        context_switch(&oldRunning->context, &Thread::running->context);
    }

}

Thread::~Thread(){}
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00813423          	sd	s0,8(sp)
    800021ac:	01010413          	addi	s0,sp,16
    800021b0:	00813403          	ld	s0,8(sp)
    800021b4:	01010113          	addi	sp,sp,16
    800021b8:	00008067          	ret

00000000800021bc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*kernelBody)(void*), void* arg)
    800021bc:	fd010113          	addi	sp,sp,-48
    800021c0:	02113423          	sd	ra,40(sp)
    800021c4:	02813023          	sd	s0,32(sp)
    800021c8:	00913c23          	sd	s1,24(sp)
    800021cc:	01213823          	sd	s2,16(sp)
    800021d0:	01313423          	sd	s3,8(sp)
    800021d4:	03010413          	addi	s0,sp,48
    800021d8:	00050493          	mv	s1,a0
    800021dc:	00058913          	mv	s2,a1
    800021e0:	00060993          	mv	s3,a2
    800021e4:	0000b797          	auipc	a5,0xb
    800021e8:	90c78793          	addi	a5,a5,-1780 # 8000caf0 <_ZTV6Thread+0x10>
    800021ec:	00f53023          	sd	a5,0(a0)
    this->next = nullptr;
    800021f0:	00053823          	sd	zero,16(a0)
    this->body = kernelBody;
    800021f4:	08b53c23          	sd	a1,152(a0)
    this->arg = arg;
    800021f8:	0ac53023          	sd	a2,160(a0)
    threadId = cnt++;
    800021fc:	0000b717          	auipc	a4,0xb
    80002200:	b4470713          	addi	a4,a4,-1212 # 8000cd40 <_ZN6Thread3cntE>
    80002204:	00072783          	lw	a5,0(a4)
    80002208:	0017869b          	addiw	a3,a5,1
    8000220c:	00d72023          	sw	a3,0(a4)
    80002210:	02f52223          	sw	a5,36(a0)
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80002214:	00001097          	auipc	ra,0x1
    80002218:	6dc080e7          	jalr	1756(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    8000221c:	08100593          	li	a1,129
    80002220:	00001097          	auipc	ra,0x1
    80002224:	448080e7          	jalr	1096(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    80002228:	00850793          	addi	a5,a0,8
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;
    8000222c:	00002737          	lui	a4,0x2
    80002230:	00870713          	addi	a4,a4,8 # 2008 <_entry-0x7fffdff8>
    80002234:	00e50533          	add	a0,a0,a4
    context.userStack = nullptr;                 // kernel nit nema user stack
    80002238:	0204b823          	sd	zero,48(s1)
    context.sp = (uint64)stack_top;
    8000223c:	04a4b023          	sd	a0,64(s1)
    context.sstatus |= RiscV::SSTATUS_SPIE;
    80002240:	02000713          	li	a4,32
    80002244:	04e4b823          	sd	a4,80(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    80002248:	02f4bc23          	sd	a5,56(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    8000224c:	00001737          	lui	a4,0x1
    80002250:	00e787b3          	add	a5,a5,a4
    80002254:	04f4b423          	sd	a5,72(s1)
    context.startedOnce = 0;
    80002258:	0604b023          	sd	zero,96(s1)
    context.wasActive = 0;
    8000225c:	0604b423          	sd	zero,104(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    80002260:	00200793          	li	a5,2
    80002264:	06f4b823          	sd	a5,112(s1)
    wrapperArgs.userArgs = arg;
    80002268:	0934b423          	sd	s3,136(s1)
    wrapperArgs.userFunc = kernelBody;
    8000226c:	0924b023          	sd	s2,128(s1)
    context.ra = (uint64)&kernelThreadWrapper;
    80002270:	00000797          	auipc	a5,0x0
    80002274:	3d478793          	addi	a5,a5,980 # 80002644 <_ZN6Thread19kernelThreadWrapperEv>
    80002278:	04f4bc23          	sd	a5,88(s1)
    context.isKernelThread = 1;
    8000227c:	00100793          	li	a5,1
    80002280:	06f4bc23          	sd	a5,120(s1)
}
    80002284:	02813083          	ld	ra,40(sp)
    80002288:	02013403          	ld	s0,32(sp)
    8000228c:	01813483          	ld	s1,24(sp)
    80002290:	01013903          	ld	s2,16(sp)
    80002294:	00813983          	ld	s3,8(sp)
    80002298:	03010113          	addi	sp,sp,48
    8000229c:	00008067          	ret

00000000800022a0 <_ZN6Thread21clearTimeSliceCounterEv>:
void Thread::clearTimeSliceCounter() {
    800022a0:	ff010113          	addi	sp,sp,-16
    800022a4:	00813423          	sd	s0,8(sp)
    800022a8:	01010413          	addi	s0,sp,16
    this->timeSliceCounter = 0;
    800022ac:	00053c23          	sd	zero,24(a0)
}
    800022b0:	00813403          	ld	s0,8(sp)
    800022b4:	01010113          	addi	sp,sp,16
    800022b8:	00008067          	ret

00000000800022bc <_ZN6Thread19getTimeSliceCounterEv>:
uint64 Thread::getTimeSliceCounter() {
    800022bc:	ff010113          	addi	sp,sp,-16
    800022c0:	00813423          	sd	s0,8(sp)
    800022c4:	01010413          	addi	s0,sp,16
}
    800022c8:	01853503          	ld	a0,24(a0)
    800022cc:	00813403          	ld	s0,8(sp)
    800022d0:	01010113          	addi	sp,sp,16
    800022d4:	00008067          	ret

00000000800022d8 <_ZN6Thread25incrementtimeSliceCounterEv>:
void Thread::incrementtimeSliceCounter() {
    800022d8:	ff010113          	addi	sp,sp,-16
    800022dc:	00813423          	sd	s0,8(sp)
    800022e0:	01010413          	addi	s0,sp,16
    this->timeSliceCounter++;
    800022e4:	01853783          	ld	a5,24(a0)
    800022e8:	00178793          	addi	a5,a5,1
    800022ec:	00f53c23          	sd	a5,24(a0)
}
    800022f0:	00813403          	ld	s0,8(sp)
    800022f4:	01010113          	addi	sp,sp,16
    800022f8:	00008067          	ret

00000000800022fc <_ZN6Thread12getTimeSliceEv>:
uint64 Thread::getTimeSlice() {
    800022fc:	ff010113          	addi	sp,sp,-16
    80002300:	00813423          	sd	s0,8(sp)
    80002304:	01010413          	addi	s0,sp,16
}
    80002308:	07053503          	ld	a0,112(a0)
    8000230c:	00813403          	ld	s0,8(sp)
    80002310:	01010113          	addi	sp,sp,16
    80002314:	00008067          	ret

0000000080002318 <_ZN6Thread10getContextEv>:

ThreadContext* Thread::getContext() {
    80002318:	ff010113          	addi	sp,sp,-16
    8000231c:	00813423          	sd	s0,8(sp)
    80002320:	01010413          	addi	s0,sp,16
    return &this->context;
}
    80002324:	02850513          	addi	a0,a0,40
    80002328:	00813403          	ld	s0,8(sp)
    8000232c:	01010113          	addi	sp,sp,16
    80002330:	00008067          	ret

0000000080002334 <_ZN6ThreadC1EPFvPvES0_S0_>:
Thread::Thread(void (*body)(void*), void* arg, void* stack_top) {
    80002334:	fc010113          	addi	sp,sp,-64
    80002338:	02113c23          	sd	ra,56(sp)
    8000233c:	02813823          	sd	s0,48(sp)
    80002340:	02913423          	sd	s1,40(sp)
    80002344:	03213023          	sd	s2,32(sp)
    80002348:	01313c23          	sd	s3,24(sp)
    8000234c:	01413823          	sd	s4,16(sp)
    80002350:	01513423          	sd	s5,8(sp)
    80002354:	04010413          	addi	s0,sp,64
    80002358:	00050493          	mv	s1,a0
    8000235c:	00058993          	mv	s3,a1
    80002360:	00060a13          	mv	s4,a2
    80002364:	00068913          	mv	s2,a3
    80002368:	0000a797          	auipc	a5,0xa
    8000236c:	78878793          	addi	a5,a5,1928 # 8000caf0 <_ZTV6Thread+0x10>
    80002370:	00f53023          	sd	a5,0(a0)
    this->next = nullptr;
    80002374:	00053823          	sd	zero,16(a0)
    this->body = body;
    80002378:	08b53c23          	sd	a1,152(a0)
    this->arg = arg;
    8000237c:	0ac53023          	sd	a2,160(a0)
    threadId = cnt++;
    80002380:	0000b797          	auipc	a5,0xb
    80002384:	9c078793          	addi	a5,a5,-1600 # 8000cd40 <_ZN6Thread3cntE>
    80002388:	0007a703          	lw	a4,0(a5)
    8000238c:	0017069b          	addiw	a3,a4,1
    80002390:	00d7a023          	sw	a3,0(a5)
    80002394:	02e52223          	sw	a4,36(a0)
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    80002398:	fffffab7          	lui	s5,0xfffff
    8000239c:	01590ab3          	add	s5,s2,s5
    800023a0:	03553823          	sd	s5,48(a0)
    context.sp = (uint64)stack_top;
    800023a4:	05253023          	sd	s2,64(a0)
    if (Thread::running != nullptr) {
    800023a8:	0087b503          	ld	a0,8(a5)
    800023ac:	06050863          	beqz	a0,8000241c <_ZN6ThreadC1EPFvPvES0_S0_+0xe8>
        context.sstatus = Thread::running->getContext()->sstatus;
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	f68080e7          	jalr	-152(ra) # 80002318 <_ZN6Thread10getContextEv>
    800023b8:	02853783          	ld	a5,40(a0)
    800023bc:	04f4b823          	sd	a5,80(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    800023c0:	ffffe6b7          	lui	a3,0xffffe
    800023c4:	00d90933          	add	s2,s2,a3
    800023c8:	0324bc23          	sd	s2,56(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    800023cc:	0554b423          	sd	s5,72(s1)
    context.startedOnce = (uint64)0;
    800023d0:	0604b023          	sd	zero,96(s1)
    context.wasActive = (uint64)0;
    800023d4:	0604b423          	sd	zero,104(s1)
    this->wrapperArgs.userArgs = arg;
    800023d8:	0944b423          	sd	s4,136(s1)
    this->wrapperArgs.userFunc = body;
    800023dc:	0934b023          	sd	s3,128(s1)
    context.ra = (uint64)&threadWrapper;
    800023e0:	00000797          	auipc	a5,0x0
    800023e4:	21878793          	addi	a5,a5,536 # 800025f8 <_ZN6Thread13threadWrapperEv>
    800023e8:	04f4bc23          	sd	a5,88(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    800023ec:	00200793          	li	a5,2
    800023f0:	06f4b823          	sd	a5,112(s1)
    context.isKernelThread = 0;
    800023f4:	0604bc23          	sd	zero,120(s1)
}
    800023f8:	03813083          	ld	ra,56(sp)
    800023fc:	03013403          	ld	s0,48(sp)
    80002400:	02813483          	ld	s1,40(sp)
    80002404:	02013903          	ld	s2,32(sp)
    80002408:	01813983          	ld	s3,24(sp)
    8000240c:	01013a03          	ld	s4,16(sp)
    80002410:	00813a83          	ld	s5,8(sp)
    80002414:	04010113          	addi	sp,sp,64
    80002418:	00008067          	ret
        context.sstatus |= RiscV::SSTATUS_SPIE;
    8000241c:	02000793          	li	a5,32
    80002420:	04f4b823          	sd	a5,80(s1)
    80002424:	f9dff06f          	j	800023c0 <_ZN6ThreadC1EPFvPvES0_S0_+0x8c>

0000000080002428 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002428:	fe010113          	addi	sp,sp,-32
    8000242c:	00113c23          	sd	ra,24(sp)
    80002430:	00813823          	sd	s0,16(sp)
    80002434:	00913423          	sd	s1,8(sp)
    80002438:	01213023          	sd	s2,0(sp)
    8000243c:	02010413          	addi	s0,sp,32
    80002440:	00050493          	mv	s1,a0
    80002444:	0000a797          	auipc	a5,0xa
    80002448:	6ac78793          	addi	a5,a5,1708 # 8000caf0 <_ZTV6Thread+0x10>
    8000244c:	00f53023          	sd	a5,0(a0)
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80002450:	00001097          	auipc	ra,0x1
    80002454:	4a0080e7          	jalr	1184(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80002458:	08100593          	li	a1,129
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	20c080e7          	jalr	524(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    80002464:	00850913          	addi	s2,a0,8
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;
    80002468:	000027b7          	lui	a5,0x2
    8000246c:	00878793          	addi	a5,a5,8 # 2008 <_entry-0x7fffdff8>
    80002470:	00f507b3          	add	a5,a0,a5
    this->next = nullptr;
    80002474:	0004b823          	sd	zero,16(s1)
    this->body = nullptr;  // C++ nit nema body
    80002478:	0804bc23          	sd	zero,152(s1)
    this->arg = nullptr;
    8000247c:	0a04b023          	sd	zero,160(s1)
    threadId = cnt++;
    80002480:	0000b717          	auipc	a4,0xb
    80002484:	8c070713          	addi	a4,a4,-1856 # 8000cd40 <_ZN6Thread3cntE>
    80002488:	00072683          	lw	a3,0(a4)
    8000248c:	0016861b          	addiw	a2,a3,1
    80002490:	00c72023          	sw	a2,0(a4)
    80002494:	02d4a223          	sw	a3,36(s1)
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    80002498:	000016b7          	lui	a3,0x1
    8000249c:	00868693          	addi	a3,a3,8 # 1008 <_entry-0x7fffeff8>
    800024a0:	00d50533          	add	a0,a0,a3
    800024a4:	02a4b823          	sd	a0,48(s1)
    context.sp = (uint64)stack_top;
    800024a8:	04f4b023          	sd	a5,64(s1)
    if (Thread::running != nullptr) {
    800024ac:	00873503          	ld	a0,8(a4)
    800024b0:	06050863          	beqz	a0,80002520 <_ZN6ThreadC1Ev+0xf8>
        context.sstatus = Thread::running->getContext()->sstatus;
    800024b4:	00000097          	auipc	ra,0x0
    800024b8:	e64080e7          	jalr	-412(ra) # 80002318 <_ZN6Thread10getContextEv>
    800024bc:	02853783          	ld	a5,40(a0)
    800024c0:	04f4b823          	sd	a5,80(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    800024c4:	0324bc23          	sd	s2,56(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    800024c8:	000017b7          	lui	a5,0x1
    800024cc:	00f90933          	add	s2,s2,a5
    800024d0:	0524b423          	sd	s2,72(s1)
    context.startedOnce = 0;
    800024d4:	0604b023          	sd	zero,96(s1)
    context.wasActive = 0;
    800024d8:	0604b423          	sd	zero,104(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    800024dc:	00200793          	li	a5,2
    800024e0:	06f4b823          	sd	a5,112(s1)
    context.ra = (uint64)&threadWrapper;
    800024e4:	00000797          	auipc	a5,0x0
    800024e8:	11478793          	addi	a5,a5,276 # 800025f8 <_ZN6Thread13threadWrapperEv>
    800024ec:	04f4bc23          	sd	a5,88(s1)
    wrapperArgs.userArgs = this;
    800024f0:	0894b423          	sd	s1,136(s1)
    wrapperArgs.userFunc = this->body = [](void* obj){
    800024f4:	00000797          	auipc	a5,0x0
    800024f8:	c8478793          	addi	a5,a5,-892 # 80002178 <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>
    800024fc:	08f4bc23          	sd	a5,152(s1)
    80002500:	08f4b023          	sd	a5,128(s1)
    context.isKernelThread = 0;
    80002504:	0604bc23          	sd	zero,120(s1)
}
    80002508:	01813083          	ld	ra,24(sp)
    8000250c:	01013403          	ld	s0,16(sp)
    80002510:	00813483          	ld	s1,8(sp)
    80002514:	00013903          	ld	s2,0(sp)
    80002518:	02010113          	addi	sp,sp,32
    8000251c:	00008067          	ret
        context.sstatus |= RiscV::SSTATUS_SPIE;
    80002520:	02000793          	li	a5,32
    80002524:	04f4b823          	sd	a5,80(s1)
    80002528:	f9dff06f          	j	800024c4 <_ZN6ThreadC1Ev+0x9c>

000000008000252c <_ZN6Thread18thread_exit_kernelEv>:
int Thread::thread_exit_kernel(){
    8000252c:	fd010113          	addi	sp,sp,-48
    80002530:	02113423          	sd	ra,40(sp)
    80002534:	02813023          	sd	s0,32(sp)
    80002538:	00913c23          	sd	s1,24(sp)
    8000253c:	01213823          	sd	s2,16(sp)
    80002540:	01313423          	sd	s3,8(sp)
    80002544:	03010413          	addi	s0,sp,48
    Thread* oldRunning = Thread::running;
    80002548:	0000a917          	auipc	s2,0xa
    8000254c:	7f890913          	addi	s2,s2,2040 # 8000cd40 <_ZN6Thread3cntE>
    80002550:	00893983          	ld	s3,8(s2)
    Thread::running = scheduler.get();
    80002554:	0000a517          	auipc	a0,0xa
    80002558:	78453503          	ld	a0,1924(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000255c:	00000097          	auipc	ra,0x0
    80002560:	754080e7          	jalr	1876(ra) # 80002cb0 <_ZN9Scheduler3getEv>
    80002564:	00a93423          	sd	a0,8(s2)
    if(Thread::running){
    80002568:	02050663          	beqz	a0,80002594 <_ZN6Thread18thread_exit_kernelEv+0x68>
    8000256c:	00050493          	mv	s1,a0
        if(Thread::running->getContext()->wasActive == 1){
    80002570:	00000097          	auipc	ra,0x0
    80002574:	da8080e7          	jalr	-600(ra) # 80002318 <_ZN6Thread10getContextEv>
    80002578:	04053703          	ld	a4,64(a0)
    8000257c:	00100793          	li	a5,1
    80002580:	02f70a63          	beq	a4,a5,800025b4 <_ZN6Thread18thread_exit_kernelEv+0x88>
            context_switch(&oldRunning->context, &Thread::running->context);
    80002584:	02848593          	addi	a1,s1,40
    80002588:	02898513          	addi	a0,s3,40
    8000258c:	fffff097          	auipc	ra,0xfffff
    80002590:	d24080e7          	jalr	-732(ra) # 800012b0 <context_switch>
}
    80002594:	00000513          	li	a0,0
    80002598:	02813083          	ld	ra,40(sp)
    8000259c:	02013403          	ld	s0,32(sp)
    800025a0:	01813483          	ld	s1,24(sp)
    800025a4:	01013903          	ld	s2,16(sp)
    800025a8:	00813983          	ld	s3,8(sp)
    800025ac:	03010113          	addi	sp,sp,48
    800025b0:	00008067          	ret
            RiscV::w_last_sstatus();
    800025b4:	00000097          	auipc	ra,0x0
    800025b8:	b84080e7          	jalr	-1148(ra) # 80002138 <_ZN5RiscV14w_last_sstatusEv>
            RiscV::w_last_sepc();
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	b58080e7          	jalr	-1192(ra) # 80002114 <_ZN5RiscV11w_last_sepcEv>
            restore_context_kernel_mode(&Thread::running->context);
    800025c4:	0000a517          	auipc	a0,0xa
    800025c8:	78453503          	ld	a0,1924(a0) # 8000cd48 <_ZN6Thread7runningE>
    800025cc:	02850513          	addi	a0,a0,40
    800025d0:	fffff097          	auipc	ra,0xfffff
    800025d4:	b64080e7          	jalr	-1180(ra) # 80001134 <restore_context_kernel_mode>
    800025d8:	fbdff06f          	j	80002594 <_ZN6Thread18thread_exit_kernelEv+0x68>

00000000800025dc <_ZN6Thread14getWrapperArgsEv>:

ThreadWrapperArgs* Thread::getWrapperArgs() {
    800025dc:	ff010113          	addi	sp,sp,-16
    800025e0:	00813423          	sd	s0,8(sp)
    800025e4:	01010413          	addi	s0,sp,16
    return &this->wrapperArgs;
}
    800025e8:	08050513          	addi	a0,a0,128
    800025ec:	00813403          	ld	s0,8(sp)
    800025f0:	01010113          	addi	sp,sp,16
    800025f4:	00008067          	ret

00000000800025f8 <_ZN6Thread13threadWrapperEv>:
void Thread::threadWrapper() {
    800025f8:	ff010113          	addi	sp,sp,-16
    800025fc:	00113423          	sd	ra,8(sp)
    80002600:	00813023          	sd	s0,0(sp)
    80002604:	01010413          	addi	s0,sp,16
    RiscV::switchToUserMode();
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	ae4080e7          	jalr	-1308(ra) # 800020ec <_ZN5RiscV16switchToUserModeEv>
    ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    80002610:	0000a517          	auipc	a0,0xa
    80002614:	73853503          	ld	a0,1848(a0) # 8000cd48 <_ZN6Thread7runningE>
    80002618:	00000097          	auipc	ra,0x0
    8000261c:	fc4080e7          	jalr	-60(ra) # 800025dc <_ZN6Thread14getWrapperArgsEv>
    wa->userFunc(wa->userArgs);
    80002620:	00053783          	ld	a5,0(a0)
    80002624:	00853503          	ld	a0,8(a0)
    80002628:	000780e7          	jalr	a5
    thread_exit();
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	018080e7          	jalr	24(ra) # 80001644 <thread_exit>
}
    80002634:	00813083          	ld	ra,8(sp)
    80002638:	00013403          	ld	s0,0(sp)
    8000263c:	01010113          	addi	sp,sp,16
    80002640:	00008067          	ret

0000000080002644 <_ZN6Thread19kernelThreadWrapperEv>:
void Thread::kernelThreadWrapper() {
    80002644:	ff010113          	addi	sp,sp,-16
    80002648:	00113423          	sd	ra,8(sp)
    8000264c:	00813023          	sd	s0,0(sp)
    80002650:	01010413          	addi	s0,sp,16
    ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    80002654:	0000a517          	auipc	a0,0xa
    80002658:	6f453503          	ld	a0,1780(a0) # 8000cd48 <_ZN6Thread7runningE>
    8000265c:	00000097          	auipc	ra,0x0
    80002660:	f80080e7          	jalr	-128(ra) # 800025dc <_ZN6Thread14getWrapperArgsEv>
    wa->userFunc(wa->userArgs);
    80002664:	00053783          	ld	a5,0(a0)
    80002668:	00853503          	ld	a0,8(a0)
    8000266c:	000780e7          	jalr	a5
    thread_exit_kernel();
    80002670:	00000097          	auipc	ra,0x0
    80002674:	ebc080e7          	jalr	-324(ra) # 8000252c <_ZN6Thread18thread_exit_kernelEv>
}
    80002678:	00813083          	ld	ra,8(sp)
    8000267c:	00013403          	ld	s0,0(sp)
    80002680:	01010113          	addi	sp,sp,16
    80002684:	00008067          	ret

0000000080002688 <_ZN6Thread22thread_dispatch_kernelEv>:
void Thread::thread_dispatch_kernel() {
    80002688:	fe010113          	addi	sp,sp,-32
    8000268c:	00113c23          	sd	ra,24(sp)
    80002690:	00813823          	sd	s0,16(sp)
    80002694:	00913423          	sd	s1,8(sp)
    80002698:	01213023          	sd	s2,0(sp)
    8000269c:	02010413          	addi	s0,sp,32
    Thread* oldRunning = Thread::running;
    800026a0:	0000a917          	auipc	s2,0xa
    800026a4:	6a893903          	ld	s2,1704(s2) # 8000cd48 <_ZN6Thread7runningE>
    if(oldRunning)
    800026a8:	00090c63          	beqz	s2,800026c0 <_ZN6Thread22thread_dispatch_kernelEv+0x38>
        scheduler.put(oldRunning);
    800026ac:	00090593          	mv	a1,s2
    800026b0:	0000a517          	auipc	a0,0xa
    800026b4:	62853503          	ld	a0,1576(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026b8:	00000097          	auipc	ra,0x0
    800026bc:	5c0080e7          	jalr	1472(ra) # 80002c78 <_ZN9Scheduler3putEP6Thread>
    Thread::running = scheduler.get();
    800026c0:	0000a517          	auipc	a0,0xa
    800026c4:	61853503          	ld	a0,1560(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026c8:	00000097          	auipc	ra,0x0
    800026cc:	5e8080e7          	jalr	1512(ra) # 80002cb0 <_ZN9Scheduler3getEv>
    800026d0:	00050493          	mv	s1,a0
    800026d4:	0000a797          	auipc	a5,0xa
    800026d8:	66a7ba23          	sd	a0,1652(a5) # 8000cd48 <_ZN6Thread7runningE>
    if(Thread::running->getContext()->isKernelThread){
    800026dc:	00000097          	auipc	ra,0x0
    800026e0:	c3c080e7          	jalr	-964(ra) # 80002318 <_ZN6Thread10getContextEv>
    800026e4:	05053783          	ld	a5,80(a0)
    800026e8:	00078e63          	beqz	a5,80002704 <_ZN6Thread22thread_dispatch_kernelEv+0x7c>
        ThreadWrapperArgs *wa = Thread::running->getWrapperArgs();
    800026ec:	00048513          	mv	a0,s1
    800026f0:	00000097          	auipc	ra,0x0
    800026f4:	eec080e7          	jalr	-276(ra) # 800025dc <_ZN6Thread14getWrapperArgsEv>
        wa->userFunc(wa->userArgs);
    800026f8:	00053783          	ld	a5,0(a0)
    800026fc:	00853503          	ld	a0,8(a0)
    80002700:	000780e7          	jalr	a5
    if(Thread::running->getContext()->wasActive == 1){
    80002704:	0000a497          	auipc	s1,0xa
    80002708:	6444b483          	ld	s1,1604(s1) # 8000cd48 <_ZN6Thread7runningE>
    8000270c:	00048513          	mv	a0,s1
    80002710:	00000097          	auipc	ra,0x0
    80002714:	c08080e7          	jalr	-1016(ra) # 80002318 <_ZN6Thread10getContextEv>
    80002718:	04053703          	ld	a4,64(a0)
    8000271c:	00100793          	li	a5,1
    80002720:	02f70a63          	beq	a4,a5,80002754 <_ZN6Thread22thread_dispatch_kernelEv+0xcc>
        Thread::running->getContext()->wasActive = 1;
    80002724:	00100793          	li	a5,1
    80002728:	04f53023          	sd	a5,64(a0)
        context_switch(&oldRunning->context, &Thread::running->context);
    8000272c:	02848593          	addi	a1,s1,40
    80002730:	02890513          	addi	a0,s2,40
    80002734:	fffff097          	auipc	ra,0xfffff
    80002738:	b7c080e7          	jalr	-1156(ra) # 800012b0 <context_switch>
}
    8000273c:	01813083          	ld	ra,24(sp)
    80002740:	01013403          	ld	s0,16(sp)
    80002744:	00813483          	ld	s1,8(sp)
    80002748:	00013903          	ld	s2,0(sp)
    8000274c:	02010113          	addi	sp,sp,32
    80002750:	00008067          	ret
        RiscV::w_last_sstatus();
    80002754:	00000097          	auipc	ra,0x0
    80002758:	9e4080e7          	jalr	-1564(ra) # 80002138 <_ZN5RiscV14w_last_sstatusEv>
        RiscV::w_last_sepc();
    8000275c:	00000097          	auipc	ra,0x0
    80002760:	9b8080e7          	jalr	-1608(ra) # 80002114 <_ZN5RiscV11w_last_sepcEv>
        restore_context_kernel_mode(&Thread::running->context);
    80002764:	0000a517          	auipc	a0,0xa
    80002768:	5e453503          	ld	a0,1508(a0) # 8000cd48 <_ZN6Thread7runningE>
    8000276c:	02850513          	addi	a0,a0,40
    80002770:	fffff097          	auipc	ra,0xfffff
    80002774:	9c4080e7          	jalr	-1596(ra) # 80001134 <restore_context_kernel_mode>
    80002778:	fc5ff06f          	j	8000273c <_ZN6Thread22thread_dispatch_kernelEv+0xb4>

000000008000277c <_ZN6ThreadnwEm>:
void* Thread::operator new(size_t size){
    8000277c:	ff010113          	addi	sp,sp,-16
    80002780:	00113423          	sd	ra,8(sp)
    80002784:	00813023          	sd	s0,0(sp)
    80002788:	01010413          	addi	s0,sp,16

    void* mem = (void*)MemoryAllocator::Instance()->getThreadPool().allocate();
    8000278c:	00001097          	auipc	ra,0x1
    80002790:	164080e7          	jalr	356(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80002794:	00001097          	auipc	ra,0x1
    80002798:	e9c080e7          	jalr	-356(ra) # 80003630 <_ZN15MemoryAllocator13getThreadPoolEv>
    8000279c:	fffff097          	auipc	ra,0xfffff
    800027a0:	1e0080e7          	jalr	480(ra) # 8000197c <_ZN10ThreadPool8allocateEv>
    return mem;
}
    800027a4:	00813083          	ld	ra,8(sp)
    800027a8:	00013403          	ld	s0,0(sp)
    800027ac:	01010113          	addi	sp,sp,16
    800027b0:	00008067          	ret

00000000800027b4 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>:
    if(!handle || !routine || !stack_top)return -1;
    800027b4:	0c050463          	beqz	a0,8000287c <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xc8>
int Thread::create_thread_kernel(thread_t* handle, void(*routine)(void*) , void* args, void* stack_top){
    800027b8:	fc010113          	addi	sp,sp,-64
    800027bc:	02113c23          	sd	ra,56(sp)
    800027c0:	02813823          	sd	s0,48(sp)
    800027c4:	02913423          	sd	s1,40(sp)
    800027c8:	03213023          	sd	s2,32(sp)
    800027cc:	01313c23          	sd	s3,24(sp)
    800027d0:	01413823          	sd	s4,16(sp)
    800027d4:	01513423          	sd	s5,8(sp)
    800027d8:	04010413          	addi	s0,sp,64
    800027dc:	00050913          	mv	s2,a0
    800027e0:	00058993          	mv	s3,a1
    800027e4:	00060a93          	mv	s5,a2
    800027e8:	00068a13          	mv	s4,a3
    if(!handle || !routine || !stack_top)return -1;
    800027ec:	08058c63          	beqz	a1,80002884 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xd0>
    800027f0:	08068e63          	beqz	a3,8000288c <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xd8>
    Thread* thread = new Thread(routine, args, stack_top);
    800027f4:	0a800513          	li	a0,168
    800027f8:	00000097          	auipc	ra,0x0
    800027fc:	f84080e7          	jalr	-124(ra) # 8000277c <_ZN6ThreadnwEm>
    80002800:	00050493          	mv	s1,a0
    80002804:	000a0693          	mv	a3,s4
    80002808:	000a8613          	mv	a2,s5
    8000280c:	00098593          	mv	a1,s3
    80002810:	00000097          	auipc	ra,0x0
    80002814:	b24080e7          	jalr	-1244(ra) # 80002334 <_ZN6ThreadC1EPFvPvES0_S0_>
    if(!thread) return -2;
    80002818:	06048e63          	beqz	s1,80002894 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xe0>
    *handle =  thread->threadId;
    8000281c:	0244a783          	lw	a5,36(s1)
    80002820:	00f92023          	sw	a5,0(s2)
    if(!Thread::running){
    80002824:	0000a797          	auipc	a5,0xa
    80002828:	5247b783          	ld	a5,1316(a5) # 8000cd48 <_ZN6Thread7runningE>
    8000282c:	04078063          	beqz	a5,8000286c <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xb8>
    scheduler.put(thread);
    80002830:	00048593          	mv	a1,s1
    80002834:	0000a517          	auipc	a0,0xa
    80002838:	4a453503          	ld	a0,1188(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000283c:	00000097          	auipc	ra,0x0
    80002840:	43c080e7          	jalr	1084(ra) # 80002c78 <_ZN9Scheduler3putEP6Thread>
    return 0;
    80002844:	00000513          	li	a0,0
}
    80002848:	03813083          	ld	ra,56(sp)
    8000284c:	03013403          	ld	s0,48(sp)
    80002850:	02813483          	ld	s1,40(sp)
    80002854:	02013903          	ld	s2,32(sp)
    80002858:	01813983          	ld	s3,24(sp)
    8000285c:	01013a03          	ld	s4,16(sp)
    80002860:	00813a83          	ld	s5,8(sp)
    80002864:	04010113          	addi	sp,sp,64
    80002868:	00008067          	ret
        Thread::running = thread;
    8000286c:	0000a797          	auipc	a5,0xa
    80002870:	4c97be23          	sd	s1,1244(a5) # 8000cd48 <_ZN6Thread7runningE>
        return 0;
    80002874:	00000513          	li	a0,0
    80002878:	fd1ff06f          	j	80002848 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    if(!handle || !routine || !stack_top)return -1;
    8000287c:	fff00513          	li	a0,-1
}
    80002880:	00008067          	ret
    if(!handle || !routine || !stack_top)return -1;
    80002884:	fff00513          	li	a0,-1
    80002888:	fc1ff06f          	j	80002848 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    8000288c:	fff00513          	li	a0,-1
    80002890:	fb9ff06f          	j	80002848 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    if(!thread) return -2;
    80002894:	ffe00513          	li	a0,-2
    80002898:	fb1ff06f          	j	80002848 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>

000000008000289c <_ZN6ThreaddlEPv>:
void Thread::operator delete(void* mem )noexcept{
    8000289c:	fe010113          	addi	sp,sp,-32
    800028a0:	00113c23          	sd	ra,24(sp)
    800028a4:	00813823          	sd	s0,16(sp)
    800028a8:	00913423          	sd	s1,8(sp)
    800028ac:	02010413          	addi	s0,sp,32
    800028b0:	00050493          	mv	s1,a0
MemoryAllocator::Instance()->getThreadPool().deallocate((Thread*) mem);
    800028b4:	00001097          	auipc	ra,0x1
    800028b8:	03c080e7          	jalr	60(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    800028bc:	00001097          	auipc	ra,0x1
    800028c0:	d74080e7          	jalr	-652(ra) # 80003630 <_ZN15MemoryAllocator13getThreadPoolEv>
    800028c4:	00048593          	mv	a1,s1
    800028c8:	fffff097          	auipc	ra,0xfffff
    800028cc:	114080e7          	jalr	276(ra) # 800019dc <_ZN10ThreadPool10deallocateEP6Thread>
}
    800028d0:	01813083          	ld	ra,24(sp)
    800028d4:	01013403          	ld	s0,16(sp)
    800028d8:	00813483          	ld	s1,8(sp)
    800028dc:	02010113          	addi	sp,sp,32
    800028e0:	00008067          	ret

00000000800028e4 <_ZN6ThreadD0Ev>:
Thread::~Thread(){}
    800028e4:	ff010113          	addi	sp,sp,-16
    800028e8:	00113423          	sd	ra,8(sp)
    800028ec:	00813023          	sd	s0,0(sp)
    800028f0:	01010413          	addi	s0,sp,16
    800028f4:	00000097          	auipc	ra,0x0
    800028f8:	fa8080e7          	jalr	-88(ra) # 8000289c <_ZN6ThreaddlEPv>
    800028fc:	00813083          	ld	ra,8(sp)
    80002900:	00013403          	ld	s0,0(sp)
    80002904:	01010113          	addi	sp,sp,16
    80002908:	00008067          	ret

000000008000290c <_ZN6Thread8dispatchEv>:

void Thread::dispatch(){
    8000290c:	ff010113          	addi	sp,sp,-16
    80002910:	00113423          	sd	ra,8(sp)
    80002914:	00813023          	sd	s0,0(sp)
    80002918:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000291c:	fffff097          	auipc	ra,0xfffff
    80002920:	d58080e7          	jalr	-680(ra) # 80001674 <thread_dispatch>
}
    80002924:	00813083          	ld	ra,8(sp)
    80002928:	00013403          	ld	s0,0(sp)
    8000292c:	01010113          	addi	sp,sp,16
    80002930:	00008067          	ret

0000000080002934 <_ZN6Thread5startEv>:

int Thread::start() {
    80002934:	ff010113          	addi	sp,sp,-16
    80002938:	00113423          	sd	ra,8(sp)
    8000293c:	00813023          	sd	s0,0(sp)
    80002940:	01010413          	addi	s0,sp,16
    80002944:	00050593          	mv	a1,a0
    scheduler.put(this);
    80002948:	0000a517          	auipc	a0,0xa
    8000294c:	39053503          	ld	a0,912(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002950:	00000097          	auipc	ra,0x0
    80002954:	328080e7          	jalr	808(ra) # 80002c78 <_ZN9Scheduler3putEP6Thread>

    if(Thread::running == nullptr) {
    80002958:	0000a797          	auipc	a5,0xa
    8000295c:	3f07b783          	ld	a5,1008(a5) # 8000cd48 <_ZN6Thread7runningE>
    80002960:	00078c63          	beqz	a5,80002978 <_ZN6Thread5startEv+0x44>
        Thread::running = scheduler.get();
        if(Thread::running == nullptr) return -1;

    }
    return 0;
    80002964:	00000513          	li	a0,0
}
    80002968:	00813083          	ld	ra,8(sp)
    8000296c:	00013403          	ld	s0,0(sp)
    80002970:	01010113          	addi	sp,sp,16
    80002974:	00008067          	ret
        Thread::running = scheduler.get();
    80002978:	0000a517          	auipc	a0,0xa
    8000297c:	36053503          	ld	a0,864(a0) # 8000ccd8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002980:	00000097          	auipc	ra,0x0
    80002984:	330080e7          	jalr	816(ra) # 80002cb0 <_ZN9Scheduler3getEv>
    80002988:	0000a797          	auipc	a5,0xa
    8000298c:	3ca7b023          	sd	a0,960(a5) # 8000cd48 <_ZN6Thread7runningE>
        if(Thread::running == nullptr) return -1;
    80002990:	00050663          	beqz	a0,8000299c <_ZN6Thread5startEv+0x68>
    return 0;
    80002994:	00000513          	li	a0,0
    80002998:	fd1ff06f          	j	80002968 <_ZN6Thread5startEv+0x34>
        if(Thread::running == nullptr) return -1;
    8000299c:	fff00513          	li	a0,-1
    800029a0:	fc9ff06f          	j	80002968 <_ZN6Thread5startEv+0x34>

00000000800029a4 <getRunningThreadContext>:
extern "C" ThreadContext* getRunningThreadContext(){
    if(Thread::running == nullptr){
    800029a4:	0000a517          	auipc	a0,0xa
    800029a8:	3a453503          	ld	a0,932(a0) # 8000cd48 <_ZN6Thread7runningE>
    800029ac:	02050663          	beqz	a0,800029d8 <getRunningThreadContext+0x34>
extern "C" ThreadContext* getRunningThreadContext(){
    800029b0:	ff010113          	addi	sp,sp,-16
    800029b4:	00113423          	sd	ra,8(sp)
    800029b8:	00813023          	sd	s0,0(sp)
    800029bc:	01010413          	addi	s0,sp,16
        return nullptr;
    }
    return Thread::running->getContext();
    800029c0:	00000097          	auipc	ra,0x0
    800029c4:	958080e7          	jalr	-1704(ra) # 80002318 <_ZN6Thread10getContextEv>
};
    800029c8:	00813083          	ld	ra,8(sp)
    800029cc:	00013403          	ld	s0,0(sp)
    800029d0:	01010113          	addi	sp,sp,16
    800029d4:	00008067          	ret
    800029d8:	00008067          	ret

00000000800029dc <getWaitStatusForRunning>:

extern "C" int getWaitStatusForRunning(){
    800029dc:	ff010113          	addi	sp,sp,-16
    800029e0:	00813423          	sd	s0,8(sp)
    800029e4:	01010413          	addi	s0,sp,16
    return Thread::running->semWaitStatus;
}
    800029e8:	0000a797          	auipc	a5,0xa
    800029ec:	3607b783          	ld	a5,864(a5) # 8000cd48 <_ZN6Thread7runningE>
    800029f0:	0087a503          	lw	a0,8(a5)
    800029f4:	00813403          	ld	s0,8(sp)
    800029f8:	01010113          	addi	sp,sp,16
    800029fc:	00008067          	ret

0000000080002a00 <_ZN6Thread3runEv>:
    virtual ~Thread ();
    int start ();
    static void dispatch();
    static void* operator new(size_t size);
    static void operator delete(void*) noexcept;
    virtual void run (){};
    80002a00:	ff010113          	addi	sp,sp,-16
    80002a04:	00813423          	sd	s0,8(sp)
    80002a08:	01010413          	addi	s0,sp,16
    80002a0c:	00813403          	ld	s0,8(sp)
    80002a10:	01010113          	addi	sp,sp,16
    80002a14:	00008067          	ret

0000000080002a18 <_ZN13ConsoleBufferC1Ev>:
#include "../h/Buffer.hpp"

ConsoleBuffer::ConsoleBuffer() {
    80002a18:	fe010113          	addi	sp,sp,-32
    80002a1c:	00113c23          	sd	ra,24(sp)
    80002a20:	00813823          	sd	s0,16(sp)
    80002a24:	00913423          	sd	s1,8(sp)
    80002a28:	01213023          	sd	s2,0(sp)
    80002a2c:	02010413          	addi	s0,sp,32
    80002a30:	00050493          	mv	s1,a0
    head = tail = count = 0;
    80002a34:	20053823          	sd	zero,528(a0)
    80002a38:	20053423          	sd	zero,520(a0)
    80002a3c:	20053023          	sd	zero,512(a0)
    itemAvailable  = new Semaphore(0);
    80002a40:	02000513          	li	a0,32
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	08c080e7          	jalr	140(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80002a4c:	00050913          	mv	s2,a0
    80002a50:	00000593          	li	a1,0
    80002a54:	fffff097          	auipc	ra,0xfffff
    80002a58:	010080e7          	jalr	16(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80002a5c:	2124bc23          	sd	s2,536(s1)
    spaceAvailable = new Semaphore(BUFF_SIZE);
    80002a60:	02000513          	li	a0,32
    80002a64:	fffff097          	auipc	ra,0xfffff
    80002a68:	06c080e7          	jalr	108(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80002a6c:	00050913          	mv	s2,a0
    80002a70:	20000593          	li	a1,512
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	ff0080e7          	jalr	-16(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80002a7c:	2324b023          	sd	s2,544(s1)
    mutex          = new Semaphore(1);
    80002a80:	02000513          	li	a0,32
    80002a84:	fffff097          	auipc	ra,0xfffff
    80002a88:	04c080e7          	jalr	76(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80002a8c:	00050913          	mv	s2,a0
    80002a90:	00100593          	li	a1,1
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	fd0080e7          	jalr	-48(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80002a9c:	2324b423          	sd	s2,552(s1)
}
    80002aa0:	01813083          	ld	ra,24(sp)
    80002aa4:	01013403          	ld	s0,16(sp)
    80002aa8:	00813483          	ld	s1,8(sp)
    80002aac:	00013903          	ld	s2,0(sp)
    80002ab0:	02010113          	addi	sp,sp,32
    80002ab4:	00008067          	ret
    80002ab8:	00050493          	mv	s1,a0
    itemAvailable  = new Semaphore(0);
    80002abc:	00090513          	mv	a0,s2
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	048080e7          	jalr	72(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80002ac8:	00048513          	mv	a0,s1
    80002acc:	0000c097          	auipc	ra,0xc
    80002ad0:	88c080e7          	jalr	-1908(ra) # 8000e358 <_Unwind_Resume>
    80002ad4:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(BUFF_SIZE);
    80002ad8:	00090513          	mv	a0,s2
    80002adc:	fffff097          	auipc	ra,0xfffff
    80002ae0:	02c080e7          	jalr	44(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80002ae4:	00048513          	mv	a0,s1
    80002ae8:	0000c097          	auipc	ra,0xc
    80002aec:	870080e7          	jalr	-1936(ra) # 8000e358 <_Unwind_Resume>
    80002af0:	00050493          	mv	s1,a0
    mutex          = new Semaphore(1);
    80002af4:	00090513          	mv	a0,s2
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	010080e7          	jalr	16(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80002b00:	00048513          	mv	a0,s1
    80002b04:	0000c097          	auipc	ra,0xc
    80002b08:	854080e7          	jalr	-1964(ra) # 8000e358 <_Unwind_Resume>

0000000080002b0c <_ZN13ConsoleBuffer4putcEc>:

void ConsoleBuffer::putc(char c) {
    80002b0c:	fe010113          	addi	sp,sp,-32
    80002b10:	00113c23          	sd	ra,24(sp)
    80002b14:	00813823          	sd	s0,16(sp)
    80002b18:	00913423          	sd	s1,8(sp)
    80002b1c:	01213023          	sd	s2,0(sp)
    80002b20:	02010413          	addi	s0,sp,32
    80002b24:	00050493          	mv	s1,a0
    80002b28:	00058913          	mv	s2,a1

    spaceAvailable->wait();
    80002b2c:	22053503          	ld	a0,544(a0)
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	31c080e7          	jalr	796(ra) # 80001e4c <_ZN9Semaphore4waitEv>


    buffer[tail] = c;
    80002b38:	2084b783          	ld	a5,520(s1)
    80002b3c:	00f48733          	add	a4,s1,a5
    80002b40:	01270023          	sb	s2,0(a4)
    tail = (tail + 1) % BUFF_SIZE;
    80002b44:	00178793          	addi	a5,a5,1
    80002b48:	1ff7f793          	andi	a5,a5,511
    80002b4c:	20f4b423          	sd	a5,520(s1)
    count++;
    80002b50:	2104b783          	ld	a5,528(s1)
    80002b54:	00178793          	addi	a5,a5,1
    80002b58:	20f4b823          	sd	a5,528(s1)


    itemAvailable->signal();
    80002b5c:	2184b503          	ld	a0,536(s1)
    80002b60:	fffff097          	auipc	ra,0xfffff
    80002b64:	3c4080e7          	jalr	964(ra) # 80001f24 <_ZN9Semaphore6signalEv>
}
    80002b68:	01813083          	ld	ra,24(sp)
    80002b6c:	01013403          	ld	s0,16(sp)
    80002b70:	00813483          	ld	s1,8(sp)
    80002b74:	00013903          	ld	s2,0(sp)
    80002b78:	02010113          	addi	sp,sp,32
    80002b7c:	00008067          	ret

0000000080002b80 <_ZN13ConsoleBuffer4getcEv>:

char ConsoleBuffer::getc() {
    80002b80:	fe010113          	addi	sp,sp,-32
    80002b84:	00113c23          	sd	ra,24(sp)
    80002b88:	00813823          	sd	s0,16(sp)
    80002b8c:	00913423          	sd	s1,8(sp)
    80002b90:	01213023          	sd	s2,0(sp)
    80002b94:	02010413          	addi	s0,sp,32
    80002b98:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002b9c:	21853503          	ld	a0,536(a0)
    80002ba0:	fffff097          	auipc	ra,0xfffff
    80002ba4:	2ac080e7          	jalr	684(ra) # 80001e4c <_ZN9Semaphore4waitEv>

    char c = buffer[head];
    80002ba8:	2004b783          	ld	a5,512(s1)
    80002bac:	00f48733          	add	a4,s1,a5
    80002bb0:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % BUFF_SIZE;
    80002bb4:	00178793          	addi	a5,a5,1
    80002bb8:	1ff7f793          	andi	a5,a5,511
    80002bbc:	20f4b023          	sd	a5,512(s1)
    count--;
    80002bc0:	2104b783          	ld	a5,528(s1)
    80002bc4:	fff78793          	addi	a5,a5,-1
    80002bc8:	20f4b823          	sd	a5,528(s1)


    spaceAvailable->signal();
    80002bcc:	2204b503          	ld	a0,544(s1)
    80002bd0:	fffff097          	auipc	ra,0xfffff
    80002bd4:	354080e7          	jalr	852(ra) # 80001f24 <_ZN9Semaphore6signalEv>

    return c;
}
    80002bd8:	00090513          	mv	a0,s2
    80002bdc:	01813083          	ld	ra,24(sp)
    80002be0:	01013403          	ld	s0,16(sp)
    80002be4:	00813483          	ld	s1,8(sp)
    80002be8:	00013903          	ld	s2,0(sp)
    80002bec:	02010113          	addi	sp,sp,32
    80002bf0:	00008067          	ret

0000000080002bf4 <_ZNK13ConsoleBuffer11getCapacityEv>:
uint64 ConsoleBuffer::getCapacity() const {
    80002bf4:	ff010113          	addi	sp,sp,-16
    80002bf8:	00813423          	sd	s0,8(sp)
    80002bfc:	01010413          	addi	s0,sp,16
    return BUFF_SIZE;
}
    80002c00:	20000513          	li	a0,512
    80002c04:	00813403          	ld	s0,8(sp)
    80002c08:	01010113          	addi	sp,sp,16
    80002c0c:	00008067          	ret

0000000080002c10 <_ZN9SchedulerC1Ev>:
#include "../h/Scheduler.hpp"

Scheduler scheduler;

Scheduler::Scheduler() {
    80002c10:	ff010113          	addi	sp,sp,-16
    80002c14:	00813423          	sd	s0,8(sp)
    80002c18:	01010413          	addi	s0,sp,16
    head = nullptr;
    80002c1c:	00053023          	sd	zero,0(a0)
    tail = nullptr;
    80002c20:	00053423          	sd	zero,8(a0)
}
    80002c24:	00813403          	ld	s0,8(sp)
    80002c28:	01010113          	addi	sp,sp,16
    80002c2c:	00008067          	ret

0000000080002c30 <_Z41__static_initialization_and_destruction_0ii>:
    }
    head = head->next;
    thread->next = nullptr;
    if(!head) tail = nullptr;
    return thread;
    80002c30:	00100793          	li	a5,1
    80002c34:	00f50463          	beq	a0,a5,80002c3c <_Z41__static_initialization_and_destruction_0ii+0xc>
    80002c38:	00008067          	ret
    80002c3c:	000107b7          	lui	a5,0x10
    80002c40:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002c44:	fef59ae3          	bne	a1,a5,80002c38 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80002c48:	ff010113          	addi	sp,sp,-16
    80002c4c:	00113423          	sd	ra,8(sp)
    80002c50:	00813023          	sd	s0,0(sp)
    80002c54:	01010413          	addi	s0,sp,16
Scheduler scheduler;
    80002c58:	0000a517          	auipc	a0,0xa
    80002c5c:	0f850513          	addi	a0,a0,248 # 8000cd50 <scheduler>
    80002c60:	00000097          	auipc	ra,0x0
    80002c64:	fb0080e7          	jalr	-80(ra) # 80002c10 <_ZN9SchedulerC1Ev>
    80002c68:	00813083          	ld	ra,8(sp)
    80002c6c:	00013403          	ld	s0,0(sp)
    80002c70:	01010113          	addi	sp,sp,16
    80002c74:	00008067          	ret

0000000080002c78 <_ZN9Scheduler3putEP6Thread>:
void Scheduler::put(Thread* t){
    80002c78:	ff010113          	addi	sp,sp,-16
    80002c7c:	00813423          	sd	s0,8(sp)
    80002c80:	01010413          	addi	s0,sp,16
    t->next = nullptr;
    80002c84:	0005b823          	sd	zero,16(a1)
    if(!head){
    80002c88:	00053783          	ld	a5,0(a0)
    80002c8c:	00078e63          	beqz	a5,80002ca8 <_ZN9Scheduler3putEP6Thread+0x30>
        tail->next = t;
    80002c90:	00853783          	ld	a5,8(a0)
    80002c94:	00b7b823          	sd	a1,16(a5)
    tail = t;
    80002c98:	00b53423          	sd	a1,8(a0)
}
    80002c9c:	00813403          	ld	s0,8(sp)
    80002ca0:	01010113          	addi	sp,sp,16
    80002ca4:	00008067          	ret
        head = t;
    80002ca8:	00b53023          	sd	a1,0(a0)
    80002cac:	fedff06f          	j	80002c98 <_ZN9Scheduler3putEP6Thread+0x20>

0000000080002cb0 <_ZN9Scheduler3getEv>:
Thread* Scheduler::get(){
    80002cb0:	fe010113          	addi	sp,sp,-32
    80002cb4:	00113c23          	sd	ra,24(sp)
    80002cb8:	00813823          	sd	s0,16(sp)
    80002cbc:	00913423          	sd	s1,8(sp)
    80002cc0:	01213023          	sd	s2,0(sp)
    80002cc4:	02010413          	addi	s0,sp,32
    if(head == nullptr) return nullptr;
    80002cc8:	00053903          	ld	s2,0(a0)
    80002ccc:	04090463          	beqz	s2,80002d14 <_ZN9Scheduler3getEv+0x64>
    80002cd0:	00050493          	mv	s1,a0
    if(thread->getContext()->startedOnce)
    80002cd4:	00090513          	mv	a0,s2
    80002cd8:	fffff097          	auipc	ra,0xfffff
    80002cdc:	640080e7          	jalr	1600(ra) # 80002318 <_ZN6Thread10getContextEv>
    80002ce0:	03853783          	ld	a5,56(a0)
    80002ce4:	04079663          	bnez	a5,80002d30 <_ZN9Scheduler3getEv+0x80>
    if(thread->getContext()->startedOnce == 0)
    80002ce8:	00090513          	mv	a0,s2
    80002cec:	fffff097          	auipc	ra,0xfffff
    80002cf0:	62c080e7          	jalr	1580(ra) # 80002318 <_ZN6Thread10getContextEv>
    80002cf4:	03853783          	ld	a5,56(a0)
    80002cf8:	04078863          	beqz	a5,80002d48 <_ZN9Scheduler3getEv+0x98>
    head = head->next;
    80002cfc:	0004b783          	ld	a5,0(s1)
    80002d00:	0107b783          	ld	a5,16(a5)
    80002d04:	00f4b023          	sd	a5,0(s1)
    thread->next = nullptr;
    80002d08:	00093823          	sd	zero,16(s2)
    if(!head) tail = nullptr;
    80002d0c:	0004b783          	ld	a5,0(s1)
    80002d10:	04078863          	beqz	a5,80002d60 <_ZN9Scheduler3getEv+0xb0>
    80002d14:	00090513          	mv	a0,s2
    80002d18:	01813083          	ld	ra,24(sp)
    80002d1c:	01013403          	ld	s0,16(sp)
    80002d20:	00813483          	ld	s1,8(sp)
    80002d24:	00013903          	ld	s2,0(sp)
    80002d28:	02010113          	addi	sp,sp,32
    80002d2c:	00008067          	ret
        thread->getContext()->wasActive = 1;
    80002d30:	00090513          	mv	a0,s2
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	5e4080e7          	jalr	1508(ra) # 80002318 <_ZN6Thread10getContextEv>
    80002d3c:	00100793          	li	a5,1
    80002d40:	04f53023          	sd	a5,64(a0)
    80002d44:	fa5ff06f          	j	80002ce8 <_ZN9Scheduler3getEv+0x38>
        thread->getContext()->startedOnce = 1;
    80002d48:	00090513          	mv	a0,s2
    80002d4c:	fffff097          	auipc	ra,0xfffff
    80002d50:	5cc080e7          	jalr	1484(ra) # 80002318 <_ZN6Thread10getContextEv>
    80002d54:	00100793          	li	a5,1
    80002d58:	02f53c23          	sd	a5,56(a0)
    80002d5c:	fa1ff06f          	j	80002cfc <_ZN9Scheduler3getEv+0x4c>
    if(!head) tail = nullptr;
    80002d60:	0004b423          	sd	zero,8(s1)
    80002d64:	fb1ff06f          	j	80002d14 <_ZN9Scheduler3getEv+0x64>

0000000080002d68 <_GLOBAL__sub_I_scheduler>:
    80002d68:	ff010113          	addi	sp,sp,-16
    80002d6c:	00113423          	sd	ra,8(sp)
    80002d70:	00813023          	sd	s0,0(sp)
    80002d74:	01010413          	addi	s0,sp,16
    80002d78:	000105b7          	lui	a1,0x10
    80002d7c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002d80:	00100513          	li	a0,1
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	eac080e7          	jalr	-340(ra) # 80002c30 <_Z41__static_initialization_and_destruction_0ii>
    80002d8c:	00813083          	ld	ra,8(sp)
    80002d90:	00013403          	ld	s0,0(sp)
    80002d94:	01010113          	addi	sp,sp,16
    80002d98:	00008067          	ret

0000000080002d9c <_ZN7Console15producerRoutineEPv>:
Console* Console::Instance() {
    static Console instance;
    return &instance;
}

void Console::producerRoutine(void* arg) {
    80002d9c:	ff010113          	addi	sp,sp,-16
    80002da0:	00813423          	sd	s0,8(sp)
    80002da4:	01010413          	addi	s0,sp,16
//            plic_complete(CONSOLE_IRQ);
//        } else {
//            Thread::thread_dispatch_kernel();
//        }
//    }
}
    80002da8:	00813403          	ld	s0,8(sp)
    80002dac:	01010113          	addi	sp,sp,16
    80002db0:	00008067          	ret

0000000080002db4 <_ZN7Console15consumerRoutineEPv>:

void Console::consumerRoutine(void* arg) {
    80002db4:	ff010113          	addi	sp,sp,-16
    80002db8:	00813423          	sd	s0,8(sp)
    80002dbc:	01010413          	addi	s0,sp,16
//            plic_complete(CONSOLE_IRQ);
//        } else {
//            Thread::thread_dispatch_kernel();
//        }
//    }
}
    80002dc0:	00813403          	ld	s0,8(sp)
    80002dc4:	01010113          	addi	sp,sp,16
    80002dc8:	00008067          	ret

0000000080002dcc <_ZN7ConsoleC1Ev>:

Console::Console() {
    80002dcc:	fe010113          	addi	sp,sp,-32
    80002dd0:	00113c23          	sd	ra,24(sp)
    80002dd4:	00813823          	sd	s0,16(sp)
    80002dd8:	00913423          	sd	s1,8(sp)
    80002ddc:	01213023          	sd	s2,0(sp)
    80002de0:	02010413          	addi	s0,sp,32
    80002de4:	00050493          	mv	s1,a0
    80002de8:	00000097          	auipc	ra,0x0
    80002dec:	c30080e7          	jalr	-976(ra) # 80002a18 <_ZN13ConsoleBufferC1Ev>
    80002df0:	23048513          	addi	a0,s1,560
    80002df4:	00000097          	auipc	ra,0x0
    80002df8:	c24080e7          	jalr	-988(ra) # 80002a18 <_ZN13ConsoleBufferC1Ev>
    isInterrupted = false;
    80002dfc:	48048023          	sb	zero,1152(s1)

    // Kreiranje semafora
    putcSemaphore = new Semaphore(0);
    80002e00:	02000513          	li	a0,32
    80002e04:	fffff097          	auipc	ra,0xfffff
    80002e08:	ccc080e7          	jalr	-820(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80002e0c:	00050913          	mv	s2,a0
    80002e10:	00000593          	li	a1,0
    80002e14:	fffff097          	auipc	ra,0xfffff
    80002e18:	c50080e7          	jalr	-944(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80002e1c:	4724b023          	sd	s2,1120(s1)
    getcSemaphore = new Semaphore(0);
    80002e20:	02000513          	li	a0,32
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	cac080e7          	jalr	-852(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80002e2c:	00050913          	mv	s2,a0
    80002e30:	00000593          	li	a1,0
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	c30080e7          	jalr	-976(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80002e3c:	4724b423          	sd	s2,1128(s1)
    // Kernel niti
//    producerThread = new Thread(producerRoutine, this);
//    consumerThread = new Thread(consumerRoutine, this);
//    scheduler.put(consumerThread);
//    scheduler.put(producerThread);
}
    80002e40:	01813083          	ld	ra,24(sp)
    80002e44:	01013403          	ld	s0,16(sp)
    80002e48:	00813483          	ld	s1,8(sp)
    80002e4c:	00013903          	ld	s2,0(sp)
    80002e50:	02010113          	addi	sp,sp,32
    80002e54:	00008067          	ret
    80002e58:	00050493          	mv	s1,a0
    putcSemaphore = new Semaphore(0);
    80002e5c:	00090513          	mv	a0,s2
    80002e60:	fffff097          	auipc	ra,0xfffff
    80002e64:	ca8080e7          	jalr	-856(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80002e68:	00048513          	mv	a0,s1
    80002e6c:	0000b097          	auipc	ra,0xb
    80002e70:	4ec080e7          	jalr	1260(ra) # 8000e358 <_Unwind_Resume>
    80002e74:	00050493          	mv	s1,a0
    getcSemaphore = new Semaphore(0);
    80002e78:	00090513          	mv	a0,s2
    80002e7c:	fffff097          	auipc	ra,0xfffff
    80002e80:	c8c080e7          	jalr	-884(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80002e84:	00048513          	mv	a0,s1
    80002e88:	0000b097          	auipc	ra,0xb
    80002e8c:	4d0080e7          	jalr	1232(ra) # 8000e358 <_Unwind_Resume>

0000000080002e90 <_ZN7Console8InstanceEv>:
    static Console instance;
    80002e90:	0000a797          	auipc	a5,0xa
    80002e94:	ed07c783          	lbu	a5,-304(a5) # 8000cd60 <_ZGVZN7Console8InstanceEvE8instance>
    80002e98:	00078863          	beqz	a5,80002ea8 <_ZN7Console8InstanceEv+0x18>
}
    80002e9c:	0000a517          	auipc	a0,0xa
    80002ea0:	ecc50513          	addi	a0,a0,-308 # 8000cd68 <_ZZN7Console8InstanceEvE8instance>
    80002ea4:	00008067          	ret
Console* Console::Instance() {
    80002ea8:	ff010113          	addi	sp,sp,-16
    80002eac:	00113423          	sd	ra,8(sp)
    80002eb0:	00813023          	sd	s0,0(sp)
    80002eb4:	01010413          	addi	s0,sp,16
    static Console instance;
    80002eb8:	0000a517          	auipc	a0,0xa
    80002ebc:	eb050513          	addi	a0,a0,-336 # 8000cd68 <_ZZN7Console8InstanceEvE8instance>
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	f0c080e7          	jalr	-244(ra) # 80002dcc <_ZN7ConsoleC1Ev>
    80002ec8:	00100793          	li	a5,1
    80002ecc:	0000a717          	auipc	a4,0xa
    80002ed0:	e8f70a23          	sb	a5,-364(a4) # 8000cd60 <_ZGVZN7Console8InstanceEvE8instance>
}
    80002ed4:	0000a517          	auipc	a0,0xa
    80002ed8:	e9450513          	addi	a0,a0,-364 # 8000cd68 <_ZZN7Console8InstanceEvE8instance>
    80002edc:	00813083          	ld	ra,8(sp)
    80002ee0:	00013403          	ld	s0,0(sp)
    80002ee4:	01010113          	addi	sp,sp,16
    80002ee8:	00008067          	ret

0000000080002eec <_ZN7Console12setInterruptEv>:

void Console::setInterrupt() {
    80002eec:	ff010113          	addi	sp,sp,-16
    80002ef0:	00113423          	sd	ra,8(sp)
    80002ef4:	00813023          	sd	s0,0(sp)
    80002ef8:	01010413          	addi	s0,sp,16
    Console::Instance()->isInterrupted = true;
    80002efc:	00000097          	auipc	ra,0x0
    80002f00:	f94080e7          	jalr	-108(ra) # 80002e90 <_ZN7Console8InstanceEv>
    80002f04:	00100793          	li	a5,1
    80002f08:	48f50023          	sb	a5,1152(a0)
}
    80002f0c:	00813083          	ld	ra,8(sp)
    80002f10:	00013403          	ld	s0,0(sp)
    80002f14:	01010113          	addi	sp,sp,16
    80002f18:	00008067          	ret

0000000080002f1c <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002f1c:	fe010113          	addi	sp,sp,-32
    80002f20:	00113c23          	sd	ra,24(sp)
    80002f24:	00813823          	sd	s0,16(sp)
    80002f28:	00913423          	sd	s1,8(sp)
    80002f2c:	02010413          	addi	s0,sp,32
    80002f30:	00050493          	mv	s1,a0
    Console::Instance()->txBuffer.putc(c);
    80002f34:	00000097          	auipc	ra,0x0
    80002f38:	f5c080e7          	jalr	-164(ra) # 80002e90 <_ZN7Console8InstanceEv>
    80002f3c:	00048593          	mv	a1,s1
    80002f40:	23050513          	addi	a0,a0,560
    80002f44:	00000097          	auipc	ra,0x0
    80002f48:	bc8080e7          	jalr	-1080(ra) # 80002b0c <_ZN13ConsoleBuffer4putcEc>
    Console::Instance()->putcSemaphore->signal();
    80002f4c:	00000097          	auipc	ra,0x0
    80002f50:	f44080e7          	jalr	-188(ra) # 80002e90 <_ZN7Console8InstanceEv>
    80002f54:	46053503          	ld	a0,1120(a0)
    80002f58:	fffff097          	auipc	ra,0xfffff
    80002f5c:	fcc080e7          	jalr	-52(ra) # 80001f24 <_ZN9Semaphore6signalEv>
}
    80002f60:	01813083          	ld	ra,24(sp)
    80002f64:	01013403          	ld	s0,16(sp)
    80002f68:	00813483          	ld	s1,8(sp)
    80002f6c:	02010113          	addi	sp,sp,32
    80002f70:	00008067          	ret

0000000080002f74 <_ZN7Console4getcEv>:

char Console::getc() {
    80002f74:	ff010113          	addi	sp,sp,-16
    80002f78:	00113423          	sd	ra,8(sp)
    80002f7c:	00813023          	sd	s0,0(sp)
    80002f80:	01010413          	addi	s0,sp,16
    Console::Instance()->getcSemaphore->wait();
    80002f84:	00000097          	auipc	ra,0x0
    80002f88:	f0c080e7          	jalr	-244(ra) # 80002e90 <_ZN7Console8InstanceEv>
    80002f8c:	46853503          	ld	a0,1128(a0)
    80002f90:	fffff097          	auipc	ra,0xfffff
    80002f94:	ebc080e7          	jalr	-324(ra) # 80001e4c <_ZN9Semaphore4waitEv>
    return Console::Instance()->rxBuffer.getc();
    80002f98:	00000097          	auipc	ra,0x0
    80002f9c:	ef8080e7          	jalr	-264(ra) # 80002e90 <_ZN7Console8InstanceEv>
    80002fa0:	00000097          	auipc	ra,0x0
    80002fa4:	be0080e7          	jalr	-1056(ra) # 80002b80 <_ZN13ConsoleBuffer4getcEv>
}
    80002fa8:	00813083          	ld	ra,8(sp)
    80002fac:	00013403          	ld	s0,0(sp)
    80002fb0:	01010113          	addi	sp,sp,16
    80002fb4:	00008067          	ret

0000000080002fb8 <_ZN7Console10getTxCountEv>:

uint64 Console::getTxCount() {
    80002fb8:	ff010113          	addi	sp,sp,-16
    80002fbc:	00113423          	sd	ra,8(sp)
    80002fc0:	00813023          	sd	s0,0(sp)
    80002fc4:	01010413          	addi	s0,sp,16
    return Console::Instance()->txBuffer.getCount();
    80002fc8:	00000097          	auipc	ra,0x0
    80002fcc:	ec8080e7          	jalr	-312(ra) # 80002e90 <_ZN7Console8InstanceEv>
}
    80002fd0:	44053503          	ld	a0,1088(a0)
    80002fd4:	00813083          	ld	ra,8(sp)
    80002fd8:	00013403          	ld	s0,0(sp)
    80002fdc:	01010113          	addi	sp,sp,16
    80002fe0:	00008067          	ret

0000000080002fe4 <_Z15userMainWrapperPv>:

}
void* __dso_handle = nullptr;


void userMainWrapper(void* args){
    80002fe4:	ff010113          	addi	sp,sp,-16
    80002fe8:	00113423          	sd	ra,8(sp)
    80002fec:	00813023          	sd	s0,0(sp)
    80002ff0:	01010413          	addi	s0,sp,16

    //RiscV::switchToUserMode();
    userMain();
    80002ff4:	00003097          	auipc	ra,0x3
    80002ff8:	658080e7          	jalr	1624(ra) # 8000664c <userMain>
    thread_exit();
    80002ffc:	ffffe097          	auipc	ra,0xffffe
    80003000:	648080e7          	jalr	1608(ra) # 80001644 <thread_exit>
}
    80003004:	00813083          	ld	ra,8(sp)
    80003008:	00013403          	ld	s0,0(sp)
    8000300c:	01010113          	addi	sp,sp,16
    80003010:	00008067          	ret

0000000080003014 <_Z8idleBodyPv>:
void idleBody(void*) {
    80003014:	ff010113          	addi	sp,sp,-16
    80003018:	00113423          	sd	ra,8(sp)
    8000301c:	00813023          	sd	s0,0(sp)
    80003020:	01010413          	addi	s0,sp,16
    while (true){
        thread_dispatch();
    80003024:	ffffe097          	auipc	ra,0xffffe
    80003028:	650080e7          	jalr	1616(ra) # 80001674 <thread_dispatch>
    while (true){
    8000302c:	ff9ff06f          	j	80003024 <_Z8idleBodyPv+0x10>

0000000080003030 <__cxa_atexit>:
int __cxa_atexit(void (*func)(void *), void *arg, void *d) {
    80003030:	ff010113          	addi	sp,sp,-16
    80003034:	00813423          	sd	s0,8(sp)
    80003038:	01010413          	addi	s0,sp,16
}
    8000303c:	00000513          	li	a0,0
    80003040:	00813403          	ld	s0,8(sp)
    80003044:	01010113          	addi	sp,sp,16
    80003048:	00008067          	ret

000000008000304c <main>:
    }
}

void main() {
    8000304c:	fd010113          	addi	sp,sp,-48
    80003050:	02113423          	sd	ra,40(sp)
    80003054:	02813023          	sd	s0,32(sp)
    80003058:	00913c23          	sd	s1,24(sp)
    8000305c:	01213823          	sd	s2,16(sp)
    80003060:	03010413          	addi	s0,sp,48



    __asm__ volatile("csrw stvec, %[val]" : : [val] "r" (&handle_interrupt));
    80003064:	0000a797          	auipc	a5,0xa
    80003068:	c5c7b783          	ld	a5,-932(a5) # 8000ccc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000306c:	10579073          	csrw	stvec,a5
//    else {
//        stack_start = (uint64)HEAP_START_ADDR + (MEM_BLOCK_SIZE - (uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE);
//    }
//    uint64 sp = stack_start + 3*(uint64)DEFAULT_STACK_SIZE;
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
     void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80003070:	00001097          	auipc	ra,0x1
    80003074:	880080e7          	jalr	-1920(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80003078:	08100593          	li	a1,129
    8000307c:	00000097          	auipc	ra,0x0
    80003080:	5ec080e7          	jalr	1516(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    80003084:	000024b7          	lui	s1,0x2
    80003088:	00848493          	addi	s1,s1,8 # 2008 <_entry-0x7fffdff8>
    8000308c:	00950533          	add	a0,a0,s1

    __asm__ volatile("mv sp, %[sp]" : : [sp] "r" ((uint64)(stack_top)));
    80003090:	00050113          	mv	sp,a0

     numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;

    result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80003094:	00001097          	auipc	ra,0x1
    80003098:	85c080e7          	jalr	-1956(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    8000309c:	08100593          	li	a1,129
    800030a0:	00000097          	auipc	ra,0x0
    800030a4:	5c8080e7          	jalr	1480(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
    stack = (char*)result + sizeof(Header);
    stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    thread_t  pid;
    Thread::create_thread_kernel(&pid, idleBody, nullptr, stack_top);
    800030a8:	009506b3          	add	a3,a0,s1
    800030ac:	00000613          	li	a2,0
    800030b0:	00000597          	auipc	a1,0x0
    800030b4:	f6458593          	addi	a1,a1,-156 # 80003014 <_Z8idleBodyPv>
    800030b8:	fdc40913          	addi	s2,s0,-36
    800030bc:	00090513          	mv	a0,s2
    800030c0:	fffff097          	auipc	ra,0xfffff
    800030c4:	6f4080e7          	jalr	1780(ra) # 800027b4 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
    result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    800030c8:	00001097          	auipc	ra,0x1
    800030cc:	828080e7          	jalr	-2008(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    800030d0:	08100593          	li	a1,129
    800030d4:	00000097          	auipc	ra,0x0
    800030d8:	594080e7          	jalr	1428(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
    stack = (char*)result + sizeof(Header);
    stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;

    Thread::create_thread_kernel(&pid, userMainWrapper, nullptr, stack_top);
    800030dc:	009506b3          	add	a3,a0,s1
    800030e0:	00000613          	li	a2,0
    800030e4:	00000597          	auipc	a1,0x0
    800030e8:	f0058593          	addi	a1,a1,-256 # 80002fe4 <_Z15userMainWrapperPv>
    800030ec:	00090513          	mv	a0,s2
    800030f0:	fffff097          	auipc	ra,0xfffff
    800030f4:	6c4080e7          	jalr	1732(ra) # 800027b4 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
    Console::Instance();
    800030f8:	00000097          	auipc	ra,0x0
    800030fc:	d98080e7          	jalr	-616(ra) # 80002e90 <_ZN7Console8InstanceEv>
    thread_dispatch();
    80003100:	ffffe097          	auipc	ra,0xffffe
    80003104:	574080e7          	jalr	1396(ra) # 80001674 <thread_dispatch>

}
    80003108:	02813083          	ld	ra,40(sp)
    8000310c:	02013403          	ld	s0,32(sp)
    80003110:	01813483          	ld	s1,24(sp)
    80003114:	01013903          	ld	s2,16(sp)
    80003118:	03010113          	addi	sp,sp,48
    8000311c:	00008067          	ret

0000000080003120 <interrupt>:
#include "../h/Console.hpp"
#include "../h/SleepingThreadsList.hpp"



extern "C" uint64 interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5){
    80003120:	fb010113          	addi	sp,sp,-80
    80003124:	04113423          	sd	ra,72(sp)
    80003128:	04813023          	sd	s0,64(sp)
    8000312c:	02913c23          	sd	s1,56(sp)
    80003130:	03213823          	sd	s2,48(sp)
    80003134:	03313423          	sd	s3,40(sp)
    80003138:	03413023          	sd	s4,32(sp)
    8000313c:	01513c23          	sd	s5,24(sp)
    80003140:	01613823          	sd	s6,16(sp)
    80003144:	01713423          	sd	s7,8(sp)
    80003148:	01813023          	sd	s8,0(sp)
    8000314c:	05010413          	addi	s0,sp,80
    80003150:	00050493          	mv	s1,a0
    80003154:	00060993          	mv	s3,a2
    80003158:	00068b13          	mv	s6,a3
    8000315c:	00070b93          	mv	s7,a4
    80003160:	00078c13          	mv	s8,a5
    uint64 cause = RiscV::r_scause();
    80003164:	fffff097          	auipc	ra,0xfffff
    80003168:	ff8080e7          	jalr	-8(ra) # 8000215c <_ZN5RiscV8r_scauseEv>
    8000316c:	00050913          	mv	s2,a0
    uint64 sepc  = RiscV::r_sepc();
    80003170:	fffff097          	auipc	ra,0xfffff
    80003174:	e8c080e7          	jalr	-372(ra) # 80001ffc <_ZN5RiscV6r_sepcEv>
    80003178:	00050a13          	mv	s4,a0
    uint64 sstatus = RiscV::r_sstatus();
    8000317c:	fffff097          	auipc	ra,0xfffff
    80003180:	ea4080e7          	jalr	-348(ra) # 80002020 <_ZN5RiscV9r_sstatusEv>
    80003184:	00050a93          	mv	s5,a0

    if(cause == SYS_ECALL || cause == USER_ECALL){
    80003188:	ff890713          	addi	a4,s2,-8
    8000318c:	00100793          	li	a5,1
    80003190:	0ae7f063          	bgeu	a5,a4,80003230 <interrupt+0x110>
                //Console::Instance()->putc((char)a2);
                __putc((char)a2);
                break;
        }
    }
    else if(cause == CONSOLE_INTERRUPT){
    80003194:	fff00793          	li	a5,-1
    80003198:	03f79793          	slli	a5,a5,0x3f
    8000319c:	00978793          	addi	a5,a5,9
    800031a0:	1cf90863          	beq	s2,a5,80003370 <interrupt+0x250>
//        }
        console_handler();
   }


    else if(cause == TIMER_INTERRUPT){
    800031a4:	fff00793          	li	a5,-1
    800031a8:	03f79793          	slli	a5,a5,0x3f
    800031ac:	00178793          	addi	a5,a5,1
    800031b0:	1cf90663          	beq	s2,a5,8000337c <interrupt+0x25c>
            Thread::thread_dispatch_kernel();

        }

    }
    else if(cause == TIME_SLEEP){
    800031b4:	03100793          	li	a5,49
    800031b8:	36f91c63          	bne	s2,a5,80003530 <interrupt+0x410>
        time_t slice = (time_t)a2;
        if(slice != 0) {
    800031bc:	28098463          	beqz	s3,80003444 <interrupt+0x324>
            Thread::running->setSleeping(true);
    800031c0:	0000a797          	auipc	a5,0xa
    800031c4:	b107b783          	ld	a5,-1264(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800031c8:	0007bb83          	ld	s7,0(a5)
    static void kernelThreadWrapper();
    void clearTimeSliceCounter();
    uint64 getTimeSliceCounter();
    void incrementtimeSliceCounter();
    bool isSleeping() const { return sleeping; }
    void setSleeping(bool value) { sleeping = value; }
    800031cc:	00100793          	li	a5,1
    800031d0:	02fb8023          	sb	a5,32(s7)
    Elem *head, *tail;
    SleepingThreadList() : head(nullptr), tail(nullptr) {}

public:
    static SleepingThreadList* Instance(){
        static SleepingThreadList instance;
    800031d4:	0000a797          	auipc	a5,0xa
    800031d8:	0247c783          	lbu	a5,36(a5) # 8000d1f8 <_ZGVZN18SleepingThreadList8InstanceEvE8instance>
    800031dc:	02079063          	bnez	a5,800031fc <interrupt+0xdc>
    SleepingThreadList() : head(nullptr), tail(nullptr) {}
    800031e0:	0000a797          	auipc	a5,0xa
    800031e4:	02078793          	addi	a5,a5,32 # 8000d200 <_ZZN18SleepingThreadList8InstanceEvE8instance>
    800031e8:	0007b023          	sd	zero,0(a5)
    800031ec:	0007b423          	sd	zero,8(a5)
        static SleepingThreadList instance;
    800031f0:	00100793          	li	a5,1
    800031f4:	0000a717          	auipc	a4,0xa
    800031f8:	00f70223          	sb	a5,4(a4) # 8000d1f8 <_ZGVZN18SleepingThreadList8InstanceEvE8instance>
            delete elem;
        }
    }

    void put(Thread* thread, time_t slice){
        if (head == nullptr) {
    800031fc:	0000a917          	auipc	s2,0xa
    80003200:	00493903          	ld	s2,4(s2) # 8000d200 <_ZZN18SleepingThreadList8InstanceEvE8instance>
    80003204:	1e090263          	beqz	s2,800033e8 <interrupt+0x2c8>
            head = new Elem(thread, nullptr, slice);
            tail = head;
        }
        else {
            Elem* temp = head;
            Elem* prev = nullptr;
    80003208:	00000b13          	li	s6,0
            while (temp != tail && slice >= temp->relativeTime) {
    8000320c:	0000a717          	auipc	a4,0xa
    80003210:	ffc73703          	ld	a4,-4(a4) # 8000d208 <_ZZN18SleepingThreadList8InstanceEvE8instance+0x8>
    80003214:	21270063          	beq	a4,s2,80003414 <interrupt+0x2f4>
    80003218:	01093783          	ld	a5,16(s2)
    8000321c:	1ef9ec63          	bltu	s3,a5,80003414 <interrupt+0x2f4>
                slice -= temp->relativeTime;
    80003220:	40f989b3          	sub	s3,s3,a5
                prev = temp;
    80003224:	00090b13          	mv	s6,s2
                temp = temp->next;
    80003228:	00893903          	ld	s2,8(s2)
            while (temp != tail && slice >= temp->relativeTime) {
    8000322c:	fe1ff06f          	j	8000320c <interrupt+0xec>
        sepc += 4;
    80003230:	004a0a13          	addi	s4,s4,4
        switch(a0){
    80003234:	04200793          	li	a5,66
    80003238:	2097ea63          	bltu	a5,s1,8000344c <interrupt+0x32c>
    8000323c:	00249713          	slli	a4,s1,0x2
    80003240:	00007697          	auipc	a3,0x7
    80003244:	de068693          	addi	a3,a3,-544 # 8000a020 <CONSOLE_STATUS+0x10>
    80003248:	00d70733          	add	a4,a4,a3
    8000324c:	00072783          	lw	a5,0(a4)
    80003250:	00d787b3          	add	a5,a5,a3
    80003254:	00078067          	jr	a5
                a0 = (uint64)MemoryAllocator::Instance()->mem_alloc(a2);
    80003258:	00000097          	auipc	ra,0x0
    8000325c:	698080e7          	jalr	1688(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80003260:	00098593          	mv	a1,s3
    80003264:	00000097          	auipc	ra,0x0
    80003268:	404080e7          	jalr	1028(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
    8000326c:	00050493          	mv	s1,a0
                break;
    80003270:	1dc0006f          	j	8000344c <interrupt+0x32c>
                a0 = (uint64)MemoryAllocator::Instance()->mem_free((void*)a2);
    80003274:	00000097          	auipc	ra,0x0
    80003278:	67c080e7          	jalr	1660(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    8000327c:	00098593          	mv	a1,s3
    80003280:	00000097          	auipc	ra,0x0
    80003284:	720080e7          	jalr	1824(ra) # 800039a0 <_ZN15MemoryAllocator8mem_freeEPv>
    80003288:	00050493          	mv	s1,a0
                break;
    8000328c:	1c00006f          	j	8000344c <interrupt+0x32c>
                a0 = Thread::create_thread_kernel((thread_t*) a2, (void(*)(void*)) a3, (void*) a4, (void*) a5);
    80003290:	000c0693          	mv	a3,s8
    80003294:	000b8613          	mv	a2,s7
    80003298:	000b0593          	mv	a1,s6
    8000329c:	00098513          	mv	a0,s3
    800032a0:	fffff097          	auipc	ra,0xfffff
    800032a4:	514080e7          	jalr	1300(ra) # 800027b4 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
    800032a8:	00050493          	mv	s1,a0
                break;
    800032ac:	1a00006f          	j	8000344c <interrupt+0x32c>
                a0 = Thread::thread_exit_kernel();
    800032b0:	fffff097          	auipc	ra,0xfffff
    800032b4:	27c080e7          	jalr	636(ra) # 8000252c <_ZN6Thread18thread_exit_kernelEv>
    800032b8:	00050493          	mv	s1,a0
                break;
    800032bc:	1900006f          	j	8000344c <interrupt+0x32c>
                Thread::thread_dispatch_kernel();
    800032c0:	fffff097          	auipc	ra,0xfffff
    800032c4:	3c8080e7          	jalr	968(ra) # 80002688 <_ZN6Thread22thread_dispatch_kernelEv>
                break;
    800032c8:	1840006f          	j	8000344c <interrupt+0x32c>
                a0 = MemoryAllocator::Instance()->free_memory_remaining();
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	624080e7          	jalr	1572(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    800032d4:	00001097          	auipc	ra,0x1
    800032d8:	8e4080e7          	jalr	-1820(ra) # 80003bb8 <_ZN15MemoryAllocator21free_memory_remainingEv>
    800032dc:	00050493          	mv	s1,a0
                break;
    800032e0:	16c0006f          	j	8000344c <interrupt+0x32c>
                a0 = MemoryAllocator::Instance()->get_largest_mem_block();
    800032e4:	00000097          	auipc	ra,0x0
    800032e8:	60c080e7          	jalr	1548(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    800032ec:	00001097          	auipc	ra,0x1
    800032f0:	8f0080e7          	jalr	-1808(ra) # 80003bdc <_ZN15MemoryAllocator21get_largest_mem_blockEv>
    800032f4:	00050493          	mv	s1,a0
                break;
    800032f8:	1540006f          	j	8000344c <interrupt+0x32c>
                a0 = Semaphore::sem_open((sem_t*)a2, (unsigned)a3);
    800032fc:	000b059b          	sext.w	a1,s6
    80003300:	00098513          	mv	a0,s3
    80003304:	fffff097          	auipc	ra,0xfffff
    80003308:	88c080e7          	jalr	-1908(ra) # 80001b90 <_ZN9Semaphore8sem_openEPjj>
    8000330c:	00050493          	mv	s1,a0
                break;
    80003310:	13c0006f          	j	8000344c <interrupt+0x32c>
                a0 = Semaphore::sem_wait((sem_t)a2);
    80003314:	0009851b          	sext.w	a0,s3
    80003318:	fffff097          	auipc	ra,0xfffff
    8000331c:	9bc080e7          	jalr	-1604(ra) # 80001cd4 <_ZN9Semaphore8sem_waitEj>
    80003320:	00050493          	mv	s1,a0
                break;
    80003324:	1280006f          	j	8000344c <interrupt+0x32c>
                a0 = Semaphore::sem_signal((sem_t)a2);
    80003328:	0009851b          	sext.w	a0,s3
    8000332c:	fffff097          	auipc	ra,0xfffff
    80003330:	b50080e7          	jalr	-1200(ra) # 80001e7c <_ZN9Semaphore10sem_signalEj>
    80003334:	00050493          	mv	s1,a0
                break;
    80003338:	1140006f          	j	8000344c <interrupt+0x32c>
                a0 = Semaphore::sem_close((sem_t)a2);
    8000333c:	0009851b          	sext.w	a0,s3
    80003340:	fffff097          	auipc	ra,0xfffff
    80003344:	8e0080e7          	jalr	-1824(ra) # 80001c20 <_ZN9Semaphore9sem_closeEj>
    80003348:	00050493          	mv	s1,a0
                break;
    8000334c:	1000006f          	j	8000344c <interrupt+0x32c>
                a0 = __getc();
    80003350:	00006097          	auipc	ra,0x6
    80003354:	d48080e7          	jalr	-696(ra) # 80009098 <__getc>
    80003358:	00050493          	mv	s1,a0
                break;
    8000335c:	0f00006f          	j	8000344c <interrupt+0x32c>
                __putc((char)a2);
    80003360:	0ff9f513          	andi	a0,s3,255
    80003364:	00006097          	auipc	ra,0x6
    80003368:	cf8080e7          	jalr	-776(ra) # 8000905c <__putc>
                break;
    8000336c:	0e00006f          	j	8000344c <interrupt+0x32c>
        console_handler();
    80003370:	00006097          	auipc	ra,0x6
    80003374:	d60080e7          	jalr	-672(ra) # 800090d0 <console_handler>
    80003378:	0d40006f          	j	8000344c <interrupt+0x32c>
        RiscV::mc_sip(RiscV::SIP_SSIP);
    8000337c:	00200513          	li	a0,2
    80003380:	fffff097          	auipc	ra,0xfffff
    80003384:	c0c080e7          	jalr	-1012(ra) # 80001f8c <_ZN5RiscV6mc_sipEm>
        Thread::running->incrementtimeSliceCounter();
    80003388:	0000a917          	auipc	s2,0xa
    8000338c:	94893903          	ld	s2,-1720(s2) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003390:	00093503          	ld	a0,0(s2)
    80003394:	fffff097          	auipc	ra,0xfffff
    80003398:	f44080e7          	jalr	-188(ra) # 800022d8 <_ZN6Thread25incrementtimeSliceCounterEv>
        if(Thread::running && Thread::running->getTimeSliceCounter() >= Thread::running->getTimeSlice()){
    8000339c:	00093503          	ld	a0,0(s2)
    800033a0:	0a050663          	beqz	a0,8000344c <interrupt+0x32c>
    800033a4:	fffff097          	auipc	ra,0xfffff
    800033a8:	f18080e7          	jalr	-232(ra) # 800022bc <_ZN6Thread19getTimeSliceCounterEv>
    800033ac:	00050913          	mv	s2,a0
    800033b0:	0000a797          	auipc	a5,0xa
    800033b4:	9207b783          	ld	a5,-1760(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800033b8:	0007b503          	ld	a0,0(a5)
    800033bc:	fffff097          	auipc	ra,0xfffff
    800033c0:	f40080e7          	jalr	-192(ra) # 800022fc <_ZN6Thread12getTimeSliceEv>
    800033c4:	08a96463          	bltu	s2,a0,8000344c <interrupt+0x32c>
            Thread::running->clearTimeSliceCounter();
    800033c8:	0000a797          	auipc	a5,0xa
    800033cc:	9087b783          	ld	a5,-1784(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800033d0:	0007b503          	ld	a0,0(a5)
    800033d4:	fffff097          	auipc	ra,0xfffff
    800033d8:	ecc080e7          	jalr	-308(ra) # 800022a0 <_ZN6Thread21clearTimeSliceCounterEv>
            Thread::thread_dispatch_kernel();
    800033dc:	fffff097          	auipc	ra,0xfffff
    800033e0:	2ac080e7          	jalr	684(ra) # 80002688 <_ZN6Thread22thread_dispatch_kernelEv>
    800033e4:	0680006f          	j	8000344c <interrupt+0x32c>
            head = new Elem(thread, nullptr, slice);
    800033e8:	01800513          	li	a0,24
    800033ec:	00000097          	auipc	ra,0x0
    800033f0:	14c080e7          	jalr	332(ra) # 80003538 <_Znwm>
        Elem(Thread *data, Elem *next, time_t relativeTime) : data(data), next(next), relativeTime(relativeTime) {}
    800033f4:	01753023          	sd	s7,0(a0)
    800033f8:	00053423          	sd	zero,8(a0)
    800033fc:	01353823          	sd	s3,16(a0)
            head = new Elem(thread, nullptr, slice);
    80003400:	0000a797          	auipc	a5,0xa
    80003404:	e0078793          	addi	a5,a5,-512 # 8000d200 <_ZZN18SleepingThreadList8InstanceEvE8instance>
    80003408:	00a7b023          	sd	a0,0(a5)
            tail = head;
    8000340c:	00a7b423          	sd	a0,8(a5)
    80003410:	0340006f          	j	80003444 <interrupt+0x324>
            }
            if (temp == tail){
    80003414:	09270263          	beq	a4,s2,80003498 <interrupt+0x378>
                    }
                    tail->relativeTime -= slice;
                }
            }
            else {
                Elem* novi = new Elem(thread, temp, slice);
    80003418:	01800513          	li	a0,24
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	11c080e7          	jalr	284(ra) # 80003538 <_Znwm>
        Elem(Thread *data, Elem *next, time_t relativeTime) : data(data), next(next), relativeTime(relativeTime) {}
    80003424:	01753023          	sd	s7,0(a0)
    80003428:	01253423          	sd	s2,8(a0)
    8000342c:	01353823          	sd	s3,16(a0)
                if (prev) {
    80003430:	0e0b0a63          	beqz	s6,80003524 <interrupt+0x404>
                    prev->next = novi;
    80003434:	00ab3423          	sd	a0,8(s6)
                }
                else {
                    head = novi;
                }
                temp->relativeTime -= slice;
    80003438:	01093783          	ld	a5,16(s2)
    8000343c:	413789b3          	sub	s3,a5,s3
    80003440:	01393823          	sd	s3,16(s2)
            SleepingThreadList::Instance()->put(Thread::running, slice);
        }

        Thread::thread_dispatch_kernel();
    80003444:	fffff097          	auipc	ra,0xfffff
    80003448:	244080e7          	jalr	580(ra) # 80002688 <_ZN6Thread22thread_dispatch_kernelEv>
    else
    {
        return a0;
    }

    RiscV::w_sepc(sepc);
    8000344c:	000a0513          	mv	a0,s4
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	c80080e7          	jalr	-896(ra) # 800020d0 <_ZN5RiscV6w_sepcEm>
    RiscV::w_sstatus(sstatus);
    80003458:	000a8513          	mv	a0,s5
    8000345c:	fffff097          	auipc	ra,0xfffff
    80003460:	c20080e7          	jalr	-992(ra) # 8000207c <_ZN5RiscV9w_sstatusEm>
    return a0;
    80003464:	00048513          	mv	a0,s1

}
    80003468:	04813083          	ld	ra,72(sp)
    8000346c:	04013403          	ld	s0,64(sp)
    80003470:	03813483          	ld	s1,56(sp)
    80003474:	03013903          	ld	s2,48(sp)
    80003478:	02813983          	ld	s3,40(sp)
    8000347c:	02013a03          	ld	s4,32(sp)
    80003480:	01813a83          	ld	s5,24(sp)
    80003484:	01013b03          	ld	s6,16(sp)
    80003488:	00813b83          	ld	s7,8(sp)
    8000348c:	00013c03          	ld	s8,0(sp)
    80003490:	05010113          	addi	sp,sp,80
    80003494:	00008067          	ret
                if (slice >= tail->relativeTime){
    80003498:	01073783          	ld	a5,16(a4)
    8000349c:	02f9ee63          	bltu	s3,a5,800034d8 <interrupt+0x3b8>
                    Elem* novi = new Elem(thread, nullptr, slice - tail->relativeTime);
    800034a0:	01800513          	li	a0,24
    800034a4:	00000097          	auipc	ra,0x0
    800034a8:	094080e7          	jalr	148(ra) # 80003538 <_Znwm>
    800034ac:	0000a717          	auipc	a4,0xa
    800034b0:	d5470713          	addi	a4,a4,-684 # 8000d200 <_ZZN18SleepingThreadList8InstanceEvE8instance>
    800034b4:	00873683          	ld	a3,8(a4)
    800034b8:	0106b783          	ld	a5,16(a3)
    800034bc:	40f989b3          	sub	s3,s3,a5
        Elem(Thread *data, Elem *next, time_t relativeTime) : data(data), next(next), relativeTime(relativeTime) {}
    800034c0:	01753023          	sd	s7,0(a0)
    800034c4:	00053423          	sd	zero,8(a0)
    800034c8:	01353823          	sd	s3,16(a0)
                    tail->next = novi;
    800034cc:	00a6b423          	sd	a0,8(a3)
                    tail = novi;
    800034d0:	00a73423          	sd	a0,8(a4)
    800034d4:	f71ff06f          	j	80003444 <interrupt+0x324>
                    Elem* novi = new Elem(thread, tail, slice);
    800034d8:	01800513          	li	a0,24
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	05c080e7          	jalr	92(ra) # 80003538 <_Znwm>
        Elem(Thread *data, Elem *next, time_t relativeTime) : data(data), next(next), relativeTime(relativeTime) {}
    800034e4:	01753023          	sd	s7,0(a0)
    800034e8:	0000a797          	auipc	a5,0xa
    800034ec:	d207b783          	ld	a5,-736(a5) # 8000d208 <_ZZN18SleepingThreadList8InstanceEvE8instance+0x8>
    800034f0:	00f53423          	sd	a5,8(a0)
    800034f4:	01353823          	sd	s3,16(a0)
                    if (prev != nullptr){
    800034f8:	020b0063          	beqz	s6,80003518 <interrupt+0x3f8>
                        prev->next = novi;
    800034fc:	00ab3423          	sd	a0,8(s6)
                    tail->relativeTime -= slice;
    80003500:	0000a717          	auipc	a4,0xa
    80003504:	d0873703          	ld	a4,-760(a4) # 8000d208 <_ZZN18SleepingThreadList8InstanceEvE8instance+0x8>
    80003508:	01073783          	ld	a5,16(a4)
    8000350c:	413789b3          	sub	s3,a5,s3
    80003510:	01373823          	sd	s3,16(a4)
    80003514:	f31ff06f          	j	80003444 <interrupt+0x324>
                        head = novi;
    80003518:	0000a797          	auipc	a5,0xa
    8000351c:	cea7b423          	sd	a0,-792(a5) # 8000d200 <_ZZN18SleepingThreadList8InstanceEvE8instance>
    80003520:	fe1ff06f          	j	80003500 <interrupt+0x3e0>
                    head = novi;
    80003524:	0000a797          	auipc	a5,0xa
    80003528:	cca7be23          	sd	a0,-804(a5) # 8000d200 <_ZZN18SleepingThreadList8InstanceEvE8instance>
    8000352c:	f0dff06f          	j	80003438 <interrupt+0x318>
        return a0;
    80003530:	00048513          	mv	a0,s1
    80003534:	f35ff06f          	j	80003468 <interrupt+0x348>

0000000080003538 <_Znwm>:
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"


void* operator new(size_t size) {
    80003538:	ff010113          	addi	sp,sp,-16
    8000353c:	00113423          	sd	ra,8(sp)
    80003540:	00813023          	sd	s0,0(sp)
    80003544:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003548:	ffffe097          	auipc	ra,0xffffe
    8000354c:	fe0080e7          	jalr	-32(ra) # 80001528 <mem_alloc>
}
    80003550:	00813083          	ld	ra,8(sp)
    80003554:	00013403          	ld	s0,0(sp)
    80003558:	01010113          	addi	sp,sp,16
    8000355c:	00008067          	ret

0000000080003560 <_Znam>:

void* operator new[](size_t size) {
    80003560:	ff010113          	addi	sp,sp,-16
    80003564:	00113423          	sd	ra,8(sp)
    80003568:	00813023          	sd	s0,0(sp)
    8000356c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	fb8080e7          	jalr	-72(ra) # 80001528 <mem_alloc>
}
    80003578:	00813083          	ld	ra,8(sp)
    8000357c:	00013403          	ld	s0,0(sp)
    80003580:	01010113          	addi	sp,sp,16
    80003584:	00008067          	ret

0000000080003588 <_ZdlPv>:

void operator delete(void* ptr) noexcept {
    80003588:	ff010113          	addi	sp,sp,-16
    8000358c:	00113423          	sd	ra,8(sp)
    80003590:	00813023          	sd	s0,0(sp)
    80003594:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80003598:	ffffe097          	auipc	ra,0xffffe
    8000359c:	fd8080e7          	jalr	-40(ra) # 80001570 <mem_free>
}
    800035a0:	00813083          	ld	ra,8(sp)
    800035a4:	00013403          	ld	s0,0(sp)
    800035a8:	01010113          	addi	sp,sp,16
    800035ac:	00008067          	ret

00000000800035b0 <_ZdaPv>:

void operator delete[](void* ptr) noexcept {
    800035b0:	ff010113          	addi	sp,sp,-16
    800035b4:	00113423          	sd	ra,8(sp)
    800035b8:	00813023          	sd	s0,0(sp)
    800035bc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800035c0:	ffffe097          	auipc	ra,0xffffe
    800035c4:	fb0080e7          	jalr	-80(ra) # 80001570 <mem_free>
    800035c8:	00813083          	ld	ra,8(sp)
    800035cc:	00013403          	ld	s0,0(sp)
    800035d0:	01010113          	addi	sp,sp,16
    800035d4:	00008067          	ret

00000000800035d8 <_Z23getWaitStatusForRunningv>:
#include "../h/syscall_c.hpp"
#include "../lib/hw.h"
#include "../h/Thread.hpp"

// Povratak statusa čekanja za tekuću nit
int getWaitStatusForRunning() {
    800035d8:	ff010113          	addi	sp,sp,-16
    800035dc:	00813423          	sd	s0,8(sp)
    800035e0:	01010413          	addi	s0,sp,16
    return Thread::running->semWaitStatus;
    800035e4:	00009797          	auipc	a5,0x9
    800035e8:	6ec7b783          	ld	a5,1772(a5) # 8000ccd0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800035ec:	0007b783          	ld	a5,0(a5)
}
    800035f0:	0087a503          	lw	a0,8(a5)
    800035f4:	00813403          	ld	s0,8(sp)
    800035f8:	01010113          	addi	sp,sp,16
    800035fc:	00008067          	ret

0000000080003600 <_ZN15MemoryAllocator5alignEm>:
    static MemoryAllocator instance;
    return &instance;
}

// Poravnanje adrese
uint64 MemoryAllocator::align(uint64 addr) {
    80003600:	ff010113          	addi	sp,sp,-16
    80003604:	00813423          	sd	s0,8(sp)
    80003608:	01010413          	addi	s0,sp,16
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    8000360c:	03f5f793          	andi	a5,a1,63
    80003610:	00078c63          	beqz	a5,80003628 <_ZN15MemoryAllocator5alignEm+0x28>
    return addr + (MEM_BLOCK_SIZE - addr % MEM_BLOCK_SIZE);
    80003614:	fc05f593          	andi	a1,a1,-64
    80003618:	04058513          	addi	a0,a1,64
}
    8000361c:	00813403          	ld	s0,8(sp)
    80003620:	01010113          	addi	sp,sp,16
    80003624:	00008067          	ret
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    80003628:	00058513          	mv	a0,a1
    8000362c:	ff1ff06f          	j	8000361c <_ZN15MemoryAllocator5alignEm+0x1c>

0000000080003630 <_ZN15MemoryAllocator13getThreadPoolEv>:
    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
}

ThreadPool& MemoryAllocator::getThreadPool() {
    80003630:	ff010113          	addi	sp,sp,-16
    80003634:	00813423          	sd	s0,8(sp)
    80003638:	01010413          	addi	s0,sp,16
    return threadPool;
}
    8000363c:	00850513          	addi	a0,a0,8
    80003640:	00813403          	ld	s0,8(sp)
    80003644:	01010113          	addi	sp,sp,16
    80003648:	00008067          	ret

000000008000364c <_ZN15MemoryAllocator16getSemaphorePoolEv>:

SemaphorePool& MemoryAllocator::getSemaphorePool() {
    8000364c:	ff010113          	addi	sp,sp,-16
    80003650:	00813423          	sd	s0,8(sp)
    80003654:	01010413          	addi	s0,sp,16
    return semaphorePool;
}
    80003658:	01850513          	addi	a0,a0,24
    8000365c:	00813403          	ld	s0,8(sp)
    80003660:	01010113          	addi	sp,sp,16
    80003664:	00008067          	ret

0000000080003668 <_ZN15MemoryAllocator9mem_allocEm>:



void* MemoryAllocator::mem_alloc(uint64 numOfBlocks) {
    80003668:	ff010113          	addi	sp,sp,-16
    8000366c:	00813423          	sd	s0,8(sp)
    80003670:	01010413          	addi	s0,sp,16
    80003674:	00050713          	mv	a4,a0
    FreeMem* temp = fmem_head;
    80003678:	00053503          	ld	a0,0(a0)

    while(temp)
    8000367c:	04050863          	beqz	a0,800036cc <_ZN15MemoryAllocator9mem_allocEm+0x64>
    {
        if(temp->size >= numOfBlocks)
    80003680:	01053783          	ld	a5,16(a0)
    80003684:	00b7f663          	bgeu	a5,a1,80003690 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            header->numOfBlocks = numOfBlocks;

            return addr;
        }

        temp = temp->next;
    80003688:	00053503          	ld	a0,0(a0)
    while(temp)
    8000368c:	ff1ff06f          	j	8000367c <_ZN15MemoryAllocator9mem_allocEm+0x14>
            if(temp->size == numOfBlocks){
    80003690:	04b78463          	beq	a5,a1,800036d8 <_ZN15MemoryAllocator9mem_allocEm+0x70>
                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);
    80003694:	00659693          	slli	a3,a1,0x6
    80003698:	00d506b3          	add	a3,a0,a3
                newnode->size = temp->size - numOfBlocks;
    8000369c:	40b787b3          	sub	a5,a5,a1
    800036a0:	00f6b823          	sd	a5,16(a3)
                newnode->next = temp->next;
    800036a4:	00053783          	ld	a5,0(a0)
    800036a8:	00f6b023          	sd	a5,0(a3)
                newnode->prev = temp->prev;
    800036ac:	00853783          	ld	a5,8(a0)
    800036b0:	00f6b423          	sd	a5,8(a3)
                if(newnode->prev)
    800036b4:	04078a63          	beqz	a5,80003708 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                    newnode->prev->next = newnode;
    800036b8:	00d7b023          	sd	a3,0(a5)
                if(newnode->next)
    800036bc:	0006b783          	ld	a5,0(a3)
    800036c0:	00078463          	beqz	a5,800036c8 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    newnode->next->prev = newnode;
    800036c4:	00d7b423          	sd	a3,8(a5)
            header->numOfBlocks = numOfBlocks;
    800036c8:	00b53023          	sd	a1,0(a0)
    }

    return nullptr;
}
    800036cc:	00813403          	ld	s0,8(sp)
    800036d0:	01010113          	addi	sp,sp,16
    800036d4:	00008067          	ret
                if(temp->prev)
    800036d8:	00853783          	ld	a5,8(a0)
    800036dc:	02078063          	beqz	a5,800036fc <_ZN15MemoryAllocator9mem_allocEm+0x94>
                    temp->prev->next = temp->next;
    800036e0:	00053703          	ld	a4,0(a0)
    800036e4:	00e7b023          	sd	a4,0(a5)
                if(temp->next)
    800036e8:	00053783          	ld	a5,0(a0)
    800036ec:	fc078ee3          	beqz	a5,800036c8 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    temp->next->prev = temp->prev;
    800036f0:	00853703          	ld	a4,8(a0)
    800036f4:	00e7b423          	sd	a4,8(a5)
    800036f8:	fd1ff06f          	j	800036c8 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    fmem_head = temp->next;
    800036fc:	00053783          	ld	a5,0(a0)
    80003700:	00f73023          	sd	a5,0(a4)
    80003704:	fe5ff06f          	j	800036e8 <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    fmem_head = newnode;
    80003708:	00d73023          	sd	a3,0(a4)
    8000370c:	fb1ff06f          	j	800036bc <_ZN15MemoryAllocator9mem_allocEm+0x54>

0000000080003710 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>:
void* MemoryAllocator::mem_alloc_for_managers(size_t N, size_t sizeOfElem){
    80003710:	ff010113          	addi	sp,sp,-16
    80003714:	00813423          	sd	s0,8(sp)
    80003718:	01010413          	addi	s0,sp,16
    8000371c:	00050693          	mv	a3,a0
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80003720:	02c58633          	mul	a2,a1,a2
    80003724:	03f60613          	addi	a2,a2,63
    80003728:	00665713          	srli	a4,a2,0x6
    FreeMem* temp = fmem_head;
    8000372c:	00053503          	ld	a0,0(a0)

    while(temp)
    80003730:	04050663          	beqz	a0,8000377c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
    {
        if(temp->size >= numOfBlocks)
    80003734:	01053783          	ld	a5,16(a0)
    80003738:	00e7f663          	bgeu	a5,a4,80003744 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x34>


            return addr;
        }

        temp = temp->next;
    8000373c:	00053503          	ld	a0,0(a0)
    while(temp)
    80003740:	ff1ff06f          	j	80003730 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x20>
            if(temp->size == numOfBlocks){
    80003744:	04e78263          	beq	a5,a4,80003788 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x78>
                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);
    80003748:	fc067613          	andi	a2,a2,-64
    8000374c:	00c50633          	add	a2,a0,a2
                newnode->size = temp->size - numOfBlocks;
    80003750:	40e787b3          	sub	a5,a5,a4
    80003754:	00f63823          	sd	a5,16(a2)
                newnode->next = temp->next;
    80003758:	00053783          	ld	a5,0(a0)
    8000375c:	00f63023          	sd	a5,0(a2)
                newnode->prev = temp->prev;
    80003760:	00853783          	ld	a5,8(a0)
    80003764:	00f63423          	sd	a5,8(a2)
                if(newnode->prev)
    80003768:	04078863          	beqz	a5,800037b8 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0xa8>
                    newnode->prev->next = newnode;
    8000376c:	00c7b023          	sd	a2,0(a5)
                if(newnode->next)
    80003770:	00063783          	ld	a5,0(a2)
    80003774:	00078463          	beqz	a5,8000377c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    newnode->next->prev = newnode;
    80003778:	00c7b423          	sd	a2,8(a5)
    }

    return nullptr;
}
    8000377c:	00813403          	ld	s0,8(sp)
    80003780:	01010113          	addi	sp,sp,16
    80003784:	00008067          	ret
                if(temp->prev)
    80003788:	00853783          	ld	a5,8(a0)
    8000378c:	02078063          	beqz	a5,800037ac <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x9c>
                    temp->prev->next = temp->next;
    80003790:	00053703          	ld	a4,0(a0)
    80003794:	00e7b023          	sd	a4,0(a5)
                if(temp->next)
    80003798:	00053783          	ld	a5,0(a0)
    8000379c:	fe0780e3          	beqz	a5,8000377c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    temp->next->prev = temp->prev;
    800037a0:	00853703          	ld	a4,8(a0)
    800037a4:	00e7b423          	sd	a4,8(a5)
    800037a8:	fd5ff06f          	j	8000377c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    fmem_head = temp->next;
    800037ac:	00053783          	ld	a5,0(a0)
    800037b0:	00f6b023          	sd	a5,0(a3)
    800037b4:	fe5ff06f          	j	80003798 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x88>
                    fmem_head = newnode;
    800037b8:	00c6b023          	sd	a2,0(a3)
    800037bc:	fb5ff06f          	j	80003770 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x60>

00000000800037c0 <_ZN15MemoryAllocatorC1Ev>:
MemoryAllocator::MemoryAllocator() {
    800037c0:	fd010113          	addi	sp,sp,-48
    800037c4:	02113423          	sd	ra,40(sp)
    800037c8:	02813023          	sd	s0,32(sp)
    800037cc:	00913c23          	sd	s1,24(sp)
    800037d0:	01213823          	sd	s2,16(sp)
    800037d4:	01313423          	sd	s3,8(sp)
    800037d8:	01413023          	sd	s4,0(sp)
    800037dc:	03010413          	addi	s0,sp,48
    800037e0:	00050493          	mv	s1,a0
    800037e4:	00850a13          	addi	s4,a0,8
    800037e8:	000a0513          	mv	a0,s4
    800037ec:	ffffe097          	auipc	ra,0xffffe
    800037f0:	0d0080e7          	jalr	208(ra) # 800018bc <_ZN10ThreadPoolC1Ev>
    800037f4:	01848993          	addi	s3,s1,24
    800037f8:	00098513          	mv	a0,s3
    800037fc:	00000097          	auipc	ra,0x0
    80003800:	65c080e7          	jalr	1628(ra) # 80003e58 <_ZN13SemaphorePoolC1Ev>
    fmem_head = (FreeMem*)(align((uint64)HEAP_START_ADDR) + (uint64)DEFAULT_STACK_SIZE);
    80003804:	00009797          	auipc	a5,0x9
    80003808:	4b47b783          	ld	a5,1204(a5) # 8000ccb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000380c:	0007b583          	ld	a1,0(a5)
    80003810:	00048513          	mv	a0,s1
    80003814:	00000097          	auipc	ra,0x0
    80003818:	dec080e7          	jalr	-532(ra) # 80003600 <_ZN15MemoryAllocator5alignEm>
    8000381c:	000017b7          	lui	a5,0x1
    80003820:	00f50533          	add	a0,a0,a5
    80003824:	00a4b023          	sd	a0,0(s1)
    fmem_head->next = nullptr;
    80003828:	00053023          	sd	zero,0(a0)
    fmem_head->prev = nullptr;
    8000382c:	0004b783          	ld	a5,0(s1)
    80003830:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
                          (((uint64)HEAP_END_ADDR - (uint64)fmem_head) % MEM_BLOCK_SIZE)) / MEM_BLOCK_SIZE;
    80003834:	0004b703          	ld	a4,0(s1)
    80003838:	00009797          	auipc	a5,0x9
    8000383c:	4a87b783          	ld	a5,1192(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003840:	0007b783          	ld	a5,0(a5)
    80003844:	40e787b3          	sub	a5,a5,a4
    uint64 totalBlocks = (((uint64)HEAP_END_ADDR - (uint64)fmem_head) -
    80003848:	0067d793          	srli	a5,a5,0x6
    fmem_head->size = totalBlocks;
    8000384c:	00f73823          	sd	a5,16(a4)
    void* threadManagerPoolAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(Thread));
    80003850:	0a800613          	li	a2,168
    80003854:	00a00593          	li	a1,10
    80003858:	00048513          	mv	a0,s1
    8000385c:	00000097          	auipc	ra,0x0
    80003860:	eb4080e7          	jalr	-332(ra) # 80003710 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    80003864:	00050913          	mv	s2,a0
    void* threadManagerUsedArrayAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(bool));
    80003868:	00100613          	li	a2,1
    8000386c:	00a00593          	li	a1,10
    80003870:	00048513          	mv	a0,s1
    80003874:	00000097          	auipc	ra,0x0
    80003878:	e9c080e7          	jalr	-356(ra) # 80003710 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    8000387c:	00050613          	mv	a2,a0
    threadPool.init(threadManagerPoolAddress, threadManagerUsedArrayAddress);
    80003880:	00090593          	mv	a1,s2
    80003884:	000a0513          	mv	a0,s4
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	054080e7          	jalr	84(ra) # 800018dc <_ZN10ThreadPool4initEPvS0_>
    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    80003890:	02000613          	li	a2,32
    80003894:	00a00593          	li	a1,10
    80003898:	00048513          	mv	a0,s1
    8000389c:	00000097          	auipc	ra,0x0
    800038a0:	e74080e7          	jalr	-396(ra) # 80003710 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    800038a4:	00050913          	mv	s2,a0
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    800038a8:	00100613          	li	a2,1
    800038ac:	00a00593          	li	a1,10
    800038b0:	00048513          	mv	a0,s1
    800038b4:	00000097          	auipc	ra,0x0
    800038b8:	e5c080e7          	jalr	-420(ra) # 80003710 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    800038bc:	00050613          	mv	a2,a0
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
    800038c0:	00090593          	mv	a1,s2
    800038c4:	00098513          	mv	a0,s3
    800038c8:	00000097          	auipc	ra,0x0
    800038cc:	5b0080e7          	jalr	1456(ra) # 80003e78 <_ZN13SemaphorePool4initEPvS0_>
}
    800038d0:	02813083          	ld	ra,40(sp)
    800038d4:	02013403          	ld	s0,32(sp)
    800038d8:	01813483          	ld	s1,24(sp)
    800038dc:	01013903          	ld	s2,16(sp)
    800038e0:	00813983          	ld	s3,8(sp)
    800038e4:	00013a03          	ld	s4,0(sp)
    800038e8:	03010113          	addi	sp,sp,48
    800038ec:	00008067          	ret

00000000800038f0 <_ZN15MemoryAllocator8InstanceEv>:
    static MemoryAllocator instance;
    800038f0:	0000a797          	auipc	a5,0xa
    800038f4:	9207c783          	lbu	a5,-1760(a5) # 8000d210 <_ZGVZN15MemoryAllocator8InstanceEvE8instance>
    800038f8:	00078863          	beqz	a5,80003908 <_ZN15MemoryAllocator8InstanceEv+0x18>
}
    800038fc:	0000a517          	auipc	a0,0xa
    80003900:	91c50513          	addi	a0,a0,-1764 # 8000d218 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80003904:	00008067          	ret
MemoryAllocator* MemoryAllocator::Instance() {
    80003908:	ff010113          	addi	sp,sp,-16
    8000390c:	00113423          	sd	ra,8(sp)
    80003910:	00813023          	sd	s0,0(sp)
    80003914:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80003918:	0000a517          	auipc	a0,0xa
    8000391c:	90050513          	addi	a0,a0,-1792 # 8000d218 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80003920:	00000097          	auipc	ra,0x0
    80003924:	ea0080e7          	jalr	-352(ra) # 800037c0 <_ZN15MemoryAllocatorC1Ev>
    80003928:	00100793          	li	a5,1
    8000392c:	0000a717          	auipc	a4,0xa
    80003930:	8ef70223          	sb	a5,-1820(a4) # 8000d210 <_ZGVZN15MemoryAllocator8InstanceEvE8instance>
}
    80003934:	0000a517          	auipc	a0,0xa
    80003938:	8e450513          	addi	a0,a0,-1820 # 8000d218 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    8000393c:	00813083          	ld	ra,8(sp)
    80003940:	00013403          	ld	s0,0(sp)
    80003944:	01010113          	addi	sp,sp,16
    80003948:	00008067          	ret

000000008000394c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>:

void MemoryAllocator::tryToJoin(FreeMem *node) {
    8000394c:	ff010113          	addi	sp,sp,-16
    80003950:	00813423          	sd	s0,8(sp)
    80003954:	01010413          	addi	s0,sp,16
    if(!node) return;
    80003958:	00058e63          	beqz	a1,80003974 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    FreeMem* nextnode = node->next;
    8000395c:	0005b783          	ld	a5,0(a1)
    if(nextnode && (char*)nextnode == ((char*)node + node->size * MEM_BLOCK_SIZE)){
    80003960:	00078a63          	beqz	a5,80003974 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    80003964:	0105b683          	ld	a3,16(a1)
    80003968:	00669713          	slli	a4,a3,0x6
    8000396c:	00e58733          	add	a4,a1,a4
    80003970:	00f70863          	beq	a4,a5,80003980 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x34>
        node->size += nextnode->size;
        node->next = nextnode->next;
        if(node->next)node->next->prev = node;
    }
}
    80003974:	00813403          	ld	s0,8(sp)
    80003978:	01010113          	addi	sp,sp,16
    8000397c:	00008067          	ret
        node->size += nextnode->size;
    80003980:	0107b703          	ld	a4,16(a5)
    80003984:	00e686b3          	add	a3,a3,a4
    80003988:	00d5b823          	sd	a3,16(a1)
        node->next = nextnode->next;
    8000398c:	0007b783          	ld	a5,0(a5)
    80003990:	00f5b023          	sd	a5,0(a1)
        if(node->next)node->next->prev = node;
    80003994:	fe0780e3          	beqz	a5,80003974 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    80003998:	00b7b423          	sd	a1,8(a5)
    8000399c:	fd9ff06f          	j	80003974 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>

00000000800039a0 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {
    if(!ptr) return -1;
    800039a0:	0e058263          	beqz	a1,80003a84 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
int MemoryAllocator::mem_free(void *ptr) {
    800039a4:	fe010113          	addi	sp,sp,-32
    800039a8:	00113c23          	sd	ra,24(sp)
    800039ac:	00813823          	sd	s0,16(sp)
    800039b0:	00913423          	sd	s1,8(sp)
    800039b4:	01213023          	sd	s2,0(sp)
    800039b8:	02010413          	addi	s0,sp,32
    800039bc:	00050913          	mv	s2,a0

    Header* header = (Header*)ptr;

    //outside of the heap error
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    800039c0:	00009797          	auipc	a5,0x9
    800039c4:	2f87b783          	ld	a5,760(a5) # 8000ccb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    800039c8:	0007b783          	ld	a5,0(a5)
    800039cc:	0cf5e063          	bltu	a1,a5,80003a8c <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    800039d0:	00009797          	auipc	a5,0x9
    800039d4:	3107b783          	ld	a5,784(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800039d8:	0007b783          	ld	a5,0(a5)
    800039dc:	0ab7ec63          	bltu	a5,a1,80003a94 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    //not aligned to a block error
    //if(((char*)header - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;

    FreeMem* newnode = (FreeMem*)header;
    newnode->size = header->numOfBlocks;
    800039e0:	0005b783          	ld	a5,0(a1)
    800039e4:	00f5b823          	sd	a5,16(a1)
    newnode->prev = nullptr;
    800039e8:	0005b423          	sd	zero,8(a1)
    newnode->next = nullptr;
    800039ec:	0005b023          	sd	zero,0(a1)
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    800039f0:	00053703          	ld	a4,0(a0)
    800039f4:	02070463          	beqz	a4,80003a1c <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    800039f8:	02e5e663          	bltu	a1,a4,80003a24 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
    800039fc:	00070793          	mv	a5,a4
        while(temp->next && (char*)temp->next < (char*)newnode)
    80003a00:	00078493          	mv	s1,a5
    80003a04:	0007b783          	ld	a5,0(a5)
    80003a08:	00078463          	beqz	a5,80003a10 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    80003a0c:	feb7eae3          	bltu	a5,a1,80003a00 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        {
            temp = temp->next;
        }
    }
    if(temp)
    80003a10:	00048c63          	beqz	s1,80003a28 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    {
        newnode->next = temp->next;
    80003a14:	00f5b023          	sd	a5,0(a1)
    80003a18:	0140006f          	j	80003a2c <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
        temp = 0;
    80003a1c:	00070493          	mv	s1,a4
    80003a20:	0080006f          	j	80003a28 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    80003a24:	00000493          	li	s1,0
    }
    else {
        newnode->next = fmem_head;
    80003a28:	00e5b023          	sd	a4,0(a1)
    }
    if(newnode->next)
    80003a2c:	0005b783          	ld	a5,0(a1)
    80003a30:	00078463          	beqz	a5,80003a38 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    {
        newnode->next->prev = newnode;
    80003a34:	00b7b423          	sd	a1,8(a5)
    }
    if(temp){
    80003a38:	04048263          	beqz	s1,80003a7c <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        temp->next = newnode;
    80003a3c:	00b4b023          	sd	a1,0(s1)
        newnode->prev = temp;
    80003a40:	0095b423          	sd	s1,8(a1)
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    80003a44:	00090513          	mv	a0,s2
    80003a48:	00000097          	auipc	ra,0x0
    80003a4c:	f04080e7          	jalr	-252(ra) # 8000394c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(temp);
    80003a50:	00048593          	mv	a1,s1
    80003a54:	00090513          	mv	a0,s2
    80003a58:	00000097          	auipc	ra,0x0
    80003a5c:	ef4080e7          	jalr	-268(ra) # 8000394c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    80003a60:	00000513          	li	a0,0
}
    80003a64:	01813083          	ld	ra,24(sp)
    80003a68:	01013403          	ld	s0,16(sp)
    80003a6c:	00813483          	ld	s1,8(sp)
    80003a70:	00013903          	ld	s2,0(sp)
    80003a74:	02010113          	addi	sp,sp,32
    80003a78:	00008067          	ret
        fmem_head = newnode;
    80003a7c:	00b93023          	sd	a1,0(s2)
    80003a80:	fc5ff06f          	j	80003a44 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(!ptr) return -1;
    80003a84:	fff00513          	li	a0,-1
}
    80003a88:	00008067          	ret
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    80003a8c:	ffe00513          	li	a0,-2
    80003a90:	fd5ff06f          	j	80003a64 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
    80003a94:	ffe00513          	li	a0,-2
    80003a98:	fcdff06f          	j	80003a64 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>

0000000080003a9c <_ZN15MemoryAllocator15mem_free_kernelEPvmm>:

int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    if(!ptr) return -1;
    80003a9c:	0e058e63          	beqz	a1,80003b98 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xfc>
int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    80003aa0:	fe010113          	addi	sp,sp,-32
    80003aa4:	00113c23          	sd	ra,24(sp)
    80003aa8:	00813823          	sd	s0,16(sp)
    80003aac:	00913423          	sd	s1,8(sp)
    80003ab0:	01213023          	sd	s2,0(sp)
    80003ab4:	02010413          	addi	s0,sp,32
    80003ab8:	00050913          	mv	s2,a0


    //outside of the heap error
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    80003abc:	00009797          	auipc	a5,0x9
    80003ac0:	1fc7b783          	ld	a5,508(a5) # 8000ccb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003ac4:	0007b783          	ld	a5,0(a5)
    80003ac8:	0cf5ec63          	bltu	a1,a5,80003ba0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x104>
    80003acc:	00009797          	auipc	a5,0x9
    80003ad0:	2147b783          	ld	a5,532(a5) # 8000cce0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003ad4:	0007b783          	ld	a5,0(a5)
    80003ad8:	0cb7e863          	bltu	a5,a1,80003ba8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x10c>
    //not aligned to a block error
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    80003adc:	00053783          	ld	a5,0(a0)
    80003ae0:	40f587b3          	sub	a5,a1,a5
    80003ae4:	03f7f793          	andi	a5,a5,63
    80003ae8:	0c079463          	bnez	a5,80003bb0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x114>
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80003aec:	02d60633          	mul	a2,a2,a3
    80003af0:	03f60613          	addi	a2,a2,63
    80003af4:	00665613          	srli	a2,a2,0x6

    FreeMem* newnode = (FreeMem*)ptr;
    newnode->size = numOfBlocks;
    80003af8:	00c5b823          	sd	a2,16(a1)
    newnode->prev = nullptr;
    80003afc:	0005b423          	sd	zero,8(a1)
    newnode->next = nullptr;
    80003b00:	0005b023          	sd	zero,0(a1)
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    80003b04:	00053703          	ld	a4,0(a0)
    80003b08:	02070463          	beqz	a4,80003b30 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x94>
    80003b0c:	02e5e663          	bltu	a1,a4,80003b38 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x9c>
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
    80003b10:	00070793          	mv	a5,a4
        while(temp->next && (char*)temp->next < (char*)newnode)
    80003b14:	00078493          	mv	s1,a5
    80003b18:	0007b783          	ld	a5,0(a5)
    80003b1c:	00078463          	beqz	a5,80003b24 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x88>
    80003b20:	feb7eae3          	bltu	a5,a1,80003b14 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x78>
        {
            temp = temp->next;
        }
    }
    if(temp)
    80003b24:	00048c63          	beqz	s1,80003b3c <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa0>
    {
        newnode->next = temp->next;
    80003b28:	00f5b023          	sd	a5,0(a1)
    80003b2c:	0140006f          	j	80003b40 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa4>
        temp = 0;
    80003b30:	00070493          	mv	s1,a4
    80003b34:	0080006f          	j	80003b3c <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa0>
    80003b38:	00000493          	li	s1,0
    }
    else {
        newnode->next = fmem_head;
    80003b3c:	00e5b023          	sd	a4,0(a1)
    }
    if(newnode->next)
    80003b40:	0005b783          	ld	a5,0(a1)
    80003b44:	00078463          	beqz	a5,80003b4c <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xb0>
    {
        newnode->next->prev = newnode;
    80003b48:	00b7b423          	sd	a1,8(a5)
    }
    if(temp){
    80003b4c:	04048263          	beqz	s1,80003b90 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xf4>
        temp->next = newnode;
    80003b50:	00b4b023          	sd	a1,0(s1)
        newnode->prev = temp;
    80003b54:	0095b423          	sd	s1,8(a1)
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    80003b58:	00090513          	mv	a0,s2
    80003b5c:	00000097          	auipc	ra,0x0
    80003b60:	df0080e7          	jalr	-528(ra) # 8000394c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(temp);
    80003b64:	00048593          	mv	a1,s1
    80003b68:	00090513          	mv	a0,s2
    80003b6c:	00000097          	auipc	ra,0x0
    80003b70:	de0080e7          	jalr	-544(ra) # 8000394c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    80003b74:	00000513          	li	a0,0
}
    80003b78:	01813083          	ld	ra,24(sp)
    80003b7c:	01013403          	ld	s0,16(sp)
    80003b80:	00813483          	ld	s1,8(sp)
    80003b84:	00013903          	ld	s2,0(sp)
    80003b88:	02010113          	addi	sp,sp,32
    80003b8c:	00008067          	ret
        fmem_head = newnode;
    80003b90:	00b93023          	sd	a1,0(s2)
    80003b94:	fc5ff06f          	j	80003b58 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xbc>
    if(!ptr) return -1;
    80003b98:	fff00513          	li	a0,-1
}
    80003b9c:	00008067          	ret
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    80003ba0:	ffe00513          	li	a0,-2
    80003ba4:	fd5ff06f          	j	80003b78 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>
    80003ba8:	ffe00513          	li	a0,-2
    80003bac:	fcdff06f          	j	80003b78 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    80003bb0:	ffd00513          	li	a0,-3
    80003bb4:	fc5ff06f          	j	80003b78 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>

0000000080003bb8 <_ZN15MemoryAllocator21free_memory_remainingEv>:

size_t MemoryAllocator::free_memory_remaining() {
    80003bb8:	ff010113          	addi	sp,sp,-16
    80003bbc:	00813423          	sd	s0,8(sp)
    80003bc0:	01010413          	addi	s0,sp,16
    return fmem_head->size * MEM_BLOCK_SIZE;
    80003bc4:	00053783          	ld	a5,0(a0)
    80003bc8:	0107b503          	ld	a0,16(a5)
}
    80003bcc:	00651513          	slli	a0,a0,0x6
    80003bd0:	00813403          	ld	s0,8(sp)
    80003bd4:	01010113          	addi	sp,sp,16
    80003bd8:	00008067          	ret

0000000080003bdc <_ZN15MemoryAllocator21get_largest_mem_blockEv>:
size_t MemoryAllocator::get_largest_mem_block() {
    80003bdc:	ff010113          	addi	sp,sp,-16
    80003be0:	00813423          	sd	s0,8(sp)
    80003be4:	01010413          	addi	s0,sp,16
    if(fmem_head == nullptr) return 0;
    80003be8:	00053783          	ld	a5,0(a0)
    80003bec:	02078a63          	beqz	a5,80003c20 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x44>
    FreeMem* temp = fmem_head;
    size_t maxBlocks = temp->size;
    80003bf0:	0107b503          	ld	a0,16(a5)
    80003bf4:	0080006f          	j	80003bfc <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x20>
    while(temp)
    {
        if(temp->size > maxBlocks){
            maxBlocks = temp->size;
        }
        temp = temp->next;
    80003bf8:	0007b783          	ld	a5,0(a5)
    while(temp)
    80003bfc:	00078a63          	beqz	a5,80003c10 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x34>
        if(temp->size > maxBlocks){
    80003c00:	0107b703          	ld	a4,16(a5)
    80003c04:	fee57ae3          	bgeu	a0,a4,80003bf8 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x1c>
            maxBlocks = temp->size;
    80003c08:	00070513          	mv	a0,a4
    80003c0c:	fedff06f          	j	80003bf8 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x1c>
    }
    return maxBlocks * MEM_BLOCK_SIZE;
    80003c10:	00651513          	slli	a0,a0,0x6

}
    80003c14:	00813403          	ld	s0,8(sp)
    80003c18:	01010113          	addi	sp,sp,16
    80003c1c:	00008067          	ret
    if(fmem_head == nullptr) return 0;
    80003c20:	00000513          	li	a0,0
    80003c24:	ff1ff06f          	j	80003c14 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x38>

0000000080003c28 <_ZN8ListNodeI6ThreadEC1EPS0_>:
#include "../h/List.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Thread.hpp"

template<typename T>
ListNode<T>::ListNode(T* t) : next(nullptr), prev(nullptr), object(t) {}
    80003c28:	ff010113          	addi	sp,sp,-16
    80003c2c:	00813423          	sd	s0,8(sp)
    80003c30:	01010413          	addi	s0,sp,16
    80003c34:	00053023          	sd	zero,0(a0)
    80003c38:	00053423          	sd	zero,8(a0)
    80003c3c:	00b53823          	sd	a1,16(a0)
    80003c40:	00813403          	ld	s0,8(sp)
    80003c44:	01010113          	addi	sp,sp,16
    80003c48:	00008067          	ret

0000000080003c4c <_ZN8ListNodeI6ThreadEnwEm>:


template<typename T>
void* ListNode<T>::operator new(size_t size) {
    80003c4c:	fe010113          	addi	sp,sp,-32
    80003c50:	00113c23          	sd	ra,24(sp)
    80003c54:	00813823          	sd	s0,16(sp)
    80003c58:	00913423          	sd	s1,8(sp)
    80003c5c:	02010413          	addi	s0,sp,32
    uint64 numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80003c60:	04750493          	addi	s1,a0,71
    80003c64:	0064d493          	srli	s1,s1,0x6
    return MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80003c68:	00000097          	auipc	ra,0x0
    80003c6c:	c88080e7          	jalr	-888(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80003c70:	00048593          	mv	a1,s1
    80003c74:	00000097          	auipc	ra,0x0
    80003c78:	9f4080e7          	jalr	-1548(ra) # 80003668 <_ZN15MemoryAllocator9mem_allocEm>
}
    80003c7c:	01813083          	ld	ra,24(sp)
    80003c80:	01013403          	ld	s0,16(sp)
    80003c84:	00813483          	ld	s1,8(sp)
    80003c88:	02010113          	addi	sp,sp,32
    80003c8c:	00008067          	ret

0000000080003c90 <_ZN8ListNodeI6ThreadEdlEPv>:

template<typename T>
void ListNode<T>::operator delete(void* obj) {
    80003c90:	fe010113          	addi	sp,sp,-32
    80003c94:	00113c23          	sd	ra,24(sp)
    80003c98:	00813823          	sd	s0,16(sp)
    80003c9c:	00913423          	sd	s1,8(sp)
    80003ca0:	02010413          	addi	s0,sp,32
    char* header = (char*)obj - sizeof(Header);
    80003ca4:	ff850493          	addi	s1,a0,-8
    MemoryAllocator::Instance()->mem_free(header);
    80003ca8:	00000097          	auipc	ra,0x0
    80003cac:	c48080e7          	jalr	-952(ra) # 800038f0 <_ZN15MemoryAllocator8InstanceEv>
    80003cb0:	00048593          	mv	a1,s1
    80003cb4:	00000097          	auipc	ra,0x0
    80003cb8:	cec080e7          	jalr	-788(ra) # 800039a0 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003cbc:	01813083          	ld	ra,24(sp)
    80003cc0:	01013403          	ld	s0,16(sp)
    80003cc4:	00813483          	ld	s1,8(sp)
    80003cc8:	02010113          	addi	sp,sp,32
    80003ccc:	00008067          	ret

0000000080003cd0 <_ZN4ListI6ThreadEC1Ev>:


template<typename T>
List<T>::List() : head(nullptr), tail(nullptr) {}
    80003cd0:	ff010113          	addi	sp,sp,-16
    80003cd4:	00813423          	sd	s0,8(sp)
    80003cd8:	01010413          	addi	s0,sp,16
    80003cdc:	00053023          	sd	zero,0(a0)
    80003ce0:	00053423          	sd	zero,8(a0)
    80003ce4:	00813403          	ld	s0,8(sp)
    80003ce8:	01010113          	addi	sp,sp,16
    80003cec:	00008067          	ret

0000000080003cf0 <_ZN4ListI6ThreadED1Ev>:

template<typename T>
List<T>::~List() {
    ListNode<T>* current = head;
    80003cf0:	00053503          	ld	a0,0(a0)
    while (current) {
    80003cf4:	04050063          	beqz	a0,80003d34 <_ZN4ListI6ThreadED1Ev+0x44>
List<T>::~List() {
    80003cf8:	fe010113          	addi	sp,sp,-32
    80003cfc:	00113c23          	sd	ra,24(sp)
    80003d00:	00813823          	sd	s0,16(sp)
    80003d04:	00913423          	sd	s1,8(sp)
    80003d08:	02010413          	addi	s0,sp,32
        ListNode<T>* next = current->next;
    80003d0c:	00053483          	ld	s1,0(a0)
        delete current;
    80003d10:	00000097          	auipc	ra,0x0
    80003d14:	f80080e7          	jalr	-128(ra) # 80003c90 <_ZN8ListNodeI6ThreadEdlEPv>
        current = next;
    80003d18:	00048513          	mv	a0,s1
    while (current) {
    80003d1c:	fe0498e3          	bnez	s1,80003d0c <_ZN4ListI6ThreadED1Ev+0x1c>
    }
    head = tail = nullptr;
}
    80003d20:	01813083          	ld	ra,24(sp)
    80003d24:	01013403          	ld	s0,16(sp)
    80003d28:	00813483          	ld	s1,8(sp)
    80003d2c:	02010113          	addi	sp,sp,32
    80003d30:	00008067          	ret
    80003d34:	00008067          	ret

0000000080003d38 <_ZN4ListI6ThreadE7add_endEPS0_>:
bool List<T>::empty() {
    return head == nullptr;
}

template<typename T>
void List<T>::add_end(T* t) {
    80003d38:	fd010113          	addi	sp,sp,-48
    80003d3c:	02113423          	sd	ra,40(sp)
    80003d40:	02813023          	sd	s0,32(sp)
    80003d44:	00913c23          	sd	s1,24(sp)
    80003d48:	01213823          	sd	s2,16(sp)
    80003d4c:	01313423          	sd	s3,8(sp)
    80003d50:	03010413          	addi	s0,sp,48
    80003d54:	00050493          	mv	s1,a0
    80003d58:	00058993          	mv	s3,a1
    ListNode<T>* newnode = new ListNode<T>(t);
    80003d5c:	01800513          	li	a0,24
    80003d60:	00000097          	auipc	ra,0x0
    80003d64:	eec080e7          	jalr	-276(ra) # 80003c4c <_ZN8ListNodeI6ThreadEnwEm>
    80003d68:	00050913          	mv	s2,a0
    80003d6c:	00098593          	mv	a1,s3
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	eb8080e7          	jalr	-328(ra) # 80003c28 <_ZN8ListNodeI6ThreadEC1EPS0_>
    if (!head) {
    80003d78:	0004b783          	ld	a5,0(s1)
    80003d7c:	02078a63          	beqz	a5,80003db0 <_ZN4ListI6ThreadE7add_endEPS0_+0x78>
        head = newnode;
    } else {
        tail->next = newnode;
    80003d80:	0084b783          	ld	a5,8(s1)
    80003d84:	0127b023          	sd	s2,0(a5)
        newnode->prev = tail;
    80003d88:	0084b783          	ld	a5,8(s1)
    80003d8c:	00f93423          	sd	a5,8(s2)
    }
    tail = newnode;
    80003d90:	0124b423          	sd	s2,8(s1)
}
    80003d94:	02813083          	ld	ra,40(sp)
    80003d98:	02013403          	ld	s0,32(sp)
    80003d9c:	01813483          	ld	s1,24(sp)
    80003da0:	01013903          	ld	s2,16(sp)
    80003da4:	00813983          	ld	s3,8(sp)
    80003da8:	03010113          	addi	sp,sp,48
    80003dac:	00008067          	ret
        head = newnode;
    80003db0:	0124b023          	sd	s2,0(s1)
    80003db4:	fddff06f          	j	80003d90 <_ZN4ListI6ThreadE7add_endEPS0_+0x58>
    80003db8:	00050493          	mv	s1,a0
    ListNode<T>* newnode = new ListNode<T>(t);
    80003dbc:	00090513          	mv	a0,s2
    80003dc0:	00000097          	auipc	ra,0x0
    80003dc4:	ed0080e7          	jalr	-304(ra) # 80003c90 <_ZN8ListNodeI6ThreadEdlEPv>
    80003dc8:	00048513          	mv	a0,s1
    80003dcc:	0000a097          	auipc	ra,0xa
    80003dd0:	58c080e7          	jalr	1420(ra) # 8000e358 <_Unwind_Resume>

0000000080003dd4 <_ZN4ListI6ThreadE16remove_beginningEv>:

template<typename T>
T* List<T>::remove_beginning() {
    80003dd4:	fe010113          	addi	sp,sp,-32
    80003dd8:	00113c23          	sd	ra,24(sp)
    80003ddc:	00813823          	sd	s0,16(sp)
    80003de0:	00913423          	sd	s1,8(sp)
    80003de4:	02010413          	addi	s0,sp,32
    80003de8:	00050793          	mv	a5,a0
    if (!head) return nullptr;
    80003dec:	00053503          	ld	a0,0(a0)
    80003df0:	04050063          	beqz	a0,80003e30 <_ZN4ListI6ThreadE16remove_beginningEv+0x5c>
    ListNode<T>* node = head;
    head = head->next;
    80003df4:	00053703          	ld	a4,0(a0)
    80003df8:	00e7b023          	sd	a4,0(a5)
    if (head)
    80003dfc:	02070663          	beqz	a4,80003e28 <_ZN4ListI6ThreadE16remove_beginningEv+0x54>
        head->prev = nullptr;
    80003e00:	00073423          	sd	zero,8(a4)
    else
        tail = nullptr;

    node->next = nullptr;
    node->prev = nullptr;
    T* obj = node->object;
    80003e04:	01053483          	ld	s1,16(a0)
    delete node;
    80003e08:	00000097          	auipc	ra,0x0
    80003e0c:	e88080e7          	jalr	-376(ra) # 80003c90 <_ZN8ListNodeI6ThreadEdlEPv>
    return obj;
}
    80003e10:	00048513          	mv	a0,s1
    80003e14:	01813083          	ld	ra,24(sp)
    80003e18:	01013403          	ld	s0,16(sp)
    80003e1c:	00813483          	ld	s1,8(sp)
    80003e20:	02010113          	addi	sp,sp,32
    80003e24:	00008067          	ret
        tail = nullptr;
    80003e28:	0007b423          	sd	zero,8(a5)
    80003e2c:	fd9ff06f          	j	80003e04 <_ZN4ListI6ThreadE16remove_beginningEv+0x30>
    if (!head) return nullptr;
    80003e30:	00050493          	mv	s1,a0
    80003e34:	fddff06f          	j	80003e10 <_ZN4ListI6ThreadE16remove_beginningEv+0x3c>

0000000080003e38 <_ZN4ListI6ThreadE5emptyEv>:
bool List<T>::empty() {
    80003e38:	ff010113          	addi	sp,sp,-16
    80003e3c:	00813423          	sd	s0,8(sp)
    80003e40:	01010413          	addi	s0,sp,16
    return head == nullptr;
    80003e44:	00053503          	ld	a0,0(a0)
}
    80003e48:	00153513          	seqz	a0,a0
    80003e4c:	00813403          	ld	s0,8(sp)
    80003e50:	01010113          	addi	sp,sp,16
    80003e54:	00008067          	ret

0000000080003e58 <_ZN13SemaphorePoolC1Ev>:

#include "../h/SemaphorePool.hpp"

SemaphorePool::SemaphorePool() : pool(nullptr), used(nullptr) {}
    80003e58:	ff010113          	addi	sp,sp,-16
    80003e5c:	00813423          	sd	s0,8(sp)
    80003e60:	01010413          	addi	s0,sp,16
    80003e64:	00053023          	sd	zero,0(a0)
    80003e68:	00053423          	sd	zero,8(a0)
    80003e6c:	00813403          	ld	s0,8(sp)
    80003e70:	01010113          	addi	sp,sp,16
    80003e74:	00008067          	ret

0000000080003e78 <_ZN13SemaphorePool4initEPvS0_>:

void SemaphorePool::init(void* poolStartAddress, void* usedStartAddress) {
    80003e78:	ff010113          	addi	sp,sp,-16
    80003e7c:	00813423          	sd	s0,8(sp)
    80003e80:	01010413          	addi	s0,sp,16
    pool = (Semaphore*)poolStartAddress;
    80003e84:	00b53023          	sd	a1,0(a0)
    used = (bool*)usedStartAddress;
    80003e88:	00c53423          	sd	a2,8(a0)
    for (int i = 0; i < MAX_SEMAPHORES; i++) used[i] = false;
    80003e8c:	00000793          	li	a5,0
    80003e90:	00900713          	li	a4,9
    80003e94:	00f74c63          	blt	a4,a5,80003eac <_ZN13SemaphorePool4initEPvS0_+0x34>
    80003e98:	00853703          	ld	a4,8(a0)
    80003e9c:	00f70733          	add	a4,a4,a5
    80003ea0:	00070023          	sb	zero,0(a4)
    80003ea4:	0017879b          	addiw	a5,a5,1
    80003ea8:	fe9ff06f          	j	80003e90 <_ZN13SemaphorePool4initEPvS0_+0x18>
}
    80003eac:	00813403          	ld	s0,8(sp)
    80003eb0:	01010113          	addi	sp,sp,16
    80003eb4:	00008067          	ret

0000000080003eb8 <_ZN13SemaphorePool16getSemaphoreByIdEj>:

Semaphore* SemaphorePool::getSemaphoreById(sem_t id){
    80003eb8:	ff010113          	addi	sp,sp,-16
    80003ebc:	00813423          	sd	s0,8(sp)
    80003ec0:	01010413          	addi	s0,sp,16
    80003ec4:	00050693          	mv	a3,a0
    for(int i = 0; i < MAX_SEMAPHORES; i++){
    80003ec8:	00000793          	li	a5,0
    80003ecc:	0080006f          	j	80003ed4 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x1c>
    80003ed0:	0017879b          	addiw	a5,a5,1
    80003ed4:	00900713          	li	a4,9
    80003ed8:	02f74663          	blt	a4,a5,80003f04 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x4c>
        if(used[i] == true && pool[i].myHandle == id){
    80003edc:	0086b703          	ld	a4,8(a3)
    80003ee0:	00f70733          	add	a4,a4,a5
    80003ee4:	00074703          	lbu	a4,0(a4)
    80003ee8:	fe0704e3          	beqz	a4,80003ed0 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x18>
    80003eec:	0006b503          	ld	a0,0(a3)
    80003ef0:	00579713          	slli	a4,a5,0x5
    80003ef4:	00e50533          	add	a0,a0,a4
    80003ef8:	00852703          	lw	a4,8(a0)
    80003efc:	fcb71ae3          	bne	a4,a1,80003ed0 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x18>
    80003f00:	0080006f          	j	80003f08 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x50>
            return &pool[i];
        }
    }
    return nullptr;
    80003f04:	00000513          	li	a0,0
}
    80003f08:	00813403          	ld	s0,8(sp)
    80003f0c:	01010113          	addi	sp,sp,16
    80003f10:	00008067          	ret

0000000080003f14 <_ZN13SemaphorePool8allocateEv>:
Semaphore* SemaphorePool::allocate() {
    80003f14:	ff010113          	addi	sp,sp,-16
    80003f18:	00813423          	sd	s0,8(sp)
    80003f1c:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003f20:	00000793          	li	a5,0
    80003f24:	00900713          	li	a4,9
    80003f28:	02f74c63          	blt	a4,a5,80003f60 <_ZN13SemaphorePool8allocateEv+0x4c>
        if (!used[i]) {
    80003f2c:	00853703          	ld	a4,8(a0)
    80003f30:	00078613          	mv	a2,a5
    80003f34:	00f70733          	add	a4,a4,a5
    80003f38:	00074683          	lbu	a3,0(a4)
    80003f3c:	00068663          	beqz	a3,80003f48 <_ZN13SemaphorePool8allocateEv+0x34>
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003f40:	0017879b          	addiw	a5,a5,1
    80003f44:	fe1ff06f          	j	80003f24 <_ZN13SemaphorePool8allocateEv+0x10>
            used[i] = true;
    80003f48:	00100793          	li	a5,1
    80003f4c:	00f70023          	sb	a5,0(a4)
            return &pool[i];
    80003f50:	00053503          	ld	a0,0(a0)
    80003f54:	00561613          	slli	a2,a2,0x5
    80003f58:	00c50533          	add	a0,a0,a2
    80003f5c:	0080006f          	j	80003f64 <_ZN13SemaphorePool8allocateEv+0x50>
        }
    }
    return nullptr;
    80003f60:	00000513          	li	a0,0
}
    80003f64:	00813403          	ld	s0,8(sp)
    80003f68:	01010113          	addi	sp,sp,16
    80003f6c:	00008067          	ret

0000000080003f70 <_ZN13SemaphorePool10deallocateEP9Semaphore>:

void SemaphorePool::deallocate(Semaphore* obj) {
    80003f70:	ff010113          	addi	sp,sp,-16
    80003f74:	00813423          	sd	s0,8(sp)
    80003f78:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003f7c:	00000793          	li	a5,0
    80003f80:	00900713          	li	a4,9
    80003f84:	02f74663          	blt	a4,a5,80003fb0 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x40>
        if (&pool[i] == obj) {
    80003f88:	00053703          	ld	a4,0(a0)
    80003f8c:	00078613          	mv	a2,a5
    80003f90:	00579693          	slli	a3,a5,0x5
    80003f94:	00d70733          	add	a4,a4,a3
    80003f98:	00b70663          	beq	a4,a1,80003fa4 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x34>
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003f9c:	0017879b          	addiw	a5,a5,1
    80003fa0:	fe1ff06f          	j	80003f80 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x10>
            used[i] = false;
    80003fa4:	00853783          	ld	a5,8(a0)
    80003fa8:	00c78633          	add	a2,a5,a2
    80003fac:	00060023          	sb	zero,0(a2)
            return;
        }
    }
}
    80003fb0:	00813403          	ld	s0,8(sp)
    80003fb4:	01010113          	addi	sp,sp,16
    80003fb8:	00008067          	ret

0000000080003fbc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003fbc:	fe010113          	addi	sp,sp,-32
    80003fc0:	00113c23          	sd	ra,24(sp)
    80003fc4:	00813823          	sd	s0,16(sp)
    80003fc8:	00913423          	sd	s1,8(sp)
    80003fcc:	01213023          	sd	s2,0(sp)
    80003fd0:	02010413          	addi	s0,sp,32
    80003fd4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003fd8:	00000913          	li	s2,0
    80003fdc:	00c0006f          	j	80003fe8 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003fe0:	ffffd097          	auipc	ra,0xffffd
    80003fe4:	694080e7          	jalr	1684(ra) # 80001674 <thread_dispatch>
    while ((key = getc()) != 0x1b) {
    80003fe8:	ffffe097          	auipc	ra,0xffffe
    80003fec:	824080e7          	jalr	-2012(ra) # 8000180c <getc>
    80003ff0:	0005059b          	sext.w	a1,a0
    80003ff4:	01b00793          	li	a5,27
    80003ff8:	02f58a63          	beq	a1,a5,8000402c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003ffc:	0084b503          	ld	a0,8(s1)
    80004000:	00003097          	auipc	ra,0x3
    80004004:	d18080e7          	jalr	-744(ra) # 80006d18 <_ZN6Buffer3putEi>
        i++;
    80004008:	0019071b          	addiw	a4,s2,1
    8000400c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004010:	0004a683          	lw	a3,0(s1)
    80004014:	0026979b          	slliw	a5,a3,0x2
    80004018:	00d787bb          	addw	a5,a5,a3
    8000401c:	0017979b          	slliw	a5,a5,0x1
    80004020:	02f767bb          	remw	a5,a4,a5
    80004024:	fc0792e3          	bnez	a5,80003fe8 <_ZL16producerKeyboardPv+0x2c>
    80004028:	fb9ff06f          	j	80003fe0 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    8000402c:	00100793          	li	a5,1
    80004030:	00009717          	auipc	a4,0x9
    80004034:	20f72823          	sw	a5,528(a4) # 8000d240 <_ZL9threadEnd>
    data->buffer->put('!');
    80004038:	02100593          	li	a1,33
    8000403c:	0084b503          	ld	a0,8(s1)
    80004040:	00003097          	auipc	ra,0x3
    80004044:	cd8080e7          	jalr	-808(ra) # 80006d18 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80004048:	0104a503          	lw	a0,16(s1)
    8000404c:	ffffd097          	auipc	ra,0xffffd
    80004050:	740080e7          	jalr	1856(ra) # 8000178c <sem_signal>
}
    80004054:	01813083          	ld	ra,24(sp)
    80004058:	01013403          	ld	s0,16(sp)
    8000405c:	00813483          	ld	s1,8(sp)
    80004060:	00013903          	ld	s2,0(sp)
    80004064:	02010113          	addi	sp,sp,32
    80004068:	00008067          	ret

000000008000406c <_ZL8producerPv>:

static void producer(void *arg) {
    8000406c:	fe010113          	addi	sp,sp,-32
    80004070:	00113c23          	sd	ra,24(sp)
    80004074:	00813823          	sd	s0,16(sp)
    80004078:	00913423          	sd	s1,8(sp)
    8000407c:	01213023          	sd	s2,0(sp)
    80004080:	02010413          	addi	s0,sp,32
    80004084:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004088:	00000913          	li	s2,0
    8000408c:	00c0006f          	j	80004098 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80004090:	ffffd097          	auipc	ra,0xffffd
    80004094:	5e4080e7          	jalr	1508(ra) # 80001674 <thread_dispatch>
    while (!threadEnd) {
    80004098:	00009797          	auipc	a5,0x9
    8000409c:	1a87a783          	lw	a5,424(a5) # 8000d240 <_ZL9threadEnd>
    800040a0:	02079e63          	bnez	a5,800040dc <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    800040a4:	0004a583          	lw	a1,0(s1)
    800040a8:	0305859b          	addiw	a1,a1,48
    800040ac:	0084b503          	ld	a0,8(s1)
    800040b0:	00003097          	auipc	ra,0x3
    800040b4:	c68080e7          	jalr	-920(ra) # 80006d18 <_ZN6Buffer3putEi>
        i++;
    800040b8:	0019071b          	addiw	a4,s2,1
    800040bc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800040c0:	0004a683          	lw	a3,0(s1)
    800040c4:	0026979b          	slliw	a5,a3,0x2
    800040c8:	00d787bb          	addw	a5,a5,a3
    800040cc:	0017979b          	slliw	a5,a5,0x1
    800040d0:	02f767bb          	remw	a5,a4,a5
    800040d4:	fc0792e3          	bnez	a5,80004098 <_ZL8producerPv+0x2c>
    800040d8:	fb9ff06f          	j	80004090 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800040dc:	0104a503          	lw	a0,16(s1)
    800040e0:	ffffd097          	auipc	ra,0xffffd
    800040e4:	6ac080e7          	jalr	1708(ra) # 8000178c <sem_signal>
}
    800040e8:	01813083          	ld	ra,24(sp)
    800040ec:	01013403          	ld	s0,16(sp)
    800040f0:	00813483          	ld	s1,8(sp)
    800040f4:	00013903          	ld	s2,0(sp)
    800040f8:	02010113          	addi	sp,sp,32
    800040fc:	00008067          	ret

0000000080004100 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80004100:	fd010113          	addi	sp,sp,-48
    80004104:	02113423          	sd	ra,40(sp)
    80004108:	02813023          	sd	s0,32(sp)
    8000410c:	00913c23          	sd	s1,24(sp)
    80004110:	01213823          	sd	s2,16(sp)
    80004114:	01313423          	sd	s3,8(sp)
    80004118:	03010413          	addi	s0,sp,48
    8000411c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004120:	00000993          	li	s3,0
    80004124:	01c0006f          	j	80004140 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80004128:	ffffd097          	auipc	ra,0xffffd
    8000412c:	54c080e7          	jalr	1356(ra) # 80001674 <thread_dispatch>
    80004130:	0500006f          	j	80004180 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004134:	00a00513          	li	a0,10
    80004138:	ffffd097          	auipc	ra,0xffffd
    8000413c:	704080e7          	jalr	1796(ra) # 8000183c <putc>
    while (!threadEnd) {
    80004140:	00009797          	auipc	a5,0x9
    80004144:	1007a783          	lw	a5,256(a5) # 8000d240 <_ZL9threadEnd>
    80004148:	06079063          	bnez	a5,800041a8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    8000414c:	00893503          	ld	a0,8(s2)
    80004150:	00003097          	auipc	ra,0x3
    80004154:	c58080e7          	jalr	-936(ra) # 80006da8 <_ZN6Buffer3getEv>
        i++;
    80004158:	0019849b          	addiw	s1,s3,1
    8000415c:	0004899b          	sext.w	s3,s1
        putc(key);
    80004160:	0ff57513          	andi	a0,a0,255
    80004164:	ffffd097          	auipc	ra,0xffffd
    80004168:	6d8080e7          	jalr	1752(ra) # 8000183c <putc>
        if (i % (5 * data->id) == 0) {
    8000416c:	00092703          	lw	a4,0(s2)
    80004170:	0027179b          	slliw	a5,a4,0x2
    80004174:	00e787bb          	addw	a5,a5,a4
    80004178:	02f4e7bb          	remw	a5,s1,a5
    8000417c:	fa0786e3          	beqz	a5,80004128 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80004180:	05000793          	li	a5,80
    80004184:	02f4e4bb          	remw	s1,s1,a5
    80004188:	fa049ce3          	bnez	s1,80004140 <_ZL8consumerPv+0x40>
    8000418c:	fa9ff06f          	j	80004134 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80004190:	00893503          	ld	a0,8(s2)
    80004194:	00003097          	auipc	ra,0x3
    80004198:	c14080e7          	jalr	-1004(ra) # 80006da8 <_ZN6Buffer3getEv>
        putc(key);
    8000419c:	0ff57513          	andi	a0,a0,255
    800041a0:	ffffd097          	auipc	ra,0xffffd
    800041a4:	69c080e7          	jalr	1692(ra) # 8000183c <putc>
    while (data->buffer->getCnt() > 0) {
    800041a8:	00893503          	ld	a0,8(s2)
    800041ac:	00003097          	auipc	ra,0x3
    800041b0:	c88080e7          	jalr	-888(ra) # 80006e34 <_ZN6Buffer6getCntEv>
    800041b4:	fca04ee3          	bgtz	a0,80004190 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    800041b8:	01092503          	lw	a0,16(s2)
    800041bc:	ffffd097          	auipc	ra,0xffffd
    800041c0:	5d0080e7          	jalr	1488(ra) # 8000178c <sem_signal>
}
    800041c4:	02813083          	ld	ra,40(sp)
    800041c8:	02013403          	ld	s0,32(sp)
    800041cc:	01813483          	ld	s1,24(sp)
    800041d0:	01013903          	ld	s2,16(sp)
    800041d4:	00813983          	ld	s3,8(sp)
    800041d8:	03010113          	addi	sp,sp,48
    800041dc:	00008067          	ret

00000000800041e0 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800041e0:	fa010113          	addi	sp,sp,-96
    800041e4:	04113c23          	sd	ra,88(sp)
    800041e8:	04813823          	sd	s0,80(sp)
    800041ec:	04913423          	sd	s1,72(sp)
    800041f0:	05213023          	sd	s2,64(sp)
    800041f4:	03313c23          	sd	s3,56(sp)
    800041f8:	06010413          	addi	s0,sp,96
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    800041fc:	00006517          	auipc	a0,0x6
    80004200:	f3450513          	addi	a0,a0,-204 # 8000a130 <CONSOLE_STATUS+0x120>
    80004204:	00002097          	auipc	ra,0x2
    80004208:	d80080e7          	jalr	-640(ra) # 80005f84 <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 10;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    8000420c:	00006517          	auipc	a0,0x6
    80004210:	f4450513          	addi	a0,a0,-188 # 8000a150 <CONSOLE_STATUS+0x140>
    80004214:	00002097          	auipc	ra,0x2
    80004218:	d70080e7          	jalr	-656(ra) # 80005f84 <_Z11printStringPKc>
    //getString(input, 30);
    n = 15;//stringToInt(input);

    printString("Broj proizvodjaca "); printInt(threadNum);
    8000421c:	00006517          	auipc	a0,0x6
    80004220:	f5450513          	addi	a0,a0,-172 # 8000a170 <CONSOLE_STATUS+0x160>
    80004224:	00002097          	auipc	ra,0x2
    80004228:	d60080e7          	jalr	-672(ra) # 80005f84 <_Z11printStringPKc>
    8000422c:	00000613          	li	a2,0
    80004230:	00a00593          	li	a1,10
    80004234:	00a00513          	li	a0,10
    80004238:	00002097          	auipc	ra,0x2
    8000423c:	efc080e7          	jalr	-260(ra) # 80006134 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004240:	00006517          	auipc	a0,0x6
    80004244:	f4850513          	addi	a0,a0,-184 # 8000a188 <CONSOLE_STATUS+0x178>
    80004248:	00002097          	auipc	ra,0x2
    8000424c:	d3c080e7          	jalr	-708(ra) # 80005f84 <_Z11printStringPKc>
    80004250:	00000613          	li	a2,0
    80004254:	00a00593          	li	a1,10
    80004258:	00f00513          	li	a0,15
    8000425c:	00002097          	auipc	ra,0x2
    80004260:	ed8080e7          	jalr	-296(ra) # 80006134 <_Z8printIntiii>
    printString(".\n");
    80004264:	00006517          	auipc	a0,0x6
    80004268:	f3c50513          	addi	a0,a0,-196 # 8000a1a0 <CONSOLE_STATUS+0x190>
    8000426c:	00002097          	auipc	ra,0x2
    80004270:	d18080e7          	jalr	-744(ra) # 80005f84 <_Z11printStringPKc>
    } else if (threadNum < 1) {
        printString("Broj proizvodjaca mora biti veci od nula!\n");
        return;
    }

    Buffer *buffer = new Buffer(n);
    80004274:	02800513          	li	a0,40
    80004278:	fffff097          	auipc	ra,0xfffff
    8000427c:	2c0080e7          	jalr	704(ra) # 80003538 <_Znwm>
    80004280:	00050993          	mv	s3,a0
    80004284:	00f00593          	li	a1,15
    80004288:	00003097          	auipc	ra,0x3
    8000428c:	9f4080e7          	jalr	-1548(ra) # 80006c7c <_ZN6BufferC1Ei>


    sem_open(&waitForAll, 0);
    80004290:	00000593          	li	a1,0
    80004294:	00009517          	auipc	a0,0x9
    80004298:	fb050513          	addi	a0,a0,-80 # 8000d244 <_ZL10waitForAll>
    8000429c:	ffffd097          	auipc	ra,0xffffd
    800042a0:	458080e7          	jalr	1112(ra) # 800016f4 <sem_open>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    800042a4:	ef010113          	addi	sp,sp,-272
    800042a8:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    800042ac:	00a00793          	li	a5,10
    800042b0:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    800042b4:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    800042b8:	00009797          	auipc	a5,0x9
    800042bc:	f8c7a783          	lw	a5,-116(a5) # 8000d244 <_ZL10waitForAll>
    800042c0:	10f92023          	sw	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    800042c4:	0f090613          	addi	a2,s2,240
    800042c8:	00000597          	auipc	a1,0x0
    800042cc:	e3858593          	addi	a1,a1,-456 # 80004100 <_ZL8consumerPv>
    800042d0:	fcc40513          	addi	a0,s0,-52
    800042d4:	ffffd097          	auipc	ra,0xffffd
    800042d8:	2e8080e7          	jalr	744(ra) # 800015bc <thread_create>

    for (int i = 0; i < threadNum; i++) {
    800042dc:	00000493          	li	s1,0
    800042e0:	00900793          	li	a5,9
    800042e4:	0697c863          	blt	a5,s1,80004354 <_Z22producerConsumer_C_APIv+0x174>
        data[i].id = i;
    800042e8:	00149793          	slli	a5,s1,0x1
    800042ec:	009787b3          	add	a5,a5,s1
    800042f0:	00379793          	slli	a5,a5,0x3
    800042f4:	00f907b3          	add	a5,s2,a5
    800042f8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800042fc:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    80004300:	00009717          	auipc	a4,0x9
    80004304:	f4472703          	lw	a4,-188(a4) # 8000d244 <_ZL10waitForAll>
    80004308:	00e7a823          	sw	a4,16(a5)

        thread_create(threads + i,
    8000430c:	00048713          	mv	a4,s1
    80004310:	00249513          	slli	a0,s1,0x2
    80004314:	fa040793          	addi	a5,s0,-96
    80004318:	00a78533          	add	a0,a5,a0
    8000431c:	02905663          	blez	s1,80004348 <_Z22producerConsumer_C_APIv+0x168>
    80004320:	00000597          	auipc	a1,0x0
    80004324:	d4c58593          	addi	a1,a1,-692 # 8000406c <_ZL8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80004328:	00171613          	slli	a2,a4,0x1
    8000432c:	00e60633          	add	a2,a2,a4
    80004330:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004334:	00c90633          	add	a2,s2,a2
    80004338:	ffffd097          	auipc	ra,0xffffd
    8000433c:	284080e7          	jalr	644(ra) # 800015bc <thread_create>
    for (int i = 0; i < threadNum; i++) {
    80004340:	0014849b          	addiw	s1,s1,1
    80004344:	f9dff06f          	j	800042e0 <_Z22producerConsumer_C_APIv+0x100>
        thread_create(threads + i,
    80004348:	00000597          	auipc	a1,0x0
    8000434c:	c7458593          	addi	a1,a1,-908 # 80003fbc <_ZL16producerKeyboardPv>
    80004350:	fd9ff06f          	j	80004328 <_Z22producerConsumer_C_APIv+0x148>
    }

    thread_dispatch();
    80004354:	ffffd097          	auipc	ra,0xffffd
    80004358:	320080e7          	jalr	800(ra) # 80001674 <thread_dispatch>

    for (int i = 0; i <= threadNum; i++) {
    8000435c:	00000493          	li	s1,0
    80004360:	0180006f          	j	80004378 <_Z22producerConsumer_C_APIv+0x198>
        sem_wait(waitForAll);
    80004364:	00009517          	auipc	a0,0x9
    80004368:	ee052503          	lw	a0,-288(a0) # 8000d244 <_ZL10waitForAll>
    8000436c:	ffffd097          	auipc	ra,0xffffd
    80004370:	3d8080e7          	jalr	984(ra) # 80001744 <sem_wait>
    for (int i = 0; i <= threadNum; i++) {
    80004374:	0014849b          	addiw	s1,s1,1
    80004378:	00a00793          	li	a5,10
    8000437c:	fe97d4e3          	bge	a5,s1,80004364 <_Z22producerConsumer_C_APIv+0x184>
    }

    sem_close(waitForAll);
    80004380:	00009517          	auipc	a0,0x9
    80004384:	ec452503          	lw	a0,-316(a0) # 8000d244 <_ZL10waitForAll>
    80004388:	ffffd097          	auipc	ra,0xffffd
    8000438c:	444080e7          	jalr	1092(ra) # 800017cc <sem_close>

    delete buffer;
    80004390:	00098e63          	beqz	s3,800043ac <_Z22producerConsumer_C_APIv+0x1cc>
    80004394:	00098513          	mv	a0,s3
    80004398:	00003097          	auipc	ra,0x3
    8000439c:	b24080e7          	jalr	-1244(ra) # 80006ebc <_ZN6BufferD1Ev>
    800043a0:	00098513          	mv	a0,s3
    800043a4:	fffff097          	auipc	ra,0xfffff
    800043a8:	1e4080e7          	jalr	484(ra) # 80003588 <_ZdlPv>

}
    800043ac:	fa040113          	addi	sp,s0,-96
    800043b0:	05813083          	ld	ra,88(sp)
    800043b4:	05013403          	ld	s0,80(sp)
    800043b8:	04813483          	ld	s1,72(sp)
    800043bc:	04013903          	ld	s2,64(sp)
    800043c0:	03813983          	ld	s3,56(sp)
    800043c4:	06010113          	addi	sp,sp,96
    800043c8:	00008067          	ret
    800043cc:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800043d0:	00098513          	mv	a0,s3
    800043d4:	fffff097          	auipc	ra,0xfffff
    800043d8:	1b4080e7          	jalr	436(ra) # 80003588 <_ZdlPv>
    800043dc:	00048513          	mv	a0,s1
    800043e0:	0000a097          	auipc	ra,0xa
    800043e4:	f78080e7          	jalr	-136(ra) # 8000e358 <_Unwind_Resume>

00000000800043e8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800043e8:	fe010113          	addi	sp,sp,-32
    800043ec:	00113c23          	sd	ra,24(sp)
    800043f0:	00813823          	sd	s0,16(sp)
    800043f4:	00913423          	sd	s1,8(sp)
    800043f8:	01213023          	sd	s2,0(sp)
    800043fc:	02010413          	addi	s0,sp,32
    80004400:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004404:	00100793          	li	a5,1
    80004408:	02a7f863          	bgeu	a5,a0,80004438 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000440c:	00a00793          	li	a5,10
    80004410:	02f577b3          	remu	a5,a0,a5
    80004414:	02078e63          	beqz	a5,80004450 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004418:	fff48513          	addi	a0,s1,-1
    8000441c:	00000097          	auipc	ra,0x0
    80004420:	fcc080e7          	jalr	-52(ra) # 800043e8 <_ZL9fibonaccim>
    80004424:	00050913          	mv	s2,a0
    80004428:	ffe48513          	addi	a0,s1,-2
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	fbc080e7          	jalr	-68(ra) # 800043e8 <_ZL9fibonaccim>
    80004434:	00a90533          	add	a0,s2,a0
}
    80004438:	01813083          	ld	ra,24(sp)
    8000443c:	01013403          	ld	s0,16(sp)
    80004440:	00813483          	ld	s1,8(sp)
    80004444:	00013903          	ld	s2,0(sp)
    80004448:	02010113          	addi	sp,sp,32
    8000444c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004450:	ffffd097          	auipc	ra,0xffffd
    80004454:	224080e7          	jalr	548(ra) # 80001674 <thread_dispatch>
    80004458:	fc1ff06f          	j	80004418 <_ZL9fibonaccim+0x30>

000000008000445c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000445c:	fe010113          	addi	sp,sp,-32
    80004460:	00113c23          	sd	ra,24(sp)
    80004464:	00813823          	sd	s0,16(sp)
    80004468:	00913423          	sd	s1,8(sp)
    8000446c:	01213023          	sd	s2,0(sp)
    80004470:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004474:	00000913          	li	s2,0
    80004478:	0300006f          	j	800044a8 <_ZN7WorkerA11workerBodyAEPv+0x4c>
        printString("A: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10; j++) {
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    8000447c:	00178793          	addi	a5,a5,1
    80004480:	01d00713          	li	a4,29
    80004484:	fef77ce3          	bgeu	a4,a5,8000447c <_ZN7WorkerA11workerBodyAEPv+0x20>
            thread_dispatch();
    80004488:	ffffd097          	auipc	ra,0xffffd
    8000448c:	1ec080e7          	jalr	492(ra) # 80001674 <thread_dispatch>
        for (uint64 j = 0; j < 10; j++) {
    80004490:	00148493          	addi	s1,s1,1
    80004494:	00900793          	li	a5,9
    80004498:	0097e663          	bltu	a5,s1,800044a4 <_ZN7WorkerA11workerBodyAEPv+0x48>
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    8000449c:	00000793          	li	a5,0
    800044a0:	fe1ff06f          	j	80004480 <_ZN7WorkerA11workerBodyAEPv+0x24>
    for (uint64 i = 0; i < 10; i++) {
    800044a4:	00190913          	addi	s2,s2,1
    800044a8:	00900793          	li	a5,9
    800044ac:	0527e063          	bltu	a5,s2,800044ec <_ZN7WorkerA11workerBodyAEPv+0x90>
        printString("A: i=");
    800044b0:	00006517          	auipc	a0,0x6
    800044b4:	cf850513          	addi	a0,a0,-776 # 8000a1a8 <CONSOLE_STATUS+0x198>
    800044b8:	00002097          	auipc	ra,0x2
    800044bc:	acc080e7          	jalr	-1332(ra) # 80005f84 <_Z11printStringPKc>
        printInt(i);
    800044c0:	00000613          	li	a2,0
    800044c4:	00a00593          	li	a1,10
    800044c8:	0009051b          	sext.w	a0,s2
    800044cc:	00002097          	auipc	ra,0x2
    800044d0:	c68080e7          	jalr	-920(ra) # 80006134 <_Z8printIntiii>
        printString("\n");
    800044d4:	00006517          	auipc	a0,0x6
    800044d8:	c9450513          	addi	a0,a0,-876 # 8000a168 <CONSOLE_STATUS+0x158>
    800044dc:	00002097          	auipc	ra,0x2
    800044e0:	aa8080e7          	jalr	-1368(ra) # 80005f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    800044e4:	00000493          	li	s1,0
    800044e8:	fadff06f          	j	80004494 <_ZN7WorkerA11workerBodyAEPv+0x38>
        }
    }
    printString("A finished!\n");
    800044ec:	00006517          	auipc	a0,0x6
    800044f0:	cc450513          	addi	a0,a0,-828 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    800044f4:	00002097          	auipc	ra,0x2
    800044f8:	a90080e7          	jalr	-1392(ra) # 80005f84 <_Z11printStringPKc>
    finishedA = true;
    800044fc:	00100793          	li	a5,1
    80004500:	00009717          	auipc	a4,0x9
    80004504:	d4f70423          	sb	a5,-696(a4) # 8000d248 <_ZL9finishedA>
}
    80004508:	01813083          	ld	ra,24(sp)
    8000450c:	01013403          	ld	s0,16(sp)
    80004510:	00813483          	ld	s1,8(sp)
    80004514:	00013903          	ld	s2,0(sp)
    80004518:	02010113          	addi	sp,sp,32
    8000451c:	00008067          	ret

0000000080004520 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004520:	fe010113          	addi	sp,sp,-32
    80004524:	00113c23          	sd	ra,24(sp)
    80004528:	00813823          	sd	s0,16(sp)
    8000452c:	00913423          	sd	s1,8(sp)
    80004530:	01213023          	sd	s2,0(sp)
    80004534:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004538:	00000913          	li	s2,0
    8000453c:	0300006f          	j	8000456c <_ZN7WorkerB11workerBodyBEPv+0x4c>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10; j++) {
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80004540:	00178793          	addi	a5,a5,1
    80004544:	01d00713          	li	a4,29
    80004548:	fef77ce3          	bgeu	a4,a5,80004540 <_ZN7WorkerB11workerBodyBEPv+0x20>
            thread_dispatch();
    8000454c:	ffffd097          	auipc	ra,0xffffd
    80004550:	128080e7          	jalr	296(ra) # 80001674 <thread_dispatch>
        for (uint64 j = 0; j < 10; j++) {
    80004554:	00148493          	addi	s1,s1,1
    80004558:	00900793          	li	a5,9
    8000455c:	0097e663          	bltu	a5,s1,80004568 <_ZN7WorkerB11workerBodyBEPv+0x48>
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80004560:	00000793          	li	a5,0
    80004564:	fe1ff06f          	j	80004544 <_ZN7WorkerB11workerBodyBEPv+0x24>
    for (uint64 i = 0; i < 16; i++) {
    80004568:	00190913          	addi	s2,s2,1
    8000456c:	00f00793          	li	a5,15
    80004570:	0527e063          	bltu	a5,s2,800045b0 <_ZN7WorkerB11workerBodyBEPv+0x90>
        printString("B: i="); printInt(i); printString("\n");
    80004574:	00006517          	auipc	a0,0x6
    80004578:	c4c50513          	addi	a0,a0,-948 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    8000457c:	00002097          	auipc	ra,0x2
    80004580:	a08080e7          	jalr	-1528(ra) # 80005f84 <_Z11printStringPKc>
    80004584:	00000613          	li	a2,0
    80004588:	00a00593          	li	a1,10
    8000458c:	0009051b          	sext.w	a0,s2
    80004590:	00002097          	auipc	ra,0x2
    80004594:	ba4080e7          	jalr	-1116(ra) # 80006134 <_Z8printIntiii>
    80004598:	00006517          	auipc	a0,0x6
    8000459c:	bd050513          	addi	a0,a0,-1072 # 8000a168 <CONSOLE_STATUS+0x158>
    800045a0:	00002097          	auipc	ra,0x2
    800045a4:	9e4080e7          	jalr	-1564(ra) # 80005f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    800045a8:	00000493          	li	s1,0
    800045ac:	fadff06f          	j	80004558 <_ZN7WorkerB11workerBodyBEPv+0x38>
        }
    }
    printString("B finished!\n");
    800045b0:	00006517          	auipc	a0,0x6
    800045b4:	c1850513          	addi	a0,a0,-1000 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    800045b8:	00002097          	auipc	ra,0x2
    800045bc:	9cc080e7          	jalr	-1588(ra) # 80005f84 <_Z11printStringPKc>
    finishedB = true;
    800045c0:	00100793          	li	a5,1
    800045c4:	00009717          	auipc	a4,0x9
    800045c8:	c8f702a3          	sb	a5,-891(a4) # 8000d249 <_ZL9finishedB>
    thread_dispatch();
    800045cc:	ffffd097          	auipc	ra,0xffffd
    800045d0:	0a8080e7          	jalr	168(ra) # 80001674 <thread_dispatch>
}
    800045d4:	01813083          	ld	ra,24(sp)
    800045d8:	01013403          	ld	s0,16(sp)
    800045dc:	00813483          	ld	s1,8(sp)
    800045e0:	00013903          	ld	s2,0(sp)
    800045e4:	02010113          	addi	sp,sp,32
    800045e8:	00008067          	ret

00000000800045ec <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    800045ec:	fe010113          	addi	sp,sp,-32
    800045f0:	00113c23          	sd	ra,24(sp)
    800045f4:	00813823          	sd	s0,16(sp)
    800045f8:	00913423          	sd	s1,8(sp)
    800045fc:	01213023          	sd	s2,0(sp)
    80004600:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004604:	00000493          	li	s1,0
    80004608:	0400006f          	j	80004648 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000460c:	00006517          	auipc	a0,0x6
    80004610:	bcc50513          	addi	a0,a0,-1076 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80004614:	00002097          	auipc	ra,0x2
    80004618:	970080e7          	jalr	-1680(ra) # 80005f84 <_Z11printStringPKc>
    8000461c:	00000613          	li	a2,0
    80004620:	00a00593          	li	a1,10
    80004624:	00048513          	mv	a0,s1
    80004628:	00002097          	auipc	ra,0x2
    8000462c:	b0c080e7          	jalr	-1268(ra) # 80006134 <_Z8printIntiii>
    80004630:	00006517          	auipc	a0,0x6
    80004634:	b3850513          	addi	a0,a0,-1224 # 8000a168 <CONSOLE_STATUS+0x158>
    80004638:	00002097          	auipc	ra,0x2
    8000463c:	94c080e7          	jalr	-1716(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004640:	0014849b          	addiw	s1,s1,1
    80004644:	0ff4f493          	andi	s1,s1,255
    80004648:	00200793          	li	a5,2
    8000464c:	fc97f0e3          	bgeu	a5,s1,8000460c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004650:	00006517          	auipc	a0,0x6
    80004654:	b9050513          	addi	a0,a0,-1136 # 8000a1e0 <CONSOLE_STATUS+0x1d0>
    80004658:	00002097          	auipc	ra,0x2
    8000465c:	92c080e7          	jalr	-1748(ra) # 80005f84 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004660:	00700313          	li	t1,7

    thread_dispatch();
    80004664:	ffffd097          	auipc	ra,0xffffd
    80004668:	010080e7          	jalr	16(ra) # 80001674 <thread_dispatch>


    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000466c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004670:	00006517          	auipc	a0,0x6
    80004674:	b8050513          	addi	a0,a0,-1152 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    80004678:	00002097          	auipc	ra,0x2
    8000467c:	90c080e7          	jalr	-1780(ra) # 80005f84 <_Z11printStringPKc>
    80004680:	00000613          	li	a2,0
    80004684:	00a00593          	li	a1,10
    80004688:	0009051b          	sext.w	a0,s2
    8000468c:	00002097          	auipc	ra,0x2
    80004690:	aa8080e7          	jalr	-1368(ra) # 80006134 <_Z8printIntiii>
    80004694:	00006517          	auipc	a0,0x6
    80004698:	ad450513          	addi	a0,a0,-1324 # 8000a168 <CONSOLE_STATUS+0x158>
    8000469c:	00002097          	auipc	ra,0x2
    800046a0:	8e8080e7          	jalr	-1816(ra) # 80005f84 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800046a4:	00c00513          	li	a0,12
    800046a8:	00000097          	auipc	ra,0x0
    800046ac:	d40080e7          	jalr	-704(ra) # 800043e8 <_ZL9fibonaccim>
    800046b0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800046b4:	00006517          	auipc	a0,0x6
    800046b8:	b4450513          	addi	a0,a0,-1212 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    800046bc:	00002097          	auipc	ra,0x2
    800046c0:	8c8080e7          	jalr	-1848(ra) # 80005f84 <_Z11printStringPKc>
    800046c4:	00000613          	li	a2,0
    800046c8:	00a00593          	li	a1,10
    800046cc:	0009051b          	sext.w	a0,s2
    800046d0:	00002097          	auipc	ra,0x2
    800046d4:	a64080e7          	jalr	-1436(ra) # 80006134 <_Z8printIntiii>
    800046d8:	00006517          	auipc	a0,0x6
    800046dc:	a9050513          	addi	a0,a0,-1392 # 8000a168 <CONSOLE_STATUS+0x158>
    800046e0:	00002097          	auipc	ra,0x2
    800046e4:	8a4080e7          	jalr	-1884(ra) # 80005f84 <_Z11printStringPKc>
    800046e8:	0400006f          	j	80004728 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800046ec:	00006517          	auipc	a0,0x6
    800046f0:	aec50513          	addi	a0,a0,-1300 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    800046f4:	00002097          	auipc	ra,0x2
    800046f8:	890080e7          	jalr	-1904(ra) # 80005f84 <_Z11printStringPKc>
    800046fc:	00000613          	li	a2,0
    80004700:	00a00593          	li	a1,10
    80004704:	00048513          	mv	a0,s1
    80004708:	00002097          	auipc	ra,0x2
    8000470c:	a2c080e7          	jalr	-1492(ra) # 80006134 <_Z8printIntiii>
    80004710:	00006517          	auipc	a0,0x6
    80004714:	a5850513          	addi	a0,a0,-1448 # 8000a168 <CONSOLE_STATUS+0x158>
    80004718:	00002097          	auipc	ra,0x2
    8000471c:	86c080e7          	jalr	-1940(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004720:	0014849b          	addiw	s1,s1,1
    80004724:	0ff4f493          	andi	s1,s1,255
    80004728:	00500793          	li	a5,5
    8000472c:	fc97f0e3          	bgeu	a5,s1,800046ec <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004730:	00006517          	auipc	a0,0x6
    80004734:	a8050513          	addi	a0,a0,-1408 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80004738:	00002097          	auipc	ra,0x2
    8000473c:	84c080e7          	jalr	-1972(ra) # 80005f84 <_Z11printStringPKc>
    finishedC = true;
    80004740:	00100793          	li	a5,1
    80004744:	00009717          	auipc	a4,0x9
    80004748:	b0f70323          	sb	a5,-1274(a4) # 8000d24a <_ZL9finishedC>

    thread_dispatch();
    8000474c:	ffffd097          	auipc	ra,0xffffd
    80004750:	f28080e7          	jalr	-216(ra) # 80001674 <thread_dispatch>

}
    80004754:	01813083          	ld	ra,24(sp)
    80004758:	01013403          	ld	s0,16(sp)
    8000475c:	00813483          	ld	s1,8(sp)
    80004760:	00013903          	ld	s2,0(sp)
    80004764:	02010113          	addi	sp,sp,32
    80004768:	00008067          	ret

000000008000476c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000476c:	fe010113          	addi	sp,sp,-32
    80004770:	00113c23          	sd	ra,24(sp)
    80004774:	00813823          	sd	s0,16(sp)
    80004778:	00913423          	sd	s1,8(sp)
    8000477c:	01213023          	sd	s2,0(sp)
    80004780:	02010413          	addi	s0,sp,32

    uint8 i = 10;
    80004784:	00a00493          	li	s1,10
    80004788:	0400006f          	j	800047c8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000478c:	00006517          	auipc	a0,0x6
    80004790:	a7c50513          	addi	a0,a0,-1412 # 8000a208 <CONSOLE_STATUS+0x1f8>
    80004794:	00001097          	auipc	ra,0x1
    80004798:	7f0080e7          	jalr	2032(ra) # 80005f84 <_Z11printStringPKc>
    8000479c:	00000613          	li	a2,0
    800047a0:	00a00593          	li	a1,10
    800047a4:	00048513          	mv	a0,s1
    800047a8:	00002097          	auipc	ra,0x2
    800047ac:	98c080e7          	jalr	-1652(ra) # 80006134 <_Z8printIntiii>
    800047b0:	00006517          	auipc	a0,0x6
    800047b4:	9b850513          	addi	a0,a0,-1608 # 8000a168 <CONSOLE_STATUS+0x158>
    800047b8:	00001097          	auipc	ra,0x1
    800047bc:	7cc080e7          	jalr	1996(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800047c0:	0014849b          	addiw	s1,s1,1
    800047c4:	0ff4f493          	andi	s1,s1,255
    800047c8:	00c00793          	li	a5,12
    800047cc:	fc97f0e3          	bgeu	a5,s1,8000478c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800047d0:	00006517          	auipc	a0,0x6
    800047d4:	a4050513          	addi	a0,a0,-1472 # 8000a210 <CONSOLE_STATUS+0x200>
    800047d8:	00001097          	auipc	ra,0x1
    800047dc:	7ac080e7          	jalr	1964(ra) # 80005f84 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800047e0:	00500313          	li	t1,5

    thread_dispatch();
    800047e4:	ffffd097          	auipc	ra,0xffffd
    800047e8:	e90080e7          	jalr	-368(ra) # 80001674 <thread_dispatch>


    uint64 result = fibonacci(16);
    800047ec:	01000513          	li	a0,16
    800047f0:	00000097          	auipc	ra,0x0
    800047f4:	bf8080e7          	jalr	-1032(ra) # 800043e8 <_ZL9fibonaccim>
    800047f8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800047fc:	00006517          	auipc	a0,0x6
    80004800:	a2450513          	addi	a0,a0,-1500 # 8000a220 <CONSOLE_STATUS+0x210>
    80004804:	00001097          	auipc	ra,0x1
    80004808:	780080e7          	jalr	1920(ra) # 80005f84 <_Z11printStringPKc>
    8000480c:	00000613          	li	a2,0
    80004810:	00a00593          	li	a1,10
    80004814:	0009051b          	sext.w	a0,s2
    80004818:	00002097          	auipc	ra,0x2
    8000481c:	91c080e7          	jalr	-1764(ra) # 80006134 <_Z8printIntiii>
    80004820:	00006517          	auipc	a0,0x6
    80004824:	94850513          	addi	a0,a0,-1720 # 8000a168 <CONSOLE_STATUS+0x158>
    80004828:	00001097          	auipc	ra,0x1
    8000482c:	75c080e7          	jalr	1884(ra) # 80005f84 <_Z11printStringPKc>
    80004830:	0400006f          	j	80004870 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004834:	00006517          	auipc	a0,0x6
    80004838:	9d450513          	addi	a0,a0,-1580 # 8000a208 <CONSOLE_STATUS+0x1f8>
    8000483c:	00001097          	auipc	ra,0x1
    80004840:	748080e7          	jalr	1864(ra) # 80005f84 <_Z11printStringPKc>
    80004844:	00000613          	li	a2,0
    80004848:	00a00593          	li	a1,10
    8000484c:	00048513          	mv	a0,s1
    80004850:	00002097          	auipc	ra,0x2
    80004854:	8e4080e7          	jalr	-1820(ra) # 80006134 <_Z8printIntiii>
    80004858:	00006517          	auipc	a0,0x6
    8000485c:	91050513          	addi	a0,a0,-1776 # 8000a168 <CONSOLE_STATUS+0x158>
    80004860:	00001097          	auipc	ra,0x1
    80004864:	724080e7          	jalr	1828(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004868:	0014849b          	addiw	s1,s1,1
    8000486c:	0ff4f493          	andi	s1,s1,255
    80004870:	00f00793          	li	a5,15
    80004874:	fc97f0e3          	bgeu	a5,s1,80004834 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004878:	00006517          	auipc	a0,0x6
    8000487c:	9b850513          	addi	a0,a0,-1608 # 8000a230 <CONSOLE_STATUS+0x220>
    80004880:	00001097          	auipc	ra,0x1
    80004884:	704080e7          	jalr	1796(ra) # 80005f84 <_Z11printStringPKc>
    finishedD = true;
    80004888:	00100793          	li	a5,1
    8000488c:	00009717          	auipc	a4,0x9
    80004890:	9af70fa3          	sb	a5,-1601(a4) # 8000d24b <_ZL9finishedD>

    thread_dispatch();
    80004894:	ffffd097          	auipc	ra,0xffffd
    80004898:	de0080e7          	jalr	-544(ra) # 80001674 <thread_dispatch>

}
    8000489c:	01813083          	ld	ra,24(sp)
    800048a0:	01013403          	ld	s0,16(sp)
    800048a4:	00813483          	ld	s1,8(sp)
    800048a8:	00013903          	ld	s2,0(sp)
    800048ac:	02010113          	addi	sp,sp,32
    800048b0:	00008067          	ret

00000000800048b4 <_Z20Threads_CPP_API_testv>:

void Threads_CPP_API_test() {
    800048b4:	fc010113          	addi	sp,sp,-64
    800048b8:	02113c23          	sd	ra,56(sp)
    800048bc:	02813823          	sd	s0,48(sp)
    800048c0:	02913423          	sd	s1,40(sp)
    800048c4:	03213023          	sd	s2,32(sp)
    800048c8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800048cc:	0a800513          	li	a0,168
    800048d0:	ffffe097          	auipc	ra,0xffffe
    800048d4:	eac080e7          	jalr	-340(ra) # 8000277c <_ZN6ThreadnwEm>
    800048d8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800048dc:	ffffe097          	auipc	ra,0xffffe
    800048e0:	b4c080e7          	jalr	-1204(ra) # 80002428 <_ZN6ThreadC1Ev>
    800048e4:	00008797          	auipc	a5,0x8
    800048e8:	23478793          	addi	a5,a5,564 # 8000cb18 <_ZTV7WorkerA+0x10>
    800048ec:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800048f0:	fc943023          	sd	s1,-64(s0)
   printString("ThreadA created\n");
    800048f4:	00006517          	auipc	a0,0x6
    800048f8:	94c50513          	addi	a0,a0,-1716 # 8000a240 <CONSOLE_STATUS+0x230>
    800048fc:	00001097          	auipc	ra,0x1
    80004900:	688080e7          	jalr	1672(ra) # 80005f84 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004904:	0a800513          	li	a0,168
    80004908:	ffffe097          	auipc	ra,0xffffe
    8000490c:	e74080e7          	jalr	-396(ra) # 8000277c <_ZN6ThreadnwEm>
    80004910:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004914:	ffffe097          	auipc	ra,0xffffe
    80004918:	b14080e7          	jalr	-1260(ra) # 80002428 <_ZN6ThreadC1Ev>
    8000491c:	00008797          	auipc	a5,0x8
    80004920:	22478793          	addi	a5,a5,548 # 8000cb40 <_ZTV7WorkerB+0x10>
    80004924:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004928:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000492c:	00006517          	auipc	a0,0x6
    80004930:	92c50513          	addi	a0,a0,-1748 # 8000a258 <CONSOLE_STATUS+0x248>
    80004934:	00001097          	auipc	ra,0x1
    80004938:	650080e7          	jalr	1616(ra) # 80005f84 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000493c:	0a800513          	li	a0,168
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	e3c080e7          	jalr	-452(ra) # 8000277c <_ZN6ThreadnwEm>
    80004948:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000494c:	ffffe097          	auipc	ra,0xffffe
    80004950:	adc080e7          	jalr	-1316(ra) # 80002428 <_ZN6ThreadC1Ev>
    80004954:	00008797          	auipc	a5,0x8
    80004958:	21478793          	addi	a5,a5,532 # 8000cb68 <_ZTV7WorkerC+0x10>
    8000495c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004960:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004964:	00006517          	auipc	a0,0x6
    80004968:	90c50513          	addi	a0,a0,-1780 # 8000a270 <CONSOLE_STATUS+0x260>
    8000496c:	00001097          	auipc	ra,0x1
    80004970:	618080e7          	jalr	1560(ra) # 80005f84 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004974:	0a800513          	li	a0,168
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	e04080e7          	jalr	-508(ra) # 8000277c <_ZN6ThreadnwEm>
    80004980:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004984:	ffffe097          	auipc	ra,0xffffe
    80004988:	aa4080e7          	jalr	-1372(ra) # 80002428 <_ZN6ThreadC1Ev>
    8000498c:	00008797          	auipc	a5,0x8
    80004990:	20478793          	addi	a5,a5,516 # 8000cb90 <_ZTV7WorkerD+0x10>
    80004994:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004998:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    8000499c:	00006517          	auipc	a0,0x6
    800049a0:	8ec50513          	addi	a0,a0,-1812 # 8000a288 <CONSOLE_STATUS+0x278>
    800049a4:	00001097          	auipc	ra,0x1
    800049a8:	5e0080e7          	jalr	1504(ra) # 80005f84 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800049ac:	00000493          	li	s1,0
    800049b0:	00300793          	li	a5,3
    800049b4:	0297c663          	blt	a5,s1,800049e0 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800049b8:	00349793          	slli	a5,s1,0x3
    800049bc:	fe040713          	addi	a4,s0,-32
    800049c0:	00f707b3          	add	a5,a4,a5
    800049c4:	fe07b503          	ld	a0,-32(a5)
    800049c8:	ffffe097          	auipc	ra,0xffffe
    800049cc:	f6c080e7          	jalr	-148(ra) # 80002934 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800049d0:	0014849b          	addiw	s1,s1,1
    800049d4:	fddff06f          	j	800049b0 <_Z20Threads_CPP_API_testv+0xfc>
    }


    while (!(finishedA && finishedB && finishedC && finishedD)) {

        Thread::dispatch();
    800049d8:	ffffe097          	auipc	ra,0xffffe
    800049dc:	f34080e7          	jalr	-204(ra) # 8000290c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800049e0:	00009797          	auipc	a5,0x9
    800049e4:	8687c783          	lbu	a5,-1944(a5) # 8000d248 <_ZL9finishedA>
    800049e8:	fe0788e3          	beqz	a5,800049d8 <_Z20Threads_CPP_API_testv+0x124>
    800049ec:	00009797          	auipc	a5,0x9
    800049f0:	85d7c783          	lbu	a5,-1955(a5) # 8000d249 <_ZL9finishedB>
    800049f4:	fe0782e3          	beqz	a5,800049d8 <_Z20Threads_CPP_API_testv+0x124>
    800049f8:	00009797          	auipc	a5,0x9
    800049fc:	8527c783          	lbu	a5,-1966(a5) # 8000d24a <_ZL9finishedC>
    80004a00:	fc078ce3          	beqz	a5,800049d8 <_Z20Threads_CPP_API_testv+0x124>
    80004a04:	00009797          	auipc	a5,0x9
    80004a08:	8477c783          	lbu	a5,-1977(a5) # 8000d24b <_ZL9finishedD>
    80004a0c:	fc0786e3          	beqz	a5,800049d8 <_Z20Threads_CPP_API_testv+0x124>
    80004a10:	fc040493          	addi	s1,s0,-64
    80004a14:	0080006f          	j	80004a1c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004a18:	00848493          	addi	s1,s1,8
    80004a1c:	fe040793          	addi	a5,s0,-32
    80004a20:	08f48663          	beq	s1,a5,80004aac <_Z20Threads_CPP_API_testv+0x1f8>
    80004a24:	0004b503          	ld	a0,0(s1)
    80004a28:	fe0508e3          	beqz	a0,80004a18 <_Z20Threads_CPP_API_testv+0x164>
    80004a2c:	00053783          	ld	a5,0(a0)
    80004a30:	0087b783          	ld	a5,8(a5)
    80004a34:	000780e7          	jalr	a5
    80004a38:	fe1ff06f          	j	80004a18 <_Z20Threads_CPP_API_testv+0x164>
    80004a3c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004a40:	00048513          	mv	a0,s1
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	e58080e7          	jalr	-424(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004a4c:	00090513          	mv	a0,s2
    80004a50:	0000a097          	auipc	ra,0xa
    80004a54:	908080e7          	jalr	-1784(ra) # 8000e358 <_Unwind_Resume>
    80004a58:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004a5c:	00048513          	mv	a0,s1
    80004a60:	ffffe097          	auipc	ra,0xffffe
    80004a64:	e3c080e7          	jalr	-452(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004a68:	00090513          	mv	a0,s2
    80004a6c:	0000a097          	auipc	ra,0xa
    80004a70:	8ec080e7          	jalr	-1812(ra) # 8000e358 <_Unwind_Resume>
    80004a74:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004a78:	00048513          	mv	a0,s1
    80004a7c:	ffffe097          	auipc	ra,0xffffe
    80004a80:	e20080e7          	jalr	-480(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004a84:	00090513          	mv	a0,s2
    80004a88:	0000a097          	auipc	ra,0xa
    80004a8c:	8d0080e7          	jalr	-1840(ra) # 8000e358 <_Unwind_Resume>
    80004a90:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004a94:	00048513          	mv	a0,s1
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	e04080e7          	jalr	-508(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004aa0:	00090513          	mv	a0,s2
    80004aa4:	0000a097          	auipc	ra,0xa
    80004aa8:	8b4080e7          	jalr	-1868(ra) # 8000e358 <_Unwind_Resume>
}
    80004aac:	03813083          	ld	ra,56(sp)
    80004ab0:	03013403          	ld	s0,48(sp)
    80004ab4:	02813483          	ld	s1,40(sp)
    80004ab8:	02013903          	ld	s2,32(sp)
    80004abc:	04010113          	addi	sp,sp,64
    80004ac0:	00008067          	ret

0000000080004ac4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004ac4:	ff010113          	addi	sp,sp,-16
    80004ac8:	00113423          	sd	ra,8(sp)
    80004acc:	00813023          	sd	s0,0(sp)
    80004ad0:	01010413          	addi	s0,sp,16
    80004ad4:	00008797          	auipc	a5,0x8
    80004ad8:	04478793          	addi	a5,a5,68 # 8000cb18 <_ZTV7WorkerA+0x10>
    80004adc:	00f53023          	sd	a5,0(a0)
    80004ae0:	ffffd097          	auipc	ra,0xffffd
    80004ae4:	6c4080e7          	jalr	1732(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004ae8:	00813083          	ld	ra,8(sp)
    80004aec:	00013403          	ld	s0,0(sp)
    80004af0:	01010113          	addi	sp,sp,16
    80004af4:	00008067          	ret

0000000080004af8 <_ZN7WorkerAD0Ev>:
    80004af8:	fe010113          	addi	sp,sp,-32
    80004afc:	00113c23          	sd	ra,24(sp)
    80004b00:	00813823          	sd	s0,16(sp)
    80004b04:	00913423          	sd	s1,8(sp)
    80004b08:	02010413          	addi	s0,sp,32
    80004b0c:	00050493          	mv	s1,a0
    80004b10:	00008797          	auipc	a5,0x8
    80004b14:	00878793          	addi	a5,a5,8 # 8000cb18 <_ZTV7WorkerA+0x10>
    80004b18:	00f53023          	sd	a5,0(a0)
    80004b1c:	ffffd097          	auipc	ra,0xffffd
    80004b20:	688080e7          	jalr	1672(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004b24:	00048513          	mv	a0,s1
    80004b28:	ffffe097          	auipc	ra,0xffffe
    80004b2c:	d74080e7          	jalr	-652(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004b30:	01813083          	ld	ra,24(sp)
    80004b34:	01013403          	ld	s0,16(sp)
    80004b38:	00813483          	ld	s1,8(sp)
    80004b3c:	02010113          	addi	sp,sp,32
    80004b40:	00008067          	ret

0000000080004b44 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004b44:	ff010113          	addi	sp,sp,-16
    80004b48:	00113423          	sd	ra,8(sp)
    80004b4c:	00813023          	sd	s0,0(sp)
    80004b50:	01010413          	addi	s0,sp,16
    80004b54:	00008797          	auipc	a5,0x8
    80004b58:	fec78793          	addi	a5,a5,-20 # 8000cb40 <_ZTV7WorkerB+0x10>
    80004b5c:	00f53023          	sd	a5,0(a0)
    80004b60:	ffffd097          	auipc	ra,0xffffd
    80004b64:	644080e7          	jalr	1604(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004b68:	00813083          	ld	ra,8(sp)
    80004b6c:	00013403          	ld	s0,0(sp)
    80004b70:	01010113          	addi	sp,sp,16
    80004b74:	00008067          	ret

0000000080004b78 <_ZN7WorkerBD0Ev>:
    80004b78:	fe010113          	addi	sp,sp,-32
    80004b7c:	00113c23          	sd	ra,24(sp)
    80004b80:	00813823          	sd	s0,16(sp)
    80004b84:	00913423          	sd	s1,8(sp)
    80004b88:	02010413          	addi	s0,sp,32
    80004b8c:	00050493          	mv	s1,a0
    80004b90:	00008797          	auipc	a5,0x8
    80004b94:	fb078793          	addi	a5,a5,-80 # 8000cb40 <_ZTV7WorkerB+0x10>
    80004b98:	00f53023          	sd	a5,0(a0)
    80004b9c:	ffffd097          	auipc	ra,0xffffd
    80004ba0:	608080e7          	jalr	1544(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004ba4:	00048513          	mv	a0,s1
    80004ba8:	ffffe097          	auipc	ra,0xffffe
    80004bac:	cf4080e7          	jalr	-780(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004bb0:	01813083          	ld	ra,24(sp)
    80004bb4:	01013403          	ld	s0,16(sp)
    80004bb8:	00813483          	ld	s1,8(sp)
    80004bbc:	02010113          	addi	sp,sp,32
    80004bc0:	00008067          	ret

0000000080004bc4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004bc4:	ff010113          	addi	sp,sp,-16
    80004bc8:	00113423          	sd	ra,8(sp)
    80004bcc:	00813023          	sd	s0,0(sp)
    80004bd0:	01010413          	addi	s0,sp,16
    80004bd4:	00008797          	auipc	a5,0x8
    80004bd8:	f9478793          	addi	a5,a5,-108 # 8000cb68 <_ZTV7WorkerC+0x10>
    80004bdc:	00f53023          	sd	a5,0(a0)
    80004be0:	ffffd097          	auipc	ra,0xffffd
    80004be4:	5c4080e7          	jalr	1476(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004be8:	00813083          	ld	ra,8(sp)
    80004bec:	00013403          	ld	s0,0(sp)
    80004bf0:	01010113          	addi	sp,sp,16
    80004bf4:	00008067          	ret

0000000080004bf8 <_ZN7WorkerCD0Ev>:
    80004bf8:	fe010113          	addi	sp,sp,-32
    80004bfc:	00113c23          	sd	ra,24(sp)
    80004c00:	00813823          	sd	s0,16(sp)
    80004c04:	00913423          	sd	s1,8(sp)
    80004c08:	02010413          	addi	s0,sp,32
    80004c0c:	00050493          	mv	s1,a0
    80004c10:	00008797          	auipc	a5,0x8
    80004c14:	f5878793          	addi	a5,a5,-168 # 8000cb68 <_ZTV7WorkerC+0x10>
    80004c18:	00f53023          	sd	a5,0(a0)
    80004c1c:	ffffd097          	auipc	ra,0xffffd
    80004c20:	588080e7          	jalr	1416(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004c24:	00048513          	mv	a0,s1
    80004c28:	ffffe097          	auipc	ra,0xffffe
    80004c2c:	c74080e7          	jalr	-908(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004c30:	01813083          	ld	ra,24(sp)
    80004c34:	01013403          	ld	s0,16(sp)
    80004c38:	00813483          	ld	s1,8(sp)
    80004c3c:	02010113          	addi	sp,sp,32
    80004c40:	00008067          	ret

0000000080004c44 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004c44:	ff010113          	addi	sp,sp,-16
    80004c48:	00113423          	sd	ra,8(sp)
    80004c4c:	00813023          	sd	s0,0(sp)
    80004c50:	01010413          	addi	s0,sp,16
    80004c54:	00008797          	auipc	a5,0x8
    80004c58:	f3c78793          	addi	a5,a5,-196 # 8000cb90 <_ZTV7WorkerD+0x10>
    80004c5c:	00f53023          	sd	a5,0(a0)
    80004c60:	ffffd097          	auipc	ra,0xffffd
    80004c64:	544080e7          	jalr	1348(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004c68:	00813083          	ld	ra,8(sp)
    80004c6c:	00013403          	ld	s0,0(sp)
    80004c70:	01010113          	addi	sp,sp,16
    80004c74:	00008067          	ret

0000000080004c78 <_ZN7WorkerDD0Ev>:
    80004c78:	fe010113          	addi	sp,sp,-32
    80004c7c:	00113c23          	sd	ra,24(sp)
    80004c80:	00813823          	sd	s0,16(sp)
    80004c84:	00913423          	sd	s1,8(sp)
    80004c88:	02010413          	addi	s0,sp,32
    80004c8c:	00050493          	mv	s1,a0
    80004c90:	00008797          	auipc	a5,0x8
    80004c94:	f0078793          	addi	a5,a5,-256 # 8000cb90 <_ZTV7WorkerD+0x10>
    80004c98:	00f53023          	sd	a5,0(a0)
    80004c9c:	ffffd097          	auipc	ra,0xffffd
    80004ca0:	508080e7          	jalr	1288(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80004ca4:	00048513          	mv	a0,s1
    80004ca8:	ffffe097          	auipc	ra,0xffffe
    80004cac:	bf4080e7          	jalr	-1036(ra) # 8000289c <_ZN6ThreaddlEPv>
    80004cb0:	01813083          	ld	ra,24(sp)
    80004cb4:	01013403          	ld	s0,16(sp)
    80004cb8:	00813483          	ld	s1,8(sp)
    80004cbc:	02010113          	addi	sp,sp,32
    80004cc0:	00008067          	ret

0000000080004cc4 <_ZN7WorkerA3runEv>:
    void run() override {
    80004cc4:	ff010113          	addi	sp,sp,-16
    80004cc8:	00113423          	sd	ra,8(sp)
    80004ccc:	00813023          	sd	s0,0(sp)
    80004cd0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004cd4:	00000593          	li	a1,0
    80004cd8:	fffff097          	auipc	ra,0xfffff
    80004cdc:	784080e7          	jalr	1924(ra) # 8000445c <_ZN7WorkerA11workerBodyAEPv>
    }
    80004ce0:	00813083          	ld	ra,8(sp)
    80004ce4:	00013403          	ld	s0,0(sp)
    80004ce8:	01010113          	addi	sp,sp,16
    80004cec:	00008067          	ret

0000000080004cf0 <_ZN7WorkerB3runEv>:
    void run() override {
    80004cf0:	ff010113          	addi	sp,sp,-16
    80004cf4:	00113423          	sd	ra,8(sp)
    80004cf8:	00813023          	sd	s0,0(sp)
    80004cfc:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004d00:	00000593          	li	a1,0
    80004d04:	00000097          	auipc	ra,0x0
    80004d08:	81c080e7          	jalr	-2020(ra) # 80004520 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004d0c:	00813083          	ld	ra,8(sp)
    80004d10:	00013403          	ld	s0,0(sp)
    80004d14:	01010113          	addi	sp,sp,16
    80004d18:	00008067          	ret

0000000080004d1c <_ZN7WorkerC3runEv>:
    void run() override {
    80004d1c:	ff010113          	addi	sp,sp,-16
    80004d20:	00113423          	sd	ra,8(sp)
    80004d24:	00813023          	sd	s0,0(sp)
    80004d28:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004d2c:	00000593          	li	a1,0
    80004d30:	00000097          	auipc	ra,0x0
    80004d34:	8bc080e7          	jalr	-1860(ra) # 800045ec <_ZN7WorkerC11workerBodyCEPv>
    }
    80004d38:	00813083          	ld	ra,8(sp)
    80004d3c:	00013403          	ld	s0,0(sp)
    80004d40:	01010113          	addi	sp,sp,16
    80004d44:	00008067          	ret

0000000080004d48 <_ZN7WorkerD3runEv>:
    void run() override {
    80004d48:	ff010113          	addi	sp,sp,-16
    80004d4c:	00113423          	sd	ra,8(sp)
    80004d50:	00813023          	sd	s0,0(sp)
    80004d54:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004d58:	00000593          	li	a1,0
    80004d5c:	00000097          	auipc	ra,0x0
    80004d60:	a10080e7          	jalr	-1520(ra) # 8000476c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004d64:	00813083          	ld	ra,8(sp)
    80004d68:	00013403          	ld	s0,0(sp)
    80004d6c:	01010113          	addi	sp,sp,16
    80004d70:	00008067          	ret

0000000080004d74 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004d74:	f8010113          	addi	sp,sp,-128
    80004d78:	06113c23          	sd	ra,120(sp)
    80004d7c:	06813823          	sd	s0,112(sp)
    80004d80:	06913423          	sd	s1,104(sp)
    80004d84:	07213023          	sd	s2,96(sp)
    80004d88:	05313c23          	sd	s3,88(sp)
    80004d8c:	05413823          	sd	s4,80(sp)
    80004d90:	05513423          	sd	s5,72(sp)
    80004d94:	05613023          	sd	s6,64(sp)
    80004d98:	03713c23          	sd	s7,56(sp)
    80004d9c:	03813823          	sd	s8,48(sp)
    80004da0:	03913423          	sd	s9,40(sp)
    80004da4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004da8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004dac:	00005517          	auipc	a0,0x5
    80004db0:	38450513          	addi	a0,a0,900 # 8000a130 <CONSOLE_STATUS+0x120>
    80004db4:	00001097          	auipc	ra,0x1
    80004db8:	1d0080e7          	jalr	464(ra) # 80005f84 <_Z11printStringPKc>
    getString(input, 30);
    80004dbc:	01e00593          	li	a1,30
    80004dc0:	f8040493          	addi	s1,s0,-128
    80004dc4:	00048513          	mv	a0,s1
    80004dc8:	00001097          	auipc	ra,0x1
    80004dcc:	244080e7          	jalr	580(ra) # 8000600c <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004dd0:	00048513          	mv	a0,s1
    80004dd4:	00001097          	auipc	ra,0x1
    80004dd8:	310080e7          	jalr	784(ra) # 800060e4 <_Z11stringToIntPKc>
    80004ddc:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004de0:	00005517          	auipc	a0,0x5
    80004de4:	37050513          	addi	a0,a0,880 # 8000a150 <CONSOLE_STATUS+0x140>
    80004de8:	00001097          	auipc	ra,0x1
    80004dec:	19c080e7          	jalr	412(ra) # 80005f84 <_Z11printStringPKc>
    getString(input, 30);
    80004df0:	01e00593          	li	a1,30
    80004df4:	00048513          	mv	a0,s1
    80004df8:	00001097          	auipc	ra,0x1
    80004dfc:	214080e7          	jalr	532(ra) # 8000600c <_Z9getStringPci>
    n = stringToInt(input);
    80004e00:	00048513          	mv	a0,s1
    80004e04:	00001097          	auipc	ra,0x1
    80004e08:	2e0080e7          	jalr	736(ra) # 800060e4 <_Z11stringToIntPKc>
    80004e0c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004e10:	00005517          	auipc	a0,0x5
    80004e14:	36050513          	addi	a0,a0,864 # 8000a170 <CONSOLE_STATUS+0x160>
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	16c080e7          	jalr	364(ra) # 80005f84 <_Z11printStringPKc>
    printInt(threadNum);
    80004e20:	00000613          	li	a2,0
    80004e24:	00a00593          	li	a1,10
    80004e28:	00098513          	mv	a0,s3
    80004e2c:	00001097          	auipc	ra,0x1
    80004e30:	308080e7          	jalr	776(ra) # 80006134 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004e34:	00005517          	auipc	a0,0x5
    80004e38:	35450513          	addi	a0,a0,852 # 8000a188 <CONSOLE_STATUS+0x178>
    80004e3c:	00001097          	auipc	ra,0x1
    80004e40:	148080e7          	jalr	328(ra) # 80005f84 <_Z11printStringPKc>
    printInt(n);
    80004e44:	00000613          	li	a2,0
    80004e48:	00a00593          	li	a1,10
    80004e4c:	00048513          	mv	a0,s1
    80004e50:	00001097          	auipc	ra,0x1
    80004e54:	2e4080e7          	jalr	740(ra) # 80006134 <_Z8printIntiii>
    printString(".\n");
    80004e58:	00005517          	auipc	a0,0x5
    80004e5c:	34850513          	addi	a0,a0,840 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80004e60:	00001097          	auipc	ra,0x1
    80004e64:	124080e7          	jalr	292(ra) # 80005f84 <_Z11printStringPKc>
    if (threadNum > n) {
    80004e68:	0334c463          	blt	s1,s3,80004e90 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004e6c:	03305c63          	blez	s3,80004ea4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004e70:	03800513          	li	a0,56
    80004e74:	ffffe097          	auipc	ra,0xffffe
    80004e78:	6c4080e7          	jalr	1732(ra) # 80003538 <_Znwm>
    80004e7c:	00050a93          	mv	s5,a0
    80004e80:	00048593          	mv	a1,s1
    80004e84:	00001097          	auipc	ra,0x1
    80004e88:	3d0080e7          	jalr	976(ra) # 80006254 <_ZN9BufferCPPC1Ei>
    80004e8c:	0300006f          	j	80004ebc <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004e90:	00005517          	auipc	a0,0x5
    80004e94:	41050513          	addi	a0,a0,1040 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80004e98:	00001097          	auipc	ra,0x1
    80004e9c:	0ec080e7          	jalr	236(ra) # 80005f84 <_Z11printStringPKc>
        return;
    80004ea0:	0140006f          	j	80004eb4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004ea4:	00005517          	auipc	a0,0x5
    80004ea8:	43c50513          	addi	a0,a0,1084 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004eac:	00001097          	auipc	ra,0x1
    80004eb0:	0d8080e7          	jalr	216(ra) # 80005f84 <_Z11printStringPKc>
        return;
    80004eb4:	000c0113          	mv	sp,s8
    80004eb8:	2140006f          	j	800050cc <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004ebc:	02000513          	li	a0,32
    80004ec0:	ffffd097          	auipc	ra,0xffffd
    80004ec4:	c10080e7          	jalr	-1008(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80004ec8:	00050913          	mv	s2,a0
    80004ecc:	00000593          	li	a1,0
    80004ed0:	ffffd097          	auipc	ra,0xffffd
    80004ed4:	b94080e7          	jalr	-1132(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80004ed8:	00008797          	auipc	a5,0x8
    80004edc:	3927b023          	sd	s2,896(a5) # 8000d258 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004ee0:	00399793          	slli	a5,s3,0x3
    80004ee4:	00f78793          	addi	a5,a5,15
    80004ee8:	ff07f793          	andi	a5,a5,-16
    80004eec:	40f10133          	sub	sp,sp,a5
    80004ef0:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004ef4:	0019871b          	addiw	a4,s3,1
    80004ef8:	00171793          	slli	a5,a4,0x1
    80004efc:	00e787b3          	add	a5,a5,a4
    80004f00:	00379793          	slli	a5,a5,0x3
    80004f04:	00f78793          	addi	a5,a5,15
    80004f08:	ff07f793          	andi	a5,a5,-16
    80004f0c:	40f10133          	sub	sp,sp,a5
    80004f10:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004f14:	00199493          	slli	s1,s3,0x1
    80004f18:	013484b3          	add	s1,s1,s3
    80004f1c:	00349493          	slli	s1,s1,0x3
    80004f20:	009b04b3          	add	s1,s6,s1
    80004f24:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004f28:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004f2c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004f30:	0b000513          	li	a0,176
    80004f34:	ffffe097          	auipc	ra,0xffffe
    80004f38:	848080e7          	jalr	-1976(ra) # 8000277c <_ZN6ThreadnwEm>
    80004f3c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004f40:	ffffd097          	auipc	ra,0xffffd
    80004f44:	4e8080e7          	jalr	1256(ra) # 80002428 <_ZN6ThreadC1Ev>
    80004f48:	00008797          	auipc	a5,0x8
    80004f4c:	cc078793          	addi	a5,a5,-832 # 8000cc08 <_ZTV8Consumer+0x10>
    80004f50:	00fbb023          	sd	a5,0(s7)
    80004f54:	0a9bb423          	sd	s1,168(s7)
    consumer->start();
    80004f58:	000b8513          	mv	a0,s7
    80004f5c:	ffffe097          	auipc	ra,0xffffe
    80004f60:	9d8080e7          	jalr	-1576(ra) # 80002934 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004f64:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004f68:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004f6c:	00008797          	auipc	a5,0x8
    80004f70:	2ec7b783          	ld	a5,748(a5) # 8000d258 <_ZL10waitForAll>
    80004f74:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004f78:	0b000513          	li	a0,176
    80004f7c:	ffffe097          	auipc	ra,0xffffe
    80004f80:	800080e7          	jalr	-2048(ra) # 8000277c <_ZN6ThreadnwEm>
    80004f84:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004f88:	ffffd097          	auipc	ra,0xffffd
    80004f8c:	4a0080e7          	jalr	1184(ra) # 80002428 <_ZN6ThreadC1Ev>
    80004f90:	00008797          	auipc	a5,0x8
    80004f94:	c2878793          	addi	a5,a5,-984 # 8000cbb8 <_ZTV16ProducerKeyborad+0x10>
    80004f98:	00f4b023          	sd	a5,0(s1)
    80004f9c:	0b64b423          	sd	s6,168(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004fa0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004fa4:	00048513          	mv	a0,s1
    80004fa8:	ffffe097          	auipc	ra,0xffffe
    80004fac:	98c080e7          	jalr	-1652(ra) # 80002934 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004fb0:	00100913          	li	s2,1
    80004fb4:	0300006f          	j	80004fe4 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004fb8:	00008797          	auipc	a5,0x8
    80004fbc:	c2878793          	addi	a5,a5,-984 # 8000cbe0 <_ZTV8Producer+0x10>
    80004fc0:	00fcb023          	sd	a5,0(s9)
    80004fc4:	0a9cb423          	sd	s1,168(s9)
        producers[i] = new Producer(&threadData[i]);
    80004fc8:	00391793          	slli	a5,s2,0x3
    80004fcc:	00fa07b3          	add	a5,s4,a5
    80004fd0:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004fd4:	000c8513          	mv	a0,s9
    80004fd8:	ffffe097          	auipc	ra,0xffffe
    80004fdc:	95c080e7          	jalr	-1700(ra) # 80002934 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004fe0:	0019091b          	addiw	s2,s2,1
    80004fe4:	05395263          	bge	s2,s3,80005028 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004fe8:	00191493          	slli	s1,s2,0x1
    80004fec:	012484b3          	add	s1,s1,s2
    80004ff0:	00349493          	slli	s1,s1,0x3
    80004ff4:	009b04b3          	add	s1,s6,s1
    80004ff8:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004ffc:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80005000:	00008797          	auipc	a5,0x8
    80005004:	2587b783          	ld	a5,600(a5) # 8000d258 <_ZL10waitForAll>
    80005008:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    8000500c:	0b000513          	li	a0,176
    80005010:	ffffd097          	auipc	ra,0xffffd
    80005014:	76c080e7          	jalr	1900(ra) # 8000277c <_ZN6ThreadnwEm>
    80005018:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000501c:	ffffd097          	auipc	ra,0xffffd
    80005020:	40c080e7          	jalr	1036(ra) # 80002428 <_ZN6ThreadC1Ev>
    80005024:	f95ff06f          	j	80004fb8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80005028:	ffffe097          	auipc	ra,0xffffe
    8000502c:	8e4080e7          	jalr	-1820(ra) # 8000290c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005030:	00000493          	li	s1,0
    80005034:	0099ce63          	blt	s3,s1,80005050 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80005038:	00008517          	auipc	a0,0x8
    8000503c:	22053503          	ld	a0,544(a0) # 8000d258 <_ZL10waitForAll>
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	e0c080e7          	jalr	-500(ra) # 80001e4c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005048:	0014849b          	addiw	s1,s1,1
    8000504c:	fe9ff06f          	j	80005034 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80005050:	00008517          	auipc	a0,0x8
    80005054:	20853503          	ld	a0,520(a0) # 8000d258 <_ZL10waitForAll>
    80005058:	00050863          	beqz	a0,80005068 <_Z20testConsumerProducerv+0x2f4>
    8000505c:	00053783          	ld	a5,0(a0)
    80005060:	0087b783          	ld	a5,8(a5)
    80005064:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80005068:	00000493          	li	s1,0
    8000506c:	0080006f          	j	80005074 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80005070:	0014849b          	addiw	s1,s1,1
    80005074:	0334d263          	bge	s1,s3,80005098 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80005078:	00349793          	slli	a5,s1,0x3
    8000507c:	00fa07b3          	add	a5,s4,a5
    80005080:	0007b503          	ld	a0,0(a5)
    80005084:	fe0506e3          	beqz	a0,80005070 <_Z20testConsumerProducerv+0x2fc>
    80005088:	00053783          	ld	a5,0(a0)
    8000508c:	0087b783          	ld	a5,8(a5)
    80005090:	000780e7          	jalr	a5
    80005094:	fddff06f          	j	80005070 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80005098:	000b8a63          	beqz	s7,800050ac <_Z20testConsumerProducerv+0x338>
    8000509c:	000bb783          	ld	a5,0(s7)
    800050a0:	0087b783          	ld	a5,8(a5)
    800050a4:	000b8513          	mv	a0,s7
    800050a8:	000780e7          	jalr	a5
    delete buffer;
    800050ac:	000a8e63          	beqz	s5,800050c8 <_Z20testConsumerProducerv+0x354>
    800050b0:	000a8513          	mv	a0,s5
    800050b4:	00001097          	auipc	ra,0x1
    800050b8:	498080e7          	jalr	1176(ra) # 8000654c <_ZN9BufferCPPD1Ev>
    800050bc:	000a8513          	mv	a0,s5
    800050c0:	ffffe097          	auipc	ra,0xffffe
    800050c4:	4c8080e7          	jalr	1224(ra) # 80003588 <_ZdlPv>
    800050c8:	000c0113          	mv	sp,s8
}
    800050cc:	f8040113          	addi	sp,s0,-128
    800050d0:	07813083          	ld	ra,120(sp)
    800050d4:	07013403          	ld	s0,112(sp)
    800050d8:	06813483          	ld	s1,104(sp)
    800050dc:	06013903          	ld	s2,96(sp)
    800050e0:	05813983          	ld	s3,88(sp)
    800050e4:	05013a03          	ld	s4,80(sp)
    800050e8:	04813a83          	ld	s5,72(sp)
    800050ec:	04013b03          	ld	s6,64(sp)
    800050f0:	03813b83          	ld	s7,56(sp)
    800050f4:	03013c03          	ld	s8,48(sp)
    800050f8:	02813c83          	ld	s9,40(sp)
    800050fc:	08010113          	addi	sp,sp,128
    80005100:	00008067          	ret
    80005104:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005108:	000a8513          	mv	a0,s5
    8000510c:	ffffe097          	auipc	ra,0xffffe
    80005110:	47c080e7          	jalr	1148(ra) # 80003588 <_ZdlPv>
    80005114:	00048513          	mv	a0,s1
    80005118:	00009097          	auipc	ra,0x9
    8000511c:	240080e7          	jalr	576(ra) # 8000e358 <_Unwind_Resume>
    80005120:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80005124:	00090513          	mv	a0,s2
    80005128:	ffffd097          	auipc	ra,0xffffd
    8000512c:	9e0080e7          	jalr	-1568(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80005130:	00048513          	mv	a0,s1
    80005134:	00009097          	auipc	ra,0x9
    80005138:	224080e7          	jalr	548(ra) # 8000e358 <_Unwind_Resume>
    8000513c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80005140:	000b8513          	mv	a0,s7
    80005144:	ffffd097          	auipc	ra,0xffffd
    80005148:	758080e7          	jalr	1880(ra) # 8000289c <_ZN6ThreaddlEPv>
    8000514c:	00048513          	mv	a0,s1
    80005150:	00009097          	auipc	ra,0x9
    80005154:	208080e7          	jalr	520(ra) # 8000e358 <_Unwind_Resume>
    80005158:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000515c:	00048513          	mv	a0,s1
    80005160:	ffffd097          	auipc	ra,0xffffd
    80005164:	73c080e7          	jalr	1852(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005168:	00090513          	mv	a0,s2
    8000516c:	00009097          	auipc	ra,0x9
    80005170:	1ec080e7          	jalr	492(ra) # 8000e358 <_Unwind_Resume>
    80005174:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80005178:	000c8513          	mv	a0,s9
    8000517c:	ffffd097          	auipc	ra,0xffffd
    80005180:	720080e7          	jalr	1824(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005184:	00048513          	mv	a0,s1
    80005188:	00009097          	auipc	ra,0x9
    8000518c:	1d0080e7          	jalr	464(ra) # 8000e358 <_Unwind_Resume>

0000000080005190 <_ZN8Consumer3runEv>:
    void run() override {
    80005190:	fd010113          	addi	sp,sp,-48
    80005194:	02113423          	sd	ra,40(sp)
    80005198:	02813023          	sd	s0,32(sp)
    8000519c:	00913c23          	sd	s1,24(sp)
    800051a0:	01213823          	sd	s2,16(sp)
    800051a4:	01313423          	sd	s3,8(sp)
    800051a8:	03010413          	addi	s0,sp,48
    800051ac:	00050913          	mv	s2,a0
        int i = 0;
    800051b0:	00000993          	li	s3,0
    800051b4:	0100006f          	j	800051c4 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    800051b8:	00a00513          	li	a0,10
    800051bc:	ffffe097          	auipc	ra,0xffffe
    800051c0:	d60080e7          	jalr	-672(ra) # 80002f1c <_ZN7Console4putcEc>
        while (!threadEnd) {
    800051c4:	00008797          	auipc	a5,0x8
    800051c8:	08c7a783          	lw	a5,140(a5) # 8000d250 <_ZL9threadEnd>
    800051cc:	04079a63          	bnez	a5,80005220 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    800051d0:	0a893783          	ld	a5,168(s2)
    800051d4:	0087b503          	ld	a0,8(a5)
    800051d8:	00001097          	auipc	ra,0x1
    800051dc:	260080e7          	jalr	608(ra) # 80006438 <_ZN9BufferCPP3getEv>
            i++;
    800051e0:	0019849b          	addiw	s1,s3,1
    800051e4:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    800051e8:	0ff57513          	andi	a0,a0,255
    800051ec:	ffffe097          	auipc	ra,0xffffe
    800051f0:	d30080e7          	jalr	-720(ra) # 80002f1c <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    800051f4:	05000793          	li	a5,80
    800051f8:	02f4e4bb          	remw	s1,s1,a5
    800051fc:	fc0494e3          	bnez	s1,800051c4 <_ZN8Consumer3runEv+0x34>
    80005200:	fb9ff06f          	j	800051b8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005204:	0a893783          	ld	a5,168(s2)
    80005208:	0087b503          	ld	a0,8(a5)
    8000520c:	00001097          	auipc	ra,0x1
    80005210:	22c080e7          	jalr	556(ra) # 80006438 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005214:	0ff57513          	andi	a0,a0,255
    80005218:	ffffe097          	auipc	ra,0xffffe
    8000521c:	d04080e7          	jalr	-764(ra) # 80002f1c <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005220:	0a893783          	ld	a5,168(s2)
    80005224:	0087b503          	ld	a0,8(a5)
    80005228:	00001097          	auipc	ra,0x1
    8000522c:	29c080e7          	jalr	668(ra) # 800064c4 <_ZN9BufferCPP6getCntEv>
    80005230:	fca04ae3          	bgtz	a0,80005204 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005234:	0a893783          	ld	a5,168(s2)
    80005238:	0107b503          	ld	a0,16(a5)
    8000523c:	ffffd097          	auipc	ra,0xffffd
    80005240:	ce8080e7          	jalr	-792(ra) # 80001f24 <_ZN9Semaphore6signalEv>
    }
    80005244:	02813083          	ld	ra,40(sp)
    80005248:	02013403          	ld	s0,32(sp)
    8000524c:	01813483          	ld	s1,24(sp)
    80005250:	01013903          	ld	s2,16(sp)
    80005254:	00813983          	ld	s3,8(sp)
    80005258:	03010113          	addi	sp,sp,48
    8000525c:	00008067          	ret

0000000080005260 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005260:	ff010113          	addi	sp,sp,-16
    80005264:	00113423          	sd	ra,8(sp)
    80005268:	00813023          	sd	s0,0(sp)
    8000526c:	01010413          	addi	s0,sp,16
    80005270:	00008797          	auipc	a5,0x8
    80005274:	99878793          	addi	a5,a5,-1640 # 8000cc08 <_ZTV8Consumer+0x10>
    80005278:	00f53023          	sd	a5,0(a0)
    8000527c:	ffffd097          	auipc	ra,0xffffd
    80005280:	f28080e7          	jalr	-216(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005284:	00813083          	ld	ra,8(sp)
    80005288:	00013403          	ld	s0,0(sp)
    8000528c:	01010113          	addi	sp,sp,16
    80005290:	00008067          	ret

0000000080005294 <_ZN8ConsumerD0Ev>:
    80005294:	fe010113          	addi	sp,sp,-32
    80005298:	00113c23          	sd	ra,24(sp)
    8000529c:	00813823          	sd	s0,16(sp)
    800052a0:	00913423          	sd	s1,8(sp)
    800052a4:	02010413          	addi	s0,sp,32
    800052a8:	00050493          	mv	s1,a0
    800052ac:	00008797          	auipc	a5,0x8
    800052b0:	95c78793          	addi	a5,a5,-1700 # 8000cc08 <_ZTV8Consumer+0x10>
    800052b4:	00f53023          	sd	a5,0(a0)
    800052b8:	ffffd097          	auipc	ra,0xffffd
    800052bc:	eec080e7          	jalr	-276(ra) # 800021a4 <_ZN6ThreadD1Ev>
    800052c0:	00048513          	mv	a0,s1
    800052c4:	ffffd097          	auipc	ra,0xffffd
    800052c8:	5d8080e7          	jalr	1496(ra) # 8000289c <_ZN6ThreaddlEPv>
    800052cc:	01813083          	ld	ra,24(sp)
    800052d0:	01013403          	ld	s0,16(sp)
    800052d4:	00813483          	ld	s1,8(sp)
    800052d8:	02010113          	addi	sp,sp,32
    800052dc:	00008067          	ret

00000000800052e0 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    800052e0:	ff010113          	addi	sp,sp,-16
    800052e4:	00113423          	sd	ra,8(sp)
    800052e8:	00813023          	sd	s0,0(sp)
    800052ec:	01010413          	addi	s0,sp,16
    800052f0:	00008797          	auipc	a5,0x8
    800052f4:	8c878793          	addi	a5,a5,-1848 # 8000cbb8 <_ZTV16ProducerKeyborad+0x10>
    800052f8:	00f53023          	sd	a5,0(a0)
    800052fc:	ffffd097          	auipc	ra,0xffffd
    80005300:	ea8080e7          	jalr	-344(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005304:	00813083          	ld	ra,8(sp)
    80005308:	00013403          	ld	s0,0(sp)
    8000530c:	01010113          	addi	sp,sp,16
    80005310:	00008067          	ret

0000000080005314 <_ZN16ProducerKeyboradD0Ev>:
    80005314:	fe010113          	addi	sp,sp,-32
    80005318:	00113c23          	sd	ra,24(sp)
    8000531c:	00813823          	sd	s0,16(sp)
    80005320:	00913423          	sd	s1,8(sp)
    80005324:	02010413          	addi	s0,sp,32
    80005328:	00050493          	mv	s1,a0
    8000532c:	00008797          	auipc	a5,0x8
    80005330:	88c78793          	addi	a5,a5,-1908 # 8000cbb8 <_ZTV16ProducerKeyborad+0x10>
    80005334:	00f53023          	sd	a5,0(a0)
    80005338:	ffffd097          	auipc	ra,0xffffd
    8000533c:	e6c080e7          	jalr	-404(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005340:	00048513          	mv	a0,s1
    80005344:	ffffd097          	auipc	ra,0xffffd
    80005348:	558080e7          	jalr	1368(ra) # 8000289c <_ZN6ThreaddlEPv>
    8000534c:	01813083          	ld	ra,24(sp)
    80005350:	01013403          	ld	s0,16(sp)
    80005354:	00813483          	ld	s1,8(sp)
    80005358:	02010113          	addi	sp,sp,32
    8000535c:	00008067          	ret

0000000080005360 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005360:	ff010113          	addi	sp,sp,-16
    80005364:	00113423          	sd	ra,8(sp)
    80005368:	00813023          	sd	s0,0(sp)
    8000536c:	01010413          	addi	s0,sp,16
    80005370:	00008797          	auipc	a5,0x8
    80005374:	87078793          	addi	a5,a5,-1936 # 8000cbe0 <_ZTV8Producer+0x10>
    80005378:	00f53023          	sd	a5,0(a0)
    8000537c:	ffffd097          	auipc	ra,0xffffd
    80005380:	e28080e7          	jalr	-472(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005384:	00813083          	ld	ra,8(sp)
    80005388:	00013403          	ld	s0,0(sp)
    8000538c:	01010113          	addi	sp,sp,16
    80005390:	00008067          	ret

0000000080005394 <_ZN8ProducerD0Ev>:
    80005394:	fe010113          	addi	sp,sp,-32
    80005398:	00113c23          	sd	ra,24(sp)
    8000539c:	00813823          	sd	s0,16(sp)
    800053a0:	00913423          	sd	s1,8(sp)
    800053a4:	02010413          	addi	s0,sp,32
    800053a8:	00050493          	mv	s1,a0
    800053ac:	00008797          	auipc	a5,0x8
    800053b0:	83478793          	addi	a5,a5,-1996 # 8000cbe0 <_ZTV8Producer+0x10>
    800053b4:	00f53023          	sd	a5,0(a0)
    800053b8:	ffffd097          	auipc	ra,0xffffd
    800053bc:	dec080e7          	jalr	-532(ra) # 800021a4 <_ZN6ThreadD1Ev>
    800053c0:	00048513          	mv	a0,s1
    800053c4:	ffffd097          	auipc	ra,0xffffd
    800053c8:	4d8080e7          	jalr	1240(ra) # 8000289c <_ZN6ThreaddlEPv>
    800053cc:	01813083          	ld	ra,24(sp)
    800053d0:	01013403          	ld	s0,16(sp)
    800053d4:	00813483          	ld	s1,8(sp)
    800053d8:	02010113          	addi	sp,sp,32
    800053dc:	00008067          	ret

00000000800053e0 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    800053e0:	fe010113          	addi	sp,sp,-32
    800053e4:	00113c23          	sd	ra,24(sp)
    800053e8:	00813823          	sd	s0,16(sp)
    800053ec:	00913423          	sd	s1,8(sp)
    800053f0:	02010413          	addi	s0,sp,32
    800053f4:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    800053f8:	ffffc097          	auipc	ra,0xffffc
    800053fc:	414080e7          	jalr	1044(ra) # 8000180c <getc>
    80005400:	0005059b          	sext.w	a1,a0
    80005404:	01b00793          	li	a5,27
    80005408:	00f58c63          	beq	a1,a5,80005420 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000540c:	0a84b783          	ld	a5,168(s1)
    80005410:	0087b503          	ld	a0,8(a5)
    80005414:	00001097          	auipc	ra,0x1
    80005418:	f94080e7          	jalr	-108(ra) # 800063a8 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000541c:	fddff06f          	j	800053f8 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005420:	00100793          	li	a5,1
    80005424:	00008717          	auipc	a4,0x8
    80005428:	e2f72623          	sw	a5,-468(a4) # 8000d250 <_ZL9threadEnd>
        td->buffer->put('!');
    8000542c:	0a84b783          	ld	a5,168(s1)
    80005430:	02100593          	li	a1,33
    80005434:	0087b503          	ld	a0,8(a5)
    80005438:	00001097          	auipc	ra,0x1
    8000543c:	f70080e7          	jalr	-144(ra) # 800063a8 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005440:	0a84b783          	ld	a5,168(s1)
    80005444:	0107b503          	ld	a0,16(a5)
    80005448:	ffffd097          	auipc	ra,0xffffd
    8000544c:	adc080e7          	jalr	-1316(ra) # 80001f24 <_ZN9Semaphore6signalEv>
    }
    80005450:	01813083          	ld	ra,24(sp)
    80005454:	01013403          	ld	s0,16(sp)
    80005458:	00813483          	ld	s1,8(sp)
    8000545c:	02010113          	addi	sp,sp,32
    80005460:	00008067          	ret

0000000080005464 <_ZN8Producer3runEv>:
    void run() override {
    80005464:	fe010113          	addi	sp,sp,-32
    80005468:	00113c23          	sd	ra,24(sp)
    8000546c:	00813823          	sd	s0,16(sp)
    80005470:	00913423          	sd	s1,8(sp)
    80005474:	02010413          	addi	s0,sp,32
    80005478:	00050493          	mv	s1,a0
        while (!threadEnd) {
    8000547c:	00008797          	auipc	a5,0x8
    80005480:	dd47a783          	lw	a5,-556(a5) # 8000d250 <_ZL9threadEnd>
    80005484:	02079063          	bnez	a5,800054a4 <_ZN8Producer3runEv+0x40>
            td->buffer->put(td->id + '0');
    80005488:	0a84b783          	ld	a5,168(s1)
    8000548c:	0007a583          	lw	a1,0(a5)
    80005490:	0305859b          	addiw	a1,a1,48
    80005494:	0087b503          	ld	a0,8(a5)
    80005498:	00001097          	auipc	ra,0x1
    8000549c:	f10080e7          	jalr	-240(ra) # 800063a8 <_ZN9BufferCPP3putEi>
        while (!threadEnd) {
    800054a0:	fddff06f          	j	8000547c <_ZN8Producer3runEv+0x18>
        td->sem->signal();
    800054a4:	0a84b783          	ld	a5,168(s1)
    800054a8:	0107b503          	ld	a0,16(a5)
    800054ac:	ffffd097          	auipc	ra,0xffffd
    800054b0:	a78080e7          	jalr	-1416(ra) # 80001f24 <_ZN9Semaphore6signalEv>
    }
    800054b4:	01813083          	ld	ra,24(sp)
    800054b8:	01013403          	ld	s0,16(sp)
    800054bc:	00813483          	ld	s1,8(sp)
    800054c0:	02010113          	addi	sp,sp,32
    800054c4:	00008067          	ret

00000000800054c8 <_ZL11workerBodyBPv>:
    printString("A finishedaaaa!\n");
    finishedA = true;

}

static void workerBodyB(void* arg) {
    800054c8:	fe010113          	addi	sp,sp,-32
    800054cc:	00113c23          	sd	ra,24(sp)
    800054d0:	00813823          	sd	s0,16(sp)
    800054d4:	00913423          	sd	s1,8(sp)
    800054d8:	01213023          	sd	s2,0(sp)
    800054dc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800054e0:	00000913          	li	s2,0
    800054e4:	0380006f          	j	8000551c <_ZL11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800054e8:	ffffc097          	auipc	ra,0xffffc
    800054ec:	18c080e7          	jalr	396(ra) # 80001674 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    800054f0:	00148493          	addi	s1,s1,1
    800054f4:	000027b7          	lui	a5,0x2
    800054f8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800054fc:	0097ee63          	bltu	a5,s1,80005518 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005500:	00000713          	li	a4,0
    80005504:	000077b7          	lui	a5,0x7
    80005508:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000550c:	fce7eee3          	bltu	a5,a4,800054e8 <_ZL11workerBodyBPv+0x20>
    80005510:	00170713          	addi	a4,a4,1
    80005514:	ff1ff06f          	j	80005504 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005518:	00190913          	addi	s2,s2,1
    8000551c:	00f00793          	li	a5,15
    80005520:	0527e063          	bltu	a5,s2,80005560 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005524:	00005517          	auipc	a0,0x5
    80005528:	c9c50513          	addi	a0,a0,-868 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    8000552c:	00001097          	auipc	ra,0x1
    80005530:	a58080e7          	jalr	-1448(ra) # 80005f84 <_Z11printStringPKc>
    80005534:	00000613          	li	a2,0
    80005538:	00a00593          	li	a1,10
    8000553c:	0009051b          	sext.w	a0,s2
    80005540:	00001097          	auipc	ra,0x1
    80005544:	bf4080e7          	jalr	-1036(ra) # 80006134 <_Z8printIntiii>
    80005548:	00005517          	auipc	a0,0x5
    8000554c:	c2050513          	addi	a0,a0,-992 # 8000a168 <CONSOLE_STATUS+0x158>
    80005550:	00001097          	auipc	ra,0x1
    80005554:	a34080e7          	jalr	-1484(ra) # 80005f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005558:	00000493          	li	s1,0
    8000555c:	f99ff06f          	j	800054f4 <_ZL11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80005560:	00005517          	auipc	a0,0x5
    80005564:	c6850513          	addi	a0,a0,-920 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    80005568:	00001097          	auipc	ra,0x1
    8000556c:	a1c080e7          	jalr	-1508(ra) # 80005f84 <_Z11printStringPKc>
    finishedB = true;
    80005570:	00100793          	li	a5,1
    80005574:	00008717          	auipc	a4,0x8
    80005578:	cef70623          	sb	a5,-788(a4) # 8000d260 <_ZL9finishedB>
    thread_dispatch();
    8000557c:	ffffc097          	auipc	ra,0xffffc
    80005580:	0f8080e7          	jalr	248(ra) # 80001674 <thread_dispatch>
}
    80005584:	01813083          	ld	ra,24(sp)
    80005588:	01013403          	ld	s0,16(sp)
    8000558c:	00813483          	ld	s1,8(sp)
    80005590:	00013903          	ld	s2,0(sp)
    80005594:	02010113          	addi	sp,sp,32
    80005598:	00008067          	ret

000000008000559c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    8000559c:	fe010113          	addi	sp,sp,-32
    800055a0:	00113c23          	sd	ra,24(sp)
    800055a4:	00813823          	sd	s0,16(sp)
    800055a8:	00913423          	sd	s1,8(sp)
    800055ac:	01213023          	sd	s2,0(sp)
    800055b0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800055b4:	00000913          	li	s2,0
    800055b8:	0340006f          	j	800055ec <_ZL11workerBodyAPv+0x50>
            thread_dispatch();
    800055bc:	ffffc097          	auipc	ra,0xffffc
    800055c0:	0b8080e7          	jalr	184(ra) # 80001674 <thread_dispatch>
        for (uint64 j = 0; j < 1000; j++) {
    800055c4:	00148493          	addi	s1,s1,1
    800055c8:	3e700793          	li	a5,999
    800055cc:	0097ee63          	bltu	a5,s1,800055e8 <_ZL11workerBodyAPv+0x4c>
            for (uint64 k = 0; k < 3000; k++) { /* busy wait */ }
    800055d0:	00000713          	li	a4,0
    800055d4:	000017b7          	lui	a5,0x1
    800055d8:	bb778793          	addi	a5,a5,-1097 # bb7 <_entry-0x7ffff449>
    800055dc:	fee7e0e3          	bltu	a5,a4,800055bc <_ZL11workerBodyAPv+0x20>
    800055e0:	00170713          	addi	a4,a4,1
    800055e4:	ff1ff06f          	j	800055d4 <_ZL11workerBodyAPv+0x38>
    for (uint64 i = 0; i < 10; i++) {
    800055e8:	00190913          	addi	s2,s2,1
    800055ec:	00900793          	li	a5,9
    800055f0:	0527e063          	bltu	a5,s2,80005630 <_ZL11workerBodyAPv+0x94>
        printString("A: i=");
    800055f4:	00005517          	auipc	a0,0x5
    800055f8:	bb450513          	addi	a0,a0,-1100 # 8000a1a8 <CONSOLE_STATUS+0x198>
    800055fc:	00001097          	auipc	ra,0x1
    80005600:	988080e7          	jalr	-1656(ra) # 80005f84 <_Z11printStringPKc>
        printInt(i);
    80005604:	00000613          	li	a2,0
    80005608:	00a00593          	li	a1,10
    8000560c:	0009051b          	sext.w	a0,s2
    80005610:	00001097          	auipc	ra,0x1
    80005614:	b24080e7          	jalr	-1244(ra) # 80006134 <_Z8printIntiii>
        printString("\n");
    80005618:	00005517          	auipc	a0,0x5
    8000561c:	b5050513          	addi	a0,a0,-1200 # 8000a168 <CONSOLE_STATUS+0x158>
    80005620:	00001097          	auipc	ra,0x1
    80005624:	964080e7          	jalr	-1692(ra) # 80005f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 1000; j++) {
    80005628:	00000493          	li	s1,0
    8000562c:	f9dff06f          	j	800055c8 <_ZL11workerBodyAPv+0x2c>
    printString("A finishedaaaa!\n");
    80005630:	00005517          	auipc	a0,0x5
    80005634:	ce050513          	addi	a0,a0,-800 # 8000a310 <CONSOLE_STATUS+0x300>
    80005638:	00001097          	auipc	ra,0x1
    8000563c:	94c080e7          	jalr	-1716(ra) # 80005f84 <_Z11printStringPKc>
    finishedA = true;
    80005640:	00100793          	li	a5,1
    80005644:	00008717          	auipc	a4,0x8
    80005648:	c0f70ea3          	sb	a5,-995(a4) # 8000d261 <_ZL9finishedA>
}
    8000564c:	01813083          	ld	ra,24(sp)
    80005650:	01013403          	ld	s0,16(sp)
    80005654:	00813483          	ld	s1,8(sp)
    80005658:	00013903          	ld	s2,0(sp)
    8000565c:	02010113          	addi	sp,sp,32
    80005660:	00008067          	ret

0000000080005664 <_Z18Threads_C_API_testv>:
//    finishedD = true;
//    thread_dispatch();
//}


void Threads_C_API_test() {
    80005664:	fe010113          	addi	sp,sp,-32
    80005668:	00113c23          	sd	ra,24(sp)
    8000566c:	00813823          	sd	s0,16(sp)
    80005670:	02010413          	addi	s0,sp,32
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005674:	00000613          	li	a2,0
    80005678:	00000597          	auipc	a1,0x0
    8000567c:	f2458593          	addi	a1,a1,-220 # 8000559c <_ZL11workerBodyAPv>
    80005680:	fe040513          	addi	a0,s0,-32
    80005684:	ffffc097          	auipc	ra,0xffffc
    80005688:	f38080e7          	jalr	-200(ra) # 800015bc <thread_create>
    printString("ThreadA created\n");
    8000568c:	00005517          	auipc	a0,0x5
    80005690:	bb450513          	addi	a0,a0,-1100 # 8000a240 <CONSOLE_STATUS+0x230>
    80005694:	00001097          	auipc	ra,0x1
    80005698:	8f0080e7          	jalr	-1808(ra) # 80005f84 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000569c:	00000613          	li	a2,0
    800056a0:	00000597          	auipc	a1,0x0
    800056a4:	e2858593          	addi	a1,a1,-472 # 800054c8 <_ZL11workerBodyBPv>
    800056a8:	fe440513          	addi	a0,s0,-28
    800056ac:	ffffc097          	auipc	ra,0xffffc
    800056b0:	f10080e7          	jalr	-240(ra) # 800015bc <thread_create>
    printString("ThreadB created\n");
    800056b4:	00005517          	auipc	a0,0x5
    800056b8:	ba450513          	addi	a0,a0,-1116 # 8000a258 <CONSOLE_STATUS+0x248>
    800056bc:	00001097          	auipc	ra,0x1
    800056c0:	8c8080e7          	jalr	-1848(ra) # 80005f84 <_Z11printStringPKc>
    800056c4:	00c0006f          	j	800056d0 <_Z18Threads_C_API_testv+0x6c>
//
//    thread_create(&threads[3], workerBodyD, nullptr);
//    printString("ThreadD created\n");

    while (!(finishedA && finishedB )) {
        thread_dispatch();
    800056c8:	ffffc097          	auipc	ra,0xffffc
    800056cc:	fac080e7          	jalr	-84(ra) # 80001674 <thread_dispatch>
    while (!(finishedA && finishedB )) {
    800056d0:	00008797          	auipc	a5,0x8
    800056d4:	b917c783          	lbu	a5,-1135(a5) # 8000d261 <_ZL9finishedA>
    800056d8:	fe0788e3          	beqz	a5,800056c8 <_Z18Threads_C_API_testv+0x64>
    800056dc:	00008797          	auipc	a5,0x8
    800056e0:	b847c783          	lbu	a5,-1148(a5) # 8000d260 <_ZL9finishedB>
    800056e4:	fe0782e3          	beqz	a5,800056c8 <_Z18Threads_C_API_testv+0x64>
    }

}
    800056e8:	01813083          	ld	ra,24(sp)
    800056ec:	01013403          	ld	s0,16(sp)
    800056f0:	02010113          	addi	sp,sp,32
    800056f4:	00008067          	ret

00000000800056f8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800056f8:	fd010113          	addi	sp,sp,-48
    800056fc:	02113423          	sd	ra,40(sp)
    80005700:	02813023          	sd	s0,32(sp)
    80005704:	00913c23          	sd	s1,24(sp)
    80005708:	01213823          	sd	s2,16(sp)
    8000570c:	01313423          	sd	s3,8(sp)
    80005710:	03010413          	addi	s0,sp,48
    80005714:	00050993          	mv	s3,a0
    80005718:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000571c:	00000913          	li	s2,0
    80005720:	00c0006f          	j	8000572c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005724:	ffffd097          	auipc	ra,0xffffd
    80005728:	1e8080e7          	jalr	488(ra) # 8000290c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000572c:	ffffc097          	auipc	ra,0xffffc
    80005730:	0e0080e7          	jalr	224(ra) # 8000180c <getc>
    80005734:	0005059b          	sext.w	a1,a0
    80005738:	01b00793          	li	a5,27
    8000573c:	02f58a63          	beq	a1,a5,80005770 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005740:	0084b503          	ld	a0,8(s1)
    80005744:	00001097          	auipc	ra,0x1
    80005748:	c64080e7          	jalr	-924(ra) # 800063a8 <_ZN9BufferCPP3putEi>
        i++;
    8000574c:	0019071b          	addiw	a4,s2,1
    80005750:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005754:	0004a683          	lw	a3,0(s1)
    80005758:	0026979b          	slliw	a5,a3,0x2
    8000575c:	00d787bb          	addw	a5,a5,a3
    80005760:	0017979b          	slliw	a5,a5,0x1
    80005764:	02f767bb          	remw	a5,a4,a5
    80005768:	fc0792e3          	bnez	a5,8000572c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000576c:	fb9ff06f          	j	80005724 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005770:	00100793          	li	a5,1
    80005774:	00008717          	auipc	a4,0x8
    80005778:	aef72a23          	sw	a5,-1292(a4) # 8000d268 <_ZL9threadEnd>
    td->buffer->put('!');
    8000577c:	0a89b783          	ld	a5,168(s3)
    80005780:	02100593          	li	a1,33
    80005784:	0087b503          	ld	a0,8(a5)
    80005788:	00001097          	auipc	ra,0x1
    8000578c:	c20080e7          	jalr	-992(ra) # 800063a8 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005790:	0104b503          	ld	a0,16(s1)
    80005794:	ffffc097          	auipc	ra,0xffffc
    80005798:	790080e7          	jalr	1936(ra) # 80001f24 <_ZN9Semaphore6signalEv>
}
    8000579c:	02813083          	ld	ra,40(sp)
    800057a0:	02013403          	ld	s0,32(sp)
    800057a4:	01813483          	ld	s1,24(sp)
    800057a8:	01013903          	ld	s2,16(sp)
    800057ac:	00813983          	ld	s3,8(sp)
    800057b0:	03010113          	addi	sp,sp,48
    800057b4:	00008067          	ret

00000000800057b8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800057b8:	fe010113          	addi	sp,sp,-32
    800057bc:	00113c23          	sd	ra,24(sp)
    800057c0:	00813823          	sd	s0,16(sp)
    800057c4:	00913423          	sd	s1,8(sp)
    800057c8:	01213023          	sd	s2,0(sp)
    800057cc:	02010413          	addi	s0,sp,32
    800057d0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800057d4:	00000913          	li	s2,0
    800057d8:	00c0006f          	j	800057e4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800057dc:	ffffd097          	auipc	ra,0xffffd
    800057e0:	130080e7          	jalr	304(ra) # 8000290c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800057e4:	00008797          	auipc	a5,0x8
    800057e8:	a847a783          	lw	a5,-1404(a5) # 8000d268 <_ZL9threadEnd>
    800057ec:	02079e63          	bnez	a5,80005828 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800057f0:	0004a583          	lw	a1,0(s1)
    800057f4:	0305859b          	addiw	a1,a1,48
    800057f8:	0084b503          	ld	a0,8(s1)
    800057fc:	00001097          	auipc	ra,0x1
    80005800:	bac080e7          	jalr	-1108(ra) # 800063a8 <_ZN9BufferCPP3putEi>
        i++;
    80005804:	0019071b          	addiw	a4,s2,1
    80005808:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000580c:	0004a683          	lw	a3,0(s1)
    80005810:	0026979b          	slliw	a5,a3,0x2
    80005814:	00d787bb          	addw	a5,a5,a3
    80005818:	0017979b          	slliw	a5,a5,0x1
    8000581c:	02f767bb          	remw	a5,a4,a5
    80005820:	fc0792e3          	bnez	a5,800057e4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005824:	fb9ff06f          	j	800057dc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005828:	0104b503          	ld	a0,16(s1)
    8000582c:	ffffc097          	auipc	ra,0xffffc
    80005830:	6f8080e7          	jalr	1784(ra) # 80001f24 <_ZN9Semaphore6signalEv>
}
    80005834:	01813083          	ld	ra,24(sp)
    80005838:	01013403          	ld	s0,16(sp)
    8000583c:	00813483          	ld	s1,8(sp)
    80005840:	00013903          	ld	s2,0(sp)
    80005844:	02010113          	addi	sp,sp,32
    80005848:	00008067          	ret

000000008000584c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000584c:	fd010113          	addi	sp,sp,-48
    80005850:	02113423          	sd	ra,40(sp)
    80005854:	02813023          	sd	s0,32(sp)
    80005858:	00913c23          	sd	s1,24(sp)
    8000585c:	01213823          	sd	s2,16(sp)
    80005860:	01313423          	sd	s3,8(sp)
    80005864:	01413023          	sd	s4,0(sp)
    80005868:	03010413          	addi	s0,sp,48
    8000586c:	00050993          	mv	s3,a0
    80005870:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005874:	00000a13          	li	s4,0
    80005878:	01c0006f          	j	80005894 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000587c:	ffffd097          	auipc	ra,0xffffd
    80005880:	090080e7          	jalr	144(ra) # 8000290c <_ZN6Thread8dispatchEv>
    80005884:	0500006f          	j	800058d4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005888:	00a00513          	li	a0,10
    8000588c:	ffffc097          	auipc	ra,0xffffc
    80005890:	fb0080e7          	jalr	-80(ra) # 8000183c <putc>
    while (!threadEnd) {
    80005894:	00008797          	auipc	a5,0x8
    80005898:	9d47a783          	lw	a5,-1580(a5) # 8000d268 <_ZL9threadEnd>
    8000589c:	06079263          	bnez	a5,80005900 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800058a0:	00893503          	ld	a0,8(s2)
    800058a4:	00001097          	auipc	ra,0x1
    800058a8:	b94080e7          	jalr	-1132(ra) # 80006438 <_ZN9BufferCPP3getEv>
        i++;
    800058ac:	001a049b          	addiw	s1,s4,1
    800058b0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800058b4:	0ff57513          	andi	a0,a0,255
    800058b8:	ffffc097          	auipc	ra,0xffffc
    800058bc:	f84080e7          	jalr	-124(ra) # 8000183c <putc>
        if (i % (5 * data->id) == 0) {
    800058c0:	00092703          	lw	a4,0(s2)
    800058c4:	0027179b          	slliw	a5,a4,0x2
    800058c8:	00e787bb          	addw	a5,a5,a4
    800058cc:	02f4e7bb          	remw	a5,s1,a5
    800058d0:	fa0786e3          	beqz	a5,8000587c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800058d4:	05000793          	li	a5,80
    800058d8:	02f4e4bb          	remw	s1,s1,a5
    800058dc:	fa049ce3          	bnez	s1,80005894 <_ZN12ConsumerSync8consumerEPv+0x48>
    800058e0:	fa9ff06f          	j	80005888 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800058e4:	0a89b783          	ld	a5,168(s3)
    800058e8:	0087b503          	ld	a0,8(a5)
    800058ec:	00001097          	auipc	ra,0x1
    800058f0:	b4c080e7          	jalr	-1204(ra) # 80006438 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    800058f4:	0ff57513          	andi	a0,a0,255
    800058f8:	ffffd097          	auipc	ra,0xffffd
    800058fc:	624080e7          	jalr	1572(ra) # 80002f1c <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005900:	0a89b783          	ld	a5,168(s3)
    80005904:	0087b503          	ld	a0,8(a5)
    80005908:	00001097          	auipc	ra,0x1
    8000590c:	bbc080e7          	jalr	-1092(ra) # 800064c4 <_ZN9BufferCPP6getCntEv>
    80005910:	fca04ae3          	bgtz	a0,800058e4 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005914:	01093503          	ld	a0,16(s2)
    80005918:	ffffc097          	auipc	ra,0xffffc
    8000591c:	60c080e7          	jalr	1548(ra) # 80001f24 <_ZN9Semaphore6signalEv>
}
    80005920:	02813083          	ld	ra,40(sp)
    80005924:	02013403          	ld	s0,32(sp)
    80005928:	01813483          	ld	s1,24(sp)
    8000592c:	01013903          	ld	s2,16(sp)
    80005930:	00813983          	ld	s3,8(sp)
    80005934:	00013a03          	ld	s4,0(sp)
    80005938:	03010113          	addi	sp,sp,48
    8000593c:	00008067          	ret

0000000080005940 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005940:	f8010113          	addi	sp,sp,-128
    80005944:	06113c23          	sd	ra,120(sp)
    80005948:	06813823          	sd	s0,112(sp)
    8000594c:	06913423          	sd	s1,104(sp)
    80005950:	07213023          	sd	s2,96(sp)
    80005954:	05313c23          	sd	s3,88(sp)
    80005958:	05413823          	sd	s4,80(sp)
    8000595c:	05513423          	sd	s5,72(sp)
    80005960:	05613023          	sd	s6,64(sp)
    80005964:	03713c23          	sd	s7,56(sp)
    80005968:	03813823          	sd	s8,48(sp)
    8000596c:	03913423          	sd	s9,40(sp)
    80005970:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005974:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005978:	00004517          	auipc	a0,0x4
    8000597c:	7b850513          	addi	a0,a0,1976 # 8000a130 <CONSOLE_STATUS+0x120>
    80005980:	00000097          	auipc	ra,0x0
    80005984:	604080e7          	jalr	1540(ra) # 80005f84 <_Z11printStringPKc>
    getString(input, 30);
    80005988:	01e00593          	li	a1,30
    8000598c:	f8040493          	addi	s1,s0,-128
    80005990:	00048513          	mv	a0,s1
    80005994:	00000097          	auipc	ra,0x0
    80005998:	678080e7          	jalr	1656(ra) # 8000600c <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000599c:	00048513          	mv	a0,s1
    800059a0:	00000097          	auipc	ra,0x0
    800059a4:	744080e7          	jalr	1860(ra) # 800060e4 <_Z11stringToIntPKc>
    800059a8:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800059ac:	00004517          	auipc	a0,0x4
    800059b0:	7a450513          	addi	a0,a0,1956 # 8000a150 <CONSOLE_STATUS+0x140>
    800059b4:	00000097          	auipc	ra,0x0
    800059b8:	5d0080e7          	jalr	1488(ra) # 80005f84 <_Z11printStringPKc>
    getString(input, 30);
    800059bc:	01e00593          	li	a1,30
    800059c0:	00048513          	mv	a0,s1
    800059c4:	00000097          	auipc	ra,0x0
    800059c8:	648080e7          	jalr	1608(ra) # 8000600c <_Z9getStringPci>
    n = stringToInt(input);
    800059cc:	00048513          	mv	a0,s1
    800059d0:	00000097          	auipc	ra,0x0
    800059d4:	714080e7          	jalr	1812(ra) # 800060e4 <_Z11stringToIntPKc>
    800059d8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800059dc:	00004517          	auipc	a0,0x4
    800059e0:	79450513          	addi	a0,a0,1940 # 8000a170 <CONSOLE_STATUS+0x160>
    800059e4:	00000097          	auipc	ra,0x0
    800059e8:	5a0080e7          	jalr	1440(ra) # 80005f84 <_Z11printStringPKc>
    800059ec:	00000613          	li	a2,0
    800059f0:	00a00593          	li	a1,10
    800059f4:	00090513          	mv	a0,s2
    800059f8:	00000097          	auipc	ra,0x0
    800059fc:	73c080e7          	jalr	1852(ra) # 80006134 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005a00:	00004517          	auipc	a0,0x4
    80005a04:	78850513          	addi	a0,a0,1928 # 8000a188 <CONSOLE_STATUS+0x178>
    80005a08:	00000097          	auipc	ra,0x0
    80005a0c:	57c080e7          	jalr	1404(ra) # 80005f84 <_Z11printStringPKc>
    80005a10:	00000613          	li	a2,0
    80005a14:	00a00593          	li	a1,10
    80005a18:	00048513          	mv	a0,s1
    80005a1c:	00000097          	auipc	ra,0x0
    80005a20:	718080e7          	jalr	1816(ra) # 80006134 <_Z8printIntiii>
    printString(".\n");
    80005a24:	00004517          	auipc	a0,0x4
    80005a28:	77c50513          	addi	a0,a0,1916 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80005a2c:	00000097          	auipc	ra,0x0
    80005a30:	558080e7          	jalr	1368(ra) # 80005f84 <_Z11printStringPKc>
    if(threadNum > n) {
    80005a34:	0324c463          	blt	s1,s2,80005a5c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005a38:	03205c63          	blez	s2,80005a70 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005a3c:	03800513          	li	a0,56
    80005a40:	ffffe097          	auipc	ra,0xffffe
    80005a44:	af8080e7          	jalr	-1288(ra) # 80003538 <_Znwm>
    80005a48:	00050a93          	mv	s5,a0
    80005a4c:	00048593          	mv	a1,s1
    80005a50:	00001097          	auipc	ra,0x1
    80005a54:	804080e7          	jalr	-2044(ra) # 80006254 <_ZN9BufferCPPC1Ei>
    80005a58:	0300006f          	j	80005a88 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005a5c:	00005517          	auipc	a0,0x5
    80005a60:	84450513          	addi	a0,a0,-1980 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80005a64:	00000097          	auipc	ra,0x0
    80005a68:	520080e7          	jalr	1312(ra) # 80005f84 <_Z11printStringPKc>
        return;
    80005a6c:	0140006f          	j	80005a80 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005a70:	00005517          	auipc	a0,0x5
    80005a74:	87050513          	addi	a0,a0,-1936 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005a78:	00000097          	auipc	ra,0x0
    80005a7c:	50c080e7          	jalr	1292(ra) # 80005f84 <_Z11printStringPKc>
        return;
    80005a80:	000b8113          	mv	sp,s7
    80005a84:	2380006f          	j	80005cbc <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005a88:	02000513          	li	a0,32
    80005a8c:	ffffc097          	auipc	ra,0xffffc
    80005a90:	044080e7          	jalr	68(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80005a94:	00050493          	mv	s1,a0
    80005a98:	00000593          	li	a1,0
    80005a9c:	ffffc097          	auipc	ra,0xffffc
    80005aa0:	fc8080e7          	jalr	-56(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80005aa4:	00007797          	auipc	a5,0x7
    80005aa8:	7c97b623          	sd	s1,1996(a5) # 8000d270 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005aac:	00391793          	slli	a5,s2,0x3
    80005ab0:	00f78793          	addi	a5,a5,15
    80005ab4:	ff07f793          	andi	a5,a5,-16
    80005ab8:	40f10133          	sub	sp,sp,a5
    80005abc:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005ac0:	0019071b          	addiw	a4,s2,1
    80005ac4:	00171793          	slli	a5,a4,0x1
    80005ac8:	00e787b3          	add	a5,a5,a4
    80005acc:	00379793          	slli	a5,a5,0x3
    80005ad0:	00f78793          	addi	a5,a5,15
    80005ad4:	ff07f793          	andi	a5,a5,-16
    80005ad8:	40f10133          	sub	sp,sp,a5
    80005adc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005ae0:	00191c13          	slli	s8,s2,0x1
    80005ae4:	012c07b3          	add	a5,s8,s2
    80005ae8:	00379793          	slli	a5,a5,0x3
    80005aec:	00fa07b3          	add	a5,s4,a5
    80005af0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005af4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005af8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005afc:	0b000513          	li	a0,176
    80005b00:	ffffd097          	auipc	ra,0xffffd
    80005b04:	c7c080e7          	jalr	-900(ra) # 8000277c <_ZN6ThreadnwEm>
    80005b08:	00050b13          	mv	s6,a0
    80005b0c:	012c0c33          	add	s8,s8,s2
    80005b10:	003c1c13          	slli	s8,s8,0x3
    80005b14:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005b18:	ffffd097          	auipc	ra,0xffffd
    80005b1c:	910080e7          	jalr	-1776(ra) # 80002428 <_ZN6ThreadC1Ev>
    80005b20:	00007797          	auipc	a5,0x7
    80005b24:	16078793          	addi	a5,a5,352 # 8000cc80 <_ZTV12ConsumerSync+0x10>
    80005b28:	00fb3023          	sd	a5,0(s6)
    80005b2c:	0b8b3423          	sd	s8,168(s6)
    consumerThread->start();
    80005b30:	000b0513          	mv	a0,s6
    80005b34:	ffffd097          	auipc	ra,0xffffd
    80005b38:	e00080e7          	jalr	-512(ra) # 80002934 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005b3c:	00000493          	li	s1,0
    80005b40:	0380006f          	j	80005b78 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005b44:	00007797          	auipc	a5,0x7
    80005b48:	11478793          	addi	a5,a5,276 # 8000cc58 <_ZTV12ProducerSync+0x10>
    80005b4c:	00fcb023          	sd	a5,0(s9)
    80005b50:	0b8cb423          	sd	s8,168(s9)
            threads[i] = new ProducerSync(data+i);
    80005b54:	00349793          	slli	a5,s1,0x3
    80005b58:	00f987b3          	add	a5,s3,a5
    80005b5c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005b60:	00349793          	slli	a5,s1,0x3
    80005b64:	00f987b3          	add	a5,s3,a5
    80005b68:	0007b503          	ld	a0,0(a5)
    80005b6c:	ffffd097          	auipc	ra,0xffffd
    80005b70:	dc8080e7          	jalr	-568(ra) # 80002934 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005b74:	0014849b          	addiw	s1,s1,1
    80005b78:	0b24d063          	bge	s1,s2,80005c18 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005b7c:	00149793          	slli	a5,s1,0x1
    80005b80:	009787b3          	add	a5,a5,s1
    80005b84:	00379793          	slli	a5,a5,0x3
    80005b88:	00fa07b3          	add	a5,s4,a5
    80005b8c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005b90:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005b94:	00007717          	auipc	a4,0x7
    80005b98:	6dc73703          	ld	a4,1756(a4) # 8000d270 <_ZL10waitForAll>
    80005b9c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005ba0:	02905863          	blez	s1,80005bd0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005ba4:	0b000513          	li	a0,176
    80005ba8:	ffffd097          	auipc	ra,0xffffd
    80005bac:	bd4080e7          	jalr	-1068(ra) # 8000277c <_ZN6ThreadnwEm>
    80005bb0:	00050c93          	mv	s9,a0
    80005bb4:	00149c13          	slli	s8,s1,0x1
    80005bb8:	009c0c33          	add	s8,s8,s1
    80005bbc:	003c1c13          	slli	s8,s8,0x3
    80005bc0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005bc4:	ffffd097          	auipc	ra,0xffffd
    80005bc8:	864080e7          	jalr	-1948(ra) # 80002428 <_ZN6ThreadC1Ev>
    80005bcc:	f79ff06f          	j	80005b44 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005bd0:	0b000513          	li	a0,176
    80005bd4:	ffffd097          	auipc	ra,0xffffd
    80005bd8:	ba8080e7          	jalr	-1112(ra) # 8000277c <_ZN6ThreadnwEm>
    80005bdc:	00050c93          	mv	s9,a0
    80005be0:	00149c13          	slli	s8,s1,0x1
    80005be4:	009c0c33          	add	s8,s8,s1
    80005be8:	003c1c13          	slli	s8,s8,0x3
    80005bec:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005bf0:	ffffd097          	auipc	ra,0xffffd
    80005bf4:	838080e7          	jalr	-1992(ra) # 80002428 <_ZN6ThreadC1Ev>
    80005bf8:	00007797          	auipc	a5,0x7
    80005bfc:	03878793          	addi	a5,a5,56 # 8000cc30 <_ZTV16ProducerKeyboard+0x10>
    80005c00:	00fcb023          	sd	a5,0(s9)
    80005c04:	0b8cb423          	sd	s8,168(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005c08:	00349793          	slli	a5,s1,0x3
    80005c0c:	00f987b3          	add	a5,s3,a5
    80005c10:	0197b023          	sd	s9,0(a5)
    80005c14:	f4dff06f          	j	80005b60 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005c18:	ffffd097          	auipc	ra,0xffffd
    80005c1c:	cf4080e7          	jalr	-780(ra) # 8000290c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005c20:	00000493          	li	s1,0
    80005c24:	00994e63          	blt	s2,s1,80005c40 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005c28:	00007517          	auipc	a0,0x7
    80005c2c:	64853503          	ld	a0,1608(a0) # 8000d270 <_ZL10waitForAll>
    80005c30:	ffffc097          	auipc	ra,0xffffc
    80005c34:	21c080e7          	jalr	540(ra) # 80001e4c <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005c38:	0014849b          	addiw	s1,s1,1
    80005c3c:	fe9ff06f          	j	80005c24 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005c40:	00000493          	li	s1,0
    80005c44:	0080006f          	j	80005c4c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005c48:	0014849b          	addiw	s1,s1,1
    80005c4c:	0324d263          	bge	s1,s2,80005c70 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005c50:	00349793          	slli	a5,s1,0x3
    80005c54:	00f987b3          	add	a5,s3,a5
    80005c58:	0007b503          	ld	a0,0(a5)
    80005c5c:	fe0506e3          	beqz	a0,80005c48 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005c60:	00053783          	ld	a5,0(a0)
    80005c64:	0087b783          	ld	a5,8(a5)
    80005c68:	000780e7          	jalr	a5
    80005c6c:	fddff06f          	j	80005c48 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005c70:	000b0a63          	beqz	s6,80005c84 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005c74:	000b3783          	ld	a5,0(s6)
    80005c78:	0087b783          	ld	a5,8(a5)
    80005c7c:	000b0513          	mv	a0,s6
    80005c80:	000780e7          	jalr	a5
    delete waitForAll;
    80005c84:	00007517          	auipc	a0,0x7
    80005c88:	5ec53503          	ld	a0,1516(a0) # 8000d270 <_ZL10waitForAll>
    80005c8c:	00050863          	beqz	a0,80005c9c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005c90:	00053783          	ld	a5,0(a0)
    80005c94:	0087b783          	ld	a5,8(a5)
    80005c98:	000780e7          	jalr	a5
    delete buffer;
    80005c9c:	000a8e63          	beqz	s5,80005cb8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005ca0:	000a8513          	mv	a0,s5
    80005ca4:	00001097          	auipc	ra,0x1
    80005ca8:	8a8080e7          	jalr	-1880(ra) # 8000654c <_ZN9BufferCPPD1Ev>
    80005cac:	000a8513          	mv	a0,s5
    80005cb0:	ffffe097          	auipc	ra,0xffffe
    80005cb4:	8d8080e7          	jalr	-1832(ra) # 80003588 <_ZdlPv>
    80005cb8:	000b8113          	mv	sp,s7

}
    80005cbc:	f8040113          	addi	sp,s0,-128
    80005cc0:	07813083          	ld	ra,120(sp)
    80005cc4:	07013403          	ld	s0,112(sp)
    80005cc8:	06813483          	ld	s1,104(sp)
    80005ccc:	06013903          	ld	s2,96(sp)
    80005cd0:	05813983          	ld	s3,88(sp)
    80005cd4:	05013a03          	ld	s4,80(sp)
    80005cd8:	04813a83          	ld	s5,72(sp)
    80005cdc:	04013b03          	ld	s6,64(sp)
    80005ce0:	03813b83          	ld	s7,56(sp)
    80005ce4:	03013c03          	ld	s8,48(sp)
    80005ce8:	02813c83          	ld	s9,40(sp)
    80005cec:	08010113          	addi	sp,sp,128
    80005cf0:	00008067          	ret
    80005cf4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005cf8:	000a8513          	mv	a0,s5
    80005cfc:	ffffe097          	auipc	ra,0xffffe
    80005d00:	88c080e7          	jalr	-1908(ra) # 80003588 <_ZdlPv>
    80005d04:	00048513          	mv	a0,s1
    80005d08:	00008097          	auipc	ra,0x8
    80005d0c:	650080e7          	jalr	1616(ra) # 8000e358 <_Unwind_Resume>
    80005d10:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005d14:	00048513          	mv	a0,s1
    80005d18:	ffffc097          	auipc	ra,0xffffc
    80005d1c:	df0080e7          	jalr	-528(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80005d20:	00090513          	mv	a0,s2
    80005d24:	00008097          	auipc	ra,0x8
    80005d28:	634080e7          	jalr	1588(ra) # 8000e358 <_Unwind_Resume>
    80005d2c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005d30:	000b0513          	mv	a0,s6
    80005d34:	ffffd097          	auipc	ra,0xffffd
    80005d38:	b68080e7          	jalr	-1176(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005d3c:	00048513          	mv	a0,s1
    80005d40:	00008097          	auipc	ra,0x8
    80005d44:	618080e7          	jalr	1560(ra) # 8000e358 <_Unwind_Resume>
    80005d48:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005d4c:	000c8513          	mv	a0,s9
    80005d50:	ffffd097          	auipc	ra,0xffffd
    80005d54:	b4c080e7          	jalr	-1204(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005d58:	00048513          	mv	a0,s1
    80005d5c:	00008097          	auipc	ra,0x8
    80005d60:	5fc080e7          	jalr	1532(ra) # 8000e358 <_Unwind_Resume>
    80005d64:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005d68:	000c8513          	mv	a0,s9
    80005d6c:	ffffd097          	auipc	ra,0xffffd
    80005d70:	b30080e7          	jalr	-1232(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005d74:	00048513          	mv	a0,s1
    80005d78:	00008097          	auipc	ra,0x8
    80005d7c:	5e0080e7          	jalr	1504(ra) # 8000e358 <_Unwind_Resume>

0000000080005d80 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005d80:	ff010113          	addi	sp,sp,-16
    80005d84:	00113423          	sd	ra,8(sp)
    80005d88:	00813023          	sd	s0,0(sp)
    80005d8c:	01010413          	addi	s0,sp,16
    80005d90:	00007797          	auipc	a5,0x7
    80005d94:	ef078793          	addi	a5,a5,-272 # 8000cc80 <_ZTV12ConsumerSync+0x10>
    80005d98:	00f53023          	sd	a5,0(a0)
    80005d9c:	ffffc097          	auipc	ra,0xffffc
    80005da0:	408080e7          	jalr	1032(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005da4:	00813083          	ld	ra,8(sp)
    80005da8:	00013403          	ld	s0,0(sp)
    80005dac:	01010113          	addi	sp,sp,16
    80005db0:	00008067          	ret

0000000080005db4 <_ZN12ConsumerSyncD0Ev>:
    80005db4:	fe010113          	addi	sp,sp,-32
    80005db8:	00113c23          	sd	ra,24(sp)
    80005dbc:	00813823          	sd	s0,16(sp)
    80005dc0:	00913423          	sd	s1,8(sp)
    80005dc4:	02010413          	addi	s0,sp,32
    80005dc8:	00050493          	mv	s1,a0
    80005dcc:	00007797          	auipc	a5,0x7
    80005dd0:	eb478793          	addi	a5,a5,-332 # 8000cc80 <_ZTV12ConsumerSync+0x10>
    80005dd4:	00f53023          	sd	a5,0(a0)
    80005dd8:	ffffc097          	auipc	ra,0xffffc
    80005ddc:	3cc080e7          	jalr	972(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005de0:	00048513          	mv	a0,s1
    80005de4:	ffffd097          	auipc	ra,0xffffd
    80005de8:	ab8080e7          	jalr	-1352(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005dec:	01813083          	ld	ra,24(sp)
    80005df0:	01013403          	ld	s0,16(sp)
    80005df4:	00813483          	ld	s1,8(sp)
    80005df8:	02010113          	addi	sp,sp,32
    80005dfc:	00008067          	ret

0000000080005e00 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005e00:	ff010113          	addi	sp,sp,-16
    80005e04:	00113423          	sd	ra,8(sp)
    80005e08:	00813023          	sd	s0,0(sp)
    80005e0c:	01010413          	addi	s0,sp,16
    80005e10:	00007797          	auipc	a5,0x7
    80005e14:	e4878793          	addi	a5,a5,-440 # 8000cc58 <_ZTV12ProducerSync+0x10>
    80005e18:	00f53023          	sd	a5,0(a0)
    80005e1c:	ffffc097          	auipc	ra,0xffffc
    80005e20:	388080e7          	jalr	904(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005e24:	00813083          	ld	ra,8(sp)
    80005e28:	00013403          	ld	s0,0(sp)
    80005e2c:	01010113          	addi	sp,sp,16
    80005e30:	00008067          	ret

0000000080005e34 <_ZN12ProducerSyncD0Ev>:
    80005e34:	fe010113          	addi	sp,sp,-32
    80005e38:	00113c23          	sd	ra,24(sp)
    80005e3c:	00813823          	sd	s0,16(sp)
    80005e40:	00913423          	sd	s1,8(sp)
    80005e44:	02010413          	addi	s0,sp,32
    80005e48:	00050493          	mv	s1,a0
    80005e4c:	00007797          	auipc	a5,0x7
    80005e50:	e0c78793          	addi	a5,a5,-500 # 8000cc58 <_ZTV12ProducerSync+0x10>
    80005e54:	00f53023          	sd	a5,0(a0)
    80005e58:	ffffc097          	auipc	ra,0xffffc
    80005e5c:	34c080e7          	jalr	844(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005e60:	00048513          	mv	a0,s1
    80005e64:	ffffd097          	auipc	ra,0xffffd
    80005e68:	a38080e7          	jalr	-1480(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005e6c:	01813083          	ld	ra,24(sp)
    80005e70:	01013403          	ld	s0,16(sp)
    80005e74:	00813483          	ld	s1,8(sp)
    80005e78:	02010113          	addi	sp,sp,32
    80005e7c:	00008067          	ret

0000000080005e80 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005e80:	ff010113          	addi	sp,sp,-16
    80005e84:	00113423          	sd	ra,8(sp)
    80005e88:	00813023          	sd	s0,0(sp)
    80005e8c:	01010413          	addi	s0,sp,16
    80005e90:	00007797          	auipc	a5,0x7
    80005e94:	da078793          	addi	a5,a5,-608 # 8000cc30 <_ZTV16ProducerKeyboard+0x10>
    80005e98:	00f53023          	sd	a5,0(a0)
    80005e9c:	ffffc097          	auipc	ra,0xffffc
    80005ea0:	308080e7          	jalr	776(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005ea4:	00813083          	ld	ra,8(sp)
    80005ea8:	00013403          	ld	s0,0(sp)
    80005eac:	01010113          	addi	sp,sp,16
    80005eb0:	00008067          	ret

0000000080005eb4 <_ZN16ProducerKeyboardD0Ev>:
    80005eb4:	fe010113          	addi	sp,sp,-32
    80005eb8:	00113c23          	sd	ra,24(sp)
    80005ebc:	00813823          	sd	s0,16(sp)
    80005ec0:	00913423          	sd	s1,8(sp)
    80005ec4:	02010413          	addi	s0,sp,32
    80005ec8:	00050493          	mv	s1,a0
    80005ecc:	00007797          	auipc	a5,0x7
    80005ed0:	d6478793          	addi	a5,a5,-668 # 8000cc30 <_ZTV16ProducerKeyboard+0x10>
    80005ed4:	00f53023          	sd	a5,0(a0)
    80005ed8:	ffffc097          	auipc	ra,0xffffc
    80005edc:	2cc080e7          	jalr	716(ra) # 800021a4 <_ZN6ThreadD1Ev>
    80005ee0:	00048513          	mv	a0,s1
    80005ee4:	ffffd097          	auipc	ra,0xffffd
    80005ee8:	9b8080e7          	jalr	-1608(ra) # 8000289c <_ZN6ThreaddlEPv>
    80005eec:	01813083          	ld	ra,24(sp)
    80005ef0:	01013403          	ld	s0,16(sp)
    80005ef4:	00813483          	ld	s1,8(sp)
    80005ef8:	02010113          	addi	sp,sp,32
    80005efc:	00008067          	ret

0000000080005f00 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005f00:	ff010113          	addi	sp,sp,-16
    80005f04:	00113423          	sd	ra,8(sp)
    80005f08:	00813023          	sd	s0,0(sp)
    80005f0c:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005f10:	0a853583          	ld	a1,168(a0)
    80005f14:	fffff097          	auipc	ra,0xfffff
    80005f18:	7e4080e7          	jalr	2020(ra) # 800056f8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005f1c:	00813083          	ld	ra,8(sp)
    80005f20:	00013403          	ld	s0,0(sp)
    80005f24:	01010113          	addi	sp,sp,16
    80005f28:	00008067          	ret

0000000080005f2c <_ZN12ProducerSync3runEv>:
    void run() override {
    80005f2c:	ff010113          	addi	sp,sp,-16
    80005f30:	00113423          	sd	ra,8(sp)
    80005f34:	00813023          	sd	s0,0(sp)
    80005f38:	01010413          	addi	s0,sp,16
        producer(td);
    80005f3c:	0a853583          	ld	a1,168(a0)
    80005f40:	00000097          	auipc	ra,0x0
    80005f44:	878080e7          	jalr	-1928(ra) # 800057b8 <_ZN12ProducerSync8producerEPv>
    }
    80005f48:	00813083          	ld	ra,8(sp)
    80005f4c:	00013403          	ld	s0,0(sp)
    80005f50:	01010113          	addi	sp,sp,16
    80005f54:	00008067          	ret

0000000080005f58 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005f58:	ff010113          	addi	sp,sp,-16
    80005f5c:	00113423          	sd	ra,8(sp)
    80005f60:	00813023          	sd	s0,0(sp)
    80005f64:	01010413          	addi	s0,sp,16
        consumer(td);
    80005f68:	0a853583          	ld	a1,168(a0)
    80005f6c:	00000097          	auipc	ra,0x0
    80005f70:	8e0080e7          	jalr	-1824(ra) # 8000584c <_ZN12ConsumerSync8consumerEPv>
    }
    80005f74:	00813083          	ld	ra,8(sp)
    80005f78:	00013403          	ld	s0,0(sp)
    80005f7c:	01010113          	addi	sp,sp,16
    80005f80:	00008067          	ret

0000000080005f84 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005f84:	fe010113          	addi	sp,sp,-32
    80005f88:	00113c23          	sd	ra,24(sp)
    80005f8c:	00813823          	sd	s0,16(sp)
    80005f90:	00913423          	sd	s1,8(sp)
    80005f94:	02010413          	addi	s0,sp,32
    80005f98:	00050493          	mv	s1,a0
    LOCK();
    80005f9c:	00100613          	li	a2,1
    80005fa0:	00000593          	li	a1,0
    80005fa4:	00007517          	auipc	a0,0x7
    80005fa8:	2d450513          	addi	a0,a0,724 # 8000d278 <lockPrint>
    80005fac:	ffffb097          	auipc	ra,0xffffb
    80005fb0:	33c080e7          	jalr	828(ra) # 800012e8 <copy_and_swap>
    80005fb4:	00050863          	beqz	a0,80005fc4 <_Z11printStringPKc+0x40>
    80005fb8:	ffffb097          	auipc	ra,0xffffb
    80005fbc:	6bc080e7          	jalr	1724(ra) # 80001674 <thread_dispatch>
    80005fc0:	fddff06f          	j	80005f9c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005fc4:	0004c503          	lbu	a0,0(s1)
    80005fc8:	00050a63          	beqz	a0,80005fdc <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005fcc:	ffffc097          	auipc	ra,0xffffc
    80005fd0:	870080e7          	jalr	-1936(ra) # 8000183c <putc>
        string++;
    80005fd4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005fd8:	fedff06f          	j	80005fc4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005fdc:	00000613          	li	a2,0
    80005fe0:	00100593          	li	a1,1
    80005fe4:	00007517          	auipc	a0,0x7
    80005fe8:	29450513          	addi	a0,a0,660 # 8000d278 <lockPrint>
    80005fec:	ffffb097          	auipc	ra,0xffffb
    80005ff0:	2fc080e7          	jalr	764(ra) # 800012e8 <copy_and_swap>
    80005ff4:	fe0514e3          	bnez	a0,80005fdc <_Z11printStringPKc+0x58>
}
    80005ff8:	01813083          	ld	ra,24(sp)
    80005ffc:	01013403          	ld	s0,16(sp)
    80006000:	00813483          	ld	s1,8(sp)
    80006004:	02010113          	addi	sp,sp,32
    80006008:	00008067          	ret

000000008000600c <_Z9getStringPci>:

char* getString(char *buf, int max) {
    8000600c:	fd010113          	addi	sp,sp,-48
    80006010:	02113423          	sd	ra,40(sp)
    80006014:	02813023          	sd	s0,32(sp)
    80006018:	00913c23          	sd	s1,24(sp)
    8000601c:	01213823          	sd	s2,16(sp)
    80006020:	01313423          	sd	s3,8(sp)
    80006024:	01413023          	sd	s4,0(sp)
    80006028:	03010413          	addi	s0,sp,48
    8000602c:	00050993          	mv	s3,a0
    80006030:	00058a13          	mv	s4,a1
    LOCK();
    80006034:	00100613          	li	a2,1
    80006038:	00000593          	li	a1,0
    8000603c:	00007517          	auipc	a0,0x7
    80006040:	23c50513          	addi	a0,a0,572 # 8000d278 <lockPrint>
    80006044:	ffffb097          	auipc	ra,0xffffb
    80006048:	2a4080e7          	jalr	676(ra) # 800012e8 <copy_and_swap>
    8000604c:	00050863          	beqz	a0,8000605c <_Z9getStringPci+0x50>
    80006050:	ffffb097          	auipc	ra,0xffffb
    80006054:	624080e7          	jalr	1572(ra) # 80001674 <thread_dispatch>
    80006058:	fddff06f          	j	80006034 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000605c:	00000913          	li	s2,0
    80006060:	00090493          	mv	s1,s2
    80006064:	0019091b          	addiw	s2,s2,1
    80006068:	03495a63          	bge	s2,s4,8000609c <_Z9getStringPci+0x90>
        cc = getc();
    8000606c:	ffffb097          	auipc	ra,0xffffb
    80006070:	7a0080e7          	jalr	1952(ra) # 8000180c <getc>
        if(cc < 1)
    80006074:	02050463          	beqz	a0,8000609c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80006078:	009984b3          	add	s1,s3,s1
    8000607c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80006080:	00a00793          	li	a5,10
    80006084:	00f50a63          	beq	a0,a5,80006098 <_Z9getStringPci+0x8c>
    80006088:	00d00793          	li	a5,13
    8000608c:	fcf51ae3          	bne	a0,a5,80006060 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80006090:	00090493          	mv	s1,s2
    80006094:	0080006f          	j	8000609c <_Z9getStringPci+0x90>
    80006098:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000609c:	009984b3          	add	s1,s3,s1
    800060a0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800060a4:	00000613          	li	a2,0
    800060a8:	00100593          	li	a1,1
    800060ac:	00007517          	auipc	a0,0x7
    800060b0:	1cc50513          	addi	a0,a0,460 # 8000d278 <lockPrint>
    800060b4:	ffffb097          	auipc	ra,0xffffb
    800060b8:	234080e7          	jalr	564(ra) # 800012e8 <copy_and_swap>
    800060bc:	fe0514e3          	bnez	a0,800060a4 <_Z9getStringPci+0x98>
    return buf;
}
    800060c0:	00098513          	mv	a0,s3
    800060c4:	02813083          	ld	ra,40(sp)
    800060c8:	02013403          	ld	s0,32(sp)
    800060cc:	01813483          	ld	s1,24(sp)
    800060d0:	01013903          	ld	s2,16(sp)
    800060d4:	00813983          	ld	s3,8(sp)
    800060d8:	00013a03          	ld	s4,0(sp)
    800060dc:	03010113          	addi	sp,sp,48
    800060e0:	00008067          	ret

00000000800060e4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800060e4:	ff010113          	addi	sp,sp,-16
    800060e8:	00813423          	sd	s0,8(sp)
    800060ec:	01010413          	addi	s0,sp,16
    800060f0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800060f4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800060f8:	0006c603          	lbu	a2,0(a3)
    800060fc:	fd06071b          	addiw	a4,a2,-48
    80006100:	0ff77713          	andi	a4,a4,255
    80006104:	00900793          	li	a5,9
    80006108:	02e7e063          	bltu	a5,a4,80006128 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000610c:	0025179b          	slliw	a5,a0,0x2
    80006110:	00a787bb          	addw	a5,a5,a0
    80006114:	0017979b          	slliw	a5,a5,0x1
    80006118:	00168693          	addi	a3,a3,1
    8000611c:	00c787bb          	addw	a5,a5,a2
    80006120:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80006124:	fd5ff06f          	j	800060f8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80006128:	00813403          	ld	s0,8(sp)
    8000612c:	01010113          	addi	sp,sp,16
    80006130:	00008067          	ret

0000000080006134 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80006134:	fc010113          	addi	sp,sp,-64
    80006138:	02113c23          	sd	ra,56(sp)
    8000613c:	02813823          	sd	s0,48(sp)
    80006140:	02913423          	sd	s1,40(sp)
    80006144:	03213023          	sd	s2,32(sp)
    80006148:	01313c23          	sd	s3,24(sp)
    8000614c:	04010413          	addi	s0,sp,64
    80006150:	00050493          	mv	s1,a0
    80006154:	00058913          	mv	s2,a1
    80006158:	00060993          	mv	s3,a2
    LOCK();
    8000615c:	00100613          	li	a2,1
    80006160:	00000593          	li	a1,0
    80006164:	00007517          	auipc	a0,0x7
    80006168:	11450513          	addi	a0,a0,276 # 8000d278 <lockPrint>
    8000616c:	ffffb097          	auipc	ra,0xffffb
    80006170:	17c080e7          	jalr	380(ra) # 800012e8 <copy_and_swap>
    80006174:	00050863          	beqz	a0,80006184 <_Z8printIntiii+0x50>
    80006178:	ffffb097          	auipc	ra,0xffffb
    8000617c:	4fc080e7          	jalr	1276(ra) # 80001674 <thread_dispatch>
    80006180:	fddff06f          	j	8000615c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80006184:	00098463          	beqz	s3,8000618c <_Z8printIntiii+0x58>
    80006188:	0804c463          	bltz	s1,80006210 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000618c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006190:	00000593          	li	a1,0
    }

    i = 0;
    80006194:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80006198:	0009079b          	sext.w	a5,s2
    8000619c:	0325773b          	remuw	a4,a0,s2
    800061a0:	00048613          	mv	a2,s1
    800061a4:	0014849b          	addiw	s1,s1,1
    800061a8:	02071693          	slli	a3,a4,0x20
    800061ac:	0206d693          	srli	a3,a3,0x20
    800061b0:	00007717          	auipc	a4,0x7
    800061b4:	ae870713          	addi	a4,a4,-1304 # 8000cc98 <digits>
    800061b8:	00d70733          	add	a4,a4,a3
    800061bc:	00074683          	lbu	a3,0(a4)
    800061c0:	fd040713          	addi	a4,s0,-48
    800061c4:	00c70733          	add	a4,a4,a2
    800061c8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800061cc:	0005071b          	sext.w	a4,a0
    800061d0:	0325553b          	divuw	a0,a0,s2
    800061d4:	fcf772e3          	bgeu	a4,a5,80006198 <_Z8printIntiii+0x64>
    if(neg)
    800061d8:	00058c63          	beqz	a1,800061f0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800061dc:	fd040793          	addi	a5,s0,-48
    800061e0:	009784b3          	add	s1,a5,s1
    800061e4:	02d00793          	li	a5,45
    800061e8:	fef48823          	sb	a5,-16(s1)
    800061ec:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800061f0:	fff4849b          	addiw	s1,s1,-1
    800061f4:	0204c463          	bltz	s1,8000621c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800061f8:	fd040793          	addi	a5,s0,-48
    800061fc:	009787b3          	add	a5,a5,s1
    80006200:	ff07c503          	lbu	a0,-16(a5)
    80006204:	ffffb097          	auipc	ra,0xffffb
    80006208:	638080e7          	jalr	1592(ra) # 8000183c <putc>
    8000620c:	fe5ff06f          	j	800061f0 <_Z8printIntiii+0xbc>
        x = -xx;
    80006210:	4090053b          	negw	a0,s1
        neg = 1;
    80006214:	00100593          	li	a1,1
        x = -xx;
    80006218:	f7dff06f          	j	80006194 <_Z8printIntiii+0x60>

    UNLOCK();
    8000621c:	00000613          	li	a2,0
    80006220:	00100593          	li	a1,1
    80006224:	00007517          	auipc	a0,0x7
    80006228:	05450513          	addi	a0,a0,84 # 8000d278 <lockPrint>
    8000622c:	ffffb097          	auipc	ra,0xffffb
    80006230:	0bc080e7          	jalr	188(ra) # 800012e8 <copy_and_swap>
    80006234:	fe0514e3          	bnez	a0,8000621c <_Z8printIntiii+0xe8>
    80006238:	03813083          	ld	ra,56(sp)
    8000623c:	03013403          	ld	s0,48(sp)
    80006240:	02813483          	ld	s1,40(sp)
    80006244:	02013903          	ld	s2,32(sp)
    80006248:	01813983          	ld	s3,24(sp)
    8000624c:	04010113          	addi	sp,sp,64
    80006250:	00008067          	ret

0000000080006254 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006254:	fd010113          	addi	sp,sp,-48
    80006258:	02113423          	sd	ra,40(sp)
    8000625c:	02813023          	sd	s0,32(sp)
    80006260:	00913c23          	sd	s1,24(sp)
    80006264:	01213823          	sd	s2,16(sp)
    80006268:	01313423          	sd	s3,8(sp)
    8000626c:	03010413          	addi	s0,sp,48
    80006270:	00050493          	mv	s1,a0
    80006274:	00058913          	mv	s2,a1
    80006278:	0015879b          	addiw	a5,a1,1
    8000627c:	0007851b          	sext.w	a0,a5
    80006280:	00f4a023          	sw	a5,0(s1)
    80006284:	0004a823          	sw	zero,16(s1)
    80006288:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000628c:	00251513          	slli	a0,a0,0x2
    80006290:	ffffb097          	auipc	ra,0xffffb
    80006294:	298080e7          	jalr	664(ra) # 80001528 <mem_alloc>
    80006298:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000629c:	02000513          	li	a0,32
    800062a0:	ffffc097          	auipc	ra,0xffffc
    800062a4:	830080e7          	jalr	-2000(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    800062a8:	00050993          	mv	s3,a0
    800062ac:	00000593          	li	a1,0
    800062b0:	ffffb097          	auipc	ra,0xffffb
    800062b4:	7b4080e7          	jalr	1972(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    800062b8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800062bc:	02000513          	li	a0,32
    800062c0:	ffffc097          	auipc	ra,0xffffc
    800062c4:	810080e7          	jalr	-2032(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    800062c8:	00050993          	mv	s3,a0
    800062cc:	00090593          	mv	a1,s2
    800062d0:	ffffb097          	auipc	ra,0xffffb
    800062d4:	794080e7          	jalr	1940(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    800062d8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800062dc:	02000513          	li	a0,32
    800062e0:	ffffb097          	auipc	ra,0xffffb
    800062e4:	7f0080e7          	jalr	2032(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    800062e8:	00050913          	mv	s2,a0
    800062ec:	00100593          	li	a1,1
    800062f0:	ffffb097          	auipc	ra,0xffffb
    800062f4:	774080e7          	jalr	1908(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    800062f8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800062fc:	02000513          	li	a0,32
    80006300:	ffffb097          	auipc	ra,0xffffb
    80006304:	7d0080e7          	jalr	2000(ra) # 80001ad0 <_ZN9SemaphorenwEm>
    80006308:	00050913          	mv	s2,a0
    8000630c:	00100593          	li	a1,1
    80006310:	ffffb097          	auipc	ra,0xffffb
    80006314:	754080e7          	jalr	1876(ra) # 80001a64 <_ZN9SemaphoreC1Ej>
    80006318:	0324b823          	sd	s2,48(s1)
}
    8000631c:	02813083          	ld	ra,40(sp)
    80006320:	02013403          	ld	s0,32(sp)
    80006324:	01813483          	ld	s1,24(sp)
    80006328:	01013903          	ld	s2,16(sp)
    8000632c:	00813983          	ld	s3,8(sp)
    80006330:	03010113          	addi	sp,sp,48
    80006334:	00008067          	ret
    80006338:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    8000633c:	00098513          	mv	a0,s3
    80006340:	ffffb097          	auipc	ra,0xffffb
    80006344:	7c8080e7          	jalr	1992(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80006348:	00048513          	mv	a0,s1
    8000634c:	00008097          	auipc	ra,0x8
    80006350:	00c080e7          	jalr	12(ra) # 8000e358 <_Unwind_Resume>
    80006354:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006358:	00098513          	mv	a0,s3
    8000635c:	ffffb097          	auipc	ra,0xffffb
    80006360:	7ac080e7          	jalr	1964(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80006364:	00048513          	mv	a0,s1
    80006368:	00008097          	auipc	ra,0x8
    8000636c:	ff0080e7          	jalr	-16(ra) # 8000e358 <_Unwind_Resume>
    80006370:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80006374:	00090513          	mv	a0,s2
    80006378:	ffffb097          	auipc	ra,0xffffb
    8000637c:	790080e7          	jalr	1936(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    80006380:	00048513          	mv	a0,s1
    80006384:	00008097          	auipc	ra,0x8
    80006388:	fd4080e7          	jalr	-44(ra) # 8000e358 <_Unwind_Resume>
    8000638c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006390:	00090513          	mv	a0,s2
    80006394:	ffffb097          	auipc	ra,0xffffb
    80006398:	774080e7          	jalr	1908(ra) # 80001b08 <_ZN9SemaphoredlEPv>
    8000639c:	00048513          	mv	a0,s1
    800063a0:	00008097          	auipc	ra,0x8
    800063a4:	fb8080e7          	jalr	-72(ra) # 8000e358 <_Unwind_Resume>

00000000800063a8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800063a8:	fe010113          	addi	sp,sp,-32
    800063ac:	00113c23          	sd	ra,24(sp)
    800063b0:	00813823          	sd	s0,16(sp)
    800063b4:	00913423          	sd	s1,8(sp)
    800063b8:	01213023          	sd	s2,0(sp)
    800063bc:	02010413          	addi	s0,sp,32
    800063c0:	00050493          	mv	s1,a0
    800063c4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800063c8:	01853503          	ld	a0,24(a0)
    800063cc:	ffffc097          	auipc	ra,0xffffc
    800063d0:	a80080e7          	jalr	-1408(ra) # 80001e4c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800063d4:	0304b503          	ld	a0,48(s1)
    800063d8:	ffffc097          	auipc	ra,0xffffc
    800063dc:	a74080e7          	jalr	-1420(ra) # 80001e4c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800063e0:	0084b783          	ld	a5,8(s1)
    800063e4:	0144a703          	lw	a4,20(s1)
    800063e8:	00271713          	slli	a4,a4,0x2
    800063ec:	00e787b3          	add	a5,a5,a4
    800063f0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800063f4:	0144a783          	lw	a5,20(s1)
    800063f8:	0017879b          	addiw	a5,a5,1
    800063fc:	0004a703          	lw	a4,0(s1)
    80006400:	02e7e7bb          	remw	a5,a5,a4
    80006404:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80006408:	0304b503          	ld	a0,48(s1)
    8000640c:	ffffc097          	auipc	ra,0xffffc
    80006410:	b18080e7          	jalr	-1256(ra) # 80001f24 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006414:	0204b503          	ld	a0,32(s1)
    80006418:	ffffc097          	auipc	ra,0xffffc
    8000641c:	b0c080e7          	jalr	-1268(ra) # 80001f24 <_ZN9Semaphore6signalEv>

}
    80006420:	01813083          	ld	ra,24(sp)
    80006424:	01013403          	ld	s0,16(sp)
    80006428:	00813483          	ld	s1,8(sp)
    8000642c:	00013903          	ld	s2,0(sp)
    80006430:	02010113          	addi	sp,sp,32
    80006434:	00008067          	ret

0000000080006438 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006438:	fe010113          	addi	sp,sp,-32
    8000643c:	00113c23          	sd	ra,24(sp)
    80006440:	00813823          	sd	s0,16(sp)
    80006444:	00913423          	sd	s1,8(sp)
    80006448:	01213023          	sd	s2,0(sp)
    8000644c:	02010413          	addi	s0,sp,32
    80006450:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80006454:	02053503          	ld	a0,32(a0)
    80006458:	ffffc097          	auipc	ra,0xffffc
    8000645c:	9f4080e7          	jalr	-1548(ra) # 80001e4c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006460:	0284b503          	ld	a0,40(s1)
    80006464:	ffffc097          	auipc	ra,0xffffc
    80006468:	9e8080e7          	jalr	-1560(ra) # 80001e4c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000646c:	0084b703          	ld	a4,8(s1)
    80006470:	0104a783          	lw	a5,16(s1)
    80006474:	00279693          	slli	a3,a5,0x2
    80006478:	00d70733          	add	a4,a4,a3
    8000647c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006480:	0017879b          	addiw	a5,a5,1
    80006484:	0004a703          	lw	a4,0(s1)
    80006488:	02e7e7bb          	remw	a5,a5,a4
    8000648c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006490:	0284b503          	ld	a0,40(s1)
    80006494:	ffffc097          	auipc	ra,0xffffc
    80006498:	a90080e7          	jalr	-1392(ra) # 80001f24 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000649c:	0184b503          	ld	a0,24(s1)
    800064a0:	ffffc097          	auipc	ra,0xffffc
    800064a4:	a84080e7          	jalr	-1404(ra) # 80001f24 <_ZN9Semaphore6signalEv>

    return ret;
}
    800064a8:	00090513          	mv	a0,s2
    800064ac:	01813083          	ld	ra,24(sp)
    800064b0:	01013403          	ld	s0,16(sp)
    800064b4:	00813483          	ld	s1,8(sp)
    800064b8:	00013903          	ld	s2,0(sp)
    800064bc:	02010113          	addi	sp,sp,32
    800064c0:	00008067          	ret

00000000800064c4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800064c4:	fe010113          	addi	sp,sp,-32
    800064c8:	00113c23          	sd	ra,24(sp)
    800064cc:	00813823          	sd	s0,16(sp)
    800064d0:	00913423          	sd	s1,8(sp)
    800064d4:	01213023          	sd	s2,0(sp)
    800064d8:	02010413          	addi	s0,sp,32
    800064dc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800064e0:	02853503          	ld	a0,40(a0)
    800064e4:	ffffc097          	auipc	ra,0xffffc
    800064e8:	968080e7          	jalr	-1688(ra) # 80001e4c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800064ec:	0304b503          	ld	a0,48(s1)
    800064f0:	ffffc097          	auipc	ra,0xffffc
    800064f4:	95c080e7          	jalr	-1700(ra) # 80001e4c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800064f8:	0144a783          	lw	a5,20(s1)
    800064fc:	0104a903          	lw	s2,16(s1)
    80006500:	0327ce63          	blt	a5,s2,8000653c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006504:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80006508:	0304b503          	ld	a0,48(s1)
    8000650c:	ffffc097          	auipc	ra,0xffffc
    80006510:	a18080e7          	jalr	-1512(ra) # 80001f24 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006514:	0284b503          	ld	a0,40(s1)
    80006518:	ffffc097          	auipc	ra,0xffffc
    8000651c:	a0c080e7          	jalr	-1524(ra) # 80001f24 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006520:	00090513          	mv	a0,s2
    80006524:	01813083          	ld	ra,24(sp)
    80006528:	01013403          	ld	s0,16(sp)
    8000652c:	00813483          	ld	s1,8(sp)
    80006530:	00013903          	ld	s2,0(sp)
    80006534:	02010113          	addi	sp,sp,32
    80006538:	00008067          	ret
        ret = cap - head + tail;
    8000653c:	0004a703          	lw	a4,0(s1)
    80006540:	4127093b          	subw	s2,a4,s2
    80006544:	00f9093b          	addw	s2,s2,a5
    80006548:	fc1ff06f          	j	80006508 <_ZN9BufferCPP6getCntEv+0x44>

000000008000654c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    8000654c:	fe010113          	addi	sp,sp,-32
    80006550:	00113c23          	sd	ra,24(sp)
    80006554:	00813823          	sd	s0,16(sp)
    80006558:	00913423          	sd	s1,8(sp)
    8000655c:	02010413          	addi	s0,sp,32
    80006560:	00050493          	mv	s1,a0
    Console::putc('\n');
    80006564:	00a00513          	li	a0,10
    80006568:	ffffd097          	auipc	ra,0xffffd
    8000656c:	9b4080e7          	jalr	-1612(ra) # 80002f1c <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006570:	00004517          	auipc	a0,0x4
    80006574:	db850513          	addi	a0,a0,-584 # 8000a328 <CONSOLE_STATUS+0x318>
    80006578:	00000097          	auipc	ra,0x0
    8000657c:	a0c080e7          	jalr	-1524(ra) # 80005f84 <_Z11printStringPKc>
    while (getCnt()) {
    80006580:	00048513          	mv	a0,s1
    80006584:	00000097          	auipc	ra,0x0
    80006588:	f40080e7          	jalr	-192(ra) # 800064c4 <_ZN9BufferCPP6getCntEv>
    8000658c:	02050c63          	beqz	a0,800065c4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006590:	0084b783          	ld	a5,8(s1)
    80006594:	0104a703          	lw	a4,16(s1)
    80006598:	00271713          	slli	a4,a4,0x2
    8000659c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800065a0:	0007c503          	lbu	a0,0(a5)
    800065a4:	ffffd097          	auipc	ra,0xffffd
    800065a8:	978080e7          	jalr	-1672(ra) # 80002f1c <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800065ac:	0104a783          	lw	a5,16(s1)
    800065b0:	0017879b          	addiw	a5,a5,1
    800065b4:	0004a703          	lw	a4,0(s1)
    800065b8:	02e7e7bb          	remw	a5,a5,a4
    800065bc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800065c0:	fc1ff06f          	j	80006580 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800065c4:	02100513          	li	a0,33
    800065c8:	ffffd097          	auipc	ra,0xffffd
    800065cc:	954080e7          	jalr	-1708(ra) # 80002f1c <_ZN7Console4putcEc>
    Console::putc('\n');
    800065d0:	00a00513          	li	a0,10
    800065d4:	ffffd097          	auipc	ra,0xffffd
    800065d8:	948080e7          	jalr	-1720(ra) # 80002f1c <_ZN7Console4putcEc>
    mem_free(buffer);
    800065dc:	0084b503          	ld	a0,8(s1)
    800065e0:	ffffb097          	auipc	ra,0xffffb
    800065e4:	f90080e7          	jalr	-112(ra) # 80001570 <mem_free>
    delete itemAvailable;
    800065e8:	0204b503          	ld	a0,32(s1)
    800065ec:	00050863          	beqz	a0,800065fc <_ZN9BufferCPPD1Ev+0xb0>
    800065f0:	00053783          	ld	a5,0(a0)
    800065f4:	0087b783          	ld	a5,8(a5)
    800065f8:	000780e7          	jalr	a5
    delete spaceAvailable;
    800065fc:	0184b503          	ld	a0,24(s1)
    80006600:	00050863          	beqz	a0,80006610 <_ZN9BufferCPPD1Ev+0xc4>
    80006604:	00053783          	ld	a5,0(a0)
    80006608:	0087b783          	ld	a5,8(a5)
    8000660c:	000780e7          	jalr	a5
    delete mutexTail;
    80006610:	0304b503          	ld	a0,48(s1)
    80006614:	00050863          	beqz	a0,80006624 <_ZN9BufferCPPD1Ev+0xd8>
    80006618:	00053783          	ld	a5,0(a0)
    8000661c:	0087b783          	ld	a5,8(a5)
    80006620:	000780e7          	jalr	a5
    delete mutexHead;
    80006624:	0284b503          	ld	a0,40(s1)
    80006628:	00050863          	beqz	a0,80006638 <_ZN9BufferCPPD1Ev+0xec>
    8000662c:	00053783          	ld	a5,0(a0)
    80006630:	0087b783          	ld	a5,8(a5)
    80006634:	000780e7          	jalr	a5
}
    80006638:	01813083          	ld	ra,24(sp)
    8000663c:	01013403          	ld	s0,16(sp)
    80006640:	00813483          	ld	s1,8(sp)
    80006644:	02010113          	addi	sp,sp,32
    80006648:	00008067          	ret

000000008000664c <userMain>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

extern "C" void userMain() {
    8000664c:	ff010113          	addi	sp,sp,-16
    80006650:	00113423          	sd	ra,8(sp)
    80006654:	00813023          	sd	s0,0(sp)
    80006658:	01010413          	addi	s0,sp,16
    printString("Unesite broj testa? [1-7]\n");
    8000665c:	00004517          	auipc	a0,0x4
    80006660:	ce450513          	addi	a0,a0,-796 # 8000a340 <CONSOLE_STATUS+0x330>
    80006664:	00000097          	auipc	ra,0x0
    80006668:	920080e7          	jalr	-1760(ra) # 80005f84 <_Z11printStringPKc>
    }

    switch (test) {
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000666c:	fffff097          	auipc	ra,0xfffff
    80006670:	ff8080e7          	jalr	-8(ra) # 80005664 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006674:	00004517          	auipc	a0,0x4
    80006678:	cec50513          	addi	a0,a0,-788 # 8000a360 <CONSOLE_STATUS+0x350>
    8000667c:	00000097          	auipc	ra,0x0
    80006680:	908080e7          	jalr	-1784(ra) # 80005f84 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006684:	00813083          	ld	ra,8(sp)
    80006688:	00013403          	ld	s0,0(sp)
    8000668c:	01010113          	addi	sp,sp,16
    80006690:	00008067          	ret

0000000080006694 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006694:	fe010113          	addi	sp,sp,-32
    80006698:	00113c23          	sd	ra,24(sp)
    8000669c:	00813823          	sd	s0,16(sp)
    800066a0:	00913423          	sd	s1,8(sp)
    800066a4:	01213023          	sd	s2,0(sp)
    800066a8:	02010413          	addi	s0,sp,32
    800066ac:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800066b0:	00100793          	li	a5,1
    800066b4:	02a7f863          	bgeu	a5,a0,800066e4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800066b8:	00a00793          	li	a5,10
    800066bc:	02f577b3          	remu	a5,a0,a5
    800066c0:	02078e63          	beqz	a5,800066fc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800066c4:	fff48513          	addi	a0,s1,-1
    800066c8:	00000097          	auipc	ra,0x0
    800066cc:	fcc080e7          	jalr	-52(ra) # 80006694 <_ZL9fibonaccim>
    800066d0:	00050913          	mv	s2,a0
    800066d4:	ffe48513          	addi	a0,s1,-2
    800066d8:	00000097          	auipc	ra,0x0
    800066dc:	fbc080e7          	jalr	-68(ra) # 80006694 <_ZL9fibonaccim>
    800066e0:	00a90533          	add	a0,s2,a0
}
    800066e4:	01813083          	ld	ra,24(sp)
    800066e8:	01013403          	ld	s0,16(sp)
    800066ec:	00813483          	ld	s1,8(sp)
    800066f0:	00013903          	ld	s2,0(sp)
    800066f4:	02010113          	addi	sp,sp,32
    800066f8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800066fc:	ffffb097          	auipc	ra,0xffffb
    80006700:	f78080e7          	jalr	-136(ra) # 80001674 <thread_dispatch>
    80006704:	fc1ff06f          	j	800066c4 <_ZL9fibonaccim+0x30>

0000000080006708 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006708:	fe010113          	addi	sp,sp,-32
    8000670c:	00113c23          	sd	ra,24(sp)
    80006710:	00813823          	sd	s0,16(sp)
    80006714:	00913423          	sd	s1,8(sp)
    80006718:	01213023          	sd	s2,0(sp)
    8000671c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006720:	00a00493          	li	s1,10
    80006724:	0400006f          	j	80006764 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006728:	00004517          	auipc	a0,0x4
    8000672c:	ae050513          	addi	a0,a0,-1312 # 8000a208 <CONSOLE_STATUS+0x1f8>
    80006730:	00000097          	auipc	ra,0x0
    80006734:	854080e7          	jalr	-1964(ra) # 80005f84 <_Z11printStringPKc>
    80006738:	00000613          	li	a2,0
    8000673c:	00a00593          	li	a1,10
    80006740:	00048513          	mv	a0,s1
    80006744:	00000097          	auipc	ra,0x0
    80006748:	9f0080e7          	jalr	-1552(ra) # 80006134 <_Z8printIntiii>
    8000674c:	00004517          	auipc	a0,0x4
    80006750:	a1c50513          	addi	a0,a0,-1508 # 8000a168 <CONSOLE_STATUS+0x158>
    80006754:	00000097          	auipc	ra,0x0
    80006758:	830080e7          	jalr	-2000(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000675c:	0014849b          	addiw	s1,s1,1
    80006760:	0ff4f493          	andi	s1,s1,255
    80006764:	00c00793          	li	a5,12
    80006768:	fc97f0e3          	bgeu	a5,s1,80006728 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000676c:	00004517          	auipc	a0,0x4
    80006770:	aa450513          	addi	a0,a0,-1372 # 8000a210 <CONSOLE_STATUS+0x200>
    80006774:	00000097          	auipc	ra,0x0
    80006778:	810080e7          	jalr	-2032(ra) # 80005f84 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000677c:	00500313          	li	t1,5
    thread_dispatch();
    80006780:	ffffb097          	auipc	ra,0xffffb
    80006784:	ef4080e7          	jalr	-268(ra) # 80001674 <thread_dispatch>

    uint64 result = fibonacci(16);
    80006788:	01000513          	li	a0,16
    8000678c:	00000097          	auipc	ra,0x0
    80006790:	f08080e7          	jalr	-248(ra) # 80006694 <_ZL9fibonaccim>
    80006794:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006798:	00004517          	auipc	a0,0x4
    8000679c:	a8850513          	addi	a0,a0,-1400 # 8000a220 <CONSOLE_STATUS+0x210>
    800067a0:	fffff097          	auipc	ra,0xfffff
    800067a4:	7e4080e7          	jalr	2020(ra) # 80005f84 <_Z11printStringPKc>
    800067a8:	00000613          	li	a2,0
    800067ac:	00a00593          	li	a1,10
    800067b0:	0009051b          	sext.w	a0,s2
    800067b4:	00000097          	auipc	ra,0x0
    800067b8:	980080e7          	jalr	-1664(ra) # 80006134 <_Z8printIntiii>
    800067bc:	00004517          	auipc	a0,0x4
    800067c0:	9ac50513          	addi	a0,a0,-1620 # 8000a168 <CONSOLE_STATUS+0x158>
    800067c4:	fffff097          	auipc	ra,0xfffff
    800067c8:	7c0080e7          	jalr	1984(ra) # 80005f84 <_Z11printStringPKc>
    800067cc:	0400006f          	j	8000680c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800067d0:	00004517          	auipc	a0,0x4
    800067d4:	a3850513          	addi	a0,a0,-1480 # 8000a208 <CONSOLE_STATUS+0x1f8>
    800067d8:	fffff097          	auipc	ra,0xfffff
    800067dc:	7ac080e7          	jalr	1964(ra) # 80005f84 <_Z11printStringPKc>
    800067e0:	00000613          	li	a2,0
    800067e4:	00a00593          	li	a1,10
    800067e8:	00048513          	mv	a0,s1
    800067ec:	00000097          	auipc	ra,0x0
    800067f0:	948080e7          	jalr	-1720(ra) # 80006134 <_Z8printIntiii>
    800067f4:	00004517          	auipc	a0,0x4
    800067f8:	97450513          	addi	a0,a0,-1676 # 8000a168 <CONSOLE_STATUS+0x158>
    800067fc:	fffff097          	auipc	ra,0xfffff
    80006800:	788080e7          	jalr	1928(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80006804:	0014849b          	addiw	s1,s1,1
    80006808:	0ff4f493          	andi	s1,s1,255
    8000680c:	00f00793          	li	a5,15
    80006810:	fc97f0e3          	bgeu	a5,s1,800067d0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006814:	00004517          	auipc	a0,0x4
    80006818:	a1c50513          	addi	a0,a0,-1508 # 8000a230 <CONSOLE_STATUS+0x220>
    8000681c:	fffff097          	auipc	ra,0xfffff
    80006820:	768080e7          	jalr	1896(ra) # 80005f84 <_Z11printStringPKc>
    finishedD = true;
    80006824:	00100793          	li	a5,1
    80006828:	00007717          	auipc	a4,0x7
    8000682c:	a4f70c23          	sb	a5,-1448(a4) # 8000d280 <_ZL9finishedD>
    thread_dispatch();
    80006830:	ffffb097          	auipc	ra,0xffffb
    80006834:	e44080e7          	jalr	-444(ra) # 80001674 <thread_dispatch>
}
    80006838:	01813083          	ld	ra,24(sp)
    8000683c:	01013403          	ld	s0,16(sp)
    80006840:	00813483          	ld	s1,8(sp)
    80006844:	00013903          	ld	s2,0(sp)
    80006848:	02010113          	addi	sp,sp,32
    8000684c:	00008067          	ret

0000000080006850 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006850:	fe010113          	addi	sp,sp,-32
    80006854:	00113c23          	sd	ra,24(sp)
    80006858:	00813823          	sd	s0,16(sp)
    8000685c:	00913423          	sd	s1,8(sp)
    80006860:	01213023          	sd	s2,0(sp)
    80006864:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006868:	00000493          	li	s1,0
    8000686c:	0400006f          	j	800068ac <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006870:	00004517          	auipc	a0,0x4
    80006874:	96850513          	addi	a0,a0,-1688 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	70c080e7          	jalr	1804(ra) # 80005f84 <_Z11printStringPKc>
    80006880:	00000613          	li	a2,0
    80006884:	00a00593          	li	a1,10
    80006888:	00048513          	mv	a0,s1
    8000688c:	00000097          	auipc	ra,0x0
    80006890:	8a8080e7          	jalr	-1880(ra) # 80006134 <_Z8printIntiii>
    80006894:	00004517          	auipc	a0,0x4
    80006898:	8d450513          	addi	a0,a0,-1836 # 8000a168 <CONSOLE_STATUS+0x158>
    8000689c:	fffff097          	auipc	ra,0xfffff
    800068a0:	6e8080e7          	jalr	1768(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800068a4:	0014849b          	addiw	s1,s1,1
    800068a8:	0ff4f493          	andi	s1,s1,255
    800068ac:	00200793          	li	a5,2
    800068b0:	fc97f0e3          	bgeu	a5,s1,80006870 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800068b4:	00004517          	auipc	a0,0x4
    800068b8:	92c50513          	addi	a0,a0,-1748 # 8000a1e0 <CONSOLE_STATUS+0x1d0>
    800068bc:	fffff097          	auipc	ra,0xfffff
    800068c0:	6c8080e7          	jalr	1736(ra) # 80005f84 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800068c4:	00700313          	li	t1,7
    thread_dispatch();
    800068c8:	ffffb097          	auipc	ra,0xffffb
    800068cc:	dac080e7          	jalr	-596(ra) # 80001674 <thread_dispatch>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800068d0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800068d4:	00004517          	auipc	a0,0x4
    800068d8:	91c50513          	addi	a0,a0,-1764 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    800068dc:	fffff097          	auipc	ra,0xfffff
    800068e0:	6a8080e7          	jalr	1704(ra) # 80005f84 <_Z11printStringPKc>
    800068e4:	00000613          	li	a2,0
    800068e8:	00a00593          	li	a1,10
    800068ec:	0009051b          	sext.w	a0,s2
    800068f0:	00000097          	auipc	ra,0x0
    800068f4:	844080e7          	jalr	-1980(ra) # 80006134 <_Z8printIntiii>
    800068f8:	00004517          	auipc	a0,0x4
    800068fc:	87050513          	addi	a0,a0,-1936 # 8000a168 <CONSOLE_STATUS+0x158>
    80006900:	fffff097          	auipc	ra,0xfffff
    80006904:	684080e7          	jalr	1668(ra) # 80005f84 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006908:	00c00513          	li	a0,12
    8000690c:	00000097          	auipc	ra,0x0
    80006910:	d88080e7          	jalr	-632(ra) # 80006694 <_ZL9fibonaccim>
    80006914:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006918:	00004517          	auipc	a0,0x4
    8000691c:	8e050513          	addi	a0,a0,-1824 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80006920:	fffff097          	auipc	ra,0xfffff
    80006924:	664080e7          	jalr	1636(ra) # 80005f84 <_Z11printStringPKc>
    80006928:	00000613          	li	a2,0
    8000692c:	00a00593          	li	a1,10
    80006930:	0009051b          	sext.w	a0,s2
    80006934:	00000097          	auipc	ra,0x0
    80006938:	800080e7          	jalr	-2048(ra) # 80006134 <_Z8printIntiii>
    8000693c:	00004517          	auipc	a0,0x4
    80006940:	82c50513          	addi	a0,a0,-2004 # 8000a168 <CONSOLE_STATUS+0x158>
    80006944:	fffff097          	auipc	ra,0xfffff
    80006948:	640080e7          	jalr	1600(ra) # 80005f84 <_Z11printStringPKc>
    8000694c:	0400006f          	j	8000698c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006950:	00004517          	auipc	a0,0x4
    80006954:	88850513          	addi	a0,a0,-1912 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80006958:	fffff097          	auipc	ra,0xfffff
    8000695c:	62c080e7          	jalr	1580(ra) # 80005f84 <_Z11printStringPKc>
    80006960:	00000613          	li	a2,0
    80006964:	00a00593          	li	a1,10
    80006968:	00048513          	mv	a0,s1
    8000696c:	fffff097          	auipc	ra,0xfffff
    80006970:	7c8080e7          	jalr	1992(ra) # 80006134 <_Z8printIntiii>
    80006974:	00003517          	auipc	a0,0x3
    80006978:	7f450513          	addi	a0,a0,2036 # 8000a168 <CONSOLE_STATUS+0x158>
    8000697c:	fffff097          	auipc	ra,0xfffff
    80006980:	608080e7          	jalr	1544(ra) # 80005f84 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006984:	0014849b          	addiw	s1,s1,1
    80006988:	0ff4f493          	andi	s1,s1,255
    8000698c:	00500793          	li	a5,5
    80006990:	fc97f0e3          	bgeu	a5,s1,80006950 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006994:	00004517          	auipc	a0,0x4
    80006998:	81c50513          	addi	a0,a0,-2020 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    8000699c:	fffff097          	auipc	ra,0xfffff
    800069a0:	5e8080e7          	jalr	1512(ra) # 80005f84 <_Z11printStringPKc>
    finishedC = true;
    800069a4:	00100793          	li	a5,1
    800069a8:	00007717          	auipc	a4,0x7
    800069ac:	8cf70ca3          	sb	a5,-1831(a4) # 8000d281 <_ZL9finishedC>
    thread_dispatch();
    800069b0:	ffffb097          	auipc	ra,0xffffb
    800069b4:	cc4080e7          	jalr	-828(ra) # 80001674 <thread_dispatch>
}
    800069b8:	01813083          	ld	ra,24(sp)
    800069bc:	01013403          	ld	s0,16(sp)
    800069c0:	00813483          	ld	s1,8(sp)
    800069c4:	00013903          	ld	s2,0(sp)
    800069c8:	02010113          	addi	sp,sp,32
    800069cc:	00008067          	ret

00000000800069d0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800069d0:	fe010113          	addi	sp,sp,-32
    800069d4:	00113c23          	sd	ra,24(sp)
    800069d8:	00813823          	sd	s0,16(sp)
    800069dc:	00913423          	sd	s1,8(sp)
    800069e0:	01213023          	sd	s2,0(sp)
    800069e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800069e8:	00000913          	li	s2,0
    800069ec:	0400006f          	j	80006a2c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800069f0:	ffffb097          	auipc	ra,0xffffb
    800069f4:	c84080e7          	jalr	-892(ra) # 80001674 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    800069f8:	00148493          	addi	s1,s1,1
    800069fc:	000027b7          	lui	a5,0x2
    80006a00:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006a04:	0097ee63          	bltu	a5,s1,80006a20 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006a08:	00000713          	li	a4,0
    80006a0c:	000077b7          	lui	a5,0x7
    80006a10:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006a14:	fce7eee3          	bltu	a5,a4,800069f0 <_ZL11workerBodyBPv+0x20>
    80006a18:	00170713          	addi	a4,a4,1
    80006a1c:	ff1ff06f          	j	80006a0c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006a20:	00a00793          	li	a5,10
    80006a24:	04f90663          	beq	s2,a5,80006a70 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006a28:	00190913          	addi	s2,s2,1
    80006a2c:	00f00793          	li	a5,15
    80006a30:	0527e463          	bltu	a5,s2,80006a78 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006a34:	00003517          	auipc	a0,0x3
    80006a38:	78c50513          	addi	a0,a0,1932 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80006a3c:	fffff097          	auipc	ra,0xfffff
    80006a40:	548080e7          	jalr	1352(ra) # 80005f84 <_Z11printStringPKc>
    80006a44:	00000613          	li	a2,0
    80006a48:	00a00593          	li	a1,10
    80006a4c:	0009051b          	sext.w	a0,s2
    80006a50:	fffff097          	auipc	ra,0xfffff
    80006a54:	6e4080e7          	jalr	1764(ra) # 80006134 <_Z8printIntiii>
    80006a58:	00003517          	auipc	a0,0x3
    80006a5c:	71050513          	addi	a0,a0,1808 # 8000a168 <CONSOLE_STATUS+0x158>
    80006a60:	fffff097          	auipc	ra,0xfffff
    80006a64:	524080e7          	jalr	1316(ra) # 80005f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006a68:	00000493          	li	s1,0
    80006a6c:	f91ff06f          	j	800069fc <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006a70:	14102ff3          	csrr	t6,sepc
    80006a74:	fb5ff06f          	j	80006a28 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006a78:	00003517          	auipc	a0,0x3
    80006a7c:	75050513          	addi	a0,a0,1872 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    80006a80:	fffff097          	auipc	ra,0xfffff
    80006a84:	504080e7          	jalr	1284(ra) # 80005f84 <_Z11printStringPKc>
    finishedB = true;
    80006a88:	00100793          	li	a5,1
    80006a8c:	00006717          	auipc	a4,0x6
    80006a90:	7ef70b23          	sb	a5,2038(a4) # 8000d282 <_ZL9finishedB>
    thread_dispatch();
    80006a94:	ffffb097          	auipc	ra,0xffffb
    80006a98:	be0080e7          	jalr	-1056(ra) # 80001674 <thread_dispatch>
}
    80006a9c:	01813083          	ld	ra,24(sp)
    80006aa0:	01013403          	ld	s0,16(sp)
    80006aa4:	00813483          	ld	s1,8(sp)
    80006aa8:	00013903          	ld	s2,0(sp)
    80006aac:	02010113          	addi	sp,sp,32
    80006ab0:	00008067          	ret

0000000080006ab4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006ab4:	fe010113          	addi	sp,sp,-32
    80006ab8:	00113c23          	sd	ra,24(sp)
    80006abc:	00813823          	sd	s0,16(sp)
    80006ac0:	00913423          	sd	s1,8(sp)
    80006ac4:	01213023          	sd	s2,0(sp)
    80006ac8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006acc:	00000913          	li	s2,0
    80006ad0:	0380006f          	j	80006b08 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006ad4:	ffffb097          	auipc	ra,0xffffb
    80006ad8:	ba0080e7          	jalr	-1120(ra) # 80001674 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    80006adc:	00148493          	addi	s1,s1,1
    80006ae0:	000027b7          	lui	a5,0x2
    80006ae4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006ae8:	0097ee63          	bltu	a5,s1,80006b04 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006aec:	00000713          	li	a4,0
    80006af0:	000077b7          	lui	a5,0x7
    80006af4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006af8:	fce7eee3          	bltu	a5,a4,80006ad4 <_ZL11workerBodyAPv+0x20>
    80006afc:	00170713          	addi	a4,a4,1
    80006b00:	ff1ff06f          	j	80006af0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006b04:	00190913          	addi	s2,s2,1
    80006b08:	00900793          	li	a5,9
    80006b0c:	0527e063          	bltu	a5,s2,80006b4c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006b10:	00003517          	auipc	a0,0x3
    80006b14:	69850513          	addi	a0,a0,1688 # 8000a1a8 <CONSOLE_STATUS+0x198>
    80006b18:	fffff097          	auipc	ra,0xfffff
    80006b1c:	46c080e7          	jalr	1132(ra) # 80005f84 <_Z11printStringPKc>
    80006b20:	00000613          	li	a2,0
    80006b24:	00a00593          	li	a1,10
    80006b28:	0009051b          	sext.w	a0,s2
    80006b2c:	fffff097          	auipc	ra,0xfffff
    80006b30:	608080e7          	jalr	1544(ra) # 80006134 <_Z8printIntiii>
    80006b34:	00003517          	auipc	a0,0x3
    80006b38:	63450513          	addi	a0,a0,1588 # 8000a168 <CONSOLE_STATUS+0x158>
    80006b3c:	fffff097          	auipc	ra,0xfffff
    80006b40:	448080e7          	jalr	1096(ra) # 80005f84 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006b44:	00000493          	li	s1,0
    80006b48:	f99ff06f          	j	80006ae0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006b4c:	00003517          	auipc	a0,0x3
    80006b50:	66450513          	addi	a0,a0,1636 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80006b54:	fffff097          	auipc	ra,0xfffff
    80006b58:	430080e7          	jalr	1072(ra) # 80005f84 <_Z11printStringPKc>
    finishedA = true;
    80006b5c:	00100793          	li	a5,1
    80006b60:	00006717          	auipc	a4,0x6
    80006b64:	72f701a3          	sb	a5,1827(a4) # 8000d283 <_ZL9finishedA>
}
    80006b68:	01813083          	ld	ra,24(sp)
    80006b6c:	01013403          	ld	s0,16(sp)
    80006b70:	00813483          	ld	s1,8(sp)
    80006b74:	00013903          	ld	s2,0(sp)
    80006b78:	02010113          	addi	sp,sp,32
    80006b7c:	00008067          	ret

0000000080006b80 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006b80:	fe010113          	addi	sp,sp,-32
    80006b84:	00113c23          	sd	ra,24(sp)
    80006b88:	00813823          	sd	s0,16(sp)
    80006b8c:	02010413          	addi	s0,sp,32
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006b90:	00000613          	li	a2,0
    80006b94:	00000597          	auipc	a1,0x0
    80006b98:	f2058593          	addi	a1,a1,-224 # 80006ab4 <_ZL11workerBodyAPv>
    80006b9c:	fe040513          	addi	a0,s0,-32
    80006ba0:	ffffb097          	auipc	ra,0xffffb
    80006ba4:	a1c080e7          	jalr	-1508(ra) # 800015bc <thread_create>
    printString("ThreadA created\n");
    80006ba8:	00003517          	auipc	a0,0x3
    80006bac:	69850513          	addi	a0,a0,1688 # 8000a240 <CONSOLE_STATUS+0x230>
    80006bb0:	fffff097          	auipc	ra,0xfffff
    80006bb4:	3d4080e7          	jalr	980(ra) # 80005f84 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006bb8:	00000613          	li	a2,0
    80006bbc:	00000597          	auipc	a1,0x0
    80006bc0:	e1458593          	addi	a1,a1,-492 # 800069d0 <_ZL11workerBodyBPv>
    80006bc4:	fe440513          	addi	a0,s0,-28
    80006bc8:	ffffb097          	auipc	ra,0xffffb
    80006bcc:	9f4080e7          	jalr	-1548(ra) # 800015bc <thread_create>
    printString("ThreadB created\n");
    80006bd0:	00003517          	auipc	a0,0x3
    80006bd4:	68850513          	addi	a0,a0,1672 # 8000a258 <CONSOLE_STATUS+0x248>
    80006bd8:	fffff097          	auipc	ra,0xfffff
    80006bdc:	3ac080e7          	jalr	940(ra) # 80005f84 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006be0:	00000613          	li	a2,0
    80006be4:	00000597          	auipc	a1,0x0
    80006be8:	c6c58593          	addi	a1,a1,-916 # 80006850 <_ZL11workerBodyCPv>
    80006bec:	fe840513          	addi	a0,s0,-24
    80006bf0:	ffffb097          	auipc	ra,0xffffb
    80006bf4:	9cc080e7          	jalr	-1588(ra) # 800015bc <thread_create>
    printString("ThreadC created\n");
    80006bf8:	00003517          	auipc	a0,0x3
    80006bfc:	67850513          	addi	a0,a0,1656 # 8000a270 <CONSOLE_STATUS+0x260>
    80006c00:	fffff097          	auipc	ra,0xfffff
    80006c04:	384080e7          	jalr	900(ra) # 80005f84 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006c08:	00000613          	li	a2,0
    80006c0c:	00000597          	auipc	a1,0x0
    80006c10:	afc58593          	addi	a1,a1,-1284 # 80006708 <_ZL11workerBodyDPv>
    80006c14:	fec40513          	addi	a0,s0,-20
    80006c18:	ffffb097          	auipc	ra,0xffffb
    80006c1c:	9a4080e7          	jalr	-1628(ra) # 800015bc <thread_create>
    printString("ThreadD created\n");
    80006c20:	00003517          	auipc	a0,0x3
    80006c24:	66850513          	addi	a0,a0,1640 # 8000a288 <CONSOLE_STATUS+0x278>
    80006c28:	fffff097          	auipc	ra,0xfffff
    80006c2c:	35c080e7          	jalr	860(ra) # 80005f84 <_Z11printStringPKc>
    80006c30:	00c0006f          	j	80006c3c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006c34:	ffffb097          	auipc	ra,0xffffb
    80006c38:	a40080e7          	jalr	-1472(ra) # 80001674 <thread_dispatch>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006c3c:	00006797          	auipc	a5,0x6
    80006c40:	6477c783          	lbu	a5,1607(a5) # 8000d283 <_ZL9finishedA>
    80006c44:	fe0788e3          	beqz	a5,80006c34 <_Z16System_Mode_testv+0xb4>
    80006c48:	00006797          	auipc	a5,0x6
    80006c4c:	63a7c783          	lbu	a5,1594(a5) # 8000d282 <_ZL9finishedB>
    80006c50:	fe0782e3          	beqz	a5,80006c34 <_Z16System_Mode_testv+0xb4>
    80006c54:	00006797          	auipc	a5,0x6
    80006c58:	62d7c783          	lbu	a5,1581(a5) # 8000d281 <_ZL9finishedC>
    80006c5c:	fc078ce3          	beqz	a5,80006c34 <_Z16System_Mode_testv+0xb4>
    80006c60:	00006797          	auipc	a5,0x6
    80006c64:	6207c783          	lbu	a5,1568(a5) # 8000d280 <_ZL9finishedD>
    80006c68:	fc0786e3          	beqz	a5,80006c34 <_Z16System_Mode_testv+0xb4>
    }

}
    80006c6c:	01813083          	ld	ra,24(sp)
    80006c70:	01013403          	ld	s0,16(sp)
    80006c74:	02010113          	addi	sp,sp,32
    80006c78:	00008067          	ret

0000000080006c7c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006c7c:	fe010113          	addi	sp,sp,-32
    80006c80:	00113c23          	sd	ra,24(sp)
    80006c84:	00813823          	sd	s0,16(sp)
    80006c88:	00913423          	sd	s1,8(sp)
    80006c8c:	01213023          	sd	s2,0(sp)
    80006c90:	02010413          	addi	s0,sp,32
    80006c94:	00050493          	mv	s1,a0
    80006c98:	00058913          	mv	s2,a1
    80006c9c:	0015879b          	addiw	a5,a1,1
    80006ca0:	0007851b          	sext.w	a0,a5
    80006ca4:	00f4a023          	sw	a5,0(s1)
    80006ca8:	0004a823          	sw	zero,16(s1)
    80006cac:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006cb0:	00251513          	slli	a0,a0,0x2
    80006cb4:	ffffb097          	auipc	ra,0xffffb
    80006cb8:	874080e7          	jalr	-1932(ra) # 80001528 <mem_alloc>
    80006cbc:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006cc0:	00000593          	li	a1,0
    80006cc4:	01c48513          	addi	a0,s1,28
    80006cc8:	ffffb097          	auipc	ra,0xffffb
    80006ccc:	a2c080e7          	jalr	-1492(ra) # 800016f4 <sem_open>
    sem_open(&spaceAvailable, _cap);
    80006cd0:	00090593          	mv	a1,s2
    80006cd4:	01848513          	addi	a0,s1,24
    80006cd8:	ffffb097          	auipc	ra,0xffffb
    80006cdc:	a1c080e7          	jalr	-1508(ra) # 800016f4 <sem_open>
    sem_open(&mutexHead, 1);
    80006ce0:	00100593          	li	a1,1
    80006ce4:	02048513          	addi	a0,s1,32
    80006ce8:	ffffb097          	auipc	ra,0xffffb
    80006cec:	a0c080e7          	jalr	-1524(ra) # 800016f4 <sem_open>
    sem_open(&mutexTail, 1);
    80006cf0:	00100593          	li	a1,1
    80006cf4:	02448513          	addi	a0,s1,36
    80006cf8:	ffffb097          	auipc	ra,0xffffb
    80006cfc:	9fc080e7          	jalr	-1540(ra) # 800016f4 <sem_open>
}
    80006d00:	01813083          	ld	ra,24(sp)
    80006d04:	01013403          	ld	s0,16(sp)
    80006d08:	00813483          	ld	s1,8(sp)
    80006d0c:	00013903          	ld	s2,0(sp)
    80006d10:	02010113          	addi	sp,sp,32
    80006d14:	00008067          	ret

0000000080006d18 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006d18:	fe010113          	addi	sp,sp,-32
    80006d1c:	00113c23          	sd	ra,24(sp)
    80006d20:	00813823          	sd	s0,16(sp)
    80006d24:	00913423          	sd	s1,8(sp)
    80006d28:	01213023          	sd	s2,0(sp)
    80006d2c:	02010413          	addi	s0,sp,32
    80006d30:	00050493          	mv	s1,a0
    80006d34:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006d38:	01852503          	lw	a0,24(a0)
    80006d3c:	ffffb097          	auipc	ra,0xffffb
    80006d40:	a08080e7          	jalr	-1528(ra) # 80001744 <sem_wait>

    sem_wait(mutexTail);
    80006d44:	0244a503          	lw	a0,36(s1)
    80006d48:	ffffb097          	auipc	ra,0xffffb
    80006d4c:	9fc080e7          	jalr	-1540(ra) # 80001744 <sem_wait>
    buffer[tail] = val;
    80006d50:	0084b783          	ld	a5,8(s1)
    80006d54:	0144a703          	lw	a4,20(s1)
    80006d58:	00271713          	slli	a4,a4,0x2
    80006d5c:	00e787b3          	add	a5,a5,a4
    80006d60:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006d64:	0144a783          	lw	a5,20(s1)
    80006d68:	0017879b          	addiw	a5,a5,1
    80006d6c:	0004a703          	lw	a4,0(s1)
    80006d70:	02e7e7bb          	remw	a5,a5,a4
    80006d74:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006d78:	0244a503          	lw	a0,36(s1)
    80006d7c:	ffffb097          	auipc	ra,0xffffb
    80006d80:	a10080e7          	jalr	-1520(ra) # 8000178c <sem_signal>

    sem_signal(itemAvailable);
    80006d84:	01c4a503          	lw	a0,28(s1)
    80006d88:	ffffb097          	auipc	ra,0xffffb
    80006d8c:	a04080e7          	jalr	-1532(ra) # 8000178c <sem_signal>

}
    80006d90:	01813083          	ld	ra,24(sp)
    80006d94:	01013403          	ld	s0,16(sp)
    80006d98:	00813483          	ld	s1,8(sp)
    80006d9c:	00013903          	ld	s2,0(sp)
    80006da0:	02010113          	addi	sp,sp,32
    80006da4:	00008067          	ret

0000000080006da8 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006da8:	fe010113          	addi	sp,sp,-32
    80006dac:	00113c23          	sd	ra,24(sp)
    80006db0:	00813823          	sd	s0,16(sp)
    80006db4:	00913423          	sd	s1,8(sp)
    80006db8:	01213023          	sd	s2,0(sp)
    80006dbc:	02010413          	addi	s0,sp,32
    80006dc0:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006dc4:	01c52503          	lw	a0,28(a0)
    80006dc8:	ffffb097          	auipc	ra,0xffffb
    80006dcc:	97c080e7          	jalr	-1668(ra) # 80001744 <sem_wait>

    sem_wait(mutexHead);
    80006dd0:	0204a503          	lw	a0,32(s1)
    80006dd4:	ffffb097          	auipc	ra,0xffffb
    80006dd8:	970080e7          	jalr	-1680(ra) # 80001744 <sem_wait>

    int ret = buffer[head];
    80006ddc:	0084b703          	ld	a4,8(s1)
    80006de0:	0104a783          	lw	a5,16(s1)
    80006de4:	00279693          	slli	a3,a5,0x2
    80006de8:	00d70733          	add	a4,a4,a3
    80006dec:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006df0:	0017879b          	addiw	a5,a5,1
    80006df4:	0004a703          	lw	a4,0(s1)
    80006df8:	02e7e7bb          	remw	a5,a5,a4
    80006dfc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006e00:	0204a503          	lw	a0,32(s1)
    80006e04:	ffffb097          	auipc	ra,0xffffb
    80006e08:	988080e7          	jalr	-1656(ra) # 8000178c <sem_signal>

    sem_signal(spaceAvailable);
    80006e0c:	0184a503          	lw	a0,24(s1)
    80006e10:	ffffb097          	auipc	ra,0xffffb
    80006e14:	97c080e7          	jalr	-1668(ra) # 8000178c <sem_signal>

    return ret;
}
    80006e18:	00090513          	mv	a0,s2
    80006e1c:	01813083          	ld	ra,24(sp)
    80006e20:	01013403          	ld	s0,16(sp)
    80006e24:	00813483          	ld	s1,8(sp)
    80006e28:	00013903          	ld	s2,0(sp)
    80006e2c:	02010113          	addi	sp,sp,32
    80006e30:	00008067          	ret

0000000080006e34 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006e34:	fe010113          	addi	sp,sp,-32
    80006e38:	00113c23          	sd	ra,24(sp)
    80006e3c:	00813823          	sd	s0,16(sp)
    80006e40:	00913423          	sd	s1,8(sp)
    80006e44:	01213023          	sd	s2,0(sp)
    80006e48:	02010413          	addi	s0,sp,32
    80006e4c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006e50:	02052503          	lw	a0,32(a0)
    80006e54:	ffffb097          	auipc	ra,0xffffb
    80006e58:	8f0080e7          	jalr	-1808(ra) # 80001744 <sem_wait>
    sem_wait(mutexTail);
    80006e5c:	0244a503          	lw	a0,36(s1)
    80006e60:	ffffb097          	auipc	ra,0xffffb
    80006e64:	8e4080e7          	jalr	-1820(ra) # 80001744 <sem_wait>

    if (tail >= head) {
    80006e68:	0144a783          	lw	a5,20(s1)
    80006e6c:	0104a903          	lw	s2,16(s1)
    80006e70:	0327ce63          	blt	a5,s2,80006eac <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006e74:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006e78:	0244a503          	lw	a0,36(s1)
    80006e7c:	ffffb097          	auipc	ra,0xffffb
    80006e80:	910080e7          	jalr	-1776(ra) # 8000178c <sem_signal>
    sem_signal(mutexHead);
    80006e84:	0204a503          	lw	a0,32(s1)
    80006e88:	ffffb097          	auipc	ra,0xffffb
    80006e8c:	904080e7          	jalr	-1788(ra) # 8000178c <sem_signal>

    return ret;
}
    80006e90:	00090513          	mv	a0,s2
    80006e94:	01813083          	ld	ra,24(sp)
    80006e98:	01013403          	ld	s0,16(sp)
    80006e9c:	00813483          	ld	s1,8(sp)
    80006ea0:	00013903          	ld	s2,0(sp)
    80006ea4:	02010113          	addi	sp,sp,32
    80006ea8:	00008067          	ret
        ret = cap - head + tail;
    80006eac:	0004a703          	lw	a4,0(s1)
    80006eb0:	4127093b          	subw	s2,a4,s2
    80006eb4:	00f9093b          	addw	s2,s2,a5
    80006eb8:	fc1ff06f          	j	80006e78 <_ZN6Buffer6getCntEv+0x44>

0000000080006ebc <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006ebc:	fe010113          	addi	sp,sp,-32
    80006ec0:	00113c23          	sd	ra,24(sp)
    80006ec4:	00813823          	sd	s0,16(sp)
    80006ec8:	00913423          	sd	s1,8(sp)
    80006ecc:	02010413          	addi	s0,sp,32
    80006ed0:	00050493          	mv	s1,a0
    putc('\n');
    80006ed4:	00a00513          	li	a0,10
    80006ed8:	ffffb097          	auipc	ra,0xffffb
    80006edc:	964080e7          	jalr	-1692(ra) # 8000183c <putc>
    printString("Buffer deleted!\n");
    80006ee0:	00003517          	auipc	a0,0x3
    80006ee4:	44850513          	addi	a0,a0,1096 # 8000a328 <CONSOLE_STATUS+0x318>
    80006ee8:	fffff097          	auipc	ra,0xfffff
    80006eec:	09c080e7          	jalr	156(ra) # 80005f84 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006ef0:	00048513          	mv	a0,s1
    80006ef4:	00000097          	auipc	ra,0x0
    80006ef8:	f40080e7          	jalr	-192(ra) # 80006e34 <_ZN6Buffer6getCntEv>
    80006efc:	02a05c63          	blez	a0,80006f34 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006f00:	0084b783          	ld	a5,8(s1)
    80006f04:	0104a703          	lw	a4,16(s1)
    80006f08:	00271713          	slli	a4,a4,0x2
    80006f0c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006f10:	0007c503          	lbu	a0,0(a5)
    80006f14:	ffffb097          	auipc	ra,0xffffb
    80006f18:	928080e7          	jalr	-1752(ra) # 8000183c <putc>
        head = (head + 1) % cap;
    80006f1c:	0104a783          	lw	a5,16(s1)
    80006f20:	0017879b          	addiw	a5,a5,1
    80006f24:	0004a703          	lw	a4,0(s1)
    80006f28:	02e7e7bb          	remw	a5,a5,a4
    80006f2c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006f30:	fc1ff06f          	j	80006ef0 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006f34:	02100513          	li	a0,33
    80006f38:	ffffb097          	auipc	ra,0xffffb
    80006f3c:	904080e7          	jalr	-1788(ra) # 8000183c <putc>
    putc('\n');
    80006f40:	00a00513          	li	a0,10
    80006f44:	ffffb097          	auipc	ra,0xffffb
    80006f48:	8f8080e7          	jalr	-1800(ra) # 8000183c <putc>
    mem_free(buffer);
    80006f4c:	0084b503          	ld	a0,8(s1)
    80006f50:	ffffa097          	auipc	ra,0xffffa
    80006f54:	620080e7          	jalr	1568(ra) # 80001570 <mem_free>
    sem_close(itemAvailable);
    80006f58:	01c4a503          	lw	a0,28(s1)
    80006f5c:	ffffb097          	auipc	ra,0xffffb
    80006f60:	870080e7          	jalr	-1936(ra) # 800017cc <sem_close>
    sem_close(spaceAvailable);
    80006f64:	0184a503          	lw	a0,24(s1)
    80006f68:	ffffb097          	auipc	ra,0xffffb
    80006f6c:	864080e7          	jalr	-1948(ra) # 800017cc <sem_close>
    sem_close(mutexTail);
    80006f70:	0244a503          	lw	a0,36(s1)
    80006f74:	ffffb097          	auipc	ra,0xffffb
    80006f78:	858080e7          	jalr	-1960(ra) # 800017cc <sem_close>
    sem_close(mutexHead);
    80006f7c:	0204a503          	lw	a0,32(s1)
    80006f80:	ffffb097          	auipc	ra,0xffffb
    80006f84:	84c080e7          	jalr	-1972(ra) # 800017cc <sem_close>
}
    80006f88:	01813083          	ld	ra,24(sp)
    80006f8c:	01013403          	ld	s0,16(sp)
    80006f90:	00813483          	ld	s1,8(sp)
    80006f94:	02010113          	addi	sp,sp,32
    80006f98:	00008067          	ret

0000000080006f9c <start>:
    80006f9c:	ff010113          	addi	sp,sp,-16
    80006fa0:	00813423          	sd	s0,8(sp)
    80006fa4:	01010413          	addi	s0,sp,16
    80006fa8:	300027f3          	csrr	a5,mstatus
    80006fac:	ffffe737          	lui	a4,0xffffe
    80006fb0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff030f>
    80006fb4:	00e7f7b3          	and	a5,a5,a4
    80006fb8:	00001737          	lui	a4,0x1
    80006fbc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006fc0:	00e7e7b3          	or	a5,a5,a4
    80006fc4:	30079073          	csrw	mstatus,a5
    80006fc8:	00000797          	auipc	a5,0x0
    80006fcc:	16078793          	addi	a5,a5,352 # 80007128 <system_main>
    80006fd0:	34179073          	csrw	mepc,a5
    80006fd4:	00000793          	li	a5,0
    80006fd8:	18079073          	csrw	satp,a5
    80006fdc:	000107b7          	lui	a5,0x10
    80006fe0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006fe4:	30279073          	csrw	medeleg,a5
    80006fe8:	30379073          	csrw	mideleg,a5
    80006fec:	104027f3          	csrr	a5,sie
    80006ff0:	2227e793          	ori	a5,a5,546
    80006ff4:	10479073          	csrw	sie,a5
    80006ff8:	fff00793          	li	a5,-1
    80006ffc:	00a7d793          	srli	a5,a5,0xa
    80007000:	3b079073          	csrw	pmpaddr0,a5
    80007004:	00f00793          	li	a5,15
    80007008:	3a079073          	csrw	pmpcfg0,a5
    8000700c:	f14027f3          	csrr	a5,mhartid
    80007010:	0200c737          	lui	a4,0x200c
    80007014:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80007018:	0007869b          	sext.w	a3,a5
    8000701c:	00269713          	slli	a4,a3,0x2
    80007020:	000f4637          	lui	a2,0xf4
    80007024:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80007028:	00d70733          	add	a4,a4,a3
    8000702c:	0037979b          	slliw	a5,a5,0x3
    80007030:	020046b7          	lui	a3,0x2004
    80007034:	00d787b3          	add	a5,a5,a3
    80007038:	00c585b3          	add	a1,a1,a2
    8000703c:	00371693          	slli	a3,a4,0x3
    80007040:	00006717          	auipc	a4,0x6
    80007044:	25070713          	addi	a4,a4,592 # 8000d290 <timer_scratch>
    80007048:	00b7b023          	sd	a1,0(a5)
    8000704c:	00d70733          	add	a4,a4,a3
    80007050:	00f73c23          	sd	a5,24(a4)
    80007054:	02c73023          	sd	a2,32(a4)
    80007058:	34071073          	csrw	mscratch,a4
    8000705c:	00000797          	auipc	a5,0x0
    80007060:	6e478793          	addi	a5,a5,1764 # 80007740 <timervec>
    80007064:	30579073          	csrw	mtvec,a5
    80007068:	300027f3          	csrr	a5,mstatus
    8000706c:	0087e793          	ori	a5,a5,8
    80007070:	30079073          	csrw	mstatus,a5
    80007074:	304027f3          	csrr	a5,mie
    80007078:	0807e793          	ori	a5,a5,128
    8000707c:	30479073          	csrw	mie,a5
    80007080:	f14027f3          	csrr	a5,mhartid
    80007084:	0007879b          	sext.w	a5,a5
    80007088:	00078213          	mv	tp,a5
    8000708c:	30200073          	mret
    80007090:	00813403          	ld	s0,8(sp)
    80007094:	01010113          	addi	sp,sp,16
    80007098:	00008067          	ret

000000008000709c <timerinit>:
    8000709c:	ff010113          	addi	sp,sp,-16
    800070a0:	00813423          	sd	s0,8(sp)
    800070a4:	01010413          	addi	s0,sp,16
    800070a8:	f14027f3          	csrr	a5,mhartid
    800070ac:	0200c737          	lui	a4,0x200c
    800070b0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800070b4:	0007869b          	sext.w	a3,a5
    800070b8:	00269713          	slli	a4,a3,0x2
    800070bc:	000f4637          	lui	a2,0xf4
    800070c0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800070c4:	00d70733          	add	a4,a4,a3
    800070c8:	0037979b          	slliw	a5,a5,0x3
    800070cc:	020046b7          	lui	a3,0x2004
    800070d0:	00d787b3          	add	a5,a5,a3
    800070d4:	00c585b3          	add	a1,a1,a2
    800070d8:	00371693          	slli	a3,a4,0x3
    800070dc:	00006717          	auipc	a4,0x6
    800070e0:	1b470713          	addi	a4,a4,436 # 8000d290 <timer_scratch>
    800070e4:	00b7b023          	sd	a1,0(a5)
    800070e8:	00d70733          	add	a4,a4,a3
    800070ec:	00f73c23          	sd	a5,24(a4)
    800070f0:	02c73023          	sd	a2,32(a4)
    800070f4:	34071073          	csrw	mscratch,a4
    800070f8:	00000797          	auipc	a5,0x0
    800070fc:	64878793          	addi	a5,a5,1608 # 80007740 <timervec>
    80007100:	30579073          	csrw	mtvec,a5
    80007104:	300027f3          	csrr	a5,mstatus
    80007108:	0087e793          	ori	a5,a5,8
    8000710c:	30079073          	csrw	mstatus,a5
    80007110:	304027f3          	csrr	a5,mie
    80007114:	0807e793          	ori	a5,a5,128
    80007118:	30479073          	csrw	mie,a5
    8000711c:	00813403          	ld	s0,8(sp)
    80007120:	01010113          	addi	sp,sp,16
    80007124:	00008067          	ret

0000000080007128 <system_main>:
    80007128:	fe010113          	addi	sp,sp,-32
    8000712c:	00813823          	sd	s0,16(sp)
    80007130:	00913423          	sd	s1,8(sp)
    80007134:	00113c23          	sd	ra,24(sp)
    80007138:	02010413          	addi	s0,sp,32
    8000713c:	00000097          	auipc	ra,0x0
    80007140:	0c4080e7          	jalr	196(ra) # 80007200 <cpuid>
    80007144:	00006497          	auipc	s1,0x6
    80007148:	bbc48493          	addi	s1,s1,-1092 # 8000cd00 <started>
    8000714c:	02050263          	beqz	a0,80007170 <system_main+0x48>
    80007150:	0004a783          	lw	a5,0(s1)
    80007154:	0007879b          	sext.w	a5,a5
    80007158:	fe078ce3          	beqz	a5,80007150 <system_main+0x28>
    8000715c:	0ff0000f          	fence
    80007160:	00003517          	auipc	a0,0x3
    80007164:	27050513          	addi	a0,a0,624 # 8000a3d0 <CONSOLE_STATUS+0x3c0>
    80007168:	00001097          	auipc	ra,0x1
    8000716c:	a74080e7          	jalr	-1420(ra) # 80007bdc <panic>
    80007170:	00001097          	auipc	ra,0x1
    80007174:	9c8080e7          	jalr	-1592(ra) # 80007b38 <consoleinit>
    80007178:	00001097          	auipc	ra,0x1
    8000717c:	154080e7          	jalr	340(ra) # 800082cc <printfinit>
    80007180:	00003517          	auipc	a0,0x3
    80007184:	fe850513          	addi	a0,a0,-24 # 8000a168 <CONSOLE_STATUS+0x158>
    80007188:	00001097          	auipc	ra,0x1
    8000718c:	ab0080e7          	jalr	-1360(ra) # 80007c38 <__printf>
    80007190:	00003517          	auipc	a0,0x3
    80007194:	21050513          	addi	a0,a0,528 # 8000a3a0 <CONSOLE_STATUS+0x390>
    80007198:	00001097          	auipc	ra,0x1
    8000719c:	aa0080e7          	jalr	-1376(ra) # 80007c38 <__printf>
    800071a0:	00003517          	auipc	a0,0x3
    800071a4:	fc850513          	addi	a0,a0,-56 # 8000a168 <CONSOLE_STATUS+0x158>
    800071a8:	00001097          	auipc	ra,0x1
    800071ac:	a90080e7          	jalr	-1392(ra) # 80007c38 <__printf>
    800071b0:	00001097          	auipc	ra,0x1
    800071b4:	4a8080e7          	jalr	1192(ra) # 80008658 <kinit>
    800071b8:	00000097          	auipc	ra,0x0
    800071bc:	148080e7          	jalr	328(ra) # 80007300 <trapinit>
    800071c0:	00000097          	auipc	ra,0x0
    800071c4:	16c080e7          	jalr	364(ra) # 8000732c <trapinithart>
    800071c8:	00000097          	auipc	ra,0x0
    800071cc:	5b8080e7          	jalr	1464(ra) # 80007780 <plicinit>
    800071d0:	00000097          	auipc	ra,0x0
    800071d4:	5d8080e7          	jalr	1496(ra) # 800077a8 <plicinithart>
    800071d8:	00000097          	auipc	ra,0x0
    800071dc:	078080e7          	jalr	120(ra) # 80007250 <userinit>
    800071e0:	0ff0000f          	fence
    800071e4:	00100793          	li	a5,1
    800071e8:	00003517          	auipc	a0,0x3
    800071ec:	1d050513          	addi	a0,a0,464 # 8000a3b8 <CONSOLE_STATUS+0x3a8>
    800071f0:	00f4a023          	sw	a5,0(s1)
    800071f4:	00001097          	auipc	ra,0x1
    800071f8:	a44080e7          	jalr	-1468(ra) # 80007c38 <__printf>
    800071fc:	0000006f          	j	800071fc <system_main+0xd4>

0000000080007200 <cpuid>:
    80007200:	ff010113          	addi	sp,sp,-16
    80007204:	00813423          	sd	s0,8(sp)
    80007208:	01010413          	addi	s0,sp,16
    8000720c:	00020513          	mv	a0,tp
    80007210:	00813403          	ld	s0,8(sp)
    80007214:	0005051b          	sext.w	a0,a0
    80007218:	01010113          	addi	sp,sp,16
    8000721c:	00008067          	ret

0000000080007220 <mycpu>:
    80007220:	ff010113          	addi	sp,sp,-16
    80007224:	00813423          	sd	s0,8(sp)
    80007228:	01010413          	addi	s0,sp,16
    8000722c:	00020793          	mv	a5,tp
    80007230:	00813403          	ld	s0,8(sp)
    80007234:	0007879b          	sext.w	a5,a5
    80007238:	00779793          	slli	a5,a5,0x7
    8000723c:	00007517          	auipc	a0,0x7
    80007240:	08450513          	addi	a0,a0,132 # 8000e2c0 <cpus>
    80007244:	00f50533          	add	a0,a0,a5
    80007248:	01010113          	addi	sp,sp,16
    8000724c:	00008067          	ret

0000000080007250 <userinit>:
    80007250:	ff010113          	addi	sp,sp,-16
    80007254:	00813423          	sd	s0,8(sp)
    80007258:	01010413          	addi	s0,sp,16
    8000725c:	00813403          	ld	s0,8(sp)
    80007260:	01010113          	addi	sp,sp,16
    80007264:	ffffc317          	auipc	t1,0xffffc
    80007268:	de830067          	jr	-536(t1) # 8000304c <main>

000000008000726c <either_copyout>:
    8000726c:	ff010113          	addi	sp,sp,-16
    80007270:	00813023          	sd	s0,0(sp)
    80007274:	00113423          	sd	ra,8(sp)
    80007278:	01010413          	addi	s0,sp,16
    8000727c:	02051663          	bnez	a0,800072a8 <either_copyout+0x3c>
    80007280:	00058513          	mv	a0,a1
    80007284:	00060593          	mv	a1,a2
    80007288:	0006861b          	sext.w	a2,a3
    8000728c:	00002097          	auipc	ra,0x2
    80007290:	c58080e7          	jalr	-936(ra) # 80008ee4 <__memmove>
    80007294:	00813083          	ld	ra,8(sp)
    80007298:	00013403          	ld	s0,0(sp)
    8000729c:	00000513          	li	a0,0
    800072a0:	01010113          	addi	sp,sp,16
    800072a4:	00008067          	ret
    800072a8:	00003517          	auipc	a0,0x3
    800072ac:	15050513          	addi	a0,a0,336 # 8000a3f8 <CONSOLE_STATUS+0x3e8>
    800072b0:	00001097          	auipc	ra,0x1
    800072b4:	92c080e7          	jalr	-1748(ra) # 80007bdc <panic>

00000000800072b8 <either_copyin>:
    800072b8:	ff010113          	addi	sp,sp,-16
    800072bc:	00813023          	sd	s0,0(sp)
    800072c0:	00113423          	sd	ra,8(sp)
    800072c4:	01010413          	addi	s0,sp,16
    800072c8:	02059463          	bnez	a1,800072f0 <either_copyin+0x38>
    800072cc:	00060593          	mv	a1,a2
    800072d0:	0006861b          	sext.w	a2,a3
    800072d4:	00002097          	auipc	ra,0x2
    800072d8:	c10080e7          	jalr	-1008(ra) # 80008ee4 <__memmove>
    800072dc:	00813083          	ld	ra,8(sp)
    800072e0:	00013403          	ld	s0,0(sp)
    800072e4:	00000513          	li	a0,0
    800072e8:	01010113          	addi	sp,sp,16
    800072ec:	00008067          	ret
    800072f0:	00003517          	auipc	a0,0x3
    800072f4:	13050513          	addi	a0,a0,304 # 8000a420 <CONSOLE_STATUS+0x410>
    800072f8:	00001097          	auipc	ra,0x1
    800072fc:	8e4080e7          	jalr	-1820(ra) # 80007bdc <panic>

0000000080007300 <trapinit>:
    80007300:	ff010113          	addi	sp,sp,-16
    80007304:	00813423          	sd	s0,8(sp)
    80007308:	01010413          	addi	s0,sp,16
    8000730c:	00813403          	ld	s0,8(sp)
    80007310:	00003597          	auipc	a1,0x3
    80007314:	13858593          	addi	a1,a1,312 # 8000a448 <CONSOLE_STATUS+0x438>
    80007318:	00007517          	auipc	a0,0x7
    8000731c:	02850513          	addi	a0,a0,40 # 8000e340 <tickslock>
    80007320:	01010113          	addi	sp,sp,16
    80007324:	00001317          	auipc	t1,0x1
    80007328:	5c430067          	jr	1476(t1) # 800088e8 <initlock>

000000008000732c <trapinithart>:
    8000732c:	ff010113          	addi	sp,sp,-16
    80007330:	00813423          	sd	s0,8(sp)
    80007334:	01010413          	addi	s0,sp,16
    80007338:	00000797          	auipc	a5,0x0
    8000733c:	2f878793          	addi	a5,a5,760 # 80007630 <kernelvec>
    80007340:	10579073          	csrw	stvec,a5
    80007344:	00813403          	ld	s0,8(sp)
    80007348:	01010113          	addi	sp,sp,16
    8000734c:	00008067          	ret

0000000080007350 <usertrap>:
    80007350:	ff010113          	addi	sp,sp,-16
    80007354:	00813423          	sd	s0,8(sp)
    80007358:	01010413          	addi	s0,sp,16
    8000735c:	00813403          	ld	s0,8(sp)
    80007360:	01010113          	addi	sp,sp,16
    80007364:	00008067          	ret

0000000080007368 <usertrapret>:
    80007368:	ff010113          	addi	sp,sp,-16
    8000736c:	00813423          	sd	s0,8(sp)
    80007370:	01010413          	addi	s0,sp,16
    80007374:	00813403          	ld	s0,8(sp)
    80007378:	01010113          	addi	sp,sp,16
    8000737c:	00008067          	ret

0000000080007380 <kerneltrap>:
    80007380:	fe010113          	addi	sp,sp,-32
    80007384:	00813823          	sd	s0,16(sp)
    80007388:	00113c23          	sd	ra,24(sp)
    8000738c:	00913423          	sd	s1,8(sp)
    80007390:	02010413          	addi	s0,sp,32
    80007394:	142025f3          	csrr	a1,scause
    80007398:	100027f3          	csrr	a5,sstatus
    8000739c:	0027f793          	andi	a5,a5,2
    800073a0:	10079c63          	bnez	a5,800074b8 <kerneltrap+0x138>
    800073a4:	142027f3          	csrr	a5,scause
    800073a8:	0207ce63          	bltz	a5,800073e4 <kerneltrap+0x64>
    800073ac:	00003517          	auipc	a0,0x3
    800073b0:	0e450513          	addi	a0,a0,228 # 8000a490 <CONSOLE_STATUS+0x480>
    800073b4:	00001097          	auipc	ra,0x1
    800073b8:	884080e7          	jalr	-1916(ra) # 80007c38 <__printf>
    800073bc:	141025f3          	csrr	a1,sepc
    800073c0:	14302673          	csrr	a2,stval
    800073c4:	00003517          	auipc	a0,0x3
    800073c8:	0dc50513          	addi	a0,a0,220 # 8000a4a0 <CONSOLE_STATUS+0x490>
    800073cc:	00001097          	auipc	ra,0x1
    800073d0:	86c080e7          	jalr	-1940(ra) # 80007c38 <__printf>
    800073d4:	00003517          	auipc	a0,0x3
    800073d8:	0e450513          	addi	a0,a0,228 # 8000a4b8 <CONSOLE_STATUS+0x4a8>
    800073dc:	00001097          	auipc	ra,0x1
    800073e0:	800080e7          	jalr	-2048(ra) # 80007bdc <panic>
    800073e4:	0ff7f713          	andi	a4,a5,255
    800073e8:	00900693          	li	a3,9
    800073ec:	04d70063          	beq	a4,a3,8000742c <kerneltrap+0xac>
    800073f0:	fff00713          	li	a4,-1
    800073f4:	03f71713          	slli	a4,a4,0x3f
    800073f8:	00170713          	addi	a4,a4,1
    800073fc:	fae798e3          	bne	a5,a4,800073ac <kerneltrap+0x2c>
    80007400:	00000097          	auipc	ra,0x0
    80007404:	e00080e7          	jalr	-512(ra) # 80007200 <cpuid>
    80007408:	06050663          	beqz	a0,80007474 <kerneltrap+0xf4>
    8000740c:	144027f3          	csrr	a5,sip
    80007410:	ffd7f793          	andi	a5,a5,-3
    80007414:	14479073          	csrw	sip,a5
    80007418:	01813083          	ld	ra,24(sp)
    8000741c:	01013403          	ld	s0,16(sp)
    80007420:	00813483          	ld	s1,8(sp)
    80007424:	02010113          	addi	sp,sp,32
    80007428:	00008067          	ret
    8000742c:	00000097          	auipc	ra,0x0
    80007430:	3c8080e7          	jalr	968(ra) # 800077f4 <plic_claim>
    80007434:	00a00793          	li	a5,10
    80007438:	00050493          	mv	s1,a0
    8000743c:	06f50863          	beq	a0,a5,800074ac <kerneltrap+0x12c>
    80007440:	fc050ce3          	beqz	a0,80007418 <kerneltrap+0x98>
    80007444:	00050593          	mv	a1,a0
    80007448:	00003517          	auipc	a0,0x3
    8000744c:	02850513          	addi	a0,a0,40 # 8000a470 <CONSOLE_STATUS+0x460>
    80007450:	00000097          	auipc	ra,0x0
    80007454:	7e8080e7          	jalr	2024(ra) # 80007c38 <__printf>
    80007458:	01013403          	ld	s0,16(sp)
    8000745c:	01813083          	ld	ra,24(sp)
    80007460:	00048513          	mv	a0,s1
    80007464:	00813483          	ld	s1,8(sp)
    80007468:	02010113          	addi	sp,sp,32
    8000746c:	00000317          	auipc	t1,0x0
    80007470:	3c030067          	jr	960(t1) # 8000782c <plic_complete>
    80007474:	00007517          	auipc	a0,0x7
    80007478:	ecc50513          	addi	a0,a0,-308 # 8000e340 <tickslock>
    8000747c:	00001097          	auipc	ra,0x1
    80007480:	490080e7          	jalr	1168(ra) # 8000890c <acquire>
    80007484:	00006717          	auipc	a4,0x6
    80007488:	88070713          	addi	a4,a4,-1920 # 8000cd04 <ticks>
    8000748c:	00072783          	lw	a5,0(a4)
    80007490:	00007517          	auipc	a0,0x7
    80007494:	eb050513          	addi	a0,a0,-336 # 8000e340 <tickslock>
    80007498:	0017879b          	addiw	a5,a5,1
    8000749c:	00f72023          	sw	a5,0(a4)
    800074a0:	00001097          	auipc	ra,0x1
    800074a4:	538080e7          	jalr	1336(ra) # 800089d8 <release>
    800074a8:	f65ff06f          	j	8000740c <kerneltrap+0x8c>
    800074ac:	00001097          	auipc	ra,0x1
    800074b0:	094080e7          	jalr	148(ra) # 80008540 <uartintr>
    800074b4:	fa5ff06f          	j	80007458 <kerneltrap+0xd8>
    800074b8:	00003517          	auipc	a0,0x3
    800074bc:	f9850513          	addi	a0,a0,-104 # 8000a450 <CONSOLE_STATUS+0x440>
    800074c0:	00000097          	auipc	ra,0x0
    800074c4:	71c080e7          	jalr	1820(ra) # 80007bdc <panic>

00000000800074c8 <clockintr>:
    800074c8:	fe010113          	addi	sp,sp,-32
    800074cc:	00813823          	sd	s0,16(sp)
    800074d0:	00913423          	sd	s1,8(sp)
    800074d4:	00113c23          	sd	ra,24(sp)
    800074d8:	02010413          	addi	s0,sp,32
    800074dc:	00007497          	auipc	s1,0x7
    800074e0:	e6448493          	addi	s1,s1,-412 # 8000e340 <tickslock>
    800074e4:	00048513          	mv	a0,s1
    800074e8:	00001097          	auipc	ra,0x1
    800074ec:	424080e7          	jalr	1060(ra) # 8000890c <acquire>
    800074f0:	00006717          	auipc	a4,0x6
    800074f4:	81470713          	addi	a4,a4,-2028 # 8000cd04 <ticks>
    800074f8:	00072783          	lw	a5,0(a4)
    800074fc:	01013403          	ld	s0,16(sp)
    80007500:	01813083          	ld	ra,24(sp)
    80007504:	00048513          	mv	a0,s1
    80007508:	0017879b          	addiw	a5,a5,1
    8000750c:	00813483          	ld	s1,8(sp)
    80007510:	00f72023          	sw	a5,0(a4)
    80007514:	02010113          	addi	sp,sp,32
    80007518:	00001317          	auipc	t1,0x1
    8000751c:	4c030067          	jr	1216(t1) # 800089d8 <release>

0000000080007520 <devintr>:
    80007520:	142027f3          	csrr	a5,scause
    80007524:	00000513          	li	a0,0
    80007528:	0007c463          	bltz	a5,80007530 <devintr+0x10>
    8000752c:	00008067          	ret
    80007530:	fe010113          	addi	sp,sp,-32
    80007534:	00813823          	sd	s0,16(sp)
    80007538:	00113c23          	sd	ra,24(sp)
    8000753c:	00913423          	sd	s1,8(sp)
    80007540:	02010413          	addi	s0,sp,32
    80007544:	0ff7f713          	andi	a4,a5,255
    80007548:	00900693          	li	a3,9
    8000754c:	04d70c63          	beq	a4,a3,800075a4 <devintr+0x84>
    80007550:	fff00713          	li	a4,-1
    80007554:	03f71713          	slli	a4,a4,0x3f
    80007558:	00170713          	addi	a4,a4,1
    8000755c:	00e78c63          	beq	a5,a4,80007574 <devintr+0x54>
    80007560:	01813083          	ld	ra,24(sp)
    80007564:	01013403          	ld	s0,16(sp)
    80007568:	00813483          	ld	s1,8(sp)
    8000756c:	02010113          	addi	sp,sp,32
    80007570:	00008067          	ret
    80007574:	00000097          	auipc	ra,0x0
    80007578:	c8c080e7          	jalr	-884(ra) # 80007200 <cpuid>
    8000757c:	06050663          	beqz	a0,800075e8 <devintr+0xc8>
    80007580:	144027f3          	csrr	a5,sip
    80007584:	ffd7f793          	andi	a5,a5,-3
    80007588:	14479073          	csrw	sip,a5
    8000758c:	01813083          	ld	ra,24(sp)
    80007590:	01013403          	ld	s0,16(sp)
    80007594:	00813483          	ld	s1,8(sp)
    80007598:	00200513          	li	a0,2
    8000759c:	02010113          	addi	sp,sp,32
    800075a0:	00008067          	ret
    800075a4:	00000097          	auipc	ra,0x0
    800075a8:	250080e7          	jalr	592(ra) # 800077f4 <plic_claim>
    800075ac:	00a00793          	li	a5,10
    800075b0:	00050493          	mv	s1,a0
    800075b4:	06f50663          	beq	a0,a5,80007620 <devintr+0x100>
    800075b8:	00100513          	li	a0,1
    800075bc:	fa0482e3          	beqz	s1,80007560 <devintr+0x40>
    800075c0:	00048593          	mv	a1,s1
    800075c4:	00003517          	auipc	a0,0x3
    800075c8:	eac50513          	addi	a0,a0,-340 # 8000a470 <CONSOLE_STATUS+0x460>
    800075cc:	00000097          	auipc	ra,0x0
    800075d0:	66c080e7          	jalr	1644(ra) # 80007c38 <__printf>
    800075d4:	00048513          	mv	a0,s1
    800075d8:	00000097          	auipc	ra,0x0
    800075dc:	254080e7          	jalr	596(ra) # 8000782c <plic_complete>
    800075e0:	00100513          	li	a0,1
    800075e4:	f7dff06f          	j	80007560 <devintr+0x40>
    800075e8:	00007517          	auipc	a0,0x7
    800075ec:	d5850513          	addi	a0,a0,-680 # 8000e340 <tickslock>
    800075f0:	00001097          	auipc	ra,0x1
    800075f4:	31c080e7          	jalr	796(ra) # 8000890c <acquire>
    800075f8:	00005717          	auipc	a4,0x5
    800075fc:	70c70713          	addi	a4,a4,1804 # 8000cd04 <ticks>
    80007600:	00072783          	lw	a5,0(a4)
    80007604:	00007517          	auipc	a0,0x7
    80007608:	d3c50513          	addi	a0,a0,-708 # 8000e340 <tickslock>
    8000760c:	0017879b          	addiw	a5,a5,1
    80007610:	00f72023          	sw	a5,0(a4)
    80007614:	00001097          	auipc	ra,0x1
    80007618:	3c4080e7          	jalr	964(ra) # 800089d8 <release>
    8000761c:	f65ff06f          	j	80007580 <devintr+0x60>
    80007620:	00001097          	auipc	ra,0x1
    80007624:	f20080e7          	jalr	-224(ra) # 80008540 <uartintr>
    80007628:	fadff06f          	j	800075d4 <devintr+0xb4>
    8000762c:	0000                	unimp
	...

0000000080007630 <kernelvec>:
    80007630:	f0010113          	addi	sp,sp,-256
    80007634:	00113023          	sd	ra,0(sp)
    80007638:	00213423          	sd	sp,8(sp)
    8000763c:	00313823          	sd	gp,16(sp)
    80007640:	00413c23          	sd	tp,24(sp)
    80007644:	02513023          	sd	t0,32(sp)
    80007648:	02613423          	sd	t1,40(sp)
    8000764c:	02713823          	sd	t2,48(sp)
    80007650:	02813c23          	sd	s0,56(sp)
    80007654:	04913023          	sd	s1,64(sp)
    80007658:	04a13423          	sd	a0,72(sp)
    8000765c:	04b13823          	sd	a1,80(sp)
    80007660:	04c13c23          	sd	a2,88(sp)
    80007664:	06d13023          	sd	a3,96(sp)
    80007668:	06e13423          	sd	a4,104(sp)
    8000766c:	06f13823          	sd	a5,112(sp)
    80007670:	07013c23          	sd	a6,120(sp)
    80007674:	09113023          	sd	a7,128(sp)
    80007678:	09213423          	sd	s2,136(sp)
    8000767c:	09313823          	sd	s3,144(sp)
    80007680:	09413c23          	sd	s4,152(sp)
    80007684:	0b513023          	sd	s5,160(sp)
    80007688:	0b613423          	sd	s6,168(sp)
    8000768c:	0b713823          	sd	s7,176(sp)
    80007690:	0b813c23          	sd	s8,184(sp)
    80007694:	0d913023          	sd	s9,192(sp)
    80007698:	0da13423          	sd	s10,200(sp)
    8000769c:	0db13823          	sd	s11,208(sp)
    800076a0:	0dc13c23          	sd	t3,216(sp)
    800076a4:	0fd13023          	sd	t4,224(sp)
    800076a8:	0fe13423          	sd	t5,232(sp)
    800076ac:	0ff13823          	sd	t6,240(sp)
    800076b0:	cd1ff0ef          	jal	ra,80007380 <kerneltrap>
    800076b4:	00013083          	ld	ra,0(sp)
    800076b8:	00813103          	ld	sp,8(sp)
    800076bc:	01013183          	ld	gp,16(sp)
    800076c0:	02013283          	ld	t0,32(sp)
    800076c4:	02813303          	ld	t1,40(sp)
    800076c8:	03013383          	ld	t2,48(sp)
    800076cc:	03813403          	ld	s0,56(sp)
    800076d0:	04013483          	ld	s1,64(sp)
    800076d4:	04813503          	ld	a0,72(sp)
    800076d8:	05013583          	ld	a1,80(sp)
    800076dc:	05813603          	ld	a2,88(sp)
    800076e0:	06013683          	ld	a3,96(sp)
    800076e4:	06813703          	ld	a4,104(sp)
    800076e8:	07013783          	ld	a5,112(sp)
    800076ec:	07813803          	ld	a6,120(sp)
    800076f0:	08013883          	ld	a7,128(sp)
    800076f4:	08813903          	ld	s2,136(sp)
    800076f8:	09013983          	ld	s3,144(sp)
    800076fc:	09813a03          	ld	s4,152(sp)
    80007700:	0a013a83          	ld	s5,160(sp)
    80007704:	0a813b03          	ld	s6,168(sp)
    80007708:	0b013b83          	ld	s7,176(sp)
    8000770c:	0b813c03          	ld	s8,184(sp)
    80007710:	0c013c83          	ld	s9,192(sp)
    80007714:	0c813d03          	ld	s10,200(sp)
    80007718:	0d013d83          	ld	s11,208(sp)
    8000771c:	0d813e03          	ld	t3,216(sp)
    80007720:	0e013e83          	ld	t4,224(sp)
    80007724:	0e813f03          	ld	t5,232(sp)
    80007728:	0f013f83          	ld	t6,240(sp)
    8000772c:	10010113          	addi	sp,sp,256
    80007730:	10200073          	sret
    80007734:	00000013          	nop
    80007738:	00000013          	nop
    8000773c:	00000013          	nop

0000000080007740 <timervec>:
    80007740:	34051573          	csrrw	a0,mscratch,a0
    80007744:	00b53023          	sd	a1,0(a0)
    80007748:	00c53423          	sd	a2,8(a0)
    8000774c:	00d53823          	sd	a3,16(a0)
    80007750:	01853583          	ld	a1,24(a0)
    80007754:	02053603          	ld	a2,32(a0)
    80007758:	0005b683          	ld	a3,0(a1)
    8000775c:	00c686b3          	add	a3,a3,a2
    80007760:	00d5b023          	sd	a3,0(a1)
    80007764:	00200593          	li	a1,2
    80007768:	14459073          	csrw	sip,a1
    8000776c:	01053683          	ld	a3,16(a0)
    80007770:	00853603          	ld	a2,8(a0)
    80007774:	00053583          	ld	a1,0(a0)
    80007778:	34051573          	csrrw	a0,mscratch,a0
    8000777c:	30200073          	mret

0000000080007780 <plicinit>:
    80007780:	ff010113          	addi	sp,sp,-16
    80007784:	00813423          	sd	s0,8(sp)
    80007788:	01010413          	addi	s0,sp,16
    8000778c:	00813403          	ld	s0,8(sp)
    80007790:	0c0007b7          	lui	a5,0xc000
    80007794:	00100713          	li	a4,1
    80007798:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000779c:	00e7a223          	sw	a4,4(a5)
    800077a0:	01010113          	addi	sp,sp,16
    800077a4:	00008067          	ret

00000000800077a8 <plicinithart>:
    800077a8:	ff010113          	addi	sp,sp,-16
    800077ac:	00813023          	sd	s0,0(sp)
    800077b0:	00113423          	sd	ra,8(sp)
    800077b4:	01010413          	addi	s0,sp,16
    800077b8:	00000097          	auipc	ra,0x0
    800077bc:	a48080e7          	jalr	-1464(ra) # 80007200 <cpuid>
    800077c0:	0085171b          	slliw	a4,a0,0x8
    800077c4:	0c0027b7          	lui	a5,0xc002
    800077c8:	00e787b3          	add	a5,a5,a4
    800077cc:	40200713          	li	a4,1026
    800077d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800077d4:	00813083          	ld	ra,8(sp)
    800077d8:	00013403          	ld	s0,0(sp)
    800077dc:	00d5151b          	slliw	a0,a0,0xd
    800077e0:	0c2017b7          	lui	a5,0xc201
    800077e4:	00a78533          	add	a0,a5,a0
    800077e8:	00052023          	sw	zero,0(a0)
    800077ec:	01010113          	addi	sp,sp,16
    800077f0:	00008067          	ret

00000000800077f4 <plic_claim>:
    800077f4:	ff010113          	addi	sp,sp,-16
    800077f8:	00813023          	sd	s0,0(sp)
    800077fc:	00113423          	sd	ra,8(sp)
    80007800:	01010413          	addi	s0,sp,16
    80007804:	00000097          	auipc	ra,0x0
    80007808:	9fc080e7          	jalr	-1540(ra) # 80007200 <cpuid>
    8000780c:	00813083          	ld	ra,8(sp)
    80007810:	00013403          	ld	s0,0(sp)
    80007814:	00d5151b          	slliw	a0,a0,0xd
    80007818:	0c2017b7          	lui	a5,0xc201
    8000781c:	00a78533          	add	a0,a5,a0
    80007820:	00452503          	lw	a0,4(a0)
    80007824:	01010113          	addi	sp,sp,16
    80007828:	00008067          	ret

000000008000782c <plic_complete>:
    8000782c:	fe010113          	addi	sp,sp,-32
    80007830:	00813823          	sd	s0,16(sp)
    80007834:	00913423          	sd	s1,8(sp)
    80007838:	00113c23          	sd	ra,24(sp)
    8000783c:	02010413          	addi	s0,sp,32
    80007840:	00050493          	mv	s1,a0
    80007844:	00000097          	auipc	ra,0x0
    80007848:	9bc080e7          	jalr	-1604(ra) # 80007200 <cpuid>
    8000784c:	01813083          	ld	ra,24(sp)
    80007850:	01013403          	ld	s0,16(sp)
    80007854:	00d5179b          	slliw	a5,a0,0xd
    80007858:	0c201737          	lui	a4,0xc201
    8000785c:	00f707b3          	add	a5,a4,a5
    80007860:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007864:	00813483          	ld	s1,8(sp)
    80007868:	02010113          	addi	sp,sp,32
    8000786c:	00008067          	ret

0000000080007870 <consolewrite>:
    80007870:	fb010113          	addi	sp,sp,-80
    80007874:	04813023          	sd	s0,64(sp)
    80007878:	04113423          	sd	ra,72(sp)
    8000787c:	02913c23          	sd	s1,56(sp)
    80007880:	03213823          	sd	s2,48(sp)
    80007884:	03313423          	sd	s3,40(sp)
    80007888:	03413023          	sd	s4,32(sp)
    8000788c:	01513c23          	sd	s5,24(sp)
    80007890:	05010413          	addi	s0,sp,80
    80007894:	06c05c63          	blez	a2,8000790c <consolewrite+0x9c>
    80007898:	00060993          	mv	s3,a2
    8000789c:	00050a13          	mv	s4,a0
    800078a0:	00058493          	mv	s1,a1
    800078a4:	00000913          	li	s2,0
    800078a8:	fff00a93          	li	s5,-1
    800078ac:	01c0006f          	j	800078c8 <consolewrite+0x58>
    800078b0:	fbf44503          	lbu	a0,-65(s0)
    800078b4:	0019091b          	addiw	s2,s2,1
    800078b8:	00148493          	addi	s1,s1,1
    800078bc:	00001097          	auipc	ra,0x1
    800078c0:	a9c080e7          	jalr	-1380(ra) # 80008358 <uartputc>
    800078c4:	03298063          	beq	s3,s2,800078e4 <consolewrite+0x74>
    800078c8:	00048613          	mv	a2,s1
    800078cc:	00100693          	li	a3,1
    800078d0:	000a0593          	mv	a1,s4
    800078d4:	fbf40513          	addi	a0,s0,-65
    800078d8:	00000097          	auipc	ra,0x0
    800078dc:	9e0080e7          	jalr	-1568(ra) # 800072b8 <either_copyin>
    800078e0:	fd5518e3          	bne	a0,s5,800078b0 <consolewrite+0x40>
    800078e4:	04813083          	ld	ra,72(sp)
    800078e8:	04013403          	ld	s0,64(sp)
    800078ec:	03813483          	ld	s1,56(sp)
    800078f0:	02813983          	ld	s3,40(sp)
    800078f4:	02013a03          	ld	s4,32(sp)
    800078f8:	01813a83          	ld	s5,24(sp)
    800078fc:	00090513          	mv	a0,s2
    80007900:	03013903          	ld	s2,48(sp)
    80007904:	05010113          	addi	sp,sp,80
    80007908:	00008067          	ret
    8000790c:	00000913          	li	s2,0
    80007910:	fd5ff06f          	j	800078e4 <consolewrite+0x74>

0000000080007914 <consoleread>:
    80007914:	f9010113          	addi	sp,sp,-112
    80007918:	06813023          	sd	s0,96(sp)
    8000791c:	04913c23          	sd	s1,88(sp)
    80007920:	05213823          	sd	s2,80(sp)
    80007924:	05313423          	sd	s3,72(sp)
    80007928:	05413023          	sd	s4,64(sp)
    8000792c:	03513c23          	sd	s5,56(sp)
    80007930:	03613823          	sd	s6,48(sp)
    80007934:	03713423          	sd	s7,40(sp)
    80007938:	03813023          	sd	s8,32(sp)
    8000793c:	06113423          	sd	ra,104(sp)
    80007940:	01913c23          	sd	s9,24(sp)
    80007944:	07010413          	addi	s0,sp,112
    80007948:	00060b93          	mv	s7,a2
    8000794c:	00050913          	mv	s2,a0
    80007950:	00058c13          	mv	s8,a1
    80007954:	00060b1b          	sext.w	s6,a2
    80007958:	00007497          	auipc	s1,0x7
    8000795c:	a1048493          	addi	s1,s1,-1520 # 8000e368 <cons>
    80007960:	00400993          	li	s3,4
    80007964:	fff00a13          	li	s4,-1
    80007968:	00a00a93          	li	s5,10
    8000796c:	05705e63          	blez	s7,800079c8 <consoleread+0xb4>
    80007970:	09c4a703          	lw	a4,156(s1)
    80007974:	0984a783          	lw	a5,152(s1)
    80007978:	0007071b          	sext.w	a4,a4
    8000797c:	08e78463          	beq	a5,a4,80007a04 <consoleread+0xf0>
    80007980:	07f7f713          	andi	a4,a5,127
    80007984:	00e48733          	add	a4,s1,a4
    80007988:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000798c:	0017869b          	addiw	a3,a5,1
    80007990:	08d4ac23          	sw	a3,152(s1)
    80007994:	00070c9b          	sext.w	s9,a4
    80007998:	0b370663          	beq	a4,s3,80007a44 <consoleread+0x130>
    8000799c:	00100693          	li	a3,1
    800079a0:	f9f40613          	addi	a2,s0,-97
    800079a4:	000c0593          	mv	a1,s8
    800079a8:	00090513          	mv	a0,s2
    800079ac:	f8e40fa3          	sb	a4,-97(s0)
    800079b0:	00000097          	auipc	ra,0x0
    800079b4:	8bc080e7          	jalr	-1860(ra) # 8000726c <either_copyout>
    800079b8:	01450863          	beq	a0,s4,800079c8 <consoleread+0xb4>
    800079bc:	001c0c13          	addi	s8,s8,1
    800079c0:	fffb8b9b          	addiw	s7,s7,-1
    800079c4:	fb5c94e3          	bne	s9,s5,8000796c <consoleread+0x58>
    800079c8:	000b851b          	sext.w	a0,s7
    800079cc:	06813083          	ld	ra,104(sp)
    800079d0:	06013403          	ld	s0,96(sp)
    800079d4:	05813483          	ld	s1,88(sp)
    800079d8:	05013903          	ld	s2,80(sp)
    800079dc:	04813983          	ld	s3,72(sp)
    800079e0:	04013a03          	ld	s4,64(sp)
    800079e4:	03813a83          	ld	s5,56(sp)
    800079e8:	02813b83          	ld	s7,40(sp)
    800079ec:	02013c03          	ld	s8,32(sp)
    800079f0:	01813c83          	ld	s9,24(sp)
    800079f4:	40ab053b          	subw	a0,s6,a0
    800079f8:	03013b03          	ld	s6,48(sp)
    800079fc:	07010113          	addi	sp,sp,112
    80007a00:	00008067          	ret
    80007a04:	00001097          	auipc	ra,0x1
    80007a08:	1d8080e7          	jalr	472(ra) # 80008bdc <push_on>
    80007a0c:	0984a703          	lw	a4,152(s1)
    80007a10:	09c4a783          	lw	a5,156(s1)
    80007a14:	0007879b          	sext.w	a5,a5
    80007a18:	fef70ce3          	beq	a4,a5,80007a10 <consoleread+0xfc>
    80007a1c:	00001097          	auipc	ra,0x1
    80007a20:	234080e7          	jalr	564(ra) # 80008c50 <pop_on>
    80007a24:	0984a783          	lw	a5,152(s1)
    80007a28:	07f7f713          	andi	a4,a5,127
    80007a2c:	00e48733          	add	a4,s1,a4
    80007a30:	01874703          	lbu	a4,24(a4)
    80007a34:	0017869b          	addiw	a3,a5,1
    80007a38:	08d4ac23          	sw	a3,152(s1)
    80007a3c:	00070c9b          	sext.w	s9,a4
    80007a40:	f5371ee3          	bne	a4,s3,8000799c <consoleread+0x88>
    80007a44:	000b851b          	sext.w	a0,s7
    80007a48:	f96bf2e3          	bgeu	s7,s6,800079cc <consoleread+0xb8>
    80007a4c:	08f4ac23          	sw	a5,152(s1)
    80007a50:	f7dff06f          	j	800079cc <consoleread+0xb8>

0000000080007a54 <consputc>:
    80007a54:	10000793          	li	a5,256
    80007a58:	00f50663          	beq	a0,a5,80007a64 <consputc+0x10>
    80007a5c:	00001317          	auipc	t1,0x1
    80007a60:	9f430067          	jr	-1548(t1) # 80008450 <uartputc_sync>
    80007a64:	ff010113          	addi	sp,sp,-16
    80007a68:	00113423          	sd	ra,8(sp)
    80007a6c:	00813023          	sd	s0,0(sp)
    80007a70:	01010413          	addi	s0,sp,16
    80007a74:	00800513          	li	a0,8
    80007a78:	00001097          	auipc	ra,0x1
    80007a7c:	9d8080e7          	jalr	-1576(ra) # 80008450 <uartputc_sync>
    80007a80:	02000513          	li	a0,32
    80007a84:	00001097          	auipc	ra,0x1
    80007a88:	9cc080e7          	jalr	-1588(ra) # 80008450 <uartputc_sync>
    80007a8c:	00013403          	ld	s0,0(sp)
    80007a90:	00813083          	ld	ra,8(sp)
    80007a94:	00800513          	li	a0,8
    80007a98:	01010113          	addi	sp,sp,16
    80007a9c:	00001317          	auipc	t1,0x1
    80007aa0:	9b430067          	jr	-1612(t1) # 80008450 <uartputc_sync>

0000000080007aa4 <consoleintr>:
    80007aa4:	fe010113          	addi	sp,sp,-32
    80007aa8:	00813823          	sd	s0,16(sp)
    80007aac:	00913423          	sd	s1,8(sp)
    80007ab0:	01213023          	sd	s2,0(sp)
    80007ab4:	00113c23          	sd	ra,24(sp)
    80007ab8:	02010413          	addi	s0,sp,32
    80007abc:	00007917          	auipc	s2,0x7
    80007ac0:	8ac90913          	addi	s2,s2,-1876 # 8000e368 <cons>
    80007ac4:	00050493          	mv	s1,a0
    80007ac8:	00090513          	mv	a0,s2
    80007acc:	00001097          	auipc	ra,0x1
    80007ad0:	e40080e7          	jalr	-448(ra) # 8000890c <acquire>
    80007ad4:	02048c63          	beqz	s1,80007b0c <consoleintr+0x68>
    80007ad8:	0a092783          	lw	a5,160(s2)
    80007adc:	09892703          	lw	a4,152(s2)
    80007ae0:	07f00693          	li	a3,127
    80007ae4:	40e7873b          	subw	a4,a5,a4
    80007ae8:	02e6e263          	bltu	a3,a4,80007b0c <consoleintr+0x68>
    80007aec:	00d00713          	li	a4,13
    80007af0:	04e48063          	beq	s1,a4,80007b30 <consoleintr+0x8c>
    80007af4:	07f7f713          	andi	a4,a5,127
    80007af8:	00e90733          	add	a4,s2,a4
    80007afc:	0017879b          	addiw	a5,a5,1
    80007b00:	0af92023          	sw	a5,160(s2)
    80007b04:	00970c23          	sb	s1,24(a4)
    80007b08:	08f92e23          	sw	a5,156(s2)
    80007b0c:	01013403          	ld	s0,16(sp)
    80007b10:	01813083          	ld	ra,24(sp)
    80007b14:	00813483          	ld	s1,8(sp)
    80007b18:	00013903          	ld	s2,0(sp)
    80007b1c:	00007517          	auipc	a0,0x7
    80007b20:	84c50513          	addi	a0,a0,-1972 # 8000e368 <cons>
    80007b24:	02010113          	addi	sp,sp,32
    80007b28:	00001317          	auipc	t1,0x1
    80007b2c:	eb030067          	jr	-336(t1) # 800089d8 <release>
    80007b30:	00a00493          	li	s1,10
    80007b34:	fc1ff06f          	j	80007af4 <consoleintr+0x50>

0000000080007b38 <consoleinit>:
    80007b38:	fe010113          	addi	sp,sp,-32
    80007b3c:	00113c23          	sd	ra,24(sp)
    80007b40:	00813823          	sd	s0,16(sp)
    80007b44:	00913423          	sd	s1,8(sp)
    80007b48:	02010413          	addi	s0,sp,32
    80007b4c:	00007497          	auipc	s1,0x7
    80007b50:	81c48493          	addi	s1,s1,-2020 # 8000e368 <cons>
    80007b54:	00048513          	mv	a0,s1
    80007b58:	00003597          	auipc	a1,0x3
    80007b5c:	97058593          	addi	a1,a1,-1680 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80007b60:	00001097          	auipc	ra,0x1
    80007b64:	d88080e7          	jalr	-632(ra) # 800088e8 <initlock>
    80007b68:	00000097          	auipc	ra,0x0
    80007b6c:	7ac080e7          	jalr	1964(ra) # 80008314 <uartinit>
    80007b70:	01813083          	ld	ra,24(sp)
    80007b74:	01013403          	ld	s0,16(sp)
    80007b78:	00000797          	auipc	a5,0x0
    80007b7c:	d9c78793          	addi	a5,a5,-612 # 80007914 <consoleread>
    80007b80:	0af4bc23          	sd	a5,184(s1)
    80007b84:	00000797          	auipc	a5,0x0
    80007b88:	cec78793          	addi	a5,a5,-788 # 80007870 <consolewrite>
    80007b8c:	0cf4b023          	sd	a5,192(s1)
    80007b90:	00813483          	ld	s1,8(sp)
    80007b94:	02010113          	addi	sp,sp,32
    80007b98:	00008067          	ret

0000000080007b9c <console_read>:
    80007b9c:	ff010113          	addi	sp,sp,-16
    80007ba0:	00813423          	sd	s0,8(sp)
    80007ba4:	01010413          	addi	s0,sp,16
    80007ba8:	00813403          	ld	s0,8(sp)
    80007bac:	00007317          	auipc	t1,0x7
    80007bb0:	87433303          	ld	t1,-1932(t1) # 8000e420 <devsw+0x10>
    80007bb4:	01010113          	addi	sp,sp,16
    80007bb8:	00030067          	jr	t1

0000000080007bbc <console_write>:
    80007bbc:	ff010113          	addi	sp,sp,-16
    80007bc0:	00813423          	sd	s0,8(sp)
    80007bc4:	01010413          	addi	s0,sp,16
    80007bc8:	00813403          	ld	s0,8(sp)
    80007bcc:	00007317          	auipc	t1,0x7
    80007bd0:	85c33303          	ld	t1,-1956(t1) # 8000e428 <devsw+0x18>
    80007bd4:	01010113          	addi	sp,sp,16
    80007bd8:	00030067          	jr	t1

0000000080007bdc <panic>:
    80007bdc:	fe010113          	addi	sp,sp,-32
    80007be0:	00113c23          	sd	ra,24(sp)
    80007be4:	00813823          	sd	s0,16(sp)
    80007be8:	00913423          	sd	s1,8(sp)
    80007bec:	02010413          	addi	s0,sp,32
    80007bf0:	00050493          	mv	s1,a0
    80007bf4:	00003517          	auipc	a0,0x3
    80007bf8:	8dc50513          	addi	a0,a0,-1828 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    80007bfc:	00007797          	auipc	a5,0x7
    80007c00:	8c07a623          	sw	zero,-1844(a5) # 8000e4c8 <pr+0x18>
    80007c04:	00000097          	auipc	ra,0x0
    80007c08:	034080e7          	jalr	52(ra) # 80007c38 <__printf>
    80007c0c:	00048513          	mv	a0,s1
    80007c10:	00000097          	auipc	ra,0x0
    80007c14:	028080e7          	jalr	40(ra) # 80007c38 <__printf>
    80007c18:	00002517          	auipc	a0,0x2
    80007c1c:	55050513          	addi	a0,a0,1360 # 8000a168 <CONSOLE_STATUS+0x158>
    80007c20:	00000097          	auipc	ra,0x0
    80007c24:	018080e7          	jalr	24(ra) # 80007c38 <__printf>
    80007c28:	00100793          	li	a5,1
    80007c2c:	00005717          	auipc	a4,0x5
    80007c30:	0cf72e23          	sw	a5,220(a4) # 8000cd08 <panicked>
    80007c34:	0000006f          	j	80007c34 <panic+0x58>

0000000080007c38 <__printf>:
    80007c38:	f3010113          	addi	sp,sp,-208
    80007c3c:	08813023          	sd	s0,128(sp)
    80007c40:	07313423          	sd	s3,104(sp)
    80007c44:	09010413          	addi	s0,sp,144
    80007c48:	05813023          	sd	s8,64(sp)
    80007c4c:	08113423          	sd	ra,136(sp)
    80007c50:	06913c23          	sd	s1,120(sp)
    80007c54:	07213823          	sd	s2,112(sp)
    80007c58:	07413023          	sd	s4,96(sp)
    80007c5c:	05513c23          	sd	s5,88(sp)
    80007c60:	05613823          	sd	s6,80(sp)
    80007c64:	05713423          	sd	s7,72(sp)
    80007c68:	03913c23          	sd	s9,56(sp)
    80007c6c:	03a13823          	sd	s10,48(sp)
    80007c70:	03b13423          	sd	s11,40(sp)
    80007c74:	00007317          	auipc	t1,0x7
    80007c78:	83c30313          	addi	t1,t1,-1988 # 8000e4b0 <pr>
    80007c7c:	01832c03          	lw	s8,24(t1)
    80007c80:	00b43423          	sd	a1,8(s0)
    80007c84:	00c43823          	sd	a2,16(s0)
    80007c88:	00d43c23          	sd	a3,24(s0)
    80007c8c:	02e43023          	sd	a4,32(s0)
    80007c90:	02f43423          	sd	a5,40(s0)
    80007c94:	03043823          	sd	a6,48(s0)
    80007c98:	03143c23          	sd	a7,56(s0)
    80007c9c:	00050993          	mv	s3,a0
    80007ca0:	4a0c1663          	bnez	s8,8000814c <__printf+0x514>
    80007ca4:	60098c63          	beqz	s3,800082bc <__printf+0x684>
    80007ca8:	0009c503          	lbu	a0,0(s3)
    80007cac:	00840793          	addi	a5,s0,8
    80007cb0:	f6f43c23          	sd	a5,-136(s0)
    80007cb4:	00000493          	li	s1,0
    80007cb8:	22050063          	beqz	a0,80007ed8 <__printf+0x2a0>
    80007cbc:	00002a37          	lui	s4,0x2
    80007cc0:	00018ab7          	lui	s5,0x18
    80007cc4:	000f4b37          	lui	s6,0xf4
    80007cc8:	00989bb7          	lui	s7,0x989
    80007ccc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007cd0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007cd4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007cd8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007cdc:	00148c9b          	addiw	s9,s1,1
    80007ce0:	02500793          	li	a5,37
    80007ce4:	01998933          	add	s2,s3,s9
    80007ce8:	38f51263          	bne	a0,a5,8000806c <__printf+0x434>
    80007cec:	00094783          	lbu	a5,0(s2)
    80007cf0:	00078c9b          	sext.w	s9,a5
    80007cf4:	1e078263          	beqz	a5,80007ed8 <__printf+0x2a0>
    80007cf8:	0024849b          	addiw	s1,s1,2
    80007cfc:	07000713          	li	a4,112
    80007d00:	00998933          	add	s2,s3,s1
    80007d04:	38e78a63          	beq	a5,a4,80008098 <__printf+0x460>
    80007d08:	20f76863          	bltu	a4,a5,80007f18 <__printf+0x2e0>
    80007d0c:	42a78863          	beq	a5,a0,8000813c <__printf+0x504>
    80007d10:	06400713          	li	a4,100
    80007d14:	40e79663          	bne	a5,a4,80008120 <__printf+0x4e8>
    80007d18:	f7843783          	ld	a5,-136(s0)
    80007d1c:	0007a603          	lw	a2,0(a5)
    80007d20:	00878793          	addi	a5,a5,8
    80007d24:	f6f43c23          	sd	a5,-136(s0)
    80007d28:	42064a63          	bltz	a2,8000815c <__printf+0x524>
    80007d2c:	00a00713          	li	a4,10
    80007d30:	02e677bb          	remuw	a5,a2,a4
    80007d34:	00002d97          	auipc	s11,0x2
    80007d38:	7c4d8d93          	addi	s11,s11,1988 # 8000a4f8 <digits>
    80007d3c:	00900593          	li	a1,9
    80007d40:	0006051b          	sext.w	a0,a2
    80007d44:	00000c93          	li	s9,0
    80007d48:	02079793          	slli	a5,a5,0x20
    80007d4c:	0207d793          	srli	a5,a5,0x20
    80007d50:	00fd87b3          	add	a5,s11,a5
    80007d54:	0007c783          	lbu	a5,0(a5)
    80007d58:	02e656bb          	divuw	a3,a2,a4
    80007d5c:	f8f40023          	sb	a5,-128(s0)
    80007d60:	14c5d863          	bge	a1,a2,80007eb0 <__printf+0x278>
    80007d64:	06300593          	li	a1,99
    80007d68:	00100c93          	li	s9,1
    80007d6c:	02e6f7bb          	remuw	a5,a3,a4
    80007d70:	02079793          	slli	a5,a5,0x20
    80007d74:	0207d793          	srli	a5,a5,0x20
    80007d78:	00fd87b3          	add	a5,s11,a5
    80007d7c:	0007c783          	lbu	a5,0(a5)
    80007d80:	02e6d73b          	divuw	a4,a3,a4
    80007d84:	f8f400a3          	sb	a5,-127(s0)
    80007d88:	12a5f463          	bgeu	a1,a0,80007eb0 <__printf+0x278>
    80007d8c:	00a00693          	li	a3,10
    80007d90:	00900593          	li	a1,9
    80007d94:	02d777bb          	remuw	a5,a4,a3
    80007d98:	02079793          	slli	a5,a5,0x20
    80007d9c:	0207d793          	srli	a5,a5,0x20
    80007da0:	00fd87b3          	add	a5,s11,a5
    80007da4:	0007c503          	lbu	a0,0(a5)
    80007da8:	02d757bb          	divuw	a5,a4,a3
    80007dac:	f8a40123          	sb	a0,-126(s0)
    80007db0:	48e5f263          	bgeu	a1,a4,80008234 <__printf+0x5fc>
    80007db4:	06300513          	li	a0,99
    80007db8:	02d7f5bb          	remuw	a1,a5,a3
    80007dbc:	02059593          	slli	a1,a1,0x20
    80007dc0:	0205d593          	srli	a1,a1,0x20
    80007dc4:	00bd85b3          	add	a1,s11,a1
    80007dc8:	0005c583          	lbu	a1,0(a1)
    80007dcc:	02d7d7bb          	divuw	a5,a5,a3
    80007dd0:	f8b401a3          	sb	a1,-125(s0)
    80007dd4:	48e57263          	bgeu	a0,a4,80008258 <__printf+0x620>
    80007dd8:	3e700513          	li	a0,999
    80007ddc:	02d7f5bb          	remuw	a1,a5,a3
    80007de0:	02059593          	slli	a1,a1,0x20
    80007de4:	0205d593          	srli	a1,a1,0x20
    80007de8:	00bd85b3          	add	a1,s11,a1
    80007dec:	0005c583          	lbu	a1,0(a1)
    80007df0:	02d7d7bb          	divuw	a5,a5,a3
    80007df4:	f8b40223          	sb	a1,-124(s0)
    80007df8:	46e57663          	bgeu	a0,a4,80008264 <__printf+0x62c>
    80007dfc:	02d7f5bb          	remuw	a1,a5,a3
    80007e00:	02059593          	slli	a1,a1,0x20
    80007e04:	0205d593          	srli	a1,a1,0x20
    80007e08:	00bd85b3          	add	a1,s11,a1
    80007e0c:	0005c583          	lbu	a1,0(a1)
    80007e10:	02d7d7bb          	divuw	a5,a5,a3
    80007e14:	f8b402a3          	sb	a1,-123(s0)
    80007e18:	46ea7863          	bgeu	s4,a4,80008288 <__printf+0x650>
    80007e1c:	02d7f5bb          	remuw	a1,a5,a3
    80007e20:	02059593          	slli	a1,a1,0x20
    80007e24:	0205d593          	srli	a1,a1,0x20
    80007e28:	00bd85b3          	add	a1,s11,a1
    80007e2c:	0005c583          	lbu	a1,0(a1)
    80007e30:	02d7d7bb          	divuw	a5,a5,a3
    80007e34:	f8b40323          	sb	a1,-122(s0)
    80007e38:	3eeaf863          	bgeu	s5,a4,80008228 <__printf+0x5f0>
    80007e3c:	02d7f5bb          	remuw	a1,a5,a3
    80007e40:	02059593          	slli	a1,a1,0x20
    80007e44:	0205d593          	srli	a1,a1,0x20
    80007e48:	00bd85b3          	add	a1,s11,a1
    80007e4c:	0005c583          	lbu	a1,0(a1)
    80007e50:	02d7d7bb          	divuw	a5,a5,a3
    80007e54:	f8b403a3          	sb	a1,-121(s0)
    80007e58:	42eb7e63          	bgeu	s6,a4,80008294 <__printf+0x65c>
    80007e5c:	02d7f5bb          	remuw	a1,a5,a3
    80007e60:	02059593          	slli	a1,a1,0x20
    80007e64:	0205d593          	srli	a1,a1,0x20
    80007e68:	00bd85b3          	add	a1,s11,a1
    80007e6c:	0005c583          	lbu	a1,0(a1)
    80007e70:	02d7d7bb          	divuw	a5,a5,a3
    80007e74:	f8b40423          	sb	a1,-120(s0)
    80007e78:	42ebfc63          	bgeu	s7,a4,800082b0 <__printf+0x678>
    80007e7c:	02079793          	slli	a5,a5,0x20
    80007e80:	0207d793          	srli	a5,a5,0x20
    80007e84:	00fd8db3          	add	s11,s11,a5
    80007e88:	000dc703          	lbu	a4,0(s11)
    80007e8c:	00a00793          	li	a5,10
    80007e90:	00900c93          	li	s9,9
    80007e94:	f8e404a3          	sb	a4,-119(s0)
    80007e98:	00065c63          	bgez	a2,80007eb0 <__printf+0x278>
    80007e9c:	f9040713          	addi	a4,s0,-112
    80007ea0:	00f70733          	add	a4,a4,a5
    80007ea4:	02d00693          	li	a3,45
    80007ea8:	fed70823          	sb	a3,-16(a4)
    80007eac:	00078c93          	mv	s9,a5
    80007eb0:	f8040793          	addi	a5,s0,-128
    80007eb4:	01978cb3          	add	s9,a5,s9
    80007eb8:	f7f40d13          	addi	s10,s0,-129
    80007ebc:	000cc503          	lbu	a0,0(s9)
    80007ec0:	fffc8c93          	addi	s9,s9,-1
    80007ec4:	00000097          	auipc	ra,0x0
    80007ec8:	b90080e7          	jalr	-1136(ra) # 80007a54 <consputc>
    80007ecc:	ffac98e3          	bne	s9,s10,80007ebc <__printf+0x284>
    80007ed0:	00094503          	lbu	a0,0(s2)
    80007ed4:	e00514e3          	bnez	a0,80007cdc <__printf+0xa4>
    80007ed8:	1a0c1663          	bnez	s8,80008084 <__printf+0x44c>
    80007edc:	08813083          	ld	ra,136(sp)
    80007ee0:	08013403          	ld	s0,128(sp)
    80007ee4:	07813483          	ld	s1,120(sp)
    80007ee8:	07013903          	ld	s2,112(sp)
    80007eec:	06813983          	ld	s3,104(sp)
    80007ef0:	06013a03          	ld	s4,96(sp)
    80007ef4:	05813a83          	ld	s5,88(sp)
    80007ef8:	05013b03          	ld	s6,80(sp)
    80007efc:	04813b83          	ld	s7,72(sp)
    80007f00:	04013c03          	ld	s8,64(sp)
    80007f04:	03813c83          	ld	s9,56(sp)
    80007f08:	03013d03          	ld	s10,48(sp)
    80007f0c:	02813d83          	ld	s11,40(sp)
    80007f10:	0d010113          	addi	sp,sp,208
    80007f14:	00008067          	ret
    80007f18:	07300713          	li	a4,115
    80007f1c:	1ce78a63          	beq	a5,a4,800080f0 <__printf+0x4b8>
    80007f20:	07800713          	li	a4,120
    80007f24:	1ee79e63          	bne	a5,a4,80008120 <__printf+0x4e8>
    80007f28:	f7843783          	ld	a5,-136(s0)
    80007f2c:	0007a703          	lw	a4,0(a5)
    80007f30:	00878793          	addi	a5,a5,8
    80007f34:	f6f43c23          	sd	a5,-136(s0)
    80007f38:	28074263          	bltz	a4,800081bc <__printf+0x584>
    80007f3c:	00002d97          	auipc	s11,0x2
    80007f40:	5bcd8d93          	addi	s11,s11,1468 # 8000a4f8 <digits>
    80007f44:	00f77793          	andi	a5,a4,15
    80007f48:	00fd87b3          	add	a5,s11,a5
    80007f4c:	0007c683          	lbu	a3,0(a5)
    80007f50:	00f00613          	li	a2,15
    80007f54:	0007079b          	sext.w	a5,a4
    80007f58:	f8d40023          	sb	a3,-128(s0)
    80007f5c:	0047559b          	srliw	a1,a4,0x4
    80007f60:	0047569b          	srliw	a3,a4,0x4
    80007f64:	00000c93          	li	s9,0
    80007f68:	0ee65063          	bge	a2,a4,80008048 <__printf+0x410>
    80007f6c:	00f6f693          	andi	a3,a3,15
    80007f70:	00dd86b3          	add	a3,s11,a3
    80007f74:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007f78:	0087d79b          	srliw	a5,a5,0x8
    80007f7c:	00100c93          	li	s9,1
    80007f80:	f8d400a3          	sb	a3,-127(s0)
    80007f84:	0cb67263          	bgeu	a2,a1,80008048 <__printf+0x410>
    80007f88:	00f7f693          	andi	a3,a5,15
    80007f8c:	00dd86b3          	add	a3,s11,a3
    80007f90:	0006c583          	lbu	a1,0(a3)
    80007f94:	00f00613          	li	a2,15
    80007f98:	0047d69b          	srliw	a3,a5,0x4
    80007f9c:	f8b40123          	sb	a1,-126(s0)
    80007fa0:	0047d593          	srli	a1,a5,0x4
    80007fa4:	28f67e63          	bgeu	a2,a5,80008240 <__printf+0x608>
    80007fa8:	00f6f693          	andi	a3,a3,15
    80007fac:	00dd86b3          	add	a3,s11,a3
    80007fb0:	0006c503          	lbu	a0,0(a3)
    80007fb4:	0087d813          	srli	a6,a5,0x8
    80007fb8:	0087d69b          	srliw	a3,a5,0x8
    80007fbc:	f8a401a3          	sb	a0,-125(s0)
    80007fc0:	28b67663          	bgeu	a2,a1,8000824c <__printf+0x614>
    80007fc4:	00f6f693          	andi	a3,a3,15
    80007fc8:	00dd86b3          	add	a3,s11,a3
    80007fcc:	0006c583          	lbu	a1,0(a3)
    80007fd0:	00c7d513          	srli	a0,a5,0xc
    80007fd4:	00c7d69b          	srliw	a3,a5,0xc
    80007fd8:	f8b40223          	sb	a1,-124(s0)
    80007fdc:	29067a63          	bgeu	a2,a6,80008270 <__printf+0x638>
    80007fe0:	00f6f693          	andi	a3,a3,15
    80007fe4:	00dd86b3          	add	a3,s11,a3
    80007fe8:	0006c583          	lbu	a1,0(a3)
    80007fec:	0107d813          	srli	a6,a5,0x10
    80007ff0:	0107d69b          	srliw	a3,a5,0x10
    80007ff4:	f8b402a3          	sb	a1,-123(s0)
    80007ff8:	28a67263          	bgeu	a2,a0,8000827c <__printf+0x644>
    80007ffc:	00f6f693          	andi	a3,a3,15
    80008000:	00dd86b3          	add	a3,s11,a3
    80008004:	0006c683          	lbu	a3,0(a3)
    80008008:	0147d79b          	srliw	a5,a5,0x14
    8000800c:	f8d40323          	sb	a3,-122(s0)
    80008010:	21067663          	bgeu	a2,a6,8000821c <__printf+0x5e4>
    80008014:	02079793          	slli	a5,a5,0x20
    80008018:	0207d793          	srli	a5,a5,0x20
    8000801c:	00fd8db3          	add	s11,s11,a5
    80008020:	000dc683          	lbu	a3,0(s11)
    80008024:	00800793          	li	a5,8
    80008028:	00700c93          	li	s9,7
    8000802c:	f8d403a3          	sb	a3,-121(s0)
    80008030:	00075c63          	bgez	a4,80008048 <__printf+0x410>
    80008034:	f9040713          	addi	a4,s0,-112
    80008038:	00f70733          	add	a4,a4,a5
    8000803c:	02d00693          	li	a3,45
    80008040:	fed70823          	sb	a3,-16(a4)
    80008044:	00078c93          	mv	s9,a5
    80008048:	f8040793          	addi	a5,s0,-128
    8000804c:	01978cb3          	add	s9,a5,s9
    80008050:	f7f40d13          	addi	s10,s0,-129
    80008054:	000cc503          	lbu	a0,0(s9)
    80008058:	fffc8c93          	addi	s9,s9,-1
    8000805c:	00000097          	auipc	ra,0x0
    80008060:	9f8080e7          	jalr	-1544(ra) # 80007a54 <consputc>
    80008064:	ff9d18e3          	bne	s10,s9,80008054 <__printf+0x41c>
    80008068:	0100006f          	j	80008078 <__printf+0x440>
    8000806c:	00000097          	auipc	ra,0x0
    80008070:	9e8080e7          	jalr	-1560(ra) # 80007a54 <consputc>
    80008074:	000c8493          	mv	s1,s9
    80008078:	00094503          	lbu	a0,0(s2)
    8000807c:	c60510e3          	bnez	a0,80007cdc <__printf+0xa4>
    80008080:	e40c0ee3          	beqz	s8,80007edc <__printf+0x2a4>
    80008084:	00006517          	auipc	a0,0x6
    80008088:	42c50513          	addi	a0,a0,1068 # 8000e4b0 <pr>
    8000808c:	00001097          	auipc	ra,0x1
    80008090:	94c080e7          	jalr	-1716(ra) # 800089d8 <release>
    80008094:	e49ff06f          	j	80007edc <__printf+0x2a4>
    80008098:	f7843783          	ld	a5,-136(s0)
    8000809c:	03000513          	li	a0,48
    800080a0:	01000d13          	li	s10,16
    800080a4:	00878713          	addi	a4,a5,8
    800080a8:	0007bc83          	ld	s9,0(a5)
    800080ac:	f6e43c23          	sd	a4,-136(s0)
    800080b0:	00000097          	auipc	ra,0x0
    800080b4:	9a4080e7          	jalr	-1628(ra) # 80007a54 <consputc>
    800080b8:	07800513          	li	a0,120
    800080bc:	00000097          	auipc	ra,0x0
    800080c0:	998080e7          	jalr	-1640(ra) # 80007a54 <consputc>
    800080c4:	00002d97          	auipc	s11,0x2
    800080c8:	434d8d93          	addi	s11,s11,1076 # 8000a4f8 <digits>
    800080cc:	03ccd793          	srli	a5,s9,0x3c
    800080d0:	00fd87b3          	add	a5,s11,a5
    800080d4:	0007c503          	lbu	a0,0(a5)
    800080d8:	fffd0d1b          	addiw	s10,s10,-1
    800080dc:	004c9c93          	slli	s9,s9,0x4
    800080e0:	00000097          	auipc	ra,0x0
    800080e4:	974080e7          	jalr	-1676(ra) # 80007a54 <consputc>
    800080e8:	fe0d12e3          	bnez	s10,800080cc <__printf+0x494>
    800080ec:	f8dff06f          	j	80008078 <__printf+0x440>
    800080f0:	f7843783          	ld	a5,-136(s0)
    800080f4:	0007bc83          	ld	s9,0(a5)
    800080f8:	00878793          	addi	a5,a5,8
    800080fc:	f6f43c23          	sd	a5,-136(s0)
    80008100:	000c9a63          	bnez	s9,80008114 <__printf+0x4dc>
    80008104:	1080006f          	j	8000820c <__printf+0x5d4>
    80008108:	001c8c93          	addi	s9,s9,1
    8000810c:	00000097          	auipc	ra,0x0
    80008110:	948080e7          	jalr	-1720(ra) # 80007a54 <consputc>
    80008114:	000cc503          	lbu	a0,0(s9)
    80008118:	fe0518e3          	bnez	a0,80008108 <__printf+0x4d0>
    8000811c:	f5dff06f          	j	80008078 <__printf+0x440>
    80008120:	02500513          	li	a0,37
    80008124:	00000097          	auipc	ra,0x0
    80008128:	930080e7          	jalr	-1744(ra) # 80007a54 <consputc>
    8000812c:	000c8513          	mv	a0,s9
    80008130:	00000097          	auipc	ra,0x0
    80008134:	924080e7          	jalr	-1756(ra) # 80007a54 <consputc>
    80008138:	f41ff06f          	j	80008078 <__printf+0x440>
    8000813c:	02500513          	li	a0,37
    80008140:	00000097          	auipc	ra,0x0
    80008144:	914080e7          	jalr	-1772(ra) # 80007a54 <consputc>
    80008148:	f31ff06f          	j	80008078 <__printf+0x440>
    8000814c:	00030513          	mv	a0,t1
    80008150:	00000097          	auipc	ra,0x0
    80008154:	7bc080e7          	jalr	1980(ra) # 8000890c <acquire>
    80008158:	b4dff06f          	j	80007ca4 <__printf+0x6c>
    8000815c:	40c0053b          	negw	a0,a2
    80008160:	00a00713          	li	a4,10
    80008164:	02e576bb          	remuw	a3,a0,a4
    80008168:	00002d97          	auipc	s11,0x2
    8000816c:	390d8d93          	addi	s11,s11,912 # 8000a4f8 <digits>
    80008170:	ff700593          	li	a1,-9
    80008174:	02069693          	slli	a3,a3,0x20
    80008178:	0206d693          	srli	a3,a3,0x20
    8000817c:	00dd86b3          	add	a3,s11,a3
    80008180:	0006c683          	lbu	a3,0(a3)
    80008184:	02e557bb          	divuw	a5,a0,a4
    80008188:	f8d40023          	sb	a3,-128(s0)
    8000818c:	10b65e63          	bge	a2,a1,800082a8 <__printf+0x670>
    80008190:	06300593          	li	a1,99
    80008194:	02e7f6bb          	remuw	a3,a5,a4
    80008198:	02069693          	slli	a3,a3,0x20
    8000819c:	0206d693          	srli	a3,a3,0x20
    800081a0:	00dd86b3          	add	a3,s11,a3
    800081a4:	0006c683          	lbu	a3,0(a3)
    800081a8:	02e7d73b          	divuw	a4,a5,a4
    800081ac:	00200793          	li	a5,2
    800081b0:	f8d400a3          	sb	a3,-127(s0)
    800081b4:	bca5ece3          	bltu	a1,a0,80007d8c <__printf+0x154>
    800081b8:	ce5ff06f          	j	80007e9c <__printf+0x264>
    800081bc:	40e007bb          	negw	a5,a4
    800081c0:	00002d97          	auipc	s11,0x2
    800081c4:	338d8d93          	addi	s11,s11,824 # 8000a4f8 <digits>
    800081c8:	00f7f693          	andi	a3,a5,15
    800081cc:	00dd86b3          	add	a3,s11,a3
    800081d0:	0006c583          	lbu	a1,0(a3)
    800081d4:	ff100613          	li	a2,-15
    800081d8:	0047d69b          	srliw	a3,a5,0x4
    800081dc:	f8b40023          	sb	a1,-128(s0)
    800081e0:	0047d59b          	srliw	a1,a5,0x4
    800081e4:	0ac75e63          	bge	a4,a2,800082a0 <__printf+0x668>
    800081e8:	00f6f693          	andi	a3,a3,15
    800081ec:	00dd86b3          	add	a3,s11,a3
    800081f0:	0006c603          	lbu	a2,0(a3)
    800081f4:	00f00693          	li	a3,15
    800081f8:	0087d79b          	srliw	a5,a5,0x8
    800081fc:	f8c400a3          	sb	a2,-127(s0)
    80008200:	d8b6e4e3          	bltu	a3,a1,80007f88 <__printf+0x350>
    80008204:	00200793          	li	a5,2
    80008208:	e2dff06f          	j	80008034 <__printf+0x3fc>
    8000820c:	00002c97          	auipc	s9,0x2
    80008210:	2ccc8c93          	addi	s9,s9,716 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    80008214:	02800513          	li	a0,40
    80008218:	ef1ff06f          	j	80008108 <__printf+0x4d0>
    8000821c:	00700793          	li	a5,7
    80008220:	00600c93          	li	s9,6
    80008224:	e0dff06f          	j	80008030 <__printf+0x3f8>
    80008228:	00700793          	li	a5,7
    8000822c:	00600c93          	li	s9,6
    80008230:	c69ff06f          	j	80007e98 <__printf+0x260>
    80008234:	00300793          	li	a5,3
    80008238:	00200c93          	li	s9,2
    8000823c:	c5dff06f          	j	80007e98 <__printf+0x260>
    80008240:	00300793          	li	a5,3
    80008244:	00200c93          	li	s9,2
    80008248:	de9ff06f          	j	80008030 <__printf+0x3f8>
    8000824c:	00400793          	li	a5,4
    80008250:	00300c93          	li	s9,3
    80008254:	dddff06f          	j	80008030 <__printf+0x3f8>
    80008258:	00400793          	li	a5,4
    8000825c:	00300c93          	li	s9,3
    80008260:	c39ff06f          	j	80007e98 <__printf+0x260>
    80008264:	00500793          	li	a5,5
    80008268:	00400c93          	li	s9,4
    8000826c:	c2dff06f          	j	80007e98 <__printf+0x260>
    80008270:	00500793          	li	a5,5
    80008274:	00400c93          	li	s9,4
    80008278:	db9ff06f          	j	80008030 <__printf+0x3f8>
    8000827c:	00600793          	li	a5,6
    80008280:	00500c93          	li	s9,5
    80008284:	dadff06f          	j	80008030 <__printf+0x3f8>
    80008288:	00600793          	li	a5,6
    8000828c:	00500c93          	li	s9,5
    80008290:	c09ff06f          	j	80007e98 <__printf+0x260>
    80008294:	00800793          	li	a5,8
    80008298:	00700c93          	li	s9,7
    8000829c:	bfdff06f          	j	80007e98 <__printf+0x260>
    800082a0:	00100793          	li	a5,1
    800082a4:	d91ff06f          	j	80008034 <__printf+0x3fc>
    800082a8:	00100793          	li	a5,1
    800082ac:	bf1ff06f          	j	80007e9c <__printf+0x264>
    800082b0:	00900793          	li	a5,9
    800082b4:	00800c93          	li	s9,8
    800082b8:	be1ff06f          	j	80007e98 <__printf+0x260>
    800082bc:	00002517          	auipc	a0,0x2
    800082c0:	22450513          	addi	a0,a0,548 # 8000a4e0 <CONSOLE_STATUS+0x4d0>
    800082c4:	00000097          	auipc	ra,0x0
    800082c8:	918080e7          	jalr	-1768(ra) # 80007bdc <panic>

00000000800082cc <printfinit>:
    800082cc:	fe010113          	addi	sp,sp,-32
    800082d0:	00813823          	sd	s0,16(sp)
    800082d4:	00913423          	sd	s1,8(sp)
    800082d8:	00113c23          	sd	ra,24(sp)
    800082dc:	02010413          	addi	s0,sp,32
    800082e0:	00006497          	auipc	s1,0x6
    800082e4:	1d048493          	addi	s1,s1,464 # 8000e4b0 <pr>
    800082e8:	00048513          	mv	a0,s1
    800082ec:	00002597          	auipc	a1,0x2
    800082f0:	20458593          	addi	a1,a1,516 # 8000a4f0 <CONSOLE_STATUS+0x4e0>
    800082f4:	00000097          	auipc	ra,0x0
    800082f8:	5f4080e7          	jalr	1524(ra) # 800088e8 <initlock>
    800082fc:	01813083          	ld	ra,24(sp)
    80008300:	01013403          	ld	s0,16(sp)
    80008304:	0004ac23          	sw	zero,24(s1)
    80008308:	00813483          	ld	s1,8(sp)
    8000830c:	02010113          	addi	sp,sp,32
    80008310:	00008067          	ret

0000000080008314 <uartinit>:
    80008314:	ff010113          	addi	sp,sp,-16
    80008318:	00813423          	sd	s0,8(sp)
    8000831c:	01010413          	addi	s0,sp,16
    80008320:	100007b7          	lui	a5,0x10000
    80008324:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008328:	f8000713          	li	a4,-128
    8000832c:	00e781a3          	sb	a4,3(a5)
    80008330:	00300713          	li	a4,3
    80008334:	00e78023          	sb	a4,0(a5)
    80008338:	000780a3          	sb	zero,1(a5)
    8000833c:	00e781a3          	sb	a4,3(a5)
    80008340:	00700693          	li	a3,7
    80008344:	00d78123          	sb	a3,2(a5)
    80008348:	00e780a3          	sb	a4,1(a5)
    8000834c:	00813403          	ld	s0,8(sp)
    80008350:	01010113          	addi	sp,sp,16
    80008354:	00008067          	ret

0000000080008358 <uartputc>:
    80008358:	00005797          	auipc	a5,0x5
    8000835c:	9b07a783          	lw	a5,-1616(a5) # 8000cd08 <panicked>
    80008360:	00078463          	beqz	a5,80008368 <uartputc+0x10>
    80008364:	0000006f          	j	80008364 <uartputc+0xc>
    80008368:	fd010113          	addi	sp,sp,-48
    8000836c:	02813023          	sd	s0,32(sp)
    80008370:	00913c23          	sd	s1,24(sp)
    80008374:	01213823          	sd	s2,16(sp)
    80008378:	01313423          	sd	s3,8(sp)
    8000837c:	02113423          	sd	ra,40(sp)
    80008380:	03010413          	addi	s0,sp,48
    80008384:	00005917          	auipc	s2,0x5
    80008388:	98c90913          	addi	s2,s2,-1652 # 8000cd10 <uart_tx_r>
    8000838c:	00093783          	ld	a5,0(s2)
    80008390:	00005497          	auipc	s1,0x5
    80008394:	98848493          	addi	s1,s1,-1656 # 8000cd18 <uart_tx_w>
    80008398:	0004b703          	ld	a4,0(s1)
    8000839c:	02078693          	addi	a3,a5,32
    800083a0:	00050993          	mv	s3,a0
    800083a4:	02e69c63          	bne	a3,a4,800083dc <uartputc+0x84>
    800083a8:	00001097          	auipc	ra,0x1
    800083ac:	834080e7          	jalr	-1996(ra) # 80008bdc <push_on>
    800083b0:	00093783          	ld	a5,0(s2)
    800083b4:	0004b703          	ld	a4,0(s1)
    800083b8:	02078793          	addi	a5,a5,32
    800083bc:	00e79463          	bne	a5,a4,800083c4 <uartputc+0x6c>
    800083c0:	0000006f          	j	800083c0 <uartputc+0x68>
    800083c4:	00001097          	auipc	ra,0x1
    800083c8:	88c080e7          	jalr	-1908(ra) # 80008c50 <pop_on>
    800083cc:	00093783          	ld	a5,0(s2)
    800083d0:	0004b703          	ld	a4,0(s1)
    800083d4:	02078693          	addi	a3,a5,32
    800083d8:	fce688e3          	beq	a3,a4,800083a8 <uartputc+0x50>
    800083dc:	01f77693          	andi	a3,a4,31
    800083e0:	00006597          	auipc	a1,0x6
    800083e4:	0f058593          	addi	a1,a1,240 # 8000e4d0 <uart_tx_buf>
    800083e8:	00d586b3          	add	a3,a1,a3
    800083ec:	00170713          	addi	a4,a4,1
    800083f0:	01368023          	sb	s3,0(a3)
    800083f4:	00e4b023          	sd	a4,0(s1)
    800083f8:	10000637          	lui	a2,0x10000
    800083fc:	02f71063          	bne	a4,a5,8000841c <uartputc+0xc4>
    80008400:	0340006f          	j	80008434 <uartputc+0xdc>
    80008404:	00074703          	lbu	a4,0(a4)
    80008408:	00f93023          	sd	a5,0(s2)
    8000840c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008410:	00093783          	ld	a5,0(s2)
    80008414:	0004b703          	ld	a4,0(s1)
    80008418:	00f70e63          	beq	a4,a5,80008434 <uartputc+0xdc>
    8000841c:	00564683          	lbu	a3,5(a2)
    80008420:	01f7f713          	andi	a4,a5,31
    80008424:	00e58733          	add	a4,a1,a4
    80008428:	0206f693          	andi	a3,a3,32
    8000842c:	00178793          	addi	a5,a5,1
    80008430:	fc069ae3          	bnez	a3,80008404 <uartputc+0xac>
    80008434:	02813083          	ld	ra,40(sp)
    80008438:	02013403          	ld	s0,32(sp)
    8000843c:	01813483          	ld	s1,24(sp)
    80008440:	01013903          	ld	s2,16(sp)
    80008444:	00813983          	ld	s3,8(sp)
    80008448:	03010113          	addi	sp,sp,48
    8000844c:	00008067          	ret

0000000080008450 <uartputc_sync>:
    80008450:	ff010113          	addi	sp,sp,-16
    80008454:	00813423          	sd	s0,8(sp)
    80008458:	01010413          	addi	s0,sp,16
    8000845c:	00005717          	auipc	a4,0x5
    80008460:	8ac72703          	lw	a4,-1876(a4) # 8000cd08 <panicked>
    80008464:	02071663          	bnez	a4,80008490 <uartputc_sync+0x40>
    80008468:	00050793          	mv	a5,a0
    8000846c:	100006b7          	lui	a3,0x10000
    80008470:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008474:	02077713          	andi	a4,a4,32
    80008478:	fe070ce3          	beqz	a4,80008470 <uartputc_sync+0x20>
    8000847c:	0ff7f793          	andi	a5,a5,255
    80008480:	00f68023          	sb	a5,0(a3)
    80008484:	00813403          	ld	s0,8(sp)
    80008488:	01010113          	addi	sp,sp,16
    8000848c:	00008067          	ret
    80008490:	0000006f          	j	80008490 <uartputc_sync+0x40>

0000000080008494 <uartstart>:
    80008494:	ff010113          	addi	sp,sp,-16
    80008498:	00813423          	sd	s0,8(sp)
    8000849c:	01010413          	addi	s0,sp,16
    800084a0:	00005617          	auipc	a2,0x5
    800084a4:	87060613          	addi	a2,a2,-1936 # 8000cd10 <uart_tx_r>
    800084a8:	00005517          	auipc	a0,0x5
    800084ac:	87050513          	addi	a0,a0,-1936 # 8000cd18 <uart_tx_w>
    800084b0:	00063783          	ld	a5,0(a2)
    800084b4:	00053703          	ld	a4,0(a0)
    800084b8:	04f70263          	beq	a4,a5,800084fc <uartstart+0x68>
    800084bc:	100005b7          	lui	a1,0x10000
    800084c0:	00006817          	auipc	a6,0x6
    800084c4:	01080813          	addi	a6,a6,16 # 8000e4d0 <uart_tx_buf>
    800084c8:	01c0006f          	j	800084e4 <uartstart+0x50>
    800084cc:	0006c703          	lbu	a4,0(a3)
    800084d0:	00f63023          	sd	a5,0(a2)
    800084d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800084d8:	00063783          	ld	a5,0(a2)
    800084dc:	00053703          	ld	a4,0(a0)
    800084e0:	00f70e63          	beq	a4,a5,800084fc <uartstart+0x68>
    800084e4:	01f7f713          	andi	a4,a5,31
    800084e8:	00e806b3          	add	a3,a6,a4
    800084ec:	0055c703          	lbu	a4,5(a1)
    800084f0:	00178793          	addi	a5,a5,1
    800084f4:	02077713          	andi	a4,a4,32
    800084f8:	fc071ae3          	bnez	a4,800084cc <uartstart+0x38>
    800084fc:	00813403          	ld	s0,8(sp)
    80008500:	01010113          	addi	sp,sp,16
    80008504:	00008067          	ret

0000000080008508 <uartgetc>:
    80008508:	ff010113          	addi	sp,sp,-16
    8000850c:	00813423          	sd	s0,8(sp)
    80008510:	01010413          	addi	s0,sp,16
    80008514:	10000737          	lui	a4,0x10000
    80008518:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000851c:	0017f793          	andi	a5,a5,1
    80008520:	00078c63          	beqz	a5,80008538 <uartgetc+0x30>
    80008524:	00074503          	lbu	a0,0(a4)
    80008528:	0ff57513          	andi	a0,a0,255
    8000852c:	00813403          	ld	s0,8(sp)
    80008530:	01010113          	addi	sp,sp,16
    80008534:	00008067          	ret
    80008538:	fff00513          	li	a0,-1
    8000853c:	ff1ff06f          	j	8000852c <uartgetc+0x24>

0000000080008540 <uartintr>:
    80008540:	100007b7          	lui	a5,0x10000
    80008544:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008548:	0017f793          	andi	a5,a5,1
    8000854c:	0a078463          	beqz	a5,800085f4 <uartintr+0xb4>
    80008550:	fe010113          	addi	sp,sp,-32
    80008554:	00813823          	sd	s0,16(sp)
    80008558:	00913423          	sd	s1,8(sp)
    8000855c:	00113c23          	sd	ra,24(sp)
    80008560:	02010413          	addi	s0,sp,32
    80008564:	100004b7          	lui	s1,0x10000
    80008568:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000856c:	0ff57513          	andi	a0,a0,255
    80008570:	fffff097          	auipc	ra,0xfffff
    80008574:	534080e7          	jalr	1332(ra) # 80007aa4 <consoleintr>
    80008578:	0054c783          	lbu	a5,5(s1)
    8000857c:	0017f793          	andi	a5,a5,1
    80008580:	fe0794e3          	bnez	a5,80008568 <uartintr+0x28>
    80008584:	00004617          	auipc	a2,0x4
    80008588:	78c60613          	addi	a2,a2,1932 # 8000cd10 <uart_tx_r>
    8000858c:	00004517          	auipc	a0,0x4
    80008590:	78c50513          	addi	a0,a0,1932 # 8000cd18 <uart_tx_w>
    80008594:	00063783          	ld	a5,0(a2)
    80008598:	00053703          	ld	a4,0(a0)
    8000859c:	04f70263          	beq	a4,a5,800085e0 <uartintr+0xa0>
    800085a0:	100005b7          	lui	a1,0x10000
    800085a4:	00006817          	auipc	a6,0x6
    800085a8:	f2c80813          	addi	a6,a6,-212 # 8000e4d0 <uart_tx_buf>
    800085ac:	01c0006f          	j	800085c8 <uartintr+0x88>
    800085b0:	0006c703          	lbu	a4,0(a3)
    800085b4:	00f63023          	sd	a5,0(a2)
    800085b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800085bc:	00063783          	ld	a5,0(a2)
    800085c0:	00053703          	ld	a4,0(a0)
    800085c4:	00f70e63          	beq	a4,a5,800085e0 <uartintr+0xa0>
    800085c8:	01f7f713          	andi	a4,a5,31
    800085cc:	00e806b3          	add	a3,a6,a4
    800085d0:	0055c703          	lbu	a4,5(a1)
    800085d4:	00178793          	addi	a5,a5,1
    800085d8:	02077713          	andi	a4,a4,32
    800085dc:	fc071ae3          	bnez	a4,800085b0 <uartintr+0x70>
    800085e0:	01813083          	ld	ra,24(sp)
    800085e4:	01013403          	ld	s0,16(sp)
    800085e8:	00813483          	ld	s1,8(sp)
    800085ec:	02010113          	addi	sp,sp,32
    800085f0:	00008067          	ret
    800085f4:	00004617          	auipc	a2,0x4
    800085f8:	71c60613          	addi	a2,a2,1820 # 8000cd10 <uart_tx_r>
    800085fc:	00004517          	auipc	a0,0x4
    80008600:	71c50513          	addi	a0,a0,1820 # 8000cd18 <uart_tx_w>
    80008604:	00063783          	ld	a5,0(a2)
    80008608:	00053703          	ld	a4,0(a0)
    8000860c:	04f70263          	beq	a4,a5,80008650 <uartintr+0x110>
    80008610:	100005b7          	lui	a1,0x10000
    80008614:	00006817          	auipc	a6,0x6
    80008618:	ebc80813          	addi	a6,a6,-324 # 8000e4d0 <uart_tx_buf>
    8000861c:	01c0006f          	j	80008638 <uartintr+0xf8>
    80008620:	0006c703          	lbu	a4,0(a3)
    80008624:	00f63023          	sd	a5,0(a2)
    80008628:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000862c:	00063783          	ld	a5,0(a2)
    80008630:	00053703          	ld	a4,0(a0)
    80008634:	02f70063          	beq	a4,a5,80008654 <uartintr+0x114>
    80008638:	01f7f713          	andi	a4,a5,31
    8000863c:	00e806b3          	add	a3,a6,a4
    80008640:	0055c703          	lbu	a4,5(a1)
    80008644:	00178793          	addi	a5,a5,1
    80008648:	02077713          	andi	a4,a4,32
    8000864c:	fc071ae3          	bnez	a4,80008620 <uartintr+0xe0>
    80008650:	00008067          	ret
    80008654:	00008067          	ret

0000000080008658 <kinit>:
    80008658:	fc010113          	addi	sp,sp,-64
    8000865c:	02913423          	sd	s1,40(sp)
    80008660:	fffff7b7          	lui	a5,0xfffff
    80008664:	00007497          	auipc	s1,0x7
    80008668:	e8b48493          	addi	s1,s1,-373 # 8000f4ef <end+0xfff>
    8000866c:	02813823          	sd	s0,48(sp)
    80008670:	01313c23          	sd	s3,24(sp)
    80008674:	00f4f4b3          	and	s1,s1,a5
    80008678:	02113c23          	sd	ra,56(sp)
    8000867c:	03213023          	sd	s2,32(sp)
    80008680:	01413823          	sd	s4,16(sp)
    80008684:	01513423          	sd	s5,8(sp)
    80008688:	04010413          	addi	s0,sp,64
    8000868c:	000017b7          	lui	a5,0x1
    80008690:	01100993          	li	s3,17
    80008694:	00f487b3          	add	a5,s1,a5
    80008698:	01b99993          	slli	s3,s3,0x1b
    8000869c:	06f9e063          	bltu	s3,a5,800086fc <kinit+0xa4>
    800086a0:	00006a97          	auipc	s5,0x6
    800086a4:	e50a8a93          	addi	s5,s5,-432 # 8000e4f0 <end>
    800086a8:	0754ec63          	bltu	s1,s5,80008720 <kinit+0xc8>
    800086ac:	0734fa63          	bgeu	s1,s3,80008720 <kinit+0xc8>
    800086b0:	00088a37          	lui	s4,0x88
    800086b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800086b8:	00004917          	auipc	s2,0x4
    800086bc:	66890913          	addi	s2,s2,1640 # 8000cd20 <kmem>
    800086c0:	00ca1a13          	slli	s4,s4,0xc
    800086c4:	0140006f          	j	800086d8 <kinit+0x80>
    800086c8:	000017b7          	lui	a5,0x1
    800086cc:	00f484b3          	add	s1,s1,a5
    800086d0:	0554e863          	bltu	s1,s5,80008720 <kinit+0xc8>
    800086d4:	0534f663          	bgeu	s1,s3,80008720 <kinit+0xc8>
    800086d8:	00001637          	lui	a2,0x1
    800086dc:	00100593          	li	a1,1
    800086e0:	00048513          	mv	a0,s1
    800086e4:	00000097          	auipc	ra,0x0
    800086e8:	5e4080e7          	jalr	1508(ra) # 80008cc8 <__memset>
    800086ec:	00093783          	ld	a5,0(s2)
    800086f0:	00f4b023          	sd	a5,0(s1)
    800086f4:	00993023          	sd	s1,0(s2)
    800086f8:	fd4498e3          	bne	s1,s4,800086c8 <kinit+0x70>
    800086fc:	03813083          	ld	ra,56(sp)
    80008700:	03013403          	ld	s0,48(sp)
    80008704:	02813483          	ld	s1,40(sp)
    80008708:	02013903          	ld	s2,32(sp)
    8000870c:	01813983          	ld	s3,24(sp)
    80008710:	01013a03          	ld	s4,16(sp)
    80008714:	00813a83          	ld	s5,8(sp)
    80008718:	04010113          	addi	sp,sp,64
    8000871c:	00008067          	ret
    80008720:	00002517          	auipc	a0,0x2
    80008724:	df050513          	addi	a0,a0,-528 # 8000a510 <digits+0x18>
    80008728:	fffff097          	auipc	ra,0xfffff
    8000872c:	4b4080e7          	jalr	1204(ra) # 80007bdc <panic>

0000000080008730 <freerange>:
    80008730:	fc010113          	addi	sp,sp,-64
    80008734:	000017b7          	lui	a5,0x1
    80008738:	02913423          	sd	s1,40(sp)
    8000873c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008740:	009504b3          	add	s1,a0,s1
    80008744:	fffff537          	lui	a0,0xfffff
    80008748:	02813823          	sd	s0,48(sp)
    8000874c:	02113c23          	sd	ra,56(sp)
    80008750:	03213023          	sd	s2,32(sp)
    80008754:	01313c23          	sd	s3,24(sp)
    80008758:	01413823          	sd	s4,16(sp)
    8000875c:	01513423          	sd	s5,8(sp)
    80008760:	01613023          	sd	s6,0(sp)
    80008764:	04010413          	addi	s0,sp,64
    80008768:	00a4f4b3          	and	s1,s1,a0
    8000876c:	00f487b3          	add	a5,s1,a5
    80008770:	06f5e463          	bltu	a1,a5,800087d8 <freerange+0xa8>
    80008774:	00006a97          	auipc	s5,0x6
    80008778:	d7ca8a93          	addi	s5,s5,-644 # 8000e4f0 <end>
    8000877c:	0954e263          	bltu	s1,s5,80008800 <freerange+0xd0>
    80008780:	01100993          	li	s3,17
    80008784:	01b99993          	slli	s3,s3,0x1b
    80008788:	0734fc63          	bgeu	s1,s3,80008800 <freerange+0xd0>
    8000878c:	00058a13          	mv	s4,a1
    80008790:	00004917          	auipc	s2,0x4
    80008794:	59090913          	addi	s2,s2,1424 # 8000cd20 <kmem>
    80008798:	00002b37          	lui	s6,0x2
    8000879c:	0140006f          	j	800087b0 <freerange+0x80>
    800087a0:	000017b7          	lui	a5,0x1
    800087a4:	00f484b3          	add	s1,s1,a5
    800087a8:	0554ec63          	bltu	s1,s5,80008800 <freerange+0xd0>
    800087ac:	0534fa63          	bgeu	s1,s3,80008800 <freerange+0xd0>
    800087b0:	00001637          	lui	a2,0x1
    800087b4:	00100593          	li	a1,1
    800087b8:	00048513          	mv	a0,s1
    800087bc:	00000097          	auipc	ra,0x0
    800087c0:	50c080e7          	jalr	1292(ra) # 80008cc8 <__memset>
    800087c4:	00093703          	ld	a4,0(s2)
    800087c8:	016487b3          	add	a5,s1,s6
    800087cc:	00e4b023          	sd	a4,0(s1)
    800087d0:	00993023          	sd	s1,0(s2)
    800087d4:	fcfa76e3          	bgeu	s4,a5,800087a0 <freerange+0x70>
    800087d8:	03813083          	ld	ra,56(sp)
    800087dc:	03013403          	ld	s0,48(sp)
    800087e0:	02813483          	ld	s1,40(sp)
    800087e4:	02013903          	ld	s2,32(sp)
    800087e8:	01813983          	ld	s3,24(sp)
    800087ec:	01013a03          	ld	s4,16(sp)
    800087f0:	00813a83          	ld	s5,8(sp)
    800087f4:	00013b03          	ld	s6,0(sp)
    800087f8:	04010113          	addi	sp,sp,64
    800087fc:	00008067          	ret
    80008800:	00002517          	auipc	a0,0x2
    80008804:	d1050513          	addi	a0,a0,-752 # 8000a510 <digits+0x18>
    80008808:	fffff097          	auipc	ra,0xfffff
    8000880c:	3d4080e7          	jalr	980(ra) # 80007bdc <panic>

0000000080008810 <kfree>:
    80008810:	fe010113          	addi	sp,sp,-32
    80008814:	00813823          	sd	s0,16(sp)
    80008818:	00113c23          	sd	ra,24(sp)
    8000881c:	00913423          	sd	s1,8(sp)
    80008820:	02010413          	addi	s0,sp,32
    80008824:	03451793          	slli	a5,a0,0x34
    80008828:	04079c63          	bnez	a5,80008880 <kfree+0x70>
    8000882c:	00006797          	auipc	a5,0x6
    80008830:	cc478793          	addi	a5,a5,-828 # 8000e4f0 <end>
    80008834:	00050493          	mv	s1,a0
    80008838:	04f56463          	bltu	a0,a5,80008880 <kfree+0x70>
    8000883c:	01100793          	li	a5,17
    80008840:	01b79793          	slli	a5,a5,0x1b
    80008844:	02f57e63          	bgeu	a0,a5,80008880 <kfree+0x70>
    80008848:	00001637          	lui	a2,0x1
    8000884c:	00100593          	li	a1,1
    80008850:	00000097          	auipc	ra,0x0
    80008854:	478080e7          	jalr	1144(ra) # 80008cc8 <__memset>
    80008858:	00004797          	auipc	a5,0x4
    8000885c:	4c878793          	addi	a5,a5,1224 # 8000cd20 <kmem>
    80008860:	0007b703          	ld	a4,0(a5)
    80008864:	01813083          	ld	ra,24(sp)
    80008868:	01013403          	ld	s0,16(sp)
    8000886c:	00e4b023          	sd	a4,0(s1)
    80008870:	0097b023          	sd	s1,0(a5)
    80008874:	00813483          	ld	s1,8(sp)
    80008878:	02010113          	addi	sp,sp,32
    8000887c:	00008067          	ret
    80008880:	00002517          	auipc	a0,0x2
    80008884:	c9050513          	addi	a0,a0,-880 # 8000a510 <digits+0x18>
    80008888:	fffff097          	auipc	ra,0xfffff
    8000888c:	354080e7          	jalr	852(ra) # 80007bdc <panic>

0000000080008890 <kalloc>:
    80008890:	fe010113          	addi	sp,sp,-32
    80008894:	00813823          	sd	s0,16(sp)
    80008898:	00913423          	sd	s1,8(sp)
    8000889c:	00113c23          	sd	ra,24(sp)
    800088a0:	02010413          	addi	s0,sp,32
    800088a4:	00004797          	auipc	a5,0x4
    800088a8:	47c78793          	addi	a5,a5,1148 # 8000cd20 <kmem>
    800088ac:	0007b483          	ld	s1,0(a5)
    800088b0:	02048063          	beqz	s1,800088d0 <kalloc+0x40>
    800088b4:	0004b703          	ld	a4,0(s1)
    800088b8:	00001637          	lui	a2,0x1
    800088bc:	00500593          	li	a1,5
    800088c0:	00048513          	mv	a0,s1
    800088c4:	00e7b023          	sd	a4,0(a5)
    800088c8:	00000097          	auipc	ra,0x0
    800088cc:	400080e7          	jalr	1024(ra) # 80008cc8 <__memset>
    800088d0:	01813083          	ld	ra,24(sp)
    800088d4:	01013403          	ld	s0,16(sp)
    800088d8:	00048513          	mv	a0,s1
    800088dc:	00813483          	ld	s1,8(sp)
    800088e0:	02010113          	addi	sp,sp,32
    800088e4:	00008067          	ret

00000000800088e8 <initlock>:
    800088e8:	ff010113          	addi	sp,sp,-16
    800088ec:	00813423          	sd	s0,8(sp)
    800088f0:	01010413          	addi	s0,sp,16
    800088f4:	00813403          	ld	s0,8(sp)
    800088f8:	00b53423          	sd	a1,8(a0)
    800088fc:	00052023          	sw	zero,0(a0)
    80008900:	00053823          	sd	zero,16(a0)
    80008904:	01010113          	addi	sp,sp,16
    80008908:	00008067          	ret

000000008000890c <acquire>:
    8000890c:	fe010113          	addi	sp,sp,-32
    80008910:	00813823          	sd	s0,16(sp)
    80008914:	00913423          	sd	s1,8(sp)
    80008918:	00113c23          	sd	ra,24(sp)
    8000891c:	01213023          	sd	s2,0(sp)
    80008920:	02010413          	addi	s0,sp,32
    80008924:	00050493          	mv	s1,a0
    80008928:	10002973          	csrr	s2,sstatus
    8000892c:	100027f3          	csrr	a5,sstatus
    80008930:	ffd7f793          	andi	a5,a5,-3
    80008934:	10079073          	csrw	sstatus,a5
    80008938:	fffff097          	auipc	ra,0xfffff
    8000893c:	8e8080e7          	jalr	-1816(ra) # 80007220 <mycpu>
    80008940:	07852783          	lw	a5,120(a0)
    80008944:	06078e63          	beqz	a5,800089c0 <acquire+0xb4>
    80008948:	fffff097          	auipc	ra,0xfffff
    8000894c:	8d8080e7          	jalr	-1832(ra) # 80007220 <mycpu>
    80008950:	07852783          	lw	a5,120(a0)
    80008954:	0004a703          	lw	a4,0(s1)
    80008958:	0017879b          	addiw	a5,a5,1
    8000895c:	06f52c23          	sw	a5,120(a0)
    80008960:	04071063          	bnez	a4,800089a0 <acquire+0x94>
    80008964:	00100713          	li	a4,1
    80008968:	00070793          	mv	a5,a4
    8000896c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008970:	0007879b          	sext.w	a5,a5
    80008974:	fe079ae3          	bnez	a5,80008968 <acquire+0x5c>
    80008978:	0ff0000f          	fence
    8000897c:	fffff097          	auipc	ra,0xfffff
    80008980:	8a4080e7          	jalr	-1884(ra) # 80007220 <mycpu>
    80008984:	01813083          	ld	ra,24(sp)
    80008988:	01013403          	ld	s0,16(sp)
    8000898c:	00a4b823          	sd	a0,16(s1)
    80008990:	00013903          	ld	s2,0(sp)
    80008994:	00813483          	ld	s1,8(sp)
    80008998:	02010113          	addi	sp,sp,32
    8000899c:	00008067          	ret
    800089a0:	0104b903          	ld	s2,16(s1)
    800089a4:	fffff097          	auipc	ra,0xfffff
    800089a8:	87c080e7          	jalr	-1924(ra) # 80007220 <mycpu>
    800089ac:	faa91ce3          	bne	s2,a0,80008964 <acquire+0x58>
    800089b0:	00002517          	auipc	a0,0x2
    800089b4:	b6850513          	addi	a0,a0,-1176 # 8000a518 <digits+0x20>
    800089b8:	fffff097          	auipc	ra,0xfffff
    800089bc:	224080e7          	jalr	548(ra) # 80007bdc <panic>
    800089c0:	00195913          	srli	s2,s2,0x1
    800089c4:	fffff097          	auipc	ra,0xfffff
    800089c8:	85c080e7          	jalr	-1956(ra) # 80007220 <mycpu>
    800089cc:	00197913          	andi	s2,s2,1
    800089d0:	07252e23          	sw	s2,124(a0)
    800089d4:	f75ff06f          	j	80008948 <acquire+0x3c>

00000000800089d8 <release>:
    800089d8:	fe010113          	addi	sp,sp,-32
    800089dc:	00813823          	sd	s0,16(sp)
    800089e0:	00113c23          	sd	ra,24(sp)
    800089e4:	00913423          	sd	s1,8(sp)
    800089e8:	01213023          	sd	s2,0(sp)
    800089ec:	02010413          	addi	s0,sp,32
    800089f0:	00052783          	lw	a5,0(a0)
    800089f4:	00079a63          	bnez	a5,80008a08 <release+0x30>
    800089f8:	00002517          	auipc	a0,0x2
    800089fc:	b2850513          	addi	a0,a0,-1240 # 8000a520 <digits+0x28>
    80008a00:	fffff097          	auipc	ra,0xfffff
    80008a04:	1dc080e7          	jalr	476(ra) # 80007bdc <panic>
    80008a08:	01053903          	ld	s2,16(a0)
    80008a0c:	00050493          	mv	s1,a0
    80008a10:	fffff097          	auipc	ra,0xfffff
    80008a14:	810080e7          	jalr	-2032(ra) # 80007220 <mycpu>
    80008a18:	fea910e3          	bne	s2,a0,800089f8 <release+0x20>
    80008a1c:	0004b823          	sd	zero,16(s1)
    80008a20:	0ff0000f          	fence
    80008a24:	0f50000f          	fence	iorw,ow
    80008a28:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008a2c:	ffffe097          	auipc	ra,0xffffe
    80008a30:	7f4080e7          	jalr	2036(ra) # 80007220 <mycpu>
    80008a34:	100027f3          	csrr	a5,sstatus
    80008a38:	0027f793          	andi	a5,a5,2
    80008a3c:	04079a63          	bnez	a5,80008a90 <release+0xb8>
    80008a40:	07852783          	lw	a5,120(a0)
    80008a44:	02f05e63          	blez	a5,80008a80 <release+0xa8>
    80008a48:	fff7871b          	addiw	a4,a5,-1
    80008a4c:	06e52c23          	sw	a4,120(a0)
    80008a50:	00071c63          	bnez	a4,80008a68 <release+0x90>
    80008a54:	07c52783          	lw	a5,124(a0)
    80008a58:	00078863          	beqz	a5,80008a68 <release+0x90>
    80008a5c:	100027f3          	csrr	a5,sstatus
    80008a60:	0027e793          	ori	a5,a5,2
    80008a64:	10079073          	csrw	sstatus,a5
    80008a68:	01813083          	ld	ra,24(sp)
    80008a6c:	01013403          	ld	s0,16(sp)
    80008a70:	00813483          	ld	s1,8(sp)
    80008a74:	00013903          	ld	s2,0(sp)
    80008a78:	02010113          	addi	sp,sp,32
    80008a7c:	00008067          	ret
    80008a80:	00002517          	auipc	a0,0x2
    80008a84:	ac050513          	addi	a0,a0,-1344 # 8000a540 <digits+0x48>
    80008a88:	fffff097          	auipc	ra,0xfffff
    80008a8c:	154080e7          	jalr	340(ra) # 80007bdc <panic>
    80008a90:	00002517          	auipc	a0,0x2
    80008a94:	a9850513          	addi	a0,a0,-1384 # 8000a528 <digits+0x30>
    80008a98:	fffff097          	auipc	ra,0xfffff
    80008a9c:	144080e7          	jalr	324(ra) # 80007bdc <panic>

0000000080008aa0 <holding>:
    80008aa0:	00052783          	lw	a5,0(a0)
    80008aa4:	00079663          	bnez	a5,80008ab0 <holding+0x10>
    80008aa8:	00000513          	li	a0,0
    80008aac:	00008067          	ret
    80008ab0:	fe010113          	addi	sp,sp,-32
    80008ab4:	00813823          	sd	s0,16(sp)
    80008ab8:	00913423          	sd	s1,8(sp)
    80008abc:	00113c23          	sd	ra,24(sp)
    80008ac0:	02010413          	addi	s0,sp,32
    80008ac4:	01053483          	ld	s1,16(a0)
    80008ac8:	ffffe097          	auipc	ra,0xffffe
    80008acc:	758080e7          	jalr	1880(ra) # 80007220 <mycpu>
    80008ad0:	01813083          	ld	ra,24(sp)
    80008ad4:	01013403          	ld	s0,16(sp)
    80008ad8:	40a48533          	sub	a0,s1,a0
    80008adc:	00153513          	seqz	a0,a0
    80008ae0:	00813483          	ld	s1,8(sp)
    80008ae4:	02010113          	addi	sp,sp,32
    80008ae8:	00008067          	ret

0000000080008aec <push_off>:
    80008aec:	fe010113          	addi	sp,sp,-32
    80008af0:	00813823          	sd	s0,16(sp)
    80008af4:	00113c23          	sd	ra,24(sp)
    80008af8:	00913423          	sd	s1,8(sp)
    80008afc:	02010413          	addi	s0,sp,32
    80008b00:	100024f3          	csrr	s1,sstatus
    80008b04:	100027f3          	csrr	a5,sstatus
    80008b08:	ffd7f793          	andi	a5,a5,-3
    80008b0c:	10079073          	csrw	sstatus,a5
    80008b10:	ffffe097          	auipc	ra,0xffffe
    80008b14:	710080e7          	jalr	1808(ra) # 80007220 <mycpu>
    80008b18:	07852783          	lw	a5,120(a0)
    80008b1c:	02078663          	beqz	a5,80008b48 <push_off+0x5c>
    80008b20:	ffffe097          	auipc	ra,0xffffe
    80008b24:	700080e7          	jalr	1792(ra) # 80007220 <mycpu>
    80008b28:	07852783          	lw	a5,120(a0)
    80008b2c:	01813083          	ld	ra,24(sp)
    80008b30:	01013403          	ld	s0,16(sp)
    80008b34:	0017879b          	addiw	a5,a5,1
    80008b38:	06f52c23          	sw	a5,120(a0)
    80008b3c:	00813483          	ld	s1,8(sp)
    80008b40:	02010113          	addi	sp,sp,32
    80008b44:	00008067          	ret
    80008b48:	0014d493          	srli	s1,s1,0x1
    80008b4c:	ffffe097          	auipc	ra,0xffffe
    80008b50:	6d4080e7          	jalr	1748(ra) # 80007220 <mycpu>
    80008b54:	0014f493          	andi	s1,s1,1
    80008b58:	06952e23          	sw	s1,124(a0)
    80008b5c:	fc5ff06f          	j	80008b20 <push_off+0x34>

0000000080008b60 <pop_off>:
    80008b60:	ff010113          	addi	sp,sp,-16
    80008b64:	00813023          	sd	s0,0(sp)
    80008b68:	00113423          	sd	ra,8(sp)
    80008b6c:	01010413          	addi	s0,sp,16
    80008b70:	ffffe097          	auipc	ra,0xffffe
    80008b74:	6b0080e7          	jalr	1712(ra) # 80007220 <mycpu>
    80008b78:	100027f3          	csrr	a5,sstatus
    80008b7c:	0027f793          	andi	a5,a5,2
    80008b80:	04079663          	bnez	a5,80008bcc <pop_off+0x6c>
    80008b84:	07852783          	lw	a5,120(a0)
    80008b88:	02f05a63          	blez	a5,80008bbc <pop_off+0x5c>
    80008b8c:	fff7871b          	addiw	a4,a5,-1
    80008b90:	06e52c23          	sw	a4,120(a0)
    80008b94:	00071c63          	bnez	a4,80008bac <pop_off+0x4c>
    80008b98:	07c52783          	lw	a5,124(a0)
    80008b9c:	00078863          	beqz	a5,80008bac <pop_off+0x4c>
    80008ba0:	100027f3          	csrr	a5,sstatus
    80008ba4:	0027e793          	ori	a5,a5,2
    80008ba8:	10079073          	csrw	sstatus,a5
    80008bac:	00813083          	ld	ra,8(sp)
    80008bb0:	00013403          	ld	s0,0(sp)
    80008bb4:	01010113          	addi	sp,sp,16
    80008bb8:	00008067          	ret
    80008bbc:	00002517          	auipc	a0,0x2
    80008bc0:	98450513          	addi	a0,a0,-1660 # 8000a540 <digits+0x48>
    80008bc4:	fffff097          	auipc	ra,0xfffff
    80008bc8:	018080e7          	jalr	24(ra) # 80007bdc <panic>
    80008bcc:	00002517          	auipc	a0,0x2
    80008bd0:	95c50513          	addi	a0,a0,-1700 # 8000a528 <digits+0x30>
    80008bd4:	fffff097          	auipc	ra,0xfffff
    80008bd8:	008080e7          	jalr	8(ra) # 80007bdc <panic>

0000000080008bdc <push_on>:
    80008bdc:	fe010113          	addi	sp,sp,-32
    80008be0:	00813823          	sd	s0,16(sp)
    80008be4:	00113c23          	sd	ra,24(sp)
    80008be8:	00913423          	sd	s1,8(sp)
    80008bec:	02010413          	addi	s0,sp,32
    80008bf0:	100024f3          	csrr	s1,sstatus
    80008bf4:	100027f3          	csrr	a5,sstatus
    80008bf8:	0027e793          	ori	a5,a5,2
    80008bfc:	10079073          	csrw	sstatus,a5
    80008c00:	ffffe097          	auipc	ra,0xffffe
    80008c04:	620080e7          	jalr	1568(ra) # 80007220 <mycpu>
    80008c08:	07852783          	lw	a5,120(a0)
    80008c0c:	02078663          	beqz	a5,80008c38 <push_on+0x5c>
    80008c10:	ffffe097          	auipc	ra,0xffffe
    80008c14:	610080e7          	jalr	1552(ra) # 80007220 <mycpu>
    80008c18:	07852783          	lw	a5,120(a0)
    80008c1c:	01813083          	ld	ra,24(sp)
    80008c20:	01013403          	ld	s0,16(sp)
    80008c24:	0017879b          	addiw	a5,a5,1
    80008c28:	06f52c23          	sw	a5,120(a0)
    80008c2c:	00813483          	ld	s1,8(sp)
    80008c30:	02010113          	addi	sp,sp,32
    80008c34:	00008067          	ret
    80008c38:	0014d493          	srli	s1,s1,0x1
    80008c3c:	ffffe097          	auipc	ra,0xffffe
    80008c40:	5e4080e7          	jalr	1508(ra) # 80007220 <mycpu>
    80008c44:	0014f493          	andi	s1,s1,1
    80008c48:	06952e23          	sw	s1,124(a0)
    80008c4c:	fc5ff06f          	j	80008c10 <push_on+0x34>

0000000080008c50 <pop_on>:
    80008c50:	ff010113          	addi	sp,sp,-16
    80008c54:	00813023          	sd	s0,0(sp)
    80008c58:	00113423          	sd	ra,8(sp)
    80008c5c:	01010413          	addi	s0,sp,16
    80008c60:	ffffe097          	auipc	ra,0xffffe
    80008c64:	5c0080e7          	jalr	1472(ra) # 80007220 <mycpu>
    80008c68:	100027f3          	csrr	a5,sstatus
    80008c6c:	0027f793          	andi	a5,a5,2
    80008c70:	04078463          	beqz	a5,80008cb8 <pop_on+0x68>
    80008c74:	07852783          	lw	a5,120(a0)
    80008c78:	02f05863          	blez	a5,80008ca8 <pop_on+0x58>
    80008c7c:	fff7879b          	addiw	a5,a5,-1
    80008c80:	06f52c23          	sw	a5,120(a0)
    80008c84:	07853783          	ld	a5,120(a0)
    80008c88:	00079863          	bnez	a5,80008c98 <pop_on+0x48>
    80008c8c:	100027f3          	csrr	a5,sstatus
    80008c90:	ffd7f793          	andi	a5,a5,-3
    80008c94:	10079073          	csrw	sstatus,a5
    80008c98:	00813083          	ld	ra,8(sp)
    80008c9c:	00013403          	ld	s0,0(sp)
    80008ca0:	01010113          	addi	sp,sp,16
    80008ca4:	00008067          	ret
    80008ca8:	00002517          	auipc	a0,0x2
    80008cac:	8c050513          	addi	a0,a0,-1856 # 8000a568 <digits+0x70>
    80008cb0:	fffff097          	auipc	ra,0xfffff
    80008cb4:	f2c080e7          	jalr	-212(ra) # 80007bdc <panic>
    80008cb8:	00002517          	auipc	a0,0x2
    80008cbc:	89050513          	addi	a0,a0,-1904 # 8000a548 <digits+0x50>
    80008cc0:	fffff097          	auipc	ra,0xfffff
    80008cc4:	f1c080e7          	jalr	-228(ra) # 80007bdc <panic>

0000000080008cc8 <__memset>:
    80008cc8:	ff010113          	addi	sp,sp,-16
    80008ccc:	00813423          	sd	s0,8(sp)
    80008cd0:	01010413          	addi	s0,sp,16
    80008cd4:	1a060e63          	beqz	a2,80008e90 <__memset+0x1c8>
    80008cd8:	40a007b3          	neg	a5,a0
    80008cdc:	0077f793          	andi	a5,a5,7
    80008ce0:	00778693          	addi	a3,a5,7
    80008ce4:	00b00813          	li	a6,11
    80008ce8:	0ff5f593          	andi	a1,a1,255
    80008cec:	fff6071b          	addiw	a4,a2,-1
    80008cf0:	1b06e663          	bltu	a3,a6,80008e9c <__memset+0x1d4>
    80008cf4:	1cd76463          	bltu	a4,a3,80008ebc <__memset+0x1f4>
    80008cf8:	1a078e63          	beqz	a5,80008eb4 <__memset+0x1ec>
    80008cfc:	00b50023          	sb	a1,0(a0)
    80008d00:	00100713          	li	a4,1
    80008d04:	1ae78463          	beq	a5,a4,80008eac <__memset+0x1e4>
    80008d08:	00b500a3          	sb	a1,1(a0)
    80008d0c:	00200713          	li	a4,2
    80008d10:	1ae78a63          	beq	a5,a4,80008ec4 <__memset+0x1fc>
    80008d14:	00b50123          	sb	a1,2(a0)
    80008d18:	00300713          	li	a4,3
    80008d1c:	18e78463          	beq	a5,a4,80008ea4 <__memset+0x1dc>
    80008d20:	00b501a3          	sb	a1,3(a0)
    80008d24:	00400713          	li	a4,4
    80008d28:	1ae78263          	beq	a5,a4,80008ecc <__memset+0x204>
    80008d2c:	00b50223          	sb	a1,4(a0)
    80008d30:	00500713          	li	a4,5
    80008d34:	1ae78063          	beq	a5,a4,80008ed4 <__memset+0x20c>
    80008d38:	00b502a3          	sb	a1,5(a0)
    80008d3c:	00700713          	li	a4,7
    80008d40:	18e79e63          	bne	a5,a4,80008edc <__memset+0x214>
    80008d44:	00b50323          	sb	a1,6(a0)
    80008d48:	00700e93          	li	t4,7
    80008d4c:	00859713          	slli	a4,a1,0x8
    80008d50:	00e5e733          	or	a4,a1,a4
    80008d54:	01059e13          	slli	t3,a1,0x10
    80008d58:	01c76e33          	or	t3,a4,t3
    80008d5c:	01859313          	slli	t1,a1,0x18
    80008d60:	006e6333          	or	t1,t3,t1
    80008d64:	02059893          	slli	a7,a1,0x20
    80008d68:	40f60e3b          	subw	t3,a2,a5
    80008d6c:	011368b3          	or	a7,t1,a7
    80008d70:	02859813          	slli	a6,a1,0x28
    80008d74:	0108e833          	or	a6,a7,a6
    80008d78:	03059693          	slli	a3,a1,0x30
    80008d7c:	003e589b          	srliw	a7,t3,0x3
    80008d80:	00d866b3          	or	a3,a6,a3
    80008d84:	03859713          	slli	a4,a1,0x38
    80008d88:	00389813          	slli	a6,a7,0x3
    80008d8c:	00f507b3          	add	a5,a0,a5
    80008d90:	00e6e733          	or	a4,a3,a4
    80008d94:	000e089b          	sext.w	a7,t3
    80008d98:	00f806b3          	add	a3,a6,a5
    80008d9c:	00e7b023          	sd	a4,0(a5)
    80008da0:	00878793          	addi	a5,a5,8
    80008da4:	fed79ce3          	bne	a5,a3,80008d9c <__memset+0xd4>
    80008da8:	ff8e7793          	andi	a5,t3,-8
    80008dac:	0007871b          	sext.w	a4,a5
    80008db0:	01d787bb          	addw	a5,a5,t4
    80008db4:	0ce88e63          	beq	a7,a4,80008e90 <__memset+0x1c8>
    80008db8:	00f50733          	add	a4,a0,a5
    80008dbc:	00b70023          	sb	a1,0(a4)
    80008dc0:	0017871b          	addiw	a4,a5,1
    80008dc4:	0cc77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008dc8:	00e50733          	add	a4,a0,a4
    80008dcc:	00b70023          	sb	a1,0(a4)
    80008dd0:	0027871b          	addiw	a4,a5,2
    80008dd4:	0ac77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008dd8:	00e50733          	add	a4,a0,a4
    80008ddc:	00b70023          	sb	a1,0(a4)
    80008de0:	0037871b          	addiw	a4,a5,3
    80008de4:	0ac77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008de8:	00e50733          	add	a4,a0,a4
    80008dec:	00b70023          	sb	a1,0(a4)
    80008df0:	0047871b          	addiw	a4,a5,4
    80008df4:	08c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008df8:	00e50733          	add	a4,a0,a4
    80008dfc:	00b70023          	sb	a1,0(a4)
    80008e00:	0057871b          	addiw	a4,a5,5
    80008e04:	08c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e08:	00e50733          	add	a4,a0,a4
    80008e0c:	00b70023          	sb	a1,0(a4)
    80008e10:	0067871b          	addiw	a4,a5,6
    80008e14:	06c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e18:	00e50733          	add	a4,a0,a4
    80008e1c:	00b70023          	sb	a1,0(a4)
    80008e20:	0077871b          	addiw	a4,a5,7
    80008e24:	06c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e28:	00e50733          	add	a4,a0,a4
    80008e2c:	00b70023          	sb	a1,0(a4)
    80008e30:	0087871b          	addiw	a4,a5,8
    80008e34:	04c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e38:	00e50733          	add	a4,a0,a4
    80008e3c:	00b70023          	sb	a1,0(a4)
    80008e40:	0097871b          	addiw	a4,a5,9
    80008e44:	04c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00b70023          	sb	a1,0(a4)
    80008e50:	00a7871b          	addiw	a4,a5,10
    80008e54:	02c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e58:	00e50733          	add	a4,a0,a4
    80008e5c:	00b70023          	sb	a1,0(a4)
    80008e60:	00b7871b          	addiw	a4,a5,11
    80008e64:	02c77663          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e68:	00e50733          	add	a4,a0,a4
    80008e6c:	00b70023          	sb	a1,0(a4)
    80008e70:	00c7871b          	addiw	a4,a5,12
    80008e74:	00c77e63          	bgeu	a4,a2,80008e90 <__memset+0x1c8>
    80008e78:	00e50733          	add	a4,a0,a4
    80008e7c:	00b70023          	sb	a1,0(a4)
    80008e80:	00d7879b          	addiw	a5,a5,13
    80008e84:	00c7f663          	bgeu	a5,a2,80008e90 <__memset+0x1c8>
    80008e88:	00f507b3          	add	a5,a0,a5
    80008e8c:	00b78023          	sb	a1,0(a5)
    80008e90:	00813403          	ld	s0,8(sp)
    80008e94:	01010113          	addi	sp,sp,16
    80008e98:	00008067          	ret
    80008e9c:	00b00693          	li	a3,11
    80008ea0:	e55ff06f          	j	80008cf4 <__memset+0x2c>
    80008ea4:	00300e93          	li	t4,3
    80008ea8:	ea5ff06f          	j	80008d4c <__memset+0x84>
    80008eac:	00100e93          	li	t4,1
    80008eb0:	e9dff06f          	j	80008d4c <__memset+0x84>
    80008eb4:	00000e93          	li	t4,0
    80008eb8:	e95ff06f          	j	80008d4c <__memset+0x84>
    80008ebc:	00000793          	li	a5,0
    80008ec0:	ef9ff06f          	j	80008db8 <__memset+0xf0>
    80008ec4:	00200e93          	li	t4,2
    80008ec8:	e85ff06f          	j	80008d4c <__memset+0x84>
    80008ecc:	00400e93          	li	t4,4
    80008ed0:	e7dff06f          	j	80008d4c <__memset+0x84>
    80008ed4:	00500e93          	li	t4,5
    80008ed8:	e75ff06f          	j	80008d4c <__memset+0x84>
    80008edc:	00600e93          	li	t4,6
    80008ee0:	e6dff06f          	j	80008d4c <__memset+0x84>

0000000080008ee4 <__memmove>:
    80008ee4:	ff010113          	addi	sp,sp,-16
    80008ee8:	00813423          	sd	s0,8(sp)
    80008eec:	01010413          	addi	s0,sp,16
    80008ef0:	0e060863          	beqz	a2,80008fe0 <__memmove+0xfc>
    80008ef4:	fff6069b          	addiw	a3,a2,-1
    80008ef8:	0006881b          	sext.w	a6,a3
    80008efc:	0ea5e863          	bltu	a1,a0,80008fec <__memmove+0x108>
    80008f00:	00758713          	addi	a4,a1,7
    80008f04:	00a5e7b3          	or	a5,a1,a0
    80008f08:	40a70733          	sub	a4,a4,a0
    80008f0c:	0077f793          	andi	a5,a5,7
    80008f10:	00f73713          	sltiu	a4,a4,15
    80008f14:	00174713          	xori	a4,a4,1
    80008f18:	0017b793          	seqz	a5,a5
    80008f1c:	00e7f7b3          	and	a5,a5,a4
    80008f20:	10078863          	beqz	a5,80009030 <__memmove+0x14c>
    80008f24:	00900793          	li	a5,9
    80008f28:	1107f463          	bgeu	a5,a6,80009030 <__memmove+0x14c>
    80008f2c:	0036581b          	srliw	a6,a2,0x3
    80008f30:	fff8081b          	addiw	a6,a6,-1
    80008f34:	02081813          	slli	a6,a6,0x20
    80008f38:	01d85893          	srli	a7,a6,0x1d
    80008f3c:	00858813          	addi	a6,a1,8
    80008f40:	00058793          	mv	a5,a1
    80008f44:	00050713          	mv	a4,a0
    80008f48:	01088833          	add	a6,a7,a6
    80008f4c:	0007b883          	ld	a7,0(a5)
    80008f50:	00878793          	addi	a5,a5,8
    80008f54:	00870713          	addi	a4,a4,8
    80008f58:	ff173c23          	sd	a7,-8(a4)
    80008f5c:	ff0798e3          	bne	a5,a6,80008f4c <__memmove+0x68>
    80008f60:	ff867713          	andi	a4,a2,-8
    80008f64:	02071793          	slli	a5,a4,0x20
    80008f68:	0207d793          	srli	a5,a5,0x20
    80008f6c:	00f585b3          	add	a1,a1,a5
    80008f70:	40e686bb          	subw	a3,a3,a4
    80008f74:	00f507b3          	add	a5,a0,a5
    80008f78:	06e60463          	beq	a2,a4,80008fe0 <__memmove+0xfc>
    80008f7c:	0005c703          	lbu	a4,0(a1)
    80008f80:	00e78023          	sb	a4,0(a5)
    80008f84:	04068e63          	beqz	a3,80008fe0 <__memmove+0xfc>
    80008f88:	0015c603          	lbu	a2,1(a1)
    80008f8c:	00100713          	li	a4,1
    80008f90:	00c780a3          	sb	a2,1(a5)
    80008f94:	04e68663          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008f98:	0025c603          	lbu	a2,2(a1)
    80008f9c:	00200713          	li	a4,2
    80008fa0:	00c78123          	sb	a2,2(a5)
    80008fa4:	02e68e63          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fa8:	0035c603          	lbu	a2,3(a1)
    80008fac:	00300713          	li	a4,3
    80008fb0:	00c781a3          	sb	a2,3(a5)
    80008fb4:	02e68663          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fb8:	0045c603          	lbu	a2,4(a1)
    80008fbc:	00400713          	li	a4,4
    80008fc0:	00c78223          	sb	a2,4(a5)
    80008fc4:	00e68e63          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fc8:	0055c603          	lbu	a2,5(a1)
    80008fcc:	00500713          	li	a4,5
    80008fd0:	00c782a3          	sb	a2,5(a5)
    80008fd4:	00e68663          	beq	a3,a4,80008fe0 <__memmove+0xfc>
    80008fd8:	0065c703          	lbu	a4,6(a1)
    80008fdc:	00e78323          	sb	a4,6(a5)
    80008fe0:	00813403          	ld	s0,8(sp)
    80008fe4:	01010113          	addi	sp,sp,16
    80008fe8:	00008067          	ret
    80008fec:	02061713          	slli	a4,a2,0x20
    80008ff0:	02075713          	srli	a4,a4,0x20
    80008ff4:	00e587b3          	add	a5,a1,a4
    80008ff8:	f0f574e3          	bgeu	a0,a5,80008f00 <__memmove+0x1c>
    80008ffc:	02069613          	slli	a2,a3,0x20
    80009000:	02065613          	srli	a2,a2,0x20
    80009004:	fff64613          	not	a2,a2
    80009008:	00e50733          	add	a4,a0,a4
    8000900c:	00c78633          	add	a2,a5,a2
    80009010:	fff7c683          	lbu	a3,-1(a5)
    80009014:	fff78793          	addi	a5,a5,-1
    80009018:	fff70713          	addi	a4,a4,-1
    8000901c:	00d70023          	sb	a3,0(a4)
    80009020:	fec798e3          	bne	a5,a2,80009010 <__memmove+0x12c>
    80009024:	00813403          	ld	s0,8(sp)
    80009028:	01010113          	addi	sp,sp,16
    8000902c:	00008067          	ret
    80009030:	02069713          	slli	a4,a3,0x20
    80009034:	02075713          	srli	a4,a4,0x20
    80009038:	00170713          	addi	a4,a4,1
    8000903c:	00e50733          	add	a4,a0,a4
    80009040:	00050793          	mv	a5,a0
    80009044:	0005c683          	lbu	a3,0(a1)
    80009048:	00178793          	addi	a5,a5,1
    8000904c:	00158593          	addi	a1,a1,1
    80009050:	fed78fa3          	sb	a3,-1(a5)
    80009054:	fee798e3          	bne	a5,a4,80009044 <__memmove+0x160>
    80009058:	f89ff06f          	j	80008fe0 <__memmove+0xfc>

000000008000905c <__putc>:
    8000905c:	fe010113          	addi	sp,sp,-32
    80009060:	00813823          	sd	s0,16(sp)
    80009064:	00113c23          	sd	ra,24(sp)
    80009068:	02010413          	addi	s0,sp,32
    8000906c:	00050793          	mv	a5,a0
    80009070:	fef40593          	addi	a1,s0,-17
    80009074:	00100613          	li	a2,1
    80009078:	00000513          	li	a0,0
    8000907c:	fef407a3          	sb	a5,-17(s0)
    80009080:	fffff097          	auipc	ra,0xfffff
    80009084:	b3c080e7          	jalr	-1220(ra) # 80007bbc <console_write>
    80009088:	01813083          	ld	ra,24(sp)
    8000908c:	01013403          	ld	s0,16(sp)
    80009090:	02010113          	addi	sp,sp,32
    80009094:	00008067          	ret

0000000080009098 <__getc>:
    80009098:	fe010113          	addi	sp,sp,-32
    8000909c:	00813823          	sd	s0,16(sp)
    800090a0:	00113c23          	sd	ra,24(sp)
    800090a4:	02010413          	addi	s0,sp,32
    800090a8:	fe840593          	addi	a1,s0,-24
    800090ac:	00100613          	li	a2,1
    800090b0:	00000513          	li	a0,0
    800090b4:	fffff097          	auipc	ra,0xfffff
    800090b8:	ae8080e7          	jalr	-1304(ra) # 80007b9c <console_read>
    800090bc:	fe844503          	lbu	a0,-24(s0)
    800090c0:	01813083          	ld	ra,24(sp)
    800090c4:	01013403          	ld	s0,16(sp)
    800090c8:	02010113          	addi	sp,sp,32
    800090cc:	00008067          	ret

00000000800090d0 <console_handler>:
    800090d0:	fe010113          	addi	sp,sp,-32
    800090d4:	00813823          	sd	s0,16(sp)
    800090d8:	00113c23          	sd	ra,24(sp)
    800090dc:	00913423          	sd	s1,8(sp)
    800090e0:	02010413          	addi	s0,sp,32
    800090e4:	14202773          	csrr	a4,scause
    800090e8:	100027f3          	csrr	a5,sstatus
    800090ec:	0027f793          	andi	a5,a5,2
    800090f0:	06079e63          	bnez	a5,8000916c <console_handler+0x9c>
    800090f4:	00074c63          	bltz	a4,8000910c <console_handler+0x3c>
    800090f8:	01813083          	ld	ra,24(sp)
    800090fc:	01013403          	ld	s0,16(sp)
    80009100:	00813483          	ld	s1,8(sp)
    80009104:	02010113          	addi	sp,sp,32
    80009108:	00008067          	ret
    8000910c:	0ff77713          	andi	a4,a4,255
    80009110:	00900793          	li	a5,9
    80009114:	fef712e3          	bne	a4,a5,800090f8 <console_handler+0x28>
    80009118:	ffffe097          	auipc	ra,0xffffe
    8000911c:	6dc080e7          	jalr	1756(ra) # 800077f4 <plic_claim>
    80009120:	00a00793          	li	a5,10
    80009124:	00050493          	mv	s1,a0
    80009128:	02f50c63          	beq	a0,a5,80009160 <console_handler+0x90>
    8000912c:	fc0506e3          	beqz	a0,800090f8 <console_handler+0x28>
    80009130:	00050593          	mv	a1,a0
    80009134:	00001517          	auipc	a0,0x1
    80009138:	33c50513          	addi	a0,a0,828 # 8000a470 <CONSOLE_STATUS+0x460>
    8000913c:	fffff097          	auipc	ra,0xfffff
    80009140:	afc080e7          	jalr	-1284(ra) # 80007c38 <__printf>
    80009144:	01013403          	ld	s0,16(sp)
    80009148:	01813083          	ld	ra,24(sp)
    8000914c:	00048513          	mv	a0,s1
    80009150:	00813483          	ld	s1,8(sp)
    80009154:	02010113          	addi	sp,sp,32
    80009158:	ffffe317          	auipc	t1,0xffffe
    8000915c:	6d430067          	jr	1748(t1) # 8000782c <plic_complete>
    80009160:	fffff097          	auipc	ra,0xfffff
    80009164:	3e0080e7          	jalr	992(ra) # 80008540 <uartintr>
    80009168:	fddff06f          	j	80009144 <console_handler+0x74>
    8000916c:	00001517          	auipc	a0,0x1
    80009170:	40450513          	addi	a0,a0,1028 # 8000a570 <digits+0x78>
    80009174:	fffff097          	auipc	ra,0xfffff
    80009178:	a68080e7          	jalr	-1432(ra) # 80007bdc <panic>
	...
