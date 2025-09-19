
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	d3813103          	ld	sp,-712(sp) # 8000cd38 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	148070ef          	jal	ra,80007164 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <handle_interrupt>:
.global putc_trap
.global getc_trap
.type context_switch, @function

handle_interrupt:
            mv t0, a0                     # t0 = kod prekida
    80001000:	00050293          	mv	t0,a0
            csrw sscratch, ra
    80001004:	14009073          	csrw	sscratch,ra
            # Ubaci running thread context u a1
            call getRunningThreadContext
    80001008:	151010ef          	jal	ra,80002958 <getRunningThreadContext>
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
    80001098:	034020ef          	jal	ra,800030cc <interrupt>
        	mv t0, a0                     # t0 = kod prekida
    8000109c:	00050293          	mv	t0,a0

            # Ubaci running thread context u a1
            call getRunningThreadContext
    800010a0:	0b9010ef          	jal	ra,80002958 <getRunningThreadContext>
            mv a1, a0                     # a1 = context
    800010a4:	00050593          	mv	a1,a0

            # Vrati a0 nazad
            mv a0, t0
    800010a8:	00028513          	mv	a0,t0


            ld sp, 24(a1)
    800010ac:	0185b103          	ld	sp,24(a1)
            ld ra, 0(sp)
    800010b0:	00013083          	ld	ra,0(sp)


            ld s0, 8(sp)
    800010b4:	00813403          	ld	s0,8(sp)
            ld s1, 16(sp)
    800010b8:	01013483          	ld	s1,16(sp)
            ld s2, 24(sp)
    800010bc:	01813903          	ld	s2,24(sp)
            ld s3, 32(sp)
    800010c0:	02013983          	ld	s3,32(sp)
            ld s4, 40(sp)
    800010c4:	02813a03          	ld	s4,40(sp)
            ld s5, 48(sp)
    800010c8:	03013a83          	ld	s5,48(sp)
            ld s6, 56(sp)
    800010cc:	03813b03          	ld	s6,56(sp)
            ld s7, 64(sp)
    800010d0:	04013b83          	ld	s7,64(sp)
            ld s8, 72(sp)
    800010d4:	04813c03          	ld	s8,72(sp)
            ld s9, 80(sp)
    800010d8:	05013c83          	ld	s9,80(sp)
            ld s10, 88(sp)
    800010dc:	05813d03          	ld	s10,88(sp)
            ld s11, 96(sp)
    800010e0:	06013d83          	ld	s11,96(sp)

            ld a2, 112(sp)
    800010e4:	07013603          	ld	a2,112(sp)
            ld a3, 120(sp)
    800010e8:	07813683          	ld	a3,120(sp)
            ld a4, 128(sp)
    800010ec:	08013703          	ld	a4,128(sp)
            ld a5, 136(sp)
    800010f0:	08813783          	ld	a5,136(sp)
            ld a6, 144(sp)
    800010f4:	09013803          	ld	a6,144(sp)
            ld a7, 152(sp)
    800010f8:	09813883          	ld	a7,152(sp)
            ld t0, 160(sp)
    800010fc:	0a013283          	ld	t0,160(sp)
            ld t1, 168(sp)
    80001100:	0a813303          	ld	t1,168(sp)
            ld t2, 176(sp)
    80001104:	0b013383          	ld	t2,176(sp)
            ld t3, 184(sp)
    80001108:	0b813e03          	ld	t3,184(sp)
            ld t4, 192(sp)
    8000110c:	0c013e83          	ld	t4,192(sp)
            ld t5, 200(sp)
    80001110:	0c813f03          	ld	t5,200(sp)
            ld t6, 208(sp)
    80001114:	0d013f83          	ld	t6,208(sp)
            ld gp, 216(sp)
    80001118:	0d813183          	ld	gp,216(sp)
            ld tp, 224(sp)
    8000111c:	0e013203          	ld	tp,224(sp)


            ld a1, 104(sp)
    80001120:	06813583          	ld	a1,104(sp)

        	addi sp, sp, 240
    80001124:	0f010113          	addi	sp,sp,240
        	sret
    80001128:	10200073          	sret

000000008000112c <restore_context_kernel_mode>:




restore_context_kernel_mode:
     ld sp, 24(a0)
    8000112c:	01853103          	ld	sp,24(a0) # 1018 <_entry-0x7fffefe8>
                 ld ra, 0(sp)
    80001130:	00013083          	ld	ra,0(sp)


                 ld s0, 8(sp)
    80001134:	00813403          	ld	s0,8(sp)
                 ld s1, 16(sp)
    80001138:	01013483          	ld	s1,16(sp)
                 ld s2, 24(sp)
    8000113c:	01813903          	ld	s2,24(sp)
                 ld s3, 32(sp)
    80001140:	02013983          	ld	s3,32(sp)
                 ld s4, 40(sp)
    80001144:	02813a03          	ld	s4,40(sp)
                 ld s5, 48(sp)
    80001148:	03013a83          	ld	s5,48(sp)
                 ld s6, 56(sp)
    8000114c:	03813b03          	ld	s6,56(sp)
                 ld s7, 64(sp)
    80001150:	04013b83          	ld	s7,64(sp)
                 ld s8, 72(sp)
    80001154:	04813c03          	ld	s8,72(sp)
                 ld s9, 80(sp)
    80001158:	05013c83          	ld	s9,80(sp)
                 ld s10, 88(sp)
    8000115c:	05813d03          	ld	s10,88(sp)
                 ld s11, 96(sp)
    80001160:	06013d83          	ld	s11,96(sp)

                 ld a2, 112(sp)
    80001164:	07013603          	ld	a2,112(sp)
                 ld a3, 120(sp)
    80001168:	07813683          	ld	a3,120(sp)
                 ld a4, 128(sp)
    8000116c:	08013703          	ld	a4,128(sp)
                 ld a5, 136(sp)
    80001170:	08813783          	ld	a5,136(sp)
                 ld a6, 144(sp)
    80001174:	09013803          	ld	a6,144(sp)
                 ld a7, 152(sp)
    80001178:	09813883          	ld	a7,152(sp)
                 ld t0, 160(sp)
    8000117c:	0a013283          	ld	t0,160(sp)
                 ld t1, 168(sp)
    80001180:	0a813303          	ld	t1,168(sp)
                 ld t2, 176(sp)
    80001184:	0b013383          	ld	t2,176(sp)
                 ld t3, 184(sp)
    80001188:	0b813e03          	ld	t3,184(sp)
                 ld t4, 192(sp)
    8000118c:	0c013e83          	ld	t4,192(sp)
                 ld t5, 200(sp)
    80001190:	0c813f03          	ld	t5,200(sp)
                 ld t6, 208(sp)
    80001194:	0d013f83          	ld	t6,208(sp)
                 ld gp, 216(sp)
    80001198:	0d813183          	ld	gp,216(sp)
                 ld tp, 224(sp)
    8000119c:	0e013203          	ld	tp,224(sp)


                 ld a1, 104(sp)
    800011a0:	06813583          	ld	a1,104(sp)

             	addi sp, sp, 240
    800011a4:	0f010113          	addi	sp,sp,240
             	sret
    800011a8:	10200073          	sret

00000000800011ac <mem_alloc_trap>:


mem_alloc_trap:
    mv a2, a1
    800011ac:	00058613          	mv	a2,a1
    mv a1, a0
    800011b0:	00050593          	mv	a1,a0
    li a0, 0x01
    800011b4:	00100513          	li	a0,1
    ecall
    800011b8:	00000073          	ecall
    ret
    800011bc:	00008067          	ret

00000000800011c0 <mem_free_trap>:
mem_free_trap:
    mv a2, a1
    800011c0:	00058613          	mv	a2,a1
    mv a1, a0
    800011c4:	00050593          	mv	a1,a0
    li a0, 0x02
    800011c8:	00200513          	li	a0,2
    ecall
    800011cc:	00000073          	ecall
    ret
    800011d0:	00008067          	ret

00000000800011d4 <thread_exit_trap>:
thread_exit_trap:
    mv a1, a0
    800011d4:	00050593          	mv	a1,a0
    li a0, 0x12
    800011d8:	01200513          	li	a0,18
     ecall
    800011dc:	00000073          	ecall
    ret
    800011e0:	00008067          	ret

00000000800011e4 <thread_create_trap>:
thread_create_trap:
   mv a5, a4
    800011e4:	00070793          	mv	a5,a4
   mv a4, a3
    800011e8:	00068713          	mv	a4,a3
   mv a3, a2
    800011ec:	00060693          	mv	a3,a2
   mv a2, a1
    800011f0:	00058613          	mv	a2,a1
   mv a1, a0
    800011f4:	00050593          	mv	a1,a0
   li a0, 0x11
    800011f8:	01100513          	li	a0,17
    ecall
    800011fc:	00000073          	ecall
   ret
    80001200:	00008067          	ret

0000000080001204 <thread_dispatch_trap>:
thread_dispatch_trap:
    mv a1, a0
    80001204:	00050593          	mv	a1,a0
    li a0, 0x13
    80001208:	01300513          	li	a0,19
     ecall
    8000120c:	00000073          	ecall
    ret
    80001210:	00008067          	ret

0000000080001214 <mem_get_free_space_trap>:

mem_get_free_space_trap:
    li a0, 0x03
    80001214:	00300513          	li	a0,3
     ecall
    80001218:	00000073          	ecall
    ret
    8000121c:	00008067          	ret

0000000080001220 <mem_get_largest_free_block_trap>:

mem_get_largest_free_block_trap:
    li a0, 0x04
    80001220:	00400513          	li	a0,4
    ecall
    80001224:	00000073          	ecall
    ret
    80001228:	00008067          	ret

000000008000122c <sem_open_trap>:
sem_open_trap:
    mv a3, a2
    8000122c:	00060693          	mv	a3,a2
    mv a2, a1
    80001230:	00058613          	mv	a2,a1
    mv a1, a0
    80001234:	00050593          	mv	a1,a0
    li a0, 0x21
    80001238:	02100513          	li	a0,33
    ecall
    8000123c:	00000073          	ecall
    ret
    80001240:	00008067          	ret

0000000080001244 <sem_wait_trap>:

sem_wait_trap:
    mv a2, a1
    80001244:	00058613          	mv	a2,a1
    mv a1, a0
    80001248:	00050593          	mv	a1,a0
    li a0, 0x23
    8000124c:	02300513          	li	a0,35
    ecall
    80001250:	00000073          	ecall
    ret
    80001254:	00008067          	ret

0000000080001258 <thread_wrapper>:
thread_wrapper:
    ld sp, 24(a0)
    80001258:	01853103          	ld	sp,24(a0)
   ld t0, 40(a0)
    8000125c:	02853283          	ld	t0,40(a0)
   csrw sstatus, t0
    80001260:	10029073          	csrw	sstatus,t0
   ld t0, 0(a1)
    80001264:	0005b283          	ld	t0,0(a1)
   csrw sscratch, a0
    80001268:	14051073          	csrw	sscratch,a0
   ld a0, 8(a1)
    8000126c:	0085b503          	ld	a0,8(a1)
   jalr ra, t0, 0
    80001270:	000280e7          	jalr	t0
   csrr a0, sscratch
    80001274:	14002573          	csrr	a0,sscratch
   j thread_exit_trap
    80001278:	f5dff06f          	j	800011d4 <thread_exit_trap>
   ret
    8000127c:	00008067          	ret

0000000080001280 <sem_signal_trap>:


sem_signal_trap:
    mv a2,a1
    80001280:	00058613          	mv	a2,a1
    mv a1, a0
    80001284:	00050593          	mv	a1,a0
    li a0, 0x24
    80001288:	02400513          	li	a0,36
    ecall
    8000128c:	00000073          	ecall
    ret
    80001290:	00008067          	ret

0000000080001294 <sem_close_trap>:
sem_close_trap:
    mv a2, a1
    80001294:	00058613          	mv	a2,a1
    mv a1, a0
    80001298:	00050593          	mv	a1,a0
    li a0, 0x22
    8000129c:	02200513          	li	a0,34
    ecall
    800012a0:	00000073          	ecall
    ret
    800012a4:	00008067          	ret

00000000800012a8 <context_switch>:


context_switch:

    ld ra, 48(a1)
    800012a8:	0305b083          	ld	ra,48(a1)
    ld sp, 24(a1)
    800012ac:	0185b103          	ld	sp,24(a1)

    ret
    800012b0:	00008067          	ret

00000000800012b4 <getc_trap>:

getc_trap:
        mv a1, a0
    800012b4:	00050593          	mv	a1,a0
        li a0, 0x41
    800012b8:	04100513          	li	a0,65
        ecall
    800012bc:	00000073          	ecall
        ret
    800012c0:	00008067          	ret

00000000800012c4 <putc_trap>:

putc_trap:
    mv a2, a1
    800012c4:	00058613          	mv	a2,a1
    mv a1, a0
    800012c8:	00050593          	mv	a1,a0
    li a0, 0x42
    800012cc:	04200513          	li	a0,66
    ecall
    800012d0:	00000073          	ecall
    800012d4:	00008067          	ret

00000000800012d8 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    800012d8:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    800012dc:	00b29a63          	bne	t0,a1,800012f0 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    800012e0:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    800012e4:	fe029ae3          	bnez	t0,800012d8 <copy_and_swap>
    li a0, 0               # Set return to success.
    800012e8:	00000513          	li	a0,0
    jr ra                  # Return.
    800012ec:	00008067          	ret

00000000800012f0 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    800012f0:	00100513          	li	a0,1
    800012f4:	00008067          	ret

00000000800012f8 <abi_mem_alloc>:
int sem_close_trap(ThreadContext* t, sem_t id);
char getc_trap(ThreadContext* t);
void putc_trap(ThreadContext* t, char c);


void* abi_mem_alloc(ThreadContext* c, size_t blocks) {
    800012f8:	ff010113          	addi	sp,sp,-16
    800012fc:	00113423          	sd	ra,8(sp)
    80001300:	00813023          	sd	s0,0(sp)
    80001304:	01010413          	addi	s0,sp,16

    uint64 result =  mem_alloc_trap(c, blocks);
    80001308:	00000097          	auipc	ra,0x0
    8000130c:	ea4080e7          	jalr	-348(ra) # 800011ac <mem_alloc_trap>
    void* res = (void*)result;
    return res;

}
    80001310:	00813083          	ld	ra,8(sp)
    80001314:	00013403          	ld	s0,0(sp)
    80001318:	01010113          	addi	sp,sp,16
    8000131c:	00008067          	ret

0000000080001320 <abi_mem_free>:

int abi_mem_free(ThreadContext* c, void* ptr){
    80001320:	ff010113          	addi	sp,sp,-16
    80001324:	00113423          	sd	ra,8(sp)
    80001328:	00813023          	sd	s0,0(sp)
    8000132c:	01010413          	addi	s0,sp,16
    return mem_free_trap(c, ptr);
    80001330:	00000097          	auipc	ra,0x0
    80001334:	e90080e7          	jalr	-368(ra) # 800011c0 <mem_free_trap>
}
    80001338:	00813083          	ld	ra,8(sp)
    8000133c:	00013403          	ld	s0,0(sp)
    80001340:	01010113          	addi	sp,sp,16
    80001344:	00008067          	ret

0000000080001348 <abi_thread_create>:

int abi_thread_create(ThreadContext* c, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space){
    80001348:	ff010113          	addi	sp,sp,-16
    8000134c:	00113423          	sd	ra,8(sp)
    80001350:	00813023          	sd	s0,0(sp)
    80001354:	01010413          	addi	s0,sp,16
    return thread_create_trap(c, handle, startRoutine, args, stack_space);
    80001358:	00000097          	auipc	ra,0x0
    8000135c:	e8c080e7          	jalr	-372(ra) # 800011e4 <thread_create_trap>
}
    80001360:	00813083          	ld	ra,8(sp)
    80001364:	00013403          	ld	s0,0(sp)
    80001368:	01010113          	addi	sp,sp,16
    8000136c:	00008067          	ret

0000000080001370 <abi_thread_exit>:
int abi_thread_exit(ThreadContext* c){
    80001370:	ff010113          	addi	sp,sp,-16
    80001374:	00113423          	sd	ra,8(sp)
    80001378:	00813023          	sd	s0,0(sp)
    8000137c:	01010413          	addi	s0,sp,16
    return thread_exit_trap(c);
    80001380:	00000097          	auipc	ra,0x0
    80001384:	e54080e7          	jalr	-428(ra) # 800011d4 <thread_exit_trap>
}
    80001388:	00813083          	ld	ra,8(sp)
    8000138c:	00013403          	ld	s0,0(sp)
    80001390:	01010113          	addi	sp,sp,16
    80001394:	00008067          	ret

0000000080001398 <abi_thread_dispatch>:

void abi_thread_dispatch(ThreadContext* c){
    80001398:	ff010113          	addi	sp,sp,-16
    8000139c:	00113423          	sd	ra,8(sp)
    800013a0:	00813023          	sd	s0,0(sp)
    800013a4:	01010413          	addi	s0,sp,16
   return thread_dispatch_trap(c);
    800013a8:	00000097          	auipc	ra,0x0
    800013ac:	e5c080e7          	jalr	-420(ra) # 80001204 <thread_dispatch_trap>
}
    800013b0:	00813083          	ld	ra,8(sp)
    800013b4:	00013403          	ld	s0,0(sp)
    800013b8:	01010113          	addi	sp,sp,16
    800013bc:	00008067          	ret

00000000800013c0 <abi_mem_get_free_space>:

size_t abi_mem_get_free_space(){
    800013c0:	ff010113          	addi	sp,sp,-16
    800013c4:	00113423          	sd	ra,8(sp)
    800013c8:	00813023          	sd	s0,0(sp)
    800013cc:	01010413          	addi	s0,sp,16
    return mem_get_free_space_trap();
    800013d0:	00000097          	auipc	ra,0x0
    800013d4:	e44080e7          	jalr	-444(ra) # 80001214 <mem_get_free_space_trap>
}
    800013d8:	00813083          	ld	ra,8(sp)
    800013dc:	00013403          	ld	s0,0(sp)
    800013e0:	01010113          	addi	sp,sp,16
    800013e4:	00008067          	ret

00000000800013e8 <abi_mem_get_largest_free_block>:
size_t abi_mem_get_largest_free_block(){
    800013e8:	ff010113          	addi	sp,sp,-16
    800013ec:	00113423          	sd	ra,8(sp)
    800013f0:	00813023          	sd	s0,0(sp)
    800013f4:	01010413          	addi	s0,sp,16
    return mem_get_largest_free_block_trap();
    800013f8:	00000097          	auipc	ra,0x0
    800013fc:	e28080e7          	jalr	-472(ra) # 80001220 <mem_get_largest_free_block_trap>
}
    80001400:	00813083          	ld	ra,8(sp)
    80001404:	00013403          	ld	s0,0(sp)
    80001408:	01010113          	addi	sp,sp,16
    8000140c:	00008067          	ret

0000000080001410 <abi_sem_open>:
int abi_sem_open(ThreadContext* t, sem_t* handle, int init){
    80001410:	ff010113          	addi	sp,sp,-16
    80001414:	00113423          	sd	ra,8(sp)
    80001418:	00813023          	sd	s0,0(sp)
    8000141c:	01010413          	addi	s0,sp,16
    return sem_open_trap(t, handle, init);
    80001420:	00000097          	auipc	ra,0x0
    80001424:	e0c080e7          	jalr	-500(ra) # 8000122c <sem_open_trap>
}
    80001428:	00813083          	ld	ra,8(sp)
    8000142c:	00013403          	ld	s0,0(sp)
    80001430:	01010113          	addi	sp,sp,16
    80001434:	00008067          	ret

0000000080001438 <abi_sem_wait>:
int abi_sem_wait(ThreadContext* t, sem_t id){
    80001438:	ff010113          	addi	sp,sp,-16
    8000143c:	00113423          	sd	ra,8(sp)
    80001440:	00813023          	sd	s0,0(sp)
    80001444:	01010413          	addi	s0,sp,16
    return sem_wait_trap(t, id);
    80001448:	00000097          	auipc	ra,0x0
    8000144c:	dfc080e7          	jalr	-516(ra) # 80001244 <sem_wait_trap>
}
    80001450:	00813083          	ld	ra,8(sp)
    80001454:	00013403          	ld	s0,0(sp)
    80001458:	01010113          	addi	sp,sp,16
    8000145c:	00008067          	ret

0000000080001460 <abi_sem_signal>:
int abi_sem_signal(ThreadContext* t, sem_t id){
    80001460:	ff010113          	addi	sp,sp,-16
    80001464:	00113423          	sd	ra,8(sp)
    80001468:	00813023          	sd	s0,0(sp)
    8000146c:	01010413          	addi	s0,sp,16
    return sem_signal_trap(t, id);
    80001470:	00000097          	auipc	ra,0x0
    80001474:	e10080e7          	jalr	-496(ra) # 80001280 <sem_signal_trap>
}
    80001478:	00813083          	ld	ra,8(sp)
    8000147c:	00013403          	ld	s0,0(sp)
    80001480:	01010113          	addi	sp,sp,16
    80001484:	00008067          	ret

0000000080001488 <abi_sem_close>:
int abi_sem_close(ThreadContext* t, sem_t id){
    80001488:	ff010113          	addi	sp,sp,-16
    8000148c:	00113423          	sd	ra,8(sp)
    80001490:	00813023          	sd	s0,0(sp)
    80001494:	01010413          	addi	s0,sp,16
    return sem_close_trap(t, id);
    80001498:	00000097          	auipc	ra,0x0
    8000149c:	dfc080e7          	jalr	-516(ra) # 80001294 <sem_close_trap>
}
    800014a0:	00813083          	ld	ra,8(sp)
    800014a4:	00013403          	ld	s0,0(sp)
    800014a8:	01010113          	addi	sp,sp,16
    800014ac:	00008067          	ret

00000000800014b0 <abi_getc>:

char abi_getc(ThreadContext* t){
    800014b0:	ff010113          	addi	sp,sp,-16
    800014b4:	00113423          	sd	ra,8(sp)
    800014b8:	00813023          	sd	s0,0(sp)
    800014bc:	01010413          	addi	s0,sp,16
    return getc_trap(t);
    800014c0:	00000097          	auipc	ra,0x0
    800014c4:	df4080e7          	jalr	-524(ra) # 800012b4 <getc_trap>
}
    800014c8:	00813083          	ld	ra,8(sp)
    800014cc:	00013403          	ld	s0,0(sp)
    800014d0:	01010113          	addi	sp,sp,16
    800014d4:	00008067          	ret

00000000800014d8 <abi_putc>:
void abi_putc(ThreadContext* t, char c){
    800014d8:	ff010113          	addi	sp,sp,-16
    800014dc:	00113423          	sd	ra,8(sp)
    800014e0:	00813023          	sd	s0,0(sp)
    800014e4:	01010413          	addi	s0,sp,16
     putc_trap(t, c);
    800014e8:	00000097          	auipc	ra,0x0
    800014ec:	ddc080e7          	jalr	-548(ra) # 800012c4 <putc_trap>
    800014f0:	00813083          	ld	ra,8(sp)
    800014f4:	00013403          	ld	s0,0(sp)
    800014f8:	01010113          	addi	sp,sp,16
    800014fc:	00008067          	ret

0000000080001500 <mem_alloc>:


extern "C" ThreadContext * getRunningThreadContext();
extern int getWaitStatusForRunning();

void* mem_alloc(size_t size) {
    80001500:	fe010113          	addi	sp,sp,-32
    80001504:	00113c23          	sd	ra,24(sp)
    80001508:	00813823          	sd	s0,16(sp)
    8000150c:	00913423          	sd	s1,8(sp)
    80001510:	02010413          	addi	s0,sp,32
    size_t numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE ;
    80001514:	04750493          	addi	s1,a0,71
    80001518:	0064d493          	srli	s1,s1,0x6
    ThreadContext *t = getRunningThreadContext();
    8000151c:	00001097          	auipc	ra,0x1
    80001520:	43c080e7          	jalr	1084(ra) # 80002958 <getRunningThreadContext>
    return (char*)abi_mem_alloc(t, numOfBlocks) + sizeof(Header);
    80001524:	00048593          	mv	a1,s1
    80001528:	00000097          	auipc	ra,0x0
    8000152c:	dd0080e7          	jalr	-560(ra) # 800012f8 <abi_mem_alloc>
}
    80001530:	00850513          	addi	a0,a0,8
    80001534:	01813083          	ld	ra,24(sp)
    80001538:	01013403          	ld	s0,16(sp)
    8000153c:	00813483          	ld	s1,8(sp)
    80001540:	02010113          	addi	sp,sp,32
    80001544:	00008067          	ret

0000000080001548 <mem_free>:
int mem_free(void* ptr){
    if(!ptr) return 0;
    80001548:	04050263          	beqz	a0,8000158c <mem_free+0x44>
int mem_free(void* ptr){
    8000154c:	fe010113          	addi	sp,sp,-32
    80001550:	00113c23          	sd	ra,24(sp)
    80001554:	00813823          	sd	s0,16(sp)
    80001558:	00913423          	sd	s1,8(sp)
    8000155c:	02010413          	addi	s0,sp,32
    Header* header = (Header*)((char*)ptr - sizeof(Header));
    80001560:	ff850493          	addi	s1,a0,-8
    ThreadContext *t = getRunningThreadContext();
    80001564:	00001097          	auipc	ra,0x1
    80001568:	3f4080e7          	jalr	1012(ra) # 80002958 <getRunningThreadContext>
    return abi_mem_free(t, header);
    8000156c:	00048593          	mv	a1,s1
    80001570:	00000097          	auipc	ra,0x0
    80001574:	db0080e7          	jalr	-592(ra) # 80001320 <abi_mem_free>
}
    80001578:	01813083          	ld	ra,24(sp)
    8000157c:	01013403          	ld	s0,16(sp)
    80001580:	00813483          	ld	s1,8(sp)
    80001584:	02010113          	addi	sp,sp,32
    80001588:	00008067          	ret
    if(!ptr) return 0;
    8000158c:	00000513          	li	a0,0
}
    80001590:	00008067          	ret

0000000080001594 <thread_create>:

int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args)
{
    80001594:	fd010113          	addi	sp,sp,-48
    80001598:	02113423          	sd	ra,40(sp)
    8000159c:	02813023          	sd	s0,32(sp)
    800015a0:	00913c23          	sd	s1,24(sp)
    800015a4:	01213823          	sd	s2,16(sp)
    800015a8:	01313423          	sd	s3,8(sp)
    800015ac:	01413023          	sd	s4,0(sp)
    800015b0:	03010413          	addi	s0,sp,48
    800015b4:	00050913          	mv	s2,a0
    800015b8:	00058993          	mv	s3,a1
    800015bc:	00060a13          	mv	s4,a2
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    ThreadContext *t = getRunningThreadContext();
    800015c0:	00001097          	auipc	ra,0x1
    800015c4:	398080e7          	jalr	920(ra) # 80002958 <getRunningThreadContext>
    800015c8:	00050493          	mv	s1,a0
    void* result = abi_mem_alloc(t, numOfBlocks);
    800015cc:	08100593          	li	a1,129
    800015d0:	00000097          	auipc	ra,0x0
    800015d4:	d28080e7          	jalr	-728(ra) # 800012f8 <abi_mem_alloc>
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    return abi_thread_create(t, handle, startRoutine, args, stack_top);
    800015d8:	000027b7          	lui	a5,0x2
    800015dc:	00878793          	addi	a5,a5,8 # 2008 <_entry-0x7fffdff8>
    800015e0:	00f50733          	add	a4,a0,a5
    800015e4:	000a0693          	mv	a3,s4
    800015e8:	00098613          	mv	a2,s3
    800015ec:	00090593          	mv	a1,s2
    800015f0:	00048513          	mv	a0,s1
    800015f4:	00000097          	auipc	ra,0x0
    800015f8:	d54080e7          	jalr	-684(ra) # 80001348 <abi_thread_create>
}
    800015fc:	02813083          	ld	ra,40(sp)
    80001600:	02013403          	ld	s0,32(sp)
    80001604:	01813483          	ld	s1,24(sp)
    80001608:	01013903          	ld	s2,16(sp)
    8000160c:	00813983          	ld	s3,8(sp)
    80001610:	00013a03          	ld	s4,0(sp)
    80001614:	03010113          	addi	sp,sp,48
    80001618:	00008067          	ret

000000008000161c <thread_exit>:

int thread_exit(){
    8000161c:	ff010113          	addi	sp,sp,-16
    80001620:	00113423          	sd	ra,8(sp)
    80001624:	00813023          	sd	s0,0(sp)
    80001628:	01010413          	addi	s0,sp,16
    ThreadContext *t = getRunningThreadContext();
    8000162c:	00001097          	auipc	ra,0x1
    80001630:	32c080e7          	jalr	812(ra) # 80002958 <getRunningThreadContext>
    return abi_thread_exit(t);
    80001634:	00000097          	auipc	ra,0x0
    80001638:	d3c080e7          	jalr	-708(ra) # 80001370 <abi_thread_exit>
}
    8000163c:	00813083          	ld	ra,8(sp)
    80001640:	00013403          	ld	s0,0(sp)
    80001644:	01010113          	addi	sp,sp,16
    80001648:	00008067          	ret

000000008000164c <thread_dispatch>:
void thread_dispatch(){
    8000164c:	ff010113          	addi	sp,sp,-16
    80001650:	00113423          	sd	ra,8(sp)
    80001654:	00813023          	sd	s0,0(sp)
    80001658:	01010413          	addi	s0,sp,16
    ThreadContext *t = getRunningThreadContext();
    8000165c:	00001097          	auipc	ra,0x1
    80001660:	2fc080e7          	jalr	764(ra) # 80002958 <getRunningThreadContext>
    abi_thread_dispatch(t);
    80001664:	00000097          	auipc	ra,0x0
    80001668:	d34080e7          	jalr	-716(ra) # 80001398 <abi_thread_dispatch>
}
    8000166c:	00813083          	ld	ra,8(sp)
    80001670:	00013403          	ld	s0,0(sp)
    80001674:	01010113          	addi	sp,sp,16
    80001678:	00008067          	ret

000000008000167c <mem_get_free_space>:
size_t mem_get_free_space(){
    8000167c:	ff010113          	addi	sp,sp,-16
    80001680:	00113423          	sd	ra,8(sp)
    80001684:	00813023          	sd	s0,0(sp)
    80001688:	01010413          	addi	s0,sp,16
    return abi_mem_get_free_space();
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	d34080e7          	jalr	-716(ra) # 800013c0 <abi_mem_get_free_space>
}
    80001694:	00813083          	ld	ra,8(sp)
    80001698:	00013403          	ld	s0,0(sp)
    8000169c:	01010113          	addi	sp,sp,16
    800016a0:	00008067          	ret

00000000800016a4 <mem_get_largest_free_block>:
size_t mem_get_largest_free_block(){
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00113423          	sd	ra,8(sp)
    800016ac:	00813023          	sd	s0,0(sp)
    800016b0:	01010413          	addi	s0,sp,16
    return abi_mem_get_largest_free_block();
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	d34080e7          	jalr	-716(ra) # 800013e8 <abi_mem_get_largest_free_block>
}
    800016bc:	00813083          	ld	ra,8(sp)
    800016c0:	00013403          	ld	s0,0(sp)
    800016c4:	01010113          	addi	sp,sp,16
    800016c8:	00008067          	ret

00000000800016cc <sem_open>:

int sem_open(sem_t* handle, unsigned init){
    800016cc:	fe010113          	addi	sp,sp,-32
    800016d0:	00113c23          	sd	ra,24(sp)
    800016d4:	00813823          	sd	s0,16(sp)
    800016d8:	00913423          	sd	s1,8(sp)
    800016dc:	01213023          	sd	s2,0(sp)
    800016e0:	02010413          	addi	s0,sp,32
    800016e4:	00050493          	mv	s1,a0
    800016e8:	00058913          	mv	s2,a1
    ThreadContext *t = getRunningThreadContext();
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	26c080e7          	jalr	620(ra) # 80002958 <getRunningThreadContext>
    return abi_sem_open(t, handle, init);
    800016f4:	00090613          	mv	a2,s2
    800016f8:	00048593          	mv	a1,s1
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	d14080e7          	jalr	-748(ra) # 80001410 <abi_sem_open>
}
    80001704:	01813083          	ld	ra,24(sp)
    80001708:	01013403          	ld	s0,16(sp)
    8000170c:	00813483          	ld	s1,8(sp)
    80001710:	00013903          	ld	s2,0(sp)
    80001714:	02010113          	addi	sp,sp,32
    80001718:	00008067          	ret

000000008000171c <sem_wait>:

int sem_wait(sem_t id){
    8000171c:	fe010113          	addi	sp,sp,-32
    80001720:	00113c23          	sd	ra,24(sp)
    80001724:	00813823          	sd	s0,16(sp)
    80001728:	00913423          	sd	s1,8(sp)
    8000172c:	02010413          	addi	s0,sp,32
    80001730:	00050493          	mv	s1,a0
    ThreadContext *t = getRunningThreadContext();
    80001734:	00001097          	auipc	ra,0x1
    80001738:	224080e7          	jalr	548(ra) # 80002958 <getRunningThreadContext>
    abi_sem_wait(t, id);
    8000173c:	00048593          	mv	a1,s1
    80001740:	00000097          	auipc	ra,0x0
    80001744:	cf8080e7          	jalr	-776(ra) # 80001438 <abi_sem_wait>
    int status = getWaitStatusForRunning();
    80001748:	00002097          	auipc	ra,0x2
    8000174c:	cb0080e7          	jalr	-848(ra) # 800033f8 <_Z23getWaitStatusForRunningv>
    return status;
}
    80001750:	01813083          	ld	ra,24(sp)
    80001754:	01013403          	ld	s0,16(sp)
    80001758:	00813483          	ld	s1,8(sp)
    8000175c:	02010113          	addi	sp,sp,32
    80001760:	00008067          	ret

0000000080001764 <sem_signal>:

int sem_signal(sem_t id){
    80001764:	fe010113          	addi	sp,sp,-32
    80001768:	00113c23          	sd	ra,24(sp)
    8000176c:	00813823          	sd	s0,16(sp)
    80001770:	00913423          	sd	s1,8(sp)
    80001774:	02010413          	addi	s0,sp,32
    80001778:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    8000177c:	00001097          	auipc	ra,0x1
    80001780:	1dc080e7          	jalr	476(ra) # 80002958 <getRunningThreadContext>
    return abi_sem_signal(t, id);
    80001784:	00048593          	mv	a1,s1
    80001788:	00000097          	auipc	ra,0x0
    8000178c:	cd8080e7          	jalr	-808(ra) # 80001460 <abi_sem_signal>
}
    80001790:	01813083          	ld	ra,24(sp)
    80001794:	01013403          	ld	s0,16(sp)
    80001798:	00813483          	ld	s1,8(sp)
    8000179c:	02010113          	addi	sp,sp,32
    800017a0:	00008067          	ret

00000000800017a4 <sem_close>:

int sem_close(sem_t id){
    800017a4:	fe010113          	addi	sp,sp,-32
    800017a8:	00113c23          	sd	ra,24(sp)
    800017ac:	00813823          	sd	s0,16(sp)
    800017b0:	00913423          	sd	s1,8(sp)
    800017b4:	02010413          	addi	s0,sp,32
    800017b8:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    800017bc:	00001097          	auipc	ra,0x1
    800017c0:	19c080e7          	jalr	412(ra) # 80002958 <getRunningThreadContext>
    return abi_sem_close(t, id);
    800017c4:	00048593          	mv	a1,s1
    800017c8:	00000097          	auipc	ra,0x0
    800017cc:	cc0080e7          	jalr	-832(ra) # 80001488 <abi_sem_close>
}
    800017d0:	01813083          	ld	ra,24(sp)
    800017d4:	01013403          	ld	s0,16(sp)
    800017d8:	00813483          	ld	s1,8(sp)
    800017dc:	02010113          	addi	sp,sp,32
    800017e0:	00008067          	ret

00000000800017e4 <getc>:

char getc () {
    800017e4:	ff010113          	addi	sp,sp,-16
    800017e8:	00113423          	sd	ra,8(sp)
    800017ec:	00813023          	sd	s0,0(sp)
    800017f0:	01010413          	addi	s0,sp,16

    ThreadContext* t = getRunningThreadContext();
    800017f4:	00001097          	auipc	ra,0x1
    800017f8:	164080e7          	jalr	356(ra) # 80002958 <getRunningThreadContext>
    return abi_getc(t);
    800017fc:	00000097          	auipc	ra,0x0
    80001800:	cb4080e7          	jalr	-844(ra) # 800014b0 <abi_getc>
}
    80001804:	00813083          	ld	ra,8(sp)
    80001808:	00013403          	ld	s0,0(sp)
    8000180c:	01010113          	addi	sp,sp,16
    80001810:	00008067          	ret

0000000080001814 <putc>:

void putc (char c){
    80001814:	fe010113          	addi	sp,sp,-32
    80001818:	00113c23          	sd	ra,24(sp)
    8000181c:	00813823          	sd	s0,16(sp)
    80001820:	00913423          	sd	s1,8(sp)
    80001824:	02010413          	addi	s0,sp,32
    80001828:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    8000182c:	00001097          	auipc	ra,0x1
    80001830:	12c080e7          	jalr	300(ra) # 80002958 <getRunningThreadContext>
    abi_putc(t, c);
    80001834:	00048593          	mv	a1,s1
    80001838:	00000097          	auipc	ra,0x0
    8000183c:	ca0080e7          	jalr	-864(ra) # 800014d8 <abi_putc>
}
    80001840:	01813083          	ld	ra,24(sp)
    80001844:	01013403          	ld	s0,16(sp)
    80001848:	00813483          	ld	s1,8(sp)
    8000184c:	02010113          	addi	sp,sp,32
    80001850:	00008067          	ret

0000000080001854 <_ZN10ThreadPoolC1Ev>:
#include "../h/ThreadPool.hpp"

ThreadPool::ThreadPool() : pool(nullptr), used(nullptr) {}
    80001854:	ff010113          	addi	sp,sp,-16
    80001858:	00813423          	sd	s0,8(sp)
    8000185c:	01010413          	addi	s0,sp,16
    80001860:	00053023          	sd	zero,0(a0)
    80001864:	00053423          	sd	zero,8(a0)
    80001868:	00813403          	ld	s0,8(sp)
    8000186c:	01010113          	addi	sp,sp,16
    80001870:	00008067          	ret

0000000080001874 <_ZN10ThreadPool4initEPvS0_>:

void ThreadPool::init(void* poolStartAddress, void* usedStartAddress) {
    80001874:	ff010113          	addi	sp,sp,-16
    80001878:	00813423          	sd	s0,8(sp)
    8000187c:	01010413          	addi	s0,sp,16
    pool = (Thread*)poolStartAddress;
    80001880:	00b53023          	sd	a1,0(a0)
    used = (bool*)usedStartAddress;
    80001884:	00c53423          	sd	a2,8(a0)
    for (int i = 0; i < MAX_THREADS; i++) used[i] = false;
    80001888:	00000793          	li	a5,0
    8000188c:	00900713          	li	a4,9
    80001890:	00f74c63          	blt	a4,a5,800018a8 <_ZN10ThreadPool4initEPvS0_+0x34>
    80001894:	00853703          	ld	a4,8(a0)
    80001898:	00f70733          	add	a4,a4,a5
    8000189c:	00070023          	sb	zero,0(a4)
    800018a0:	0017879b          	addiw	a5,a5,1
    800018a4:	fe9ff06f          	j	8000188c <_ZN10ThreadPool4initEPvS0_+0x18>
}
    800018a8:	00813403          	ld	s0,8(sp)
    800018ac:	01010113          	addi	sp,sp,16
    800018b0:	00008067          	ret

00000000800018b4 <_ZN10ThreadPool16getSemaphoreByIdEj>:

Thread* ThreadPool::getSemaphoreById(thread_t id){
    800018b4:	ff010113          	addi	sp,sp,-16
    800018b8:	00813423          	sd	s0,8(sp)
    800018bc:	01010413          	addi	s0,sp,16
    800018c0:	00050693          	mv	a3,a0
    for(int i = 0; i < MAX_THREADS; i++){
    800018c4:	00000793          	li	a5,0
    800018c8:	0080006f          	j	800018d0 <_ZN10ThreadPool16getSemaphoreByIdEj+0x1c>
    800018cc:	0017879b          	addiw	a5,a5,1
    800018d0:	00900713          	li	a4,9
    800018d4:	02f74a63          	blt	a4,a5,80001908 <_ZN10ThreadPool16getSemaphoreByIdEj+0x54>
        if(used[i] == true && pool[i].threadId == id){
    800018d8:	0086b703          	ld	a4,8(a3)
    800018dc:	00f70733          	add	a4,a4,a5
    800018e0:	00074703          	lbu	a4,0(a4)
    800018e4:	fe0704e3          	beqz	a4,800018cc <_ZN10ThreadPool16getSemaphoreByIdEj+0x18>
    800018e8:	0006b503          	ld	a0,0(a3)
    800018ec:	00279713          	slli	a4,a5,0x2
    800018f0:	00f70733          	add	a4,a4,a5
    800018f4:	00571713          	slli	a4,a4,0x5
    800018f8:	00e50533          	add	a0,a0,a4
    800018fc:	01852703          	lw	a4,24(a0)
    80001900:	fcb716e3          	bne	a4,a1,800018cc <_ZN10ThreadPool16getSemaphoreByIdEj+0x18>
    80001904:	0080006f          	j	8000190c <_ZN10ThreadPool16getSemaphoreByIdEj+0x58>
            return &pool[i];
        }
    }
    return nullptr;
    80001908:	00000513          	li	a0,0
}
    8000190c:	00813403          	ld	s0,8(sp)
    80001910:	01010113          	addi	sp,sp,16
    80001914:	00008067          	ret

0000000080001918 <_ZN10ThreadPool8allocateEv>:
Thread* ThreadPool::allocate() {
    80001918:	ff010113          	addi	sp,sp,-16
    8000191c:	00813423          	sd	s0,8(sp)
    80001920:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_THREADS; i++) {
    80001924:	00000793          	li	a5,0
    80001928:	00900713          	li	a4,9
    8000192c:	04f74063          	blt	a4,a5,8000196c <_ZN10ThreadPool8allocateEv+0x54>
        if (!used[i]) {
    80001930:	00853703          	ld	a4,8(a0)
    80001934:	00078613          	mv	a2,a5
    80001938:	00f70733          	add	a4,a4,a5
    8000193c:	00074683          	lbu	a3,0(a4)
    80001940:	00068663          	beqz	a3,8000194c <_ZN10ThreadPool8allocateEv+0x34>
    for (int i = 0; i < MAX_THREADS; i++) {
    80001944:	0017879b          	addiw	a5,a5,1
    80001948:	fe1ff06f          	j	80001928 <_ZN10ThreadPool8allocateEv+0x10>
            used[i] = true;
    8000194c:	00100793          	li	a5,1
    80001950:	00f70023          	sb	a5,0(a4)
            return &pool[i];
    80001954:	00053503          	ld	a0,0(a0)
    80001958:	00261793          	slli	a5,a2,0x2
    8000195c:	00c78633          	add	a2,a5,a2
    80001960:	00561613          	slli	a2,a2,0x5
    80001964:	00c50533          	add	a0,a0,a2
    80001968:	0080006f          	j	80001970 <_ZN10ThreadPool8allocateEv+0x58>
        }
    }
    return nullptr;
    8000196c:	00000513          	li	a0,0
}
    80001970:	00813403          	ld	s0,8(sp)
    80001974:	01010113          	addi	sp,sp,16
    80001978:	00008067          	ret

000000008000197c <_ZN10ThreadPool10deallocateEP6Thread>:

void ThreadPool::deallocate(Thread* obj) {
    8000197c:	ff010113          	addi	sp,sp,-16
    80001980:	00813423          	sd	s0,8(sp)
    80001984:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_THREADS; i++) {
    80001988:	00000793          	li	a5,0
    8000198c:	00900713          	li	a4,9
    80001990:	02f74a63          	blt	a4,a5,800019c4 <_ZN10ThreadPool10deallocateEP6Thread+0x48>
        if (&pool[i] == obj) {
    80001994:	00053683          	ld	a3,0(a0)
    80001998:	00078613          	mv	a2,a5
    8000199c:	00279713          	slli	a4,a5,0x2
    800019a0:	00f70733          	add	a4,a4,a5
    800019a4:	00571713          	slli	a4,a4,0x5
    800019a8:	00e68733          	add	a4,a3,a4
    800019ac:	00b70663          	beq	a4,a1,800019b8 <_ZN10ThreadPool10deallocateEP6Thread+0x3c>
    for (int i = 0; i < MAX_THREADS; i++) {
    800019b0:	0017879b          	addiw	a5,a5,1
    800019b4:	fd9ff06f          	j	8000198c <_ZN10ThreadPool10deallocateEP6Thread+0x10>
            used[i] = false;
    800019b8:	00853783          	ld	a5,8(a0)
    800019bc:	00c78633          	add	a2,a5,a2
    800019c0:	00060023          	sb	zero,0(a2)
            return;
        }
    }
}
    800019c4:	00813403          	ld	s0,8(sp)
    800019c8:	01010113          	addi	sp,sp,16
    800019cc:	00008067          	ret

00000000800019d0 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned init){
    val = init;
    myHandle = cnt++;
}
Semaphore::~Semaphore() {}
    800019d0:	ff010113          	addi	sp,sp,-16
    800019d4:	00113423          	sd	ra,8(sp)
    800019d8:	00813023          	sd	s0,0(sp)
    800019dc:	01010413          	addi	s0,sp,16
    800019e0:	0000b797          	auipc	a5,0xb
    800019e4:	15878793          	addi	a5,a5,344 # 8000cb38 <_ZTV9Semaphore+0x10>
    800019e8:	00f53023          	sd	a5,0(a0)
    800019ec:	01050513          	addi	a0,a0,16
    800019f0:	00002097          	auipc	ra,0x2
    800019f4:	120080e7          	jalr	288(ra) # 80003b10 <_ZN4ListI6ThreadED1Ev>
    800019f8:	00813083          	ld	ra,8(sp)
    800019fc:	00013403          	ld	s0,0(sp)
    80001a00:	01010113          	addi	sp,sp,16
    80001a04:	00008067          	ret

0000000080001a08 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init){
    80001a08:	fe010113          	addi	sp,sp,-32
    80001a0c:	00113c23          	sd	ra,24(sp)
    80001a10:	00813823          	sd	s0,16(sp)
    80001a14:	00913423          	sd	s1,8(sp)
    80001a18:	01213023          	sd	s2,0(sp)
    80001a1c:	02010413          	addi	s0,sp,32
    80001a20:	00050493          	mv	s1,a0
    80001a24:	00058913          	mv	s2,a1
    80001a28:	0000b797          	auipc	a5,0xb
    80001a2c:	11078793          	addi	a5,a5,272 # 8000cb38 <_ZTV9Semaphore+0x10>
    80001a30:	00f53023          	sd	a5,0(a0)
    80001a34:	01050513          	addi	a0,a0,16
    80001a38:	00002097          	auipc	ra,0x2
    80001a3c:	0b8080e7          	jalr	184(ra) # 80003af0 <_ZN4ListI6ThreadEC1Ev>
    val = init;
    80001a40:	0124a623          	sw	s2,12(s1)
    myHandle = cnt++;
    80001a44:	0000b717          	auipc	a4,0xb
    80001a48:	0dc70713          	addi	a4,a4,220 # 8000cb20 <_ZN9Semaphore3cntE>
    80001a4c:	00072783          	lw	a5,0(a4)
    80001a50:	0017869b          	addiw	a3,a5,1
    80001a54:	00d72023          	sw	a3,0(a4)
    80001a58:	00f4a423          	sw	a5,8(s1)
}
    80001a5c:	01813083          	ld	ra,24(sp)
    80001a60:	01013403          	ld	s0,16(sp)
    80001a64:	00813483          	ld	s1,8(sp)
    80001a68:	00013903          	ld	s2,0(sp)
    80001a6c:	02010113          	addi	sp,sp,32
    80001a70:	00008067          	ret

0000000080001a74 <_ZN9SemaphorenwEm>:
int Semaphore::signal(){
    sem_signal(this->myHandle);
    return 0;
}

void* Semaphore::operator new(size_t size) {
    80001a74:	ff010113          	addi	sp,sp,-16
    80001a78:	00113423          	sd	ra,8(sp)
    80001a7c:	00813023          	sd	s0,0(sp)
    80001a80:	01010413          	addi	s0,sp,16
    return MemoryAllocator::Instance()->getSemaphorePool().allocate();
    80001a84:	00002097          	auipc	ra,0x2
    80001a88:	c8c080e7          	jalr	-884(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80001a8c:	00002097          	auipc	ra,0x2
    80001a90:	9e0080e7          	jalr	-1568(ra) # 8000346c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001a94:	00002097          	auipc	ra,0x2
    80001a98:	2a0080e7          	jalr	672(ra) # 80003d34 <_ZN13SemaphorePool8allocateEv>
}
    80001a9c:	00813083          	ld	ra,8(sp)
    80001aa0:	00013403          	ld	s0,0(sp)
    80001aa4:	01010113          	addi	sp,sp,16
    80001aa8:	00008067          	ret

0000000080001aac <_ZN9SemaphoredlEPv>:

void Semaphore::operator delete(void *obj) noexcept {
    80001aac:	fe010113          	addi	sp,sp,-32
    80001ab0:	00113c23          	sd	ra,24(sp)
    80001ab4:	00813823          	sd	s0,16(sp)
    80001ab8:	00913423          	sd	s1,8(sp)
    80001abc:	02010413          	addi	s0,sp,32
    80001ac0:	00050493          	mv	s1,a0
    MemoryAllocator::Instance()->getSemaphorePool().deallocate((Semaphore*)obj);
    80001ac4:	00002097          	auipc	ra,0x2
    80001ac8:	c4c080e7          	jalr	-948(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80001acc:	00002097          	auipc	ra,0x2
    80001ad0:	9a0080e7          	jalr	-1632(ra) # 8000346c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001ad4:	00048593          	mv	a1,s1
    80001ad8:	00002097          	auipc	ra,0x2
    80001adc:	2b8080e7          	jalr	696(ra) # 80003d90 <_ZN13SemaphorePool10deallocateEP9Semaphore>
}
    80001ae0:	01813083          	ld	ra,24(sp)
    80001ae4:	01013403          	ld	s0,16(sp)
    80001ae8:	00813483          	ld	s1,8(sp)
    80001aec:	02010113          	addi	sp,sp,32
    80001af0:	00008067          	ret

0000000080001af4 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {}
    80001af4:	fe010113          	addi	sp,sp,-32
    80001af8:	00113c23          	sd	ra,24(sp)
    80001afc:	00813823          	sd	s0,16(sp)
    80001b00:	00913423          	sd	s1,8(sp)
    80001b04:	02010413          	addi	s0,sp,32
    80001b08:	00050493          	mv	s1,a0
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	ec4080e7          	jalr	-316(ra) # 800019d0 <_ZN9SemaphoreD1Ev>
    80001b14:	00048513          	mv	a0,s1
    80001b18:	00000097          	auipc	ra,0x0
    80001b1c:	f94080e7          	jalr	-108(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80001b20:	01813083          	ld	ra,24(sp)
    80001b24:	01013403          	ld	s0,16(sp)
    80001b28:	00813483          	ld	s1,8(sp)
    80001b2c:	02010113          	addi	sp,sp,32
    80001b30:	00008067          	ret

0000000080001b34 <_ZN9Semaphore8sem_openEPjj>:
int Semaphore::sem_open(sem_t *handle, unsigned init) {
    80001b34:	fd010113          	addi	sp,sp,-48
    80001b38:	02113423          	sd	ra,40(sp)
    80001b3c:	02813023          	sd	s0,32(sp)
    80001b40:	00913c23          	sd	s1,24(sp)
    80001b44:	01213823          	sd	s2,16(sp)
    80001b48:	01313423          	sd	s3,8(sp)
    80001b4c:	03010413          	addi	s0,sp,48
    80001b50:	00050993          	mv	s3,a0
    80001b54:	00058913          	mv	s2,a1
    Semaphore* semaphore = new Semaphore(init);
    80001b58:	02000513          	li	a0,32
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	f18080e7          	jalr	-232(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80001b64:	00050493          	mv	s1,a0
    80001b68:	00090593          	mv	a1,s2
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	e9c080e7          	jalr	-356(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    if(!semaphore) return -1;
    80001b74:	02048663          	beqz	s1,80001ba0 <_ZN9Semaphore8sem_openEPjj+0x6c>
    *handle = semaphore->myHandle;
    80001b78:	0084a783          	lw	a5,8(s1)
    80001b7c:	00f9a023          	sw	a5,0(s3)
    return 0;
    80001b80:	00000513          	li	a0,0
}
    80001b84:	02813083          	ld	ra,40(sp)
    80001b88:	02013403          	ld	s0,32(sp)
    80001b8c:	01813483          	ld	s1,24(sp)
    80001b90:	01013903          	ld	s2,16(sp)
    80001b94:	00813983          	ld	s3,8(sp)
    80001b98:	03010113          	addi	sp,sp,48
    80001b9c:	00008067          	ret
    if(!semaphore) return -1;
    80001ba0:	fff00513          	li	a0,-1
    80001ba4:	fe1ff06f          	j	80001b84 <_ZN9Semaphore8sem_openEPjj+0x50>
    80001ba8:	00050913          	mv	s2,a0
    Semaphore* semaphore = new Semaphore(init);
    80001bac:	00048513          	mv	a0,s1
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	efc080e7          	jalr	-260(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80001bb8:	00090513          	mv	a0,s2
    80001bbc:	0000c097          	auipc	ra,0xc
    80001bc0:	7fc080e7          	jalr	2044(ra) # 8000e3b8 <_Unwind_Resume>

0000000080001bc4 <_ZN9Semaphore9sem_closeEj>:

int Semaphore::sem_close(sem_t id){
    80001bc4:	fe010113          	addi	sp,sp,-32
    80001bc8:	00113c23          	sd	ra,24(sp)
    80001bcc:	00813823          	sd	s0,16(sp)
    80001bd0:	00913423          	sd	s1,8(sp)
    80001bd4:	01213023          	sd	s2,0(sp)
    80001bd8:	02010413          	addi	s0,sp,32
    80001bdc:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001be0:	00002097          	auipc	ra,0x2
    80001be4:	b30080e7          	jalr	-1232(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80001be8:	00002097          	auipc	ra,0x2
    80001bec:	884080e7          	jalr	-1916(ra) # 8000346c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001bf0:	00048593          	mv	a1,s1
    80001bf4:	00002097          	auipc	ra,0x2
    80001bf8:	0e4080e7          	jalr	228(ra) # 80003cd8 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    80001bfc:	00050913          	mv	s2,a0
    if(semaphore == nullptr) return -1;
    80001c00:	06050863          	beqz	a0,80001c70 <_ZN9Semaphore9sem_closeEj+0xac>

    //take out all threads that were waiting on this semaphore and put them in Scheduler as ready
    while(!semaphore->waiting.empty()){
    80001c04:	01090493          	addi	s1,s2,16
    80001c08:	00048513          	mv	a0,s1
    80001c0c:	00002097          	auipc	ra,0x2
    80001c10:	04c080e7          	jalr	76(ra) # 80003c58 <_ZN4ListI6ThreadE5emptyEv>
    80001c14:	02051863          	bnez	a0,80001c44 <_ZN9Semaphore9sem_closeEj+0x80>
        Thread* thread = semaphore->waiting.remove_beginning();
    80001c18:	00048513          	mv	a0,s1
    80001c1c:	00002097          	auipc	ra,0x2
    80001c20:	fd8080e7          	jalr	-40(ra) # 80003bf4 <_ZN4ListI6ThreadE16remove_beginningEv>
    80001c24:	00050593          	mv	a1,a0
        thread->semWaitStatus = -2;
    80001c28:	ffe00793          	li	a5,-2
    80001c2c:	00f52423          	sw	a5,8(a0)
        scheduler.put(thread);
    80001c30:	0000b517          	auipc	a0,0xb
    80001c34:	11853503          	ld	a0,280(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c38:	00001097          	auipc	ra,0x1
    80001c3c:	ff4080e7          	jalr	-12(ra) # 80002c2c <_ZN9Scheduler3putEP6Thread>
    while(!semaphore->waiting.empty()){
    80001c40:	fc5ff06f          	j	80001c04 <_ZN9Semaphore9sem_closeEj+0x40>

    }
    delete semaphore;
    80001c44:	00093783          	ld	a5,0(s2)
    80001c48:	0087b783          	ld	a5,8(a5)
    80001c4c:	00090513          	mv	a0,s2
    80001c50:	000780e7          	jalr	a5
    return 0;
    80001c54:	00000513          	li	a0,0
}
    80001c58:	01813083          	ld	ra,24(sp)
    80001c5c:	01013403          	ld	s0,16(sp)
    80001c60:	00813483          	ld	s1,8(sp)
    80001c64:	00013903          	ld	s2,0(sp)
    80001c68:	02010113          	addi	sp,sp,32
    80001c6c:	00008067          	ret
    if(semaphore == nullptr) return -1;
    80001c70:	fff00513          	li	a0,-1
    80001c74:	fe5ff06f          	j	80001c58 <_ZN9Semaphore9sem_closeEj+0x94>

0000000080001c78 <_ZN9Semaphore8sem_waitEj>:

int Semaphore::sem_wait(sem_t id) {
    80001c78:	fe010113          	addi	sp,sp,-32
    80001c7c:	00113c23          	sd	ra,24(sp)
    80001c80:	00813823          	sd	s0,16(sp)
    80001c84:	00913423          	sd	s1,8(sp)
    80001c88:	02010413          	addi	s0,sp,32
    80001c8c:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001c90:	00002097          	auipc	ra,0x2
    80001c94:	a80080e7          	jalr	-1408(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80001c98:	00001097          	auipc	ra,0x1
    80001c9c:	7d4080e7          	jalr	2004(ra) # 8000346c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001ca0:	00048593          	mv	a1,s1
    80001ca4:	00002097          	auipc	ra,0x2
    80001ca8:	034080e7          	jalr	52(ra) # 80003cd8 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    if(semaphore == nullptr) return -1;
    80001cac:	12050a63          	beqz	a0,80001de0 <_ZN9Semaphore8sem_waitEj+0x168>
    Thread::running->semWaitStatus = 0;
    80001cb0:	0000b797          	auipc	a5,0xb
    80001cb4:	0907b783          	ld	a5,144(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001cb8:	0007b483          	ld	s1,0(a5)
    80001cbc:	0004a423          	sw	zero,8(s1)
    semaphore->val--;
    80001cc0:	00c52783          	lw	a5,12(a0)
    80001cc4:	fff7879b          	addiw	a5,a5,-1
    80001cc8:	00f52623          	sw	a5,12(a0)
    if(semaphore->val < 0){
    80001ccc:	02079713          	slli	a4,a5,0x20
    80001cd0:	00074e63          	bltz	a4,80001cec <_ZN9Semaphore8sem_waitEj+0x74>
        else
        {
            context_switch(oldRunning->getContext(), Thread::running->getContext());
        }
    }
    return 0;
    80001cd4:	00000513          	li	a0,0
}
    80001cd8:	01813083          	ld	ra,24(sp)
    80001cdc:	01013403          	ld	s0,16(sp)
    80001ce0:	00813483          	ld	s1,8(sp)
    80001ce4:	02010113          	addi	sp,sp,32
    80001ce8:	00008067          	ret
        semaphore->waiting.add_end(Thread::running);
    80001cec:	00048593          	mv	a1,s1
    80001cf0:	01050513          	addi	a0,a0,16
    80001cf4:	00002097          	auipc	ra,0x2
    80001cf8:	e64080e7          	jalr	-412(ra) # 80003b58 <_ZN4ListI6ThreadE7add_endEPS0_>
        Thread::running = scheduler.get();
    80001cfc:	0000b517          	auipc	a0,0xb
    80001d00:	04c53503          	ld	a0,76(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d04:	00001097          	auipc	ra,0x1
    80001d08:	f60080e7          	jalr	-160(ra) # 80002c64 <_ZN9Scheduler3getEv>
    80001d0c:	0000b797          	auipc	a5,0xb
    80001d10:	0347b783          	ld	a5,52(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d14:	00a7b023          	sd	a0,0(a5)
        if(Thread::running == nullptr) return -1;
    80001d18:	0c050863          	beqz	a0,80001de8 <_ZN9Semaphore8sem_waitEj+0x170>
        if(Thread::running->getContext()->isKernelThread){
    80001d1c:	00000097          	auipc	ra,0x0
    80001d20:	5b0080e7          	jalr	1456(ra) # 800022cc <_ZN6Thread10getContextEv>
    80001d24:	05053783          	ld	a5,80(a0)
    80001d28:	06079063          	bnez	a5,80001d88 <_ZN9Semaphore8sem_waitEj+0x110>
        if(Thread::running->getContext()->wasActive == 1){
    80001d2c:	0000b797          	auipc	a5,0xb
    80001d30:	0147b783          	ld	a5,20(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d34:	0007b503          	ld	a0,0(a5)
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	594080e7          	jalr	1428(ra) # 800022cc <_ZN6Thread10getContextEv>
    80001d40:	04053703          	ld	a4,64(a0)
    80001d44:	00100793          	li	a5,1
    80001d48:	06f70263          	beq	a4,a5,80001dac <_ZN9Semaphore8sem_waitEj+0x134>
            context_switch(oldRunning->getContext(), Thread::running->getContext());
    80001d4c:	00048513          	mv	a0,s1
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	57c080e7          	jalr	1404(ra) # 800022cc <_ZN6Thread10getContextEv>
    80001d58:	00050493          	mv	s1,a0
    80001d5c:	0000b797          	auipc	a5,0xb
    80001d60:	fe47b783          	ld	a5,-28(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d64:	0007b503          	ld	a0,0(a5)
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	564080e7          	jalr	1380(ra) # 800022cc <_ZN6Thread10getContextEv>
    80001d70:	00050593          	mv	a1,a0
    80001d74:	00048513          	mv	a0,s1
    80001d78:	fffff097          	auipc	ra,0xfffff
    80001d7c:	530080e7          	jalr	1328(ra) # 800012a8 <context_switch>
    return 0;
    80001d80:	00000513          	li	a0,0
    80001d84:	f55ff06f          	j	80001cd8 <_ZN9Semaphore8sem_waitEj+0x60>
            ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    80001d88:	0000b797          	auipc	a5,0xb
    80001d8c:	fb87b783          	ld	a5,-72(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d90:	0007b503          	ld	a0,0(a5)
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	7fc080e7          	jalr	2044(ra) # 80002590 <_ZN6Thread14getWrapperArgsEv>
            wa->userFunc(wa->userArgs);
    80001d9c:	00053783          	ld	a5,0(a0)
    80001da0:	00853503          	ld	a0,8(a0)
    80001da4:	000780e7          	jalr	a5
    80001da8:	f85ff06f          	j	80001d2c <_ZN9Semaphore8sem_waitEj+0xb4>
            RiscV::w_last_sstatus();
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	330080e7          	jalr	816(ra) # 800020dc <_ZN5RiscV14w_last_sstatusEv>
            RiscV::w_last_sepc();
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	304080e7          	jalr	772(ra) # 800020b8 <_ZN5RiscV11w_last_sepcEv>
            restore_context_kernel_mode(Thread::running->getContext());
    80001dbc:	0000b797          	auipc	a5,0xb
    80001dc0:	f847b783          	ld	a5,-124(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001dc4:	0007b503          	ld	a0,0(a5)
    80001dc8:	00000097          	auipc	ra,0x0
    80001dcc:	504080e7          	jalr	1284(ra) # 800022cc <_ZN6Thread10getContextEv>
    80001dd0:	fffff097          	auipc	ra,0xfffff
    80001dd4:	35c080e7          	jalr	860(ra) # 8000112c <restore_context_kernel_mode>
    return 0;
    80001dd8:	00000513          	li	a0,0
    80001ddc:	efdff06f          	j	80001cd8 <_ZN9Semaphore8sem_waitEj+0x60>
    if(semaphore == nullptr) return -1;
    80001de0:	fff00513          	li	a0,-1
    80001de4:	ef5ff06f          	j	80001cd8 <_ZN9Semaphore8sem_waitEj+0x60>
        if(Thread::running == nullptr) return -1;
    80001de8:	fff00513          	li	a0,-1
    80001dec:	eedff06f          	j	80001cd8 <_ZN9Semaphore8sem_waitEj+0x60>

0000000080001df0 <_ZN9Semaphore4waitEv>:
int  Semaphore::wait(){
    80001df0:	ff010113          	addi	sp,sp,-16
    80001df4:	00113423          	sd	ra,8(sp)
    80001df8:	00813023          	sd	s0,0(sp)
    80001dfc:	01010413          	addi	s0,sp,16
    sem_wait(this->myHandle);
    80001e00:	00852503          	lw	a0,8(a0)
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	e74080e7          	jalr	-396(ra) # 80001c78 <_ZN9Semaphore8sem_waitEj>
}
    80001e0c:	00000513          	li	a0,0
    80001e10:	00813083          	ld	ra,8(sp)
    80001e14:	00013403          	ld	s0,0(sp)
    80001e18:	01010113          	addi	sp,sp,16
    80001e1c:	00008067          	ret

0000000080001e20 <_ZN9Semaphore10sem_signalEj>:

int Semaphore::sem_signal(sem_t id) {
    80001e20:	fe010113          	addi	sp,sp,-32
    80001e24:	00113c23          	sd	ra,24(sp)
    80001e28:	00813823          	sd	s0,16(sp)
    80001e2c:	00913423          	sd	s1,8(sp)
    80001e30:	02010413          	addi	s0,sp,32
    80001e34:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001e38:	00002097          	auipc	ra,0x2
    80001e3c:	8d8080e7          	jalr	-1832(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80001e40:	00001097          	auipc	ra,0x1
    80001e44:	62c080e7          	jalr	1580(ra) # 8000346c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001e48:	00048593          	mv	a1,s1
    80001e4c:	00002097          	auipc	ra,0x2
    80001e50:	e8c080e7          	jalr	-372(ra) # 80003cd8 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    if(semaphore == nullptr) return -1;
    80001e54:	06050663          	beqz	a0,80001ec0 <_ZN9Semaphore10sem_signalEj+0xa0>
    semaphore->val++;
    80001e58:	00c52783          	lw	a5,12(a0)
    80001e5c:	0017879b          	addiw	a5,a5,1
    80001e60:	00f52623          	sw	a5,12(a0)
    if(!semaphore->waiting.empty()){
    80001e64:	01050493          	addi	s1,a0,16
    80001e68:	00048513          	mv	a0,s1
    80001e6c:	00002097          	auipc	ra,0x2
    80001e70:	dec080e7          	jalr	-532(ra) # 80003c58 <_ZN4ListI6ThreadE5emptyEv>
    80001e74:	00050e63          	beqz	a0,80001e90 <_ZN9Semaphore10sem_signalEj+0x70>
        //Unblock one thread and put it in Scheduler as ready
        Thread* thread = semaphore->waiting.remove_beginning();
        scheduler.put(thread);
        thread->semWaitStatus = 0;
    }
    return 0;
    80001e78:	00000513          	li	a0,0
}
    80001e7c:	01813083          	ld	ra,24(sp)
    80001e80:	01013403          	ld	s0,16(sp)
    80001e84:	00813483          	ld	s1,8(sp)
    80001e88:	02010113          	addi	sp,sp,32
    80001e8c:	00008067          	ret
        Thread* thread = semaphore->waiting.remove_beginning();
    80001e90:	00048513          	mv	a0,s1
    80001e94:	00002097          	auipc	ra,0x2
    80001e98:	d60080e7          	jalr	-672(ra) # 80003bf4 <_ZN4ListI6ThreadE16remove_beginningEv>
    80001e9c:	00050493          	mv	s1,a0
        scheduler.put(thread);
    80001ea0:	00050593          	mv	a1,a0
    80001ea4:	0000b517          	auipc	a0,0xb
    80001ea8:	ea453503          	ld	a0,-348(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001eac:	00001097          	auipc	ra,0x1
    80001eb0:	d80080e7          	jalr	-640(ra) # 80002c2c <_ZN9Scheduler3putEP6Thread>
        thread->semWaitStatus = 0;
    80001eb4:	0004a423          	sw	zero,8(s1)
    return 0;
    80001eb8:	00000513          	li	a0,0
    80001ebc:	fc1ff06f          	j	80001e7c <_ZN9Semaphore10sem_signalEj+0x5c>
    if(semaphore == nullptr) return -1;
    80001ec0:	fff00513          	li	a0,-1
    80001ec4:	fb9ff06f          	j	80001e7c <_ZN9Semaphore10sem_signalEj+0x5c>

0000000080001ec8 <_ZN9Semaphore6signalEv>:
int Semaphore::signal(){
    80001ec8:	ff010113          	addi	sp,sp,-16
    80001ecc:	00113423          	sd	ra,8(sp)
    80001ed0:	00813023          	sd	s0,0(sp)
    80001ed4:	01010413          	addi	s0,sp,16
    sem_signal(this->myHandle);
    80001ed8:	00852503          	lw	a0,8(a0)
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	f44080e7          	jalr	-188(ra) # 80001e20 <_ZN9Semaphore10sem_signalEj>
}
    80001ee4:	00000513          	li	a0,0
    80001ee8:	00813083          	ld	ra,8(sp)
    80001eec:	00013403          	ld	s0,0(sp)
    80001ef0:	01010113          	addi	sp,sp,16
    80001ef4:	00008067          	ret

0000000080001ef8 <_ZN5RiscV23initialSstatusForThreadEv>:

uint64 RiscV::last_sepc = 0;
uint64 RiscV::last_sstatus = 0;

// --- Initial SSTATUS za novu nit ---
uint64 RiscV::initialSstatusForThread() {
    80001ef8:	ff010113          	addi	sp,sp,-16
    80001efc:	00813423          	sd	s0,8(sp)
    80001f00:	01010413          	addi	s0,sp,16

    // SIE = 0 → trenutno maskirani svi prekidi u kernel modu
    sstatus &= ~(1UL << 1);

    return sstatus;
}
    80001f04:	02000513          	li	a0,32
    80001f08:	00813403          	ld	s0,8(sp)
    80001f0c:	01010113          	addi	sp,sp,16
    80001f10:	00008067          	ret

0000000080001f14 <_ZN5RiscV6ms_sipEm>:

// --- SIP manipulacija ---
void RiscV::ms_sip(uint64 mask) {
    80001f14:	ff010113          	addi	sp,sp,-16
    80001f18:	00813423          	sd	s0,8(sp)
    80001f1c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sip, %[mask]" :: [mask] "r"(mask));
    80001f20:	14452073          	csrs	sip,a0
}
    80001f24:	00813403          	ld	s0,8(sp)
    80001f28:	01010113          	addi	sp,sp,16
    80001f2c:	00008067          	ret

0000000080001f30 <_ZN5RiscV6mc_sipEm>:

void RiscV::mc_sip(uint64 mask) {
    80001f30:	ff010113          	addi	sp,sp,-16
    80001f34:	00813423          	sd	s0,8(sp)
    80001f38:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sip, %[mask]" :: [mask] "r"(mask));
    80001f3c:	14453073          	csrc	sip,a0
}
    80001f40:	00813403          	ld	s0,8(sp)
    80001f44:	01010113          	addi	sp,sp,16
    80001f48:	00008067          	ret

0000000080001f4c <_ZN5RiscV5r_sipEv>:

uint64 RiscV::r_sip() {
    80001f4c:	ff010113          	addi	sp,sp,-16
    80001f50:	00813423          	sd	s0,8(sp)
    80001f54:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], sip" : [val] "=r"(val));
    80001f58:	14402573          	csrr	a0,sip
    return val;
}
    80001f5c:	00813403          	ld	s0,8(sp)
    80001f60:	01010113          	addi	sp,sp,16
    80001f64:	00008067          	ret

0000000080001f68 <_ZN5RiscV7r_stvecEv>:

// --- STVEC manipulacija ---
uint64 RiscV::r_stvec() {
    80001f68:	ff010113          	addi	sp,sp,-16
    80001f6c:	00813423          	sd	s0,8(sp)
    80001f70:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], stvec" : [val] "=r"(val));
    80001f74:	10502573          	csrr	a0,stvec
    return val;
}
    80001f78:	00813403          	ld	s0,8(sp)
    80001f7c:	01010113          	addi	sp,sp,16
    80001f80:	00008067          	ret

0000000080001f84 <_ZN5RiscV7w_stvecEm>:

void RiscV::w_stvec(uint64 val) {
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00813423          	sd	s0,8(sp)
    80001f8c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[val]" :: [val] "r"(val));
    80001f90:	10551073          	csrw	stvec,a0
}
    80001f94:	00813403          	ld	s0,8(sp)
    80001f98:	01010113          	addi	sp,sp,16
    80001f9c:	00008067          	ret

0000000080001fa0 <_ZN5RiscV6r_sepcEv>:

// --- SEPC manipulacija ---


 uint64 RiscV::r_sepc() {
    80001fa0:	ff010113          	addi	sp,sp,-16
    80001fa4:	00813423          	sd	s0,8(sp)
    80001fa8:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %0, sepc" : "=r"(val));
    80001fac:	14102573          	csrr	a0,sepc
    last_sepc = val;
    80001fb0:	0000b797          	auipc	a5,0xb
    80001fb4:	dea7b823          	sd	a0,-528(a5) # 8000cda0 <_ZN5RiscV9last_sepcE>
    return val;
}
    80001fb8:	00813403          	ld	s0,8(sp)
    80001fbc:	01010113          	addi	sp,sp,16
    80001fc0:	00008067          	ret

0000000080001fc4 <_ZN5RiscV9r_sstatusEv>:

 uint64 RiscV::r_sstatus() {
    80001fc4:	ff010113          	addi	sp,sp,-16
    80001fc8:	00813423          	sd	s0,8(sp)
    80001fcc:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %0, sstatus" : "=r"(val));
    80001fd0:	10002573          	csrr	a0,sstatus
    last_sstatus = val;
    80001fd4:	0000b797          	auipc	a5,0xb
    80001fd8:	dca7ba23          	sd	a0,-556(a5) # 8000cda8 <_ZN5RiscV12last_sstatusE>
    return val;
}
    80001fdc:	00813403          	ld	s0,8(sp)
    80001fe0:	01010113          	addi	sp,sp,16
    80001fe4:	00008067          	ret

0000000080001fe8 <_ZN5RiscV10ms_sstatusEm>:
// --- SSTATUS manipulacija ---
void RiscV::ms_sstatus(uint64 mask) {
    80001fe8:	ff010113          	addi	sp,sp,-16
    80001fec:	00813423          	sd	s0,8(sp)
    80001ff0:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sstatus, %[mask]" :: [mask] "r"(mask));
    80001ff4:	10052073          	csrs	sstatus,a0
}
    80001ff8:	00813403          	ld	s0,8(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret

0000000080002004 <_ZN5RiscV10mc_sstatusEm>:

void RiscV::mc_sstatus(uint64 mask) {
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sstatus, %[mask]" :: [mask] "r"(mask));
    80002010:	10053073          	csrc	sstatus,a0
}
    80002014:	00813403          	ld	s0,8(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_ZN5RiscV9w_sstatusEm>:



void RiscV::w_sstatus(uint64 val) {
    80002020:	ff010113          	addi	sp,sp,-16
    80002024:	00813423          	sd	s0,8(sp)
    80002028:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sstatus, %[val]" :: [val] "r"(val));
    8000202c:	10051073          	csrw	sstatus,a0
}
    80002030:	00813403          	ld	s0,8(sp)
    80002034:	01010113          	addi	sp,sp,16
    80002038:	00008067          	ret

000000008000203c <_ZN5RiscV4r_raEv>:


uint64 RiscV::r_ra() {
    8000203c:	ff010113          	addi	sp,sp,-16
    80002040:	00813423          	sd	s0,8(sp)
    80002044:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("mv %[val], ra" : [val] "=r"(val));
    80002048:	00008513          	mv	a0,ra
    return val;
}
    8000204c:	00813403          	ld	s0,8(sp)
    80002050:	01010113          	addi	sp,sp,16
    80002054:	00008067          	ret

0000000080002058 <_ZN5RiscV4w_raEm>:

void RiscV::w_ra(uint64 val) {
    80002058:	ff010113          	addi	sp,sp,-16
    8000205c:	00813423          	sd	s0,8(sp)
    80002060:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv ra, %[val]" :: [val] "r"(val));
    80002064:	00050093          	mv	ra,a0
}
    80002068:	00813403          	ld	s0,8(sp)
    8000206c:	01010113          	addi	sp,sp,16
    80002070:	00008067          	ret

0000000080002074 <_ZN5RiscV6w_sepcEm>:

void RiscV::w_sepc(uint64 val) {
    80002074:	ff010113          	addi	sp,sp,-16
    80002078:	00813423          	sd	s0,8(sp)
    8000207c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, %0" :: "r"(val));
    80002080:	14151073          	csrw	sepc,a0
}
    80002084:	00813403          	ld	s0,8(sp)
    80002088:	01010113          	addi	sp,sp,16
    8000208c:	00008067          	ret

0000000080002090 <_ZN5RiscV16switchToUserModeEv>:


void RiscV::switchToUserMode(){
    80002090:	ff010113          	addi	sp,sp,-16
    80002094:	00813423          	sd	s0,8(sp)
    80002098:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sstatus, %0" ::"r"(SSTATUS_SPP)); // prebaci u U-mode
    8000209c:	10000793          	li	a5,256
    800020a0:	1007b073          	csrc	sstatus,a5
    __asm__  volatile("csrw sepc, ra");
    800020a4:	14109073          	csrw	sepc,ra
    __asm__  volatile("sret");
    800020a8:	10200073          	sret
}
    800020ac:	00813403          	ld	s0,8(sp)
    800020b0:	01010113          	addi	sp,sp,16
    800020b4:	00008067          	ret

00000000800020b8 <_ZN5RiscV11w_last_sepcEv>:

void RiscV::w_last_sepc() {
    800020b8:	ff010113          	addi	sp,sp,-16
    800020bc:	00813423          	sd	s0,8(sp)
    800020c0:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, %0" :: "r"(last_sepc));
    800020c4:	0000b797          	auipc	a5,0xb
    800020c8:	cdc7b783          	ld	a5,-804(a5) # 8000cda0 <_ZN5RiscV9last_sepcE>
    800020cc:	14179073          	csrw	sepc,a5
}
    800020d0:	00813403          	ld	s0,8(sp)
    800020d4:	01010113          	addi	sp,sp,16
    800020d8:	00008067          	ret

00000000800020dc <_ZN5RiscV14w_last_sstatusEv>:

void RiscV::w_last_sstatus() {
    800020dc:	ff010113          	addi	sp,sp,-16
    800020e0:	00813423          	sd	s0,8(sp)
    800020e4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sstatus, %0" :: "r"(last_sstatus));
    800020e8:	0000b797          	auipc	a5,0xb
    800020ec:	cc07b783          	ld	a5,-832(a5) # 8000cda8 <_ZN5RiscV12last_sstatusE>
    800020f0:	10079073          	csrw	sstatus,a5
}
    800020f4:	00813403          	ld	s0,8(sp)
    800020f8:	01010113          	addi	sp,sp,16
    800020fc:	00008067          	ret

0000000080002100 <_ZN5RiscV8r_scauseEv>:
uint64 RiscV::r_scause() {
    80002100:	ff010113          	addi	sp,sp,-16
    80002104:	00813423          	sd	s0,8(sp)
    80002108:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %0, scause" : "=r"(val));
    8000210c:	14202573          	csrr	a0,scause

    return val;
    80002110:	00813403          	ld	s0,8(sp)
    80002114:	01010113          	addi	sp,sp,16
    80002118:	00008067          	ret

000000008000211c <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>:
    context.startedOnce = 0;
    context.wasActive = 0;
    context.timeSlice = DEFAULT_TIME_SLICE;
    context.ra = (uint64)&threadWrapper;
    wrapperArgs.userArgs = this;
    wrapperArgs.userFunc = this->body = [](void* obj){
    8000211c:	ff010113          	addi	sp,sp,-16
    80002120:	00113423          	sd	ra,8(sp)
    80002124:	00813023          	sd	s0,0(sp)
    80002128:	01010413          	addi	s0,sp,16
        static_cast<Thread*>(obj)->run();
    8000212c:	00053783          	ld	a5,0(a0)
    80002130:	0107b783          	ld	a5,16(a5)
    80002134:	000780e7          	jalr	a5
    };
    80002138:	00813083          	ld	ra,8(sp)
    8000213c:	00013403          	ld	s0,0(sp)
    80002140:	01010113          	addi	sp,sp,16
    80002144:	00008067          	ret

0000000080002148 <_ZN6ThreadD1Ev>:
        context_switch(&oldRunning->context, &Thread::running->context);
    }

}

Thread::~Thread(){}
    80002148:	ff010113          	addi	sp,sp,-16
    8000214c:	00813423          	sd	s0,8(sp)
    80002150:	01010413          	addi	s0,sp,16
    80002154:	00813403          	ld	s0,8(sp)
    80002158:	01010113          	addi	sp,sp,16
    8000215c:	00008067          	ret

0000000080002160 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*kernelBody)(void*), void* arg)
    80002160:	fd010113          	addi	sp,sp,-48
    80002164:	02113423          	sd	ra,40(sp)
    80002168:	02813023          	sd	s0,32(sp)
    8000216c:	00913c23          	sd	s1,24(sp)
    80002170:	01213823          	sd	s2,16(sp)
    80002174:	01313423          	sd	s3,8(sp)
    80002178:	03010413          	addi	s0,sp,48
    8000217c:	00050493          	mv	s1,a0
    80002180:	00058913          	mv	s2,a1
    80002184:	00060993          	mv	s3,a2
    80002188:	0000b797          	auipc	a5,0xb
    8000218c:	9d878793          	addi	a5,a5,-1576 # 8000cb60 <_ZTV6Thread+0x10>
    80002190:	00f53023          	sd	a5,0(a0)
    this->next = nullptr;
    80002194:	00053823          	sd	zero,16(a0)
    this->body = kernelBody;
    80002198:	08b53823          	sd	a1,144(a0)
    this->arg = arg;
    8000219c:	08c53c23          	sd	a2,152(a0)
    threadId = cnt++;
    800021a0:	0000b717          	auipc	a4,0xb
    800021a4:	c1070713          	addi	a4,a4,-1008 # 8000cdb0 <_ZN6Thread3cntE>
    800021a8:	00072783          	lw	a5,0(a4)
    800021ac:	0017869b          	addiw	a3,a5,1
    800021b0:	00d72023          	sw	a3,0(a4)
    800021b4:	00f52c23          	sw	a5,24(a0)
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    800021b8:	00001097          	auipc	ra,0x1
    800021bc:	558080e7          	jalr	1368(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    800021c0:	08100593          	li	a1,129
    800021c4:	00001097          	auipc	ra,0x1
    800021c8:	2c4080e7          	jalr	708(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    800021cc:	00850793          	addi	a5,a0,8
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;
    800021d0:	00002737          	lui	a4,0x2
    800021d4:	00870713          	addi	a4,a4,8 # 2008 <_entry-0x7fffdff8>
    800021d8:	00e50533          	add	a0,a0,a4
    context.userStack = nullptr;                 // kernel nit nema user stack
    800021dc:	0204b423          	sd	zero,40(s1)
    context.sp = (uint64)stack_top;
    800021e0:	02a4bc23          	sd	a0,56(s1)
    context.sstatus |= RiscV::SSTATUS_SPIE;
    800021e4:	02000713          	li	a4,32
    800021e8:	04e4b423          	sd	a4,72(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    800021ec:	02f4b823          	sd	a5,48(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    800021f0:	00001737          	lui	a4,0x1
    800021f4:	00e787b3          	add	a5,a5,a4
    800021f8:	04f4b023          	sd	a5,64(s1)
    context.startedOnce = 0;
    800021fc:	0404bc23          	sd	zero,88(s1)
    context.wasActive = 0;
    80002200:	0604b023          	sd	zero,96(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    80002204:	00200793          	li	a5,2
    80002208:	06f4b423          	sd	a5,104(s1)
    wrapperArgs.userArgs = arg;
    8000220c:	0934b023          	sd	s3,128(s1)
    wrapperArgs.userFunc = kernelBody;
    80002210:	0724bc23          	sd	s2,120(s1)
    context.ra = (uint64)&kernelThreadWrapper;
    80002214:	00000797          	auipc	a5,0x0
    80002218:	3e478793          	addi	a5,a5,996 # 800025f8 <_ZN6Thread19kernelThreadWrapperEv>
    8000221c:	04f4b823          	sd	a5,80(s1)
    context.isKernelThread = 1;
    80002220:	00100793          	li	a5,1
    80002224:	06f4b823          	sd	a5,112(s1)
}
    80002228:	02813083          	ld	ra,40(sp)
    8000222c:	02013403          	ld	s0,32(sp)
    80002230:	01813483          	ld	s1,24(sp)
    80002234:	01013903          	ld	s2,16(sp)
    80002238:	00813983          	ld	s3,8(sp)
    8000223c:	03010113          	addi	sp,sp,48
    80002240:	00008067          	ret

0000000080002244 <_ZN6Thread21clearTimeSliceCounterEv>:
void Thread::clearTimeSliceCounter() {
    80002244:	ff010113          	addi	sp,sp,-16
    80002248:	00813423          	sd	s0,8(sp)
    8000224c:	01010413          	addi	s0,sp,16
    Thread::timeSliceCounter = 0;
    80002250:	0000b797          	auipc	a5,0xb
    80002254:	b607b423          	sd	zero,-1176(a5) # 8000cdb8 <_ZN6Thread16timeSliceCounterE>
}
    80002258:	00813403          	ld	s0,8(sp)
    8000225c:	01010113          	addi	sp,sp,16
    80002260:	00008067          	ret

0000000080002264 <_ZN6Thread19getTimeSliceCounterEv>:
uint64 Thread::getTimeSliceCounter() {
    80002264:	ff010113          	addi	sp,sp,-16
    80002268:	00813423          	sd	s0,8(sp)
    8000226c:	01010413          	addi	s0,sp,16
}
    80002270:	0000b517          	auipc	a0,0xb
    80002274:	b4853503          	ld	a0,-1208(a0) # 8000cdb8 <_ZN6Thread16timeSliceCounterE>
    80002278:	00813403          	ld	s0,8(sp)
    8000227c:	01010113          	addi	sp,sp,16
    80002280:	00008067          	ret

0000000080002284 <_ZN6Thread25incrementtimeSliceCounterEv>:
void Thread::incrementtimeSliceCounter() {
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00813423          	sd	s0,8(sp)
    8000228c:	01010413          	addi	s0,sp,16
    Thread::timeSliceCounter++;
    80002290:	0000b717          	auipc	a4,0xb
    80002294:	b2070713          	addi	a4,a4,-1248 # 8000cdb0 <_ZN6Thread3cntE>
    80002298:	00873783          	ld	a5,8(a4)
    8000229c:	00178793          	addi	a5,a5,1
    800022a0:	00f73423          	sd	a5,8(a4)
}
    800022a4:	00813403          	ld	s0,8(sp)
    800022a8:	01010113          	addi	sp,sp,16
    800022ac:	00008067          	ret

00000000800022b0 <_ZN6Thread12getTimeSliceEv>:
uint64 Thread::getTimeSlice() {
    800022b0:	ff010113          	addi	sp,sp,-16
    800022b4:	00813423          	sd	s0,8(sp)
    800022b8:	01010413          	addi	s0,sp,16
}
    800022bc:	06853503          	ld	a0,104(a0)
    800022c0:	00813403          	ld	s0,8(sp)
    800022c4:	01010113          	addi	sp,sp,16
    800022c8:	00008067          	ret

00000000800022cc <_ZN6Thread10getContextEv>:

ThreadContext* Thread::getContext() {
    800022cc:	ff010113          	addi	sp,sp,-16
    800022d0:	00813423          	sd	s0,8(sp)
    800022d4:	01010413          	addi	s0,sp,16
    return &this->context;
}
    800022d8:	02050513          	addi	a0,a0,32
    800022dc:	00813403          	ld	s0,8(sp)
    800022e0:	01010113          	addi	sp,sp,16
    800022e4:	00008067          	ret

00000000800022e8 <_ZN6ThreadC1EPFvPvES0_S0_>:
Thread::Thread(void (*body)(void*), void* arg, void* stack_top) {
    800022e8:	fc010113          	addi	sp,sp,-64
    800022ec:	02113c23          	sd	ra,56(sp)
    800022f0:	02813823          	sd	s0,48(sp)
    800022f4:	02913423          	sd	s1,40(sp)
    800022f8:	03213023          	sd	s2,32(sp)
    800022fc:	01313c23          	sd	s3,24(sp)
    80002300:	01413823          	sd	s4,16(sp)
    80002304:	01513423          	sd	s5,8(sp)
    80002308:	04010413          	addi	s0,sp,64
    8000230c:	00050493          	mv	s1,a0
    80002310:	00058993          	mv	s3,a1
    80002314:	00060a13          	mv	s4,a2
    80002318:	00068913          	mv	s2,a3
    8000231c:	0000b797          	auipc	a5,0xb
    80002320:	84478793          	addi	a5,a5,-1980 # 8000cb60 <_ZTV6Thread+0x10>
    80002324:	00f53023          	sd	a5,0(a0)
    this->next = nullptr;
    80002328:	00053823          	sd	zero,16(a0)
    this->body = body;
    8000232c:	08b53823          	sd	a1,144(a0)
    this->arg = arg;
    80002330:	08c53c23          	sd	a2,152(a0)
    threadId = cnt++;
    80002334:	0000b797          	auipc	a5,0xb
    80002338:	a7c78793          	addi	a5,a5,-1412 # 8000cdb0 <_ZN6Thread3cntE>
    8000233c:	0007a703          	lw	a4,0(a5)
    80002340:	0017069b          	addiw	a3,a4,1
    80002344:	00d7a023          	sw	a3,0(a5)
    80002348:	00e52c23          	sw	a4,24(a0)
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    8000234c:	fffffab7          	lui	s5,0xfffff
    80002350:	01590ab3          	add	s5,s2,s5
    80002354:	03553423          	sd	s5,40(a0)
    context.sp = (uint64)stack_top;
    80002358:	03253c23          	sd	s2,56(a0)
    if (Thread::running != nullptr) {
    8000235c:	0107b503          	ld	a0,16(a5)
    80002360:	06050863          	beqz	a0,800023d0 <_ZN6ThreadC1EPFvPvES0_S0_+0xe8>
        context.sstatus = Thread::running->getContext()->sstatus;
    80002364:	00000097          	auipc	ra,0x0
    80002368:	f68080e7          	jalr	-152(ra) # 800022cc <_ZN6Thread10getContextEv>
    8000236c:	02853783          	ld	a5,40(a0)
    80002370:	04f4b423          	sd	a5,72(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    80002374:	ffffe6b7          	lui	a3,0xffffe
    80002378:	00d90933          	add	s2,s2,a3
    8000237c:	0324b823          	sd	s2,48(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    80002380:	0554b023          	sd	s5,64(s1)
    context.startedOnce = (uint64)0;
    80002384:	0404bc23          	sd	zero,88(s1)
    context.wasActive = (uint64)0;
    80002388:	0604b023          	sd	zero,96(s1)
    this->wrapperArgs.userArgs = arg;
    8000238c:	0944b023          	sd	s4,128(s1)
    this->wrapperArgs.userFunc = body;
    80002390:	0734bc23          	sd	s3,120(s1)
    context.ra = (uint64)&threadWrapper;
    80002394:	00000797          	auipc	a5,0x0
    80002398:	21878793          	addi	a5,a5,536 # 800025ac <_ZN6Thread13threadWrapperEv>
    8000239c:	04f4b823          	sd	a5,80(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    800023a0:	00200793          	li	a5,2
    800023a4:	06f4b423          	sd	a5,104(s1)
    context.isKernelThread = 0;
    800023a8:	0604b823          	sd	zero,112(s1)
}
    800023ac:	03813083          	ld	ra,56(sp)
    800023b0:	03013403          	ld	s0,48(sp)
    800023b4:	02813483          	ld	s1,40(sp)
    800023b8:	02013903          	ld	s2,32(sp)
    800023bc:	01813983          	ld	s3,24(sp)
    800023c0:	01013a03          	ld	s4,16(sp)
    800023c4:	00813a83          	ld	s5,8(sp)
    800023c8:	04010113          	addi	sp,sp,64
    800023cc:	00008067          	ret
        context.sstatus |= RiscV::SSTATUS_SPIE;
    800023d0:	02000793          	li	a5,32
    800023d4:	04f4b423          	sd	a5,72(s1)
    800023d8:	f9dff06f          	j	80002374 <_ZN6ThreadC1EPFvPvES0_S0_+0x8c>

00000000800023dc <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800023dc:	fe010113          	addi	sp,sp,-32
    800023e0:	00113c23          	sd	ra,24(sp)
    800023e4:	00813823          	sd	s0,16(sp)
    800023e8:	00913423          	sd	s1,8(sp)
    800023ec:	01213023          	sd	s2,0(sp)
    800023f0:	02010413          	addi	s0,sp,32
    800023f4:	00050493          	mv	s1,a0
    800023f8:	0000a797          	auipc	a5,0xa
    800023fc:	76878793          	addi	a5,a5,1896 # 8000cb60 <_ZTV6Thread+0x10>
    80002400:	00f53023          	sd	a5,0(a0)
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80002404:	00001097          	auipc	ra,0x1
    80002408:	30c080e7          	jalr	780(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    8000240c:	08100593          	li	a1,129
    80002410:	00001097          	auipc	ra,0x1
    80002414:	078080e7          	jalr	120(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    80002418:	00850913          	addi	s2,a0,8
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;
    8000241c:	000027b7          	lui	a5,0x2
    80002420:	00878793          	addi	a5,a5,8 # 2008 <_entry-0x7fffdff8>
    80002424:	00f507b3          	add	a5,a0,a5
    this->next = nullptr;
    80002428:	0004b823          	sd	zero,16(s1)
    this->body = nullptr;  // C++ nit nema body
    8000242c:	0804b823          	sd	zero,144(s1)
    this->arg = nullptr;
    80002430:	0804bc23          	sd	zero,152(s1)
    threadId = cnt++;
    80002434:	0000b717          	auipc	a4,0xb
    80002438:	97c70713          	addi	a4,a4,-1668 # 8000cdb0 <_ZN6Thread3cntE>
    8000243c:	00072683          	lw	a3,0(a4)
    80002440:	0016861b          	addiw	a2,a3,1
    80002444:	00c72023          	sw	a2,0(a4)
    80002448:	00d4ac23          	sw	a3,24(s1)
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    8000244c:	000016b7          	lui	a3,0x1
    80002450:	00868693          	addi	a3,a3,8 # 1008 <_entry-0x7fffeff8>
    80002454:	00d50533          	add	a0,a0,a3
    80002458:	02a4b423          	sd	a0,40(s1)
    context.sp = (uint64)stack_top;
    8000245c:	02f4bc23          	sd	a5,56(s1)
    if (Thread::running != nullptr) {
    80002460:	01073503          	ld	a0,16(a4)
    80002464:	06050863          	beqz	a0,800024d4 <_ZN6ThreadC1Ev+0xf8>
        context.sstatus = Thread::running->getContext()->sstatus;
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	e64080e7          	jalr	-412(ra) # 800022cc <_ZN6Thread10getContextEv>
    80002470:	02853783          	ld	a5,40(a0)
    80002474:	04f4b423          	sd	a5,72(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    80002478:	0324b823          	sd	s2,48(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    8000247c:	000017b7          	lui	a5,0x1
    80002480:	00f90933          	add	s2,s2,a5
    80002484:	0524b023          	sd	s2,64(s1)
    context.startedOnce = 0;
    80002488:	0404bc23          	sd	zero,88(s1)
    context.wasActive = 0;
    8000248c:	0604b023          	sd	zero,96(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    80002490:	00200793          	li	a5,2
    80002494:	06f4b423          	sd	a5,104(s1)
    context.ra = (uint64)&threadWrapper;
    80002498:	00000797          	auipc	a5,0x0
    8000249c:	11478793          	addi	a5,a5,276 # 800025ac <_ZN6Thread13threadWrapperEv>
    800024a0:	04f4b823          	sd	a5,80(s1)
    wrapperArgs.userArgs = this;
    800024a4:	0894b023          	sd	s1,128(s1)
    wrapperArgs.userFunc = this->body = [](void* obj){
    800024a8:	00000797          	auipc	a5,0x0
    800024ac:	c7478793          	addi	a5,a5,-908 # 8000211c <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>
    800024b0:	08f4b823          	sd	a5,144(s1)
    800024b4:	06f4bc23          	sd	a5,120(s1)
    context.isKernelThread = 0;
    800024b8:	0604b823          	sd	zero,112(s1)
}
    800024bc:	01813083          	ld	ra,24(sp)
    800024c0:	01013403          	ld	s0,16(sp)
    800024c4:	00813483          	ld	s1,8(sp)
    800024c8:	00013903          	ld	s2,0(sp)
    800024cc:	02010113          	addi	sp,sp,32
    800024d0:	00008067          	ret
        context.sstatus |= RiscV::SSTATUS_SPIE;
    800024d4:	02000793          	li	a5,32
    800024d8:	04f4b423          	sd	a5,72(s1)
    800024dc:	f9dff06f          	j	80002478 <_ZN6ThreadC1Ev+0x9c>

00000000800024e0 <_ZN6Thread18thread_exit_kernelEv>:
int Thread::thread_exit_kernel(){
    800024e0:	fd010113          	addi	sp,sp,-48
    800024e4:	02113423          	sd	ra,40(sp)
    800024e8:	02813023          	sd	s0,32(sp)
    800024ec:	00913c23          	sd	s1,24(sp)
    800024f0:	01213823          	sd	s2,16(sp)
    800024f4:	01313423          	sd	s3,8(sp)
    800024f8:	03010413          	addi	s0,sp,48
    Thread* oldRunning = Thread::running;
    800024fc:	0000b917          	auipc	s2,0xb
    80002500:	8b490913          	addi	s2,s2,-1868 # 8000cdb0 <_ZN6Thread3cntE>
    80002504:	01093983          	ld	s3,16(s2)
    Thread::running = scheduler.get();
    80002508:	0000b517          	auipc	a0,0xb
    8000250c:	84053503          	ld	a0,-1984(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002510:	00000097          	auipc	ra,0x0
    80002514:	754080e7          	jalr	1876(ra) # 80002c64 <_ZN9Scheduler3getEv>
    80002518:	00a93823          	sd	a0,16(s2)
    if(Thread::running){
    8000251c:	02050663          	beqz	a0,80002548 <_ZN6Thread18thread_exit_kernelEv+0x68>
    80002520:	00050493          	mv	s1,a0
        if(Thread::running->getContext()->wasActive == 1){
    80002524:	00000097          	auipc	ra,0x0
    80002528:	da8080e7          	jalr	-600(ra) # 800022cc <_ZN6Thread10getContextEv>
    8000252c:	04053703          	ld	a4,64(a0)
    80002530:	00100793          	li	a5,1
    80002534:	02f70a63          	beq	a4,a5,80002568 <_ZN6Thread18thread_exit_kernelEv+0x88>
            context_switch(&oldRunning->context, &Thread::running->context);
    80002538:	02048593          	addi	a1,s1,32
    8000253c:	02098513          	addi	a0,s3,32
    80002540:	fffff097          	auipc	ra,0xfffff
    80002544:	d68080e7          	jalr	-664(ra) # 800012a8 <context_switch>
}
    80002548:	00000513          	li	a0,0
    8000254c:	02813083          	ld	ra,40(sp)
    80002550:	02013403          	ld	s0,32(sp)
    80002554:	01813483          	ld	s1,24(sp)
    80002558:	01013903          	ld	s2,16(sp)
    8000255c:	00813983          	ld	s3,8(sp)
    80002560:	03010113          	addi	sp,sp,48
    80002564:	00008067          	ret
            RiscV::w_last_sstatus();
    80002568:	00000097          	auipc	ra,0x0
    8000256c:	b74080e7          	jalr	-1164(ra) # 800020dc <_ZN5RiscV14w_last_sstatusEv>
            RiscV::w_last_sepc();
    80002570:	00000097          	auipc	ra,0x0
    80002574:	b48080e7          	jalr	-1208(ra) # 800020b8 <_ZN5RiscV11w_last_sepcEv>
            restore_context_kernel_mode(&Thread::running->context);
    80002578:	0000b517          	auipc	a0,0xb
    8000257c:	84853503          	ld	a0,-1976(a0) # 8000cdc0 <_ZN6Thread7runningE>
    80002580:	02050513          	addi	a0,a0,32
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	ba8080e7          	jalr	-1112(ra) # 8000112c <restore_context_kernel_mode>
    8000258c:	fbdff06f          	j	80002548 <_ZN6Thread18thread_exit_kernelEv+0x68>

0000000080002590 <_ZN6Thread14getWrapperArgsEv>:

ThreadWrapperArgs* Thread::getWrapperArgs() {
    80002590:	ff010113          	addi	sp,sp,-16
    80002594:	00813423          	sd	s0,8(sp)
    80002598:	01010413          	addi	s0,sp,16
    return &this->wrapperArgs;
}
    8000259c:	07850513          	addi	a0,a0,120
    800025a0:	00813403          	ld	s0,8(sp)
    800025a4:	01010113          	addi	sp,sp,16
    800025a8:	00008067          	ret

00000000800025ac <_ZN6Thread13threadWrapperEv>:
void Thread::threadWrapper() {
    800025ac:	ff010113          	addi	sp,sp,-16
    800025b0:	00113423          	sd	ra,8(sp)
    800025b4:	00813023          	sd	s0,0(sp)
    800025b8:	01010413          	addi	s0,sp,16
    RiscV::switchToUserMode();
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	ad4080e7          	jalr	-1324(ra) # 80002090 <_ZN5RiscV16switchToUserModeEv>
    ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    800025c4:	0000a517          	auipc	a0,0xa
    800025c8:	7fc53503          	ld	a0,2044(a0) # 8000cdc0 <_ZN6Thread7runningE>
    800025cc:	00000097          	auipc	ra,0x0
    800025d0:	fc4080e7          	jalr	-60(ra) # 80002590 <_ZN6Thread14getWrapperArgsEv>
    wa->userFunc(wa->userArgs);
    800025d4:	00053783          	ld	a5,0(a0)
    800025d8:	00853503          	ld	a0,8(a0)
    800025dc:	000780e7          	jalr	a5
    thread_exit();
    800025e0:	fffff097          	auipc	ra,0xfffff
    800025e4:	03c080e7          	jalr	60(ra) # 8000161c <thread_exit>
}
    800025e8:	00813083          	ld	ra,8(sp)
    800025ec:	00013403          	ld	s0,0(sp)
    800025f0:	01010113          	addi	sp,sp,16
    800025f4:	00008067          	ret

00000000800025f8 <_ZN6Thread19kernelThreadWrapperEv>:
void Thread::kernelThreadWrapper() {
    800025f8:	ff010113          	addi	sp,sp,-16
    800025fc:	00113423          	sd	ra,8(sp)
    80002600:	00813023          	sd	s0,0(sp)
    80002604:	01010413          	addi	s0,sp,16
    ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    80002608:	0000a517          	auipc	a0,0xa
    8000260c:	7b853503          	ld	a0,1976(a0) # 8000cdc0 <_ZN6Thread7runningE>
    80002610:	00000097          	auipc	ra,0x0
    80002614:	f80080e7          	jalr	-128(ra) # 80002590 <_ZN6Thread14getWrapperArgsEv>
    wa->userFunc(wa->userArgs);
    80002618:	00053783          	ld	a5,0(a0)
    8000261c:	00853503          	ld	a0,8(a0)
    80002620:	000780e7          	jalr	a5
    thread_exit_kernel();
    80002624:	00000097          	auipc	ra,0x0
    80002628:	ebc080e7          	jalr	-324(ra) # 800024e0 <_ZN6Thread18thread_exit_kernelEv>
}
    8000262c:	00813083          	ld	ra,8(sp)
    80002630:	00013403          	ld	s0,0(sp)
    80002634:	01010113          	addi	sp,sp,16
    80002638:	00008067          	ret

000000008000263c <_ZN6Thread22thread_dispatch_kernelEv>:
void Thread::thread_dispatch_kernel() {
    8000263c:	fe010113          	addi	sp,sp,-32
    80002640:	00113c23          	sd	ra,24(sp)
    80002644:	00813823          	sd	s0,16(sp)
    80002648:	00913423          	sd	s1,8(sp)
    8000264c:	01213023          	sd	s2,0(sp)
    80002650:	02010413          	addi	s0,sp,32
    Thread* oldRunning = Thread::running;
    80002654:	0000a917          	auipc	s2,0xa
    80002658:	76c93903          	ld	s2,1900(s2) # 8000cdc0 <_ZN6Thread7runningE>
    if(oldRunning)
    8000265c:	00090c63          	beqz	s2,80002674 <_ZN6Thread22thread_dispatch_kernelEv+0x38>
        scheduler.put(oldRunning);
    80002660:	00090593          	mv	a1,s2
    80002664:	0000a517          	auipc	a0,0xa
    80002668:	6e453503          	ld	a0,1764(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000266c:	00000097          	auipc	ra,0x0
    80002670:	5c0080e7          	jalr	1472(ra) # 80002c2c <_ZN9Scheduler3putEP6Thread>
    Thread::running = scheduler.get();
    80002674:	0000a517          	auipc	a0,0xa
    80002678:	6d453503          	ld	a0,1748(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000267c:	00000097          	auipc	ra,0x0
    80002680:	5e8080e7          	jalr	1512(ra) # 80002c64 <_ZN9Scheduler3getEv>
    80002684:	00050493          	mv	s1,a0
    80002688:	0000a797          	auipc	a5,0xa
    8000268c:	72a7bc23          	sd	a0,1848(a5) # 8000cdc0 <_ZN6Thread7runningE>
    if(Thread::running->getContext()->isKernelThread){
    80002690:	00000097          	auipc	ra,0x0
    80002694:	c3c080e7          	jalr	-964(ra) # 800022cc <_ZN6Thread10getContextEv>
    80002698:	05053783          	ld	a5,80(a0)
    8000269c:	00078e63          	beqz	a5,800026b8 <_ZN6Thread22thread_dispatch_kernelEv+0x7c>
        ThreadWrapperArgs *wa = Thread::running->getWrapperArgs();
    800026a0:	00048513          	mv	a0,s1
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	eec080e7          	jalr	-276(ra) # 80002590 <_ZN6Thread14getWrapperArgsEv>
        wa->userFunc(wa->userArgs);
    800026ac:	00053783          	ld	a5,0(a0)
    800026b0:	00853503          	ld	a0,8(a0)
    800026b4:	000780e7          	jalr	a5
    if(Thread::running->getContext()->wasActive == 1){
    800026b8:	0000a497          	auipc	s1,0xa
    800026bc:	7084b483          	ld	s1,1800(s1) # 8000cdc0 <_ZN6Thread7runningE>
    800026c0:	00048513          	mv	a0,s1
    800026c4:	00000097          	auipc	ra,0x0
    800026c8:	c08080e7          	jalr	-1016(ra) # 800022cc <_ZN6Thread10getContextEv>
    800026cc:	04053703          	ld	a4,64(a0)
    800026d0:	00100793          	li	a5,1
    800026d4:	02f70a63          	beq	a4,a5,80002708 <_ZN6Thread22thread_dispatch_kernelEv+0xcc>
        Thread::running->getContext()->wasActive = 1;
    800026d8:	00100793          	li	a5,1
    800026dc:	04f53023          	sd	a5,64(a0)
        context_switch(&oldRunning->context, &Thread::running->context);
    800026e0:	02048593          	addi	a1,s1,32
    800026e4:	02090513          	addi	a0,s2,32
    800026e8:	fffff097          	auipc	ra,0xfffff
    800026ec:	bc0080e7          	jalr	-1088(ra) # 800012a8 <context_switch>
}
    800026f0:	01813083          	ld	ra,24(sp)
    800026f4:	01013403          	ld	s0,16(sp)
    800026f8:	00813483          	ld	s1,8(sp)
    800026fc:	00013903          	ld	s2,0(sp)
    80002700:	02010113          	addi	sp,sp,32
    80002704:	00008067          	ret
        RiscV::w_last_sstatus();
    80002708:	00000097          	auipc	ra,0x0
    8000270c:	9d4080e7          	jalr	-1580(ra) # 800020dc <_ZN5RiscV14w_last_sstatusEv>
        RiscV::w_last_sepc();
    80002710:	00000097          	auipc	ra,0x0
    80002714:	9a8080e7          	jalr	-1624(ra) # 800020b8 <_ZN5RiscV11w_last_sepcEv>
        restore_context_kernel_mode(&Thread::running->context);
    80002718:	0000a517          	auipc	a0,0xa
    8000271c:	6a853503          	ld	a0,1704(a0) # 8000cdc0 <_ZN6Thread7runningE>
    80002720:	02050513          	addi	a0,a0,32
    80002724:	fffff097          	auipc	ra,0xfffff
    80002728:	a08080e7          	jalr	-1528(ra) # 8000112c <restore_context_kernel_mode>
    8000272c:	fc5ff06f          	j	800026f0 <_ZN6Thread22thread_dispatch_kernelEv+0xb4>

0000000080002730 <_ZN6ThreadnwEm>:
void* Thread::operator new(size_t size){
    80002730:	ff010113          	addi	sp,sp,-16
    80002734:	00113423          	sd	ra,8(sp)
    80002738:	00813023          	sd	s0,0(sp)
    8000273c:	01010413          	addi	s0,sp,16

    void* mem = (void*)MemoryAllocator::Instance()->getThreadPool().allocate();
    80002740:	00001097          	auipc	ra,0x1
    80002744:	fd0080e7          	jalr	-48(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80002748:	00001097          	auipc	ra,0x1
    8000274c:	d08080e7          	jalr	-760(ra) # 80003450 <_ZN15MemoryAllocator13getThreadPoolEv>
    80002750:	fffff097          	auipc	ra,0xfffff
    80002754:	1c8080e7          	jalr	456(ra) # 80001918 <_ZN10ThreadPool8allocateEv>
    return mem;
}
    80002758:	00813083          	ld	ra,8(sp)
    8000275c:	00013403          	ld	s0,0(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>:
    if(!handle || !routine || !stack_top)return -1;
    80002768:	0c050463          	beqz	a0,80002830 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xc8>
int Thread::create_thread_kernel(thread_t* handle, void(*routine)(void*) , void* args, void* stack_top){
    8000276c:	fc010113          	addi	sp,sp,-64
    80002770:	02113c23          	sd	ra,56(sp)
    80002774:	02813823          	sd	s0,48(sp)
    80002778:	02913423          	sd	s1,40(sp)
    8000277c:	03213023          	sd	s2,32(sp)
    80002780:	01313c23          	sd	s3,24(sp)
    80002784:	01413823          	sd	s4,16(sp)
    80002788:	01513423          	sd	s5,8(sp)
    8000278c:	04010413          	addi	s0,sp,64
    80002790:	00050913          	mv	s2,a0
    80002794:	00058993          	mv	s3,a1
    80002798:	00060a93          	mv	s5,a2
    8000279c:	00068a13          	mv	s4,a3
    if(!handle || !routine || !stack_top)return -1;
    800027a0:	08058c63          	beqz	a1,80002838 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xd0>
    800027a4:	08068e63          	beqz	a3,80002840 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xd8>
    Thread* thread = new Thread(routine, args, stack_top);
    800027a8:	0a000513          	li	a0,160
    800027ac:	00000097          	auipc	ra,0x0
    800027b0:	f84080e7          	jalr	-124(ra) # 80002730 <_ZN6ThreadnwEm>
    800027b4:	00050493          	mv	s1,a0
    800027b8:	000a0693          	mv	a3,s4
    800027bc:	000a8613          	mv	a2,s5
    800027c0:	00098593          	mv	a1,s3
    800027c4:	00000097          	auipc	ra,0x0
    800027c8:	b24080e7          	jalr	-1244(ra) # 800022e8 <_ZN6ThreadC1EPFvPvES0_S0_>
    if(!thread) return -2;
    800027cc:	06048e63          	beqz	s1,80002848 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xe0>
    *handle =  thread->threadId;
    800027d0:	0184a783          	lw	a5,24(s1)
    800027d4:	00f92023          	sw	a5,0(s2)
    if(!Thread::running){
    800027d8:	0000a797          	auipc	a5,0xa
    800027dc:	5e87b783          	ld	a5,1512(a5) # 8000cdc0 <_ZN6Thread7runningE>
    800027e0:	04078063          	beqz	a5,80002820 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xb8>
    scheduler.put(thread);
    800027e4:	00048593          	mv	a1,s1
    800027e8:	0000a517          	auipc	a0,0xa
    800027ec:	56053503          	ld	a0,1376(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    800027f0:	00000097          	auipc	ra,0x0
    800027f4:	43c080e7          	jalr	1084(ra) # 80002c2c <_ZN9Scheduler3putEP6Thread>
    return 0;
    800027f8:	00000513          	li	a0,0
}
    800027fc:	03813083          	ld	ra,56(sp)
    80002800:	03013403          	ld	s0,48(sp)
    80002804:	02813483          	ld	s1,40(sp)
    80002808:	02013903          	ld	s2,32(sp)
    8000280c:	01813983          	ld	s3,24(sp)
    80002810:	01013a03          	ld	s4,16(sp)
    80002814:	00813a83          	ld	s5,8(sp)
    80002818:	04010113          	addi	sp,sp,64
    8000281c:	00008067          	ret
        Thread::running = thread;
    80002820:	0000a797          	auipc	a5,0xa
    80002824:	5a97b023          	sd	s1,1440(a5) # 8000cdc0 <_ZN6Thread7runningE>
        return 0;
    80002828:	00000513          	li	a0,0
    8000282c:	fd1ff06f          	j	800027fc <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    if(!handle || !routine || !stack_top)return -1;
    80002830:	fff00513          	li	a0,-1
}
    80002834:	00008067          	ret
    if(!handle || !routine || !stack_top)return -1;
    80002838:	fff00513          	li	a0,-1
    8000283c:	fc1ff06f          	j	800027fc <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    80002840:	fff00513          	li	a0,-1
    80002844:	fb9ff06f          	j	800027fc <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    if(!thread) return -2;
    80002848:	ffe00513          	li	a0,-2
    8000284c:	fb1ff06f          	j	800027fc <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>

0000000080002850 <_ZN6ThreaddlEPv>:
void Thread::operator delete(void* mem )noexcept{
    80002850:	fe010113          	addi	sp,sp,-32
    80002854:	00113c23          	sd	ra,24(sp)
    80002858:	00813823          	sd	s0,16(sp)
    8000285c:	00913423          	sd	s1,8(sp)
    80002860:	02010413          	addi	s0,sp,32
    80002864:	00050493          	mv	s1,a0
MemoryAllocator::Instance()->getThreadPool().deallocate((Thread*) mem);
    80002868:	00001097          	auipc	ra,0x1
    8000286c:	ea8080e7          	jalr	-344(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80002870:	00001097          	auipc	ra,0x1
    80002874:	be0080e7          	jalr	-1056(ra) # 80003450 <_ZN15MemoryAllocator13getThreadPoolEv>
    80002878:	00048593          	mv	a1,s1
    8000287c:	fffff097          	auipc	ra,0xfffff
    80002880:	100080e7          	jalr	256(ra) # 8000197c <_ZN10ThreadPool10deallocateEP6Thread>
}
    80002884:	01813083          	ld	ra,24(sp)
    80002888:	01013403          	ld	s0,16(sp)
    8000288c:	00813483          	ld	s1,8(sp)
    80002890:	02010113          	addi	sp,sp,32
    80002894:	00008067          	ret

0000000080002898 <_ZN6ThreadD0Ev>:
Thread::~Thread(){}
    80002898:	ff010113          	addi	sp,sp,-16
    8000289c:	00113423          	sd	ra,8(sp)
    800028a0:	00813023          	sd	s0,0(sp)
    800028a4:	01010413          	addi	s0,sp,16
    800028a8:	00000097          	auipc	ra,0x0
    800028ac:	fa8080e7          	jalr	-88(ra) # 80002850 <_ZN6ThreaddlEPv>
    800028b0:	00813083          	ld	ra,8(sp)
    800028b4:	00013403          	ld	s0,0(sp)
    800028b8:	01010113          	addi	sp,sp,16
    800028bc:	00008067          	ret

00000000800028c0 <_ZN6Thread8dispatchEv>:

void Thread::dispatch(){
    800028c0:	ff010113          	addi	sp,sp,-16
    800028c4:	00113423          	sd	ra,8(sp)
    800028c8:	00813023          	sd	s0,0(sp)
    800028cc:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	d7c080e7          	jalr	-644(ra) # 8000164c <thread_dispatch>
}
    800028d8:	00813083          	ld	ra,8(sp)
    800028dc:	00013403          	ld	s0,0(sp)
    800028e0:	01010113          	addi	sp,sp,16
    800028e4:	00008067          	ret

00000000800028e8 <_ZN6Thread5startEv>:

int Thread::start() {
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00113423          	sd	ra,8(sp)
    800028f0:	00813023          	sd	s0,0(sp)
    800028f4:	01010413          	addi	s0,sp,16
    800028f8:	00050593          	mv	a1,a0
    scheduler.put(this);
    800028fc:	0000a517          	auipc	a0,0xa
    80002900:	44c53503          	ld	a0,1100(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002904:	00000097          	auipc	ra,0x0
    80002908:	328080e7          	jalr	808(ra) # 80002c2c <_ZN9Scheduler3putEP6Thread>

    if(Thread::running == nullptr) {
    8000290c:	0000a797          	auipc	a5,0xa
    80002910:	4b47b783          	ld	a5,1204(a5) # 8000cdc0 <_ZN6Thread7runningE>
    80002914:	00078c63          	beqz	a5,8000292c <_ZN6Thread5startEv+0x44>
        Thread::running = scheduler.get();
        if(Thread::running == nullptr) return -1;

    }
    return 0;
    80002918:	00000513          	li	a0,0
}
    8000291c:	00813083          	ld	ra,8(sp)
    80002920:	00013403          	ld	s0,0(sp)
    80002924:	01010113          	addi	sp,sp,16
    80002928:	00008067          	ret
        Thread::running = scheduler.get();
    8000292c:	0000a517          	auipc	a0,0xa
    80002930:	41c53503          	ld	a0,1052(a0) # 8000cd48 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002934:	00000097          	auipc	ra,0x0
    80002938:	330080e7          	jalr	816(ra) # 80002c64 <_ZN9Scheduler3getEv>
    8000293c:	0000a797          	auipc	a5,0xa
    80002940:	48a7b223          	sd	a0,1156(a5) # 8000cdc0 <_ZN6Thread7runningE>
        if(Thread::running == nullptr) return -1;
    80002944:	00050663          	beqz	a0,80002950 <_ZN6Thread5startEv+0x68>
    return 0;
    80002948:	00000513          	li	a0,0
    8000294c:	fd1ff06f          	j	8000291c <_ZN6Thread5startEv+0x34>
        if(Thread::running == nullptr) return -1;
    80002950:	fff00513          	li	a0,-1
    80002954:	fc9ff06f          	j	8000291c <_ZN6Thread5startEv+0x34>

0000000080002958 <getRunningThreadContext>:
extern "C" ThreadContext* getRunningThreadContext(){
    if(Thread::running == nullptr){
    80002958:	0000a517          	auipc	a0,0xa
    8000295c:	46853503          	ld	a0,1128(a0) # 8000cdc0 <_ZN6Thread7runningE>
    80002960:	02050663          	beqz	a0,8000298c <getRunningThreadContext+0x34>
extern "C" ThreadContext* getRunningThreadContext(){
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00113423          	sd	ra,8(sp)
    8000296c:	00813023          	sd	s0,0(sp)
    80002970:	01010413          	addi	s0,sp,16
        return nullptr;
    }
    return Thread::running->getContext();
    80002974:	00000097          	auipc	ra,0x0
    80002978:	958080e7          	jalr	-1704(ra) # 800022cc <_ZN6Thread10getContextEv>
};
    8000297c:	00813083          	ld	ra,8(sp)
    80002980:	00013403          	ld	s0,0(sp)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret
    8000298c:	00008067          	ret

0000000080002990 <getWaitStatusForRunning>:

extern "C" int getWaitStatusForRunning(){
    80002990:	ff010113          	addi	sp,sp,-16
    80002994:	00813423          	sd	s0,8(sp)
    80002998:	01010413          	addi	s0,sp,16
    return Thread::running->semWaitStatus;
}
    8000299c:	0000a797          	auipc	a5,0xa
    800029a0:	4247b783          	ld	a5,1060(a5) # 8000cdc0 <_ZN6Thread7runningE>
    800029a4:	0087a503          	lw	a0,8(a5)
    800029a8:	00813403          	ld	s0,8(sp)
    800029ac:	01010113          	addi	sp,sp,16
    800029b0:	00008067          	ret

00000000800029b4 <_ZN6Thread3runEv>:
    virtual ~Thread ();
    int start ();
    static void dispatch();
    static void* operator new(size_t size);
    static void operator delete(void*) noexcept;
    virtual void run (){};
    800029b4:	ff010113          	addi	sp,sp,-16
    800029b8:	00813423          	sd	s0,8(sp)
    800029bc:	01010413          	addi	s0,sp,16
    800029c0:	00813403          	ld	s0,8(sp)
    800029c4:	01010113          	addi	sp,sp,16
    800029c8:	00008067          	ret

00000000800029cc <_ZN13ConsoleBufferC1Ev>:
#include "../h/Buffer.hpp"

ConsoleBuffer::ConsoleBuffer() {
    800029cc:	fe010113          	addi	sp,sp,-32
    800029d0:	00113c23          	sd	ra,24(sp)
    800029d4:	00813823          	sd	s0,16(sp)
    800029d8:	00913423          	sd	s1,8(sp)
    800029dc:	01213023          	sd	s2,0(sp)
    800029e0:	02010413          	addi	s0,sp,32
    800029e4:	00050493          	mv	s1,a0
    head = tail = count = 0;
    800029e8:	20053823          	sd	zero,528(a0)
    800029ec:	20053423          	sd	zero,520(a0)
    800029f0:	20053023          	sd	zero,512(a0)
    itemAvailable  = new Semaphore(0);
    800029f4:	02000513          	li	a0,32
    800029f8:	fffff097          	auipc	ra,0xfffff
    800029fc:	07c080e7          	jalr	124(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80002a00:	00050913          	mv	s2,a0
    80002a04:	00000593          	li	a1,0
    80002a08:	fffff097          	auipc	ra,0xfffff
    80002a0c:	000080e7          	jalr	ra # 80001a08 <_ZN9SemaphoreC1Ej>
    80002a10:	2124bc23          	sd	s2,536(s1)
    spaceAvailable = new Semaphore(BUFF_SIZE);
    80002a14:	02000513          	li	a0,32
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	05c080e7          	jalr	92(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80002a20:	00050913          	mv	s2,a0
    80002a24:	20000593          	li	a1,512
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	fe0080e7          	jalr	-32(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80002a30:	2324b023          	sd	s2,544(s1)
    mutex          = new Semaphore(1);
    80002a34:	02000513          	li	a0,32
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	03c080e7          	jalr	60(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80002a40:	00050913          	mv	s2,a0
    80002a44:	00100593          	li	a1,1
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	fc0080e7          	jalr	-64(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80002a50:	2324b423          	sd	s2,552(s1)
}
    80002a54:	01813083          	ld	ra,24(sp)
    80002a58:	01013403          	ld	s0,16(sp)
    80002a5c:	00813483          	ld	s1,8(sp)
    80002a60:	00013903          	ld	s2,0(sp)
    80002a64:	02010113          	addi	sp,sp,32
    80002a68:	00008067          	ret
    80002a6c:	00050493          	mv	s1,a0
    itemAvailable  = new Semaphore(0);
    80002a70:	00090513          	mv	a0,s2
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	038080e7          	jalr	56(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80002a7c:	00048513          	mv	a0,s1
    80002a80:	0000c097          	auipc	ra,0xc
    80002a84:	938080e7          	jalr	-1736(ra) # 8000e3b8 <_Unwind_Resume>
    80002a88:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(BUFF_SIZE);
    80002a8c:	00090513          	mv	a0,s2
    80002a90:	fffff097          	auipc	ra,0xfffff
    80002a94:	01c080e7          	jalr	28(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80002a98:	00048513          	mv	a0,s1
    80002a9c:	0000c097          	auipc	ra,0xc
    80002aa0:	91c080e7          	jalr	-1764(ra) # 8000e3b8 <_Unwind_Resume>
    80002aa4:	00050493          	mv	s1,a0
    mutex          = new Semaphore(1);
    80002aa8:	00090513          	mv	a0,s2
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	000080e7          	jalr	ra # 80001aac <_ZN9SemaphoredlEPv>
    80002ab4:	00048513          	mv	a0,s1
    80002ab8:	0000c097          	auipc	ra,0xc
    80002abc:	900080e7          	jalr	-1792(ra) # 8000e3b8 <_Unwind_Resume>

0000000080002ac0 <_ZN13ConsoleBuffer4putcEc>:

void ConsoleBuffer::putc(char c) {
    80002ac0:	fe010113          	addi	sp,sp,-32
    80002ac4:	00113c23          	sd	ra,24(sp)
    80002ac8:	00813823          	sd	s0,16(sp)
    80002acc:	00913423          	sd	s1,8(sp)
    80002ad0:	01213023          	sd	s2,0(sp)
    80002ad4:	02010413          	addi	s0,sp,32
    80002ad8:	00050493          	mv	s1,a0
    80002adc:	00058913          	mv	s2,a1

    spaceAvailable->wait();
    80002ae0:	22053503          	ld	a0,544(a0)
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	30c080e7          	jalr	780(ra) # 80001df0 <_ZN9Semaphore4waitEv>


    buffer[tail] = c;
    80002aec:	2084b783          	ld	a5,520(s1)
    80002af0:	00f48733          	add	a4,s1,a5
    80002af4:	01270023          	sb	s2,0(a4)
    tail = (tail + 1) % BUFF_SIZE;
    80002af8:	00178793          	addi	a5,a5,1
    80002afc:	1ff7f793          	andi	a5,a5,511
    80002b00:	20f4b423          	sd	a5,520(s1)
    count++;
    80002b04:	2104b783          	ld	a5,528(s1)
    80002b08:	00178793          	addi	a5,a5,1
    80002b0c:	20f4b823          	sd	a5,528(s1)


    itemAvailable->signal();
    80002b10:	2184b503          	ld	a0,536(s1)
    80002b14:	fffff097          	auipc	ra,0xfffff
    80002b18:	3b4080e7          	jalr	948(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
}
    80002b1c:	01813083          	ld	ra,24(sp)
    80002b20:	01013403          	ld	s0,16(sp)
    80002b24:	00813483          	ld	s1,8(sp)
    80002b28:	00013903          	ld	s2,0(sp)
    80002b2c:	02010113          	addi	sp,sp,32
    80002b30:	00008067          	ret

0000000080002b34 <_ZN13ConsoleBuffer4getcEv>:

char ConsoleBuffer::getc() {
    80002b34:	fe010113          	addi	sp,sp,-32
    80002b38:	00113c23          	sd	ra,24(sp)
    80002b3c:	00813823          	sd	s0,16(sp)
    80002b40:	00913423          	sd	s1,8(sp)
    80002b44:	01213023          	sd	s2,0(sp)
    80002b48:	02010413          	addi	s0,sp,32
    80002b4c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002b50:	21853503          	ld	a0,536(a0)
    80002b54:	fffff097          	auipc	ra,0xfffff
    80002b58:	29c080e7          	jalr	668(ra) # 80001df0 <_ZN9Semaphore4waitEv>

    char c = buffer[head];
    80002b5c:	2004b783          	ld	a5,512(s1)
    80002b60:	00f48733          	add	a4,s1,a5
    80002b64:	00074903          	lbu	s2,0(a4)
    head = (head + 1) % BUFF_SIZE;
    80002b68:	00178793          	addi	a5,a5,1
    80002b6c:	1ff7f793          	andi	a5,a5,511
    80002b70:	20f4b023          	sd	a5,512(s1)
    count--;
    80002b74:	2104b783          	ld	a5,528(s1)
    80002b78:	fff78793          	addi	a5,a5,-1
    80002b7c:	20f4b823          	sd	a5,528(s1)


    spaceAvailable->signal();
    80002b80:	2204b503          	ld	a0,544(s1)
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	344080e7          	jalr	836(ra) # 80001ec8 <_ZN9Semaphore6signalEv>

    return c;
}
    80002b8c:	00090513          	mv	a0,s2
    80002b90:	01813083          	ld	ra,24(sp)
    80002b94:	01013403          	ld	s0,16(sp)
    80002b98:	00813483          	ld	s1,8(sp)
    80002b9c:	00013903          	ld	s2,0(sp)
    80002ba0:	02010113          	addi	sp,sp,32
    80002ba4:	00008067          	ret

0000000080002ba8 <_ZNK13ConsoleBuffer11getCapacityEv>:
uint64 ConsoleBuffer::getCapacity() const {
    80002ba8:	ff010113          	addi	sp,sp,-16
    80002bac:	00813423          	sd	s0,8(sp)
    80002bb0:	01010413          	addi	s0,sp,16
    return BUFF_SIZE;
}
    80002bb4:	20000513          	li	a0,512
    80002bb8:	00813403          	ld	s0,8(sp)
    80002bbc:	01010113          	addi	sp,sp,16
    80002bc0:	00008067          	ret

0000000080002bc4 <_ZN9SchedulerC1Ev>:
#include "../h/Scheduler.hpp"

Scheduler scheduler;

Scheduler::Scheduler() {
    80002bc4:	ff010113          	addi	sp,sp,-16
    80002bc8:	00813423          	sd	s0,8(sp)
    80002bcc:	01010413          	addi	s0,sp,16
    head = nullptr;
    80002bd0:	00053023          	sd	zero,0(a0)
    tail = nullptr;
    80002bd4:	00053423          	sd	zero,8(a0)
}
    80002bd8:	00813403          	ld	s0,8(sp)
    80002bdc:	01010113          	addi	sp,sp,16
    80002be0:	00008067          	ret

0000000080002be4 <_Z41__static_initialization_and_destruction_0ii>:
    }
    head = head->next;
    thread->next = nullptr;
    if(!head) tail = nullptr;
    return thread;
    80002be4:	00100793          	li	a5,1
    80002be8:	00f50463          	beq	a0,a5,80002bf0 <_Z41__static_initialization_and_destruction_0ii+0xc>
    80002bec:	00008067          	ret
    80002bf0:	000107b7          	lui	a5,0x10
    80002bf4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002bf8:	fef59ae3          	bne	a1,a5,80002bec <_Z41__static_initialization_and_destruction_0ii+0x8>
    80002bfc:	ff010113          	addi	sp,sp,-16
    80002c00:	00113423          	sd	ra,8(sp)
    80002c04:	00813023          	sd	s0,0(sp)
    80002c08:	01010413          	addi	s0,sp,16
Scheduler scheduler;
    80002c0c:	0000a517          	auipc	a0,0xa
    80002c10:	1bc50513          	addi	a0,a0,444 # 8000cdc8 <scheduler>
    80002c14:	00000097          	auipc	ra,0x0
    80002c18:	fb0080e7          	jalr	-80(ra) # 80002bc4 <_ZN9SchedulerC1Ev>
    80002c1c:	00813083          	ld	ra,8(sp)
    80002c20:	00013403          	ld	s0,0(sp)
    80002c24:	01010113          	addi	sp,sp,16
    80002c28:	00008067          	ret

0000000080002c2c <_ZN9Scheduler3putEP6Thread>:
void Scheduler::put(Thread* t){
    80002c2c:	ff010113          	addi	sp,sp,-16
    80002c30:	00813423          	sd	s0,8(sp)
    80002c34:	01010413          	addi	s0,sp,16
    t->next = nullptr;
    80002c38:	0005b823          	sd	zero,16(a1)
    if(!head){
    80002c3c:	00053783          	ld	a5,0(a0)
    80002c40:	00078e63          	beqz	a5,80002c5c <_ZN9Scheduler3putEP6Thread+0x30>
        tail->next = t;
    80002c44:	00853783          	ld	a5,8(a0)
    80002c48:	00b7b823          	sd	a1,16(a5)
    tail = t;
    80002c4c:	00b53423          	sd	a1,8(a0)
}
    80002c50:	00813403          	ld	s0,8(sp)
    80002c54:	01010113          	addi	sp,sp,16
    80002c58:	00008067          	ret
        head = t;
    80002c5c:	00b53023          	sd	a1,0(a0)
    80002c60:	fedff06f          	j	80002c4c <_ZN9Scheduler3putEP6Thread+0x20>

0000000080002c64 <_ZN9Scheduler3getEv>:
Thread* Scheduler::get(){
    80002c64:	fe010113          	addi	sp,sp,-32
    80002c68:	00113c23          	sd	ra,24(sp)
    80002c6c:	00813823          	sd	s0,16(sp)
    80002c70:	00913423          	sd	s1,8(sp)
    80002c74:	01213023          	sd	s2,0(sp)
    80002c78:	02010413          	addi	s0,sp,32
    if(head == nullptr) return nullptr;
    80002c7c:	00053903          	ld	s2,0(a0)
    80002c80:	04090463          	beqz	s2,80002cc8 <_ZN9Scheduler3getEv+0x64>
    80002c84:	00050493          	mv	s1,a0
    if(thread->getContext()->startedOnce)
    80002c88:	00090513          	mv	a0,s2
    80002c8c:	fffff097          	auipc	ra,0xfffff
    80002c90:	640080e7          	jalr	1600(ra) # 800022cc <_ZN6Thread10getContextEv>
    80002c94:	03853783          	ld	a5,56(a0)
    80002c98:	04079663          	bnez	a5,80002ce4 <_ZN9Scheduler3getEv+0x80>
    if(thread->getContext()->startedOnce == 0)
    80002c9c:	00090513          	mv	a0,s2
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	62c080e7          	jalr	1580(ra) # 800022cc <_ZN6Thread10getContextEv>
    80002ca8:	03853783          	ld	a5,56(a0)
    80002cac:	04078863          	beqz	a5,80002cfc <_ZN9Scheduler3getEv+0x98>
    head = head->next;
    80002cb0:	0004b783          	ld	a5,0(s1)
    80002cb4:	0107b783          	ld	a5,16(a5)
    80002cb8:	00f4b023          	sd	a5,0(s1)
    thread->next = nullptr;
    80002cbc:	00093823          	sd	zero,16(s2)
    if(!head) tail = nullptr;
    80002cc0:	0004b783          	ld	a5,0(s1)
    80002cc4:	04078863          	beqz	a5,80002d14 <_ZN9Scheduler3getEv+0xb0>
    80002cc8:	00090513          	mv	a0,s2
    80002ccc:	01813083          	ld	ra,24(sp)
    80002cd0:	01013403          	ld	s0,16(sp)
    80002cd4:	00813483          	ld	s1,8(sp)
    80002cd8:	00013903          	ld	s2,0(sp)
    80002cdc:	02010113          	addi	sp,sp,32
    80002ce0:	00008067          	ret
        thread->getContext()->wasActive = 1;
    80002ce4:	00090513          	mv	a0,s2
    80002ce8:	fffff097          	auipc	ra,0xfffff
    80002cec:	5e4080e7          	jalr	1508(ra) # 800022cc <_ZN6Thread10getContextEv>
    80002cf0:	00100793          	li	a5,1
    80002cf4:	04f53023          	sd	a5,64(a0)
    80002cf8:	fa5ff06f          	j	80002c9c <_ZN9Scheduler3getEv+0x38>
        thread->getContext()->startedOnce = 1;
    80002cfc:	00090513          	mv	a0,s2
    80002d00:	fffff097          	auipc	ra,0xfffff
    80002d04:	5cc080e7          	jalr	1484(ra) # 800022cc <_ZN6Thread10getContextEv>
    80002d08:	00100793          	li	a5,1
    80002d0c:	02f53c23          	sd	a5,56(a0)
    80002d10:	fa1ff06f          	j	80002cb0 <_ZN9Scheduler3getEv+0x4c>
    if(!head) tail = nullptr;
    80002d14:	0004b423          	sd	zero,8(s1)
    80002d18:	fb1ff06f          	j	80002cc8 <_ZN9Scheduler3getEv+0x64>

0000000080002d1c <_GLOBAL__sub_I_scheduler>:
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00113423          	sd	ra,8(sp)
    80002d24:	00813023          	sd	s0,0(sp)
    80002d28:	01010413          	addi	s0,sp,16
    80002d2c:	000105b7          	lui	a1,0x10
    80002d30:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002d34:	00100513          	li	a0,1
    80002d38:	00000097          	auipc	ra,0x0
    80002d3c:	eac080e7          	jalr	-340(ra) # 80002be4 <_Z41__static_initialization_and_destruction_0ii>
    80002d40:	00813083          	ld	ra,8(sp)
    80002d44:	00013403          	ld	s0,0(sp)
    80002d48:	01010113          	addi	sp,sp,16
    80002d4c:	00008067          	ret

0000000080002d50 <_ZN7Console15producerRoutineEPv>:
Console* Console::Instance() {
    static Console instance;
    return &instance;
}

void Console::producerRoutine(void* arg) {
    80002d50:	ff010113          	addi	sp,sp,-16
    80002d54:	00813423          	sd	s0,8(sp)
    80002d58:	01010413          	addi	s0,sp,16
//            plic_complete(CONSOLE_IRQ);
//        } else {
//            Thread::thread_dispatch_kernel();
//        }
//    }
}
    80002d5c:	00813403          	ld	s0,8(sp)
    80002d60:	01010113          	addi	sp,sp,16
    80002d64:	00008067          	ret

0000000080002d68 <_ZN7Console15consumerRoutineEPv>:

void Console::consumerRoutine(void* arg) {
    80002d68:	ff010113          	addi	sp,sp,-16
    80002d6c:	00813423          	sd	s0,8(sp)
    80002d70:	01010413          	addi	s0,sp,16
//            plic_complete(CONSOLE_IRQ);
//        } else {
//            Thread::thread_dispatch_kernel();
//        }
//    }
}
    80002d74:	00813403          	ld	s0,8(sp)
    80002d78:	01010113          	addi	sp,sp,16
    80002d7c:	00008067          	ret

0000000080002d80 <_ZN7ConsoleC1Ev>:

Console::Console() {
    80002d80:	fe010113          	addi	sp,sp,-32
    80002d84:	00113c23          	sd	ra,24(sp)
    80002d88:	00813823          	sd	s0,16(sp)
    80002d8c:	00913423          	sd	s1,8(sp)
    80002d90:	01213023          	sd	s2,0(sp)
    80002d94:	02010413          	addi	s0,sp,32
    80002d98:	00050493          	mv	s1,a0
    80002d9c:	00000097          	auipc	ra,0x0
    80002da0:	c30080e7          	jalr	-976(ra) # 800029cc <_ZN13ConsoleBufferC1Ev>
    80002da4:	23048513          	addi	a0,s1,560
    80002da8:	00000097          	auipc	ra,0x0
    80002dac:	c24080e7          	jalr	-988(ra) # 800029cc <_ZN13ConsoleBufferC1Ev>
    isInterrupted = false;
    80002db0:	48048023          	sb	zero,1152(s1)

    // Kreiranje semafora
    putcSemaphore = new Semaphore(0);
    80002db4:	02000513          	li	a0,32
    80002db8:	fffff097          	auipc	ra,0xfffff
    80002dbc:	cbc080e7          	jalr	-836(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80002dc0:	00050913          	mv	s2,a0
    80002dc4:	00000593          	li	a1,0
    80002dc8:	fffff097          	auipc	ra,0xfffff
    80002dcc:	c40080e7          	jalr	-960(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80002dd0:	4724b023          	sd	s2,1120(s1)
    getcSemaphore = new Semaphore(0);
    80002dd4:	02000513          	li	a0,32
    80002dd8:	fffff097          	auipc	ra,0xfffff
    80002ddc:	c9c080e7          	jalr	-868(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80002de0:	00050913          	mv	s2,a0
    80002de4:	00000593          	li	a1,0
    80002de8:	fffff097          	auipc	ra,0xfffff
    80002dec:	c20080e7          	jalr	-992(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80002df0:	4724b423          	sd	s2,1128(s1)
    // Kernel niti
//    producerThread = new Thread(producerRoutine, this);
//    consumerThread = new Thread(consumerRoutine, this);
//    scheduler.put(consumerThread);
//    scheduler.put(producerThread);
}
    80002df4:	01813083          	ld	ra,24(sp)
    80002df8:	01013403          	ld	s0,16(sp)
    80002dfc:	00813483          	ld	s1,8(sp)
    80002e00:	00013903          	ld	s2,0(sp)
    80002e04:	02010113          	addi	sp,sp,32
    80002e08:	00008067          	ret
    80002e0c:	00050493          	mv	s1,a0
    putcSemaphore = new Semaphore(0);
    80002e10:	00090513          	mv	a0,s2
    80002e14:	fffff097          	auipc	ra,0xfffff
    80002e18:	c98080e7          	jalr	-872(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80002e1c:	00048513          	mv	a0,s1
    80002e20:	0000b097          	auipc	ra,0xb
    80002e24:	598080e7          	jalr	1432(ra) # 8000e3b8 <_Unwind_Resume>
    80002e28:	00050493          	mv	s1,a0
    getcSemaphore = new Semaphore(0);
    80002e2c:	00090513          	mv	a0,s2
    80002e30:	fffff097          	auipc	ra,0xfffff
    80002e34:	c7c080e7          	jalr	-900(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80002e38:	00048513          	mv	a0,s1
    80002e3c:	0000b097          	auipc	ra,0xb
    80002e40:	57c080e7          	jalr	1404(ra) # 8000e3b8 <_Unwind_Resume>

0000000080002e44 <_ZN7Console8InstanceEv>:
    static Console instance;
    80002e44:	0000a797          	auipc	a5,0xa
    80002e48:	f947c783          	lbu	a5,-108(a5) # 8000cdd8 <_ZGVZN7Console8InstanceEvE8instance>
    80002e4c:	00078863          	beqz	a5,80002e5c <_ZN7Console8InstanceEv+0x18>
}
    80002e50:	0000a517          	auipc	a0,0xa
    80002e54:	f9050513          	addi	a0,a0,-112 # 8000cde0 <_ZZN7Console8InstanceEvE8instance>
    80002e58:	00008067          	ret
Console* Console::Instance() {
    80002e5c:	ff010113          	addi	sp,sp,-16
    80002e60:	00113423          	sd	ra,8(sp)
    80002e64:	00813023          	sd	s0,0(sp)
    80002e68:	01010413          	addi	s0,sp,16
    static Console instance;
    80002e6c:	0000a517          	auipc	a0,0xa
    80002e70:	f7450513          	addi	a0,a0,-140 # 8000cde0 <_ZZN7Console8InstanceEvE8instance>
    80002e74:	00000097          	auipc	ra,0x0
    80002e78:	f0c080e7          	jalr	-244(ra) # 80002d80 <_ZN7ConsoleC1Ev>
    80002e7c:	00100793          	li	a5,1
    80002e80:	0000a717          	auipc	a4,0xa
    80002e84:	f4f70c23          	sb	a5,-168(a4) # 8000cdd8 <_ZGVZN7Console8InstanceEvE8instance>
}
    80002e88:	0000a517          	auipc	a0,0xa
    80002e8c:	f5850513          	addi	a0,a0,-168 # 8000cde0 <_ZZN7Console8InstanceEvE8instance>
    80002e90:	00813083          	ld	ra,8(sp)
    80002e94:	00013403          	ld	s0,0(sp)
    80002e98:	01010113          	addi	sp,sp,16
    80002e9c:	00008067          	ret

0000000080002ea0 <_ZN7Console12setInterruptEv>:

void Console::setInterrupt() {
    80002ea0:	ff010113          	addi	sp,sp,-16
    80002ea4:	00113423          	sd	ra,8(sp)
    80002ea8:	00813023          	sd	s0,0(sp)
    80002eac:	01010413          	addi	s0,sp,16
    Console::Instance()->isInterrupted = true;
    80002eb0:	00000097          	auipc	ra,0x0
    80002eb4:	f94080e7          	jalr	-108(ra) # 80002e44 <_ZN7Console8InstanceEv>
    80002eb8:	00100793          	li	a5,1
    80002ebc:	48f50023          	sb	a5,1152(a0)
}
    80002ec0:	00813083          	ld	ra,8(sp)
    80002ec4:	00013403          	ld	s0,0(sp)
    80002ec8:	01010113          	addi	sp,sp,16
    80002ecc:	00008067          	ret

0000000080002ed0 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002ed0:	fe010113          	addi	sp,sp,-32
    80002ed4:	00113c23          	sd	ra,24(sp)
    80002ed8:	00813823          	sd	s0,16(sp)
    80002edc:	00913423          	sd	s1,8(sp)
    80002ee0:	02010413          	addi	s0,sp,32
    80002ee4:	00050493          	mv	s1,a0
    Console::Instance()->txBuffer.putc(c);
    80002ee8:	00000097          	auipc	ra,0x0
    80002eec:	f5c080e7          	jalr	-164(ra) # 80002e44 <_ZN7Console8InstanceEv>
    80002ef0:	00048593          	mv	a1,s1
    80002ef4:	23050513          	addi	a0,a0,560
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	bc8080e7          	jalr	-1080(ra) # 80002ac0 <_ZN13ConsoleBuffer4putcEc>
    Console::Instance()->putcSemaphore->signal();
    80002f00:	00000097          	auipc	ra,0x0
    80002f04:	f44080e7          	jalr	-188(ra) # 80002e44 <_ZN7Console8InstanceEv>
    80002f08:	46053503          	ld	a0,1120(a0)
    80002f0c:	fffff097          	auipc	ra,0xfffff
    80002f10:	fbc080e7          	jalr	-68(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
}
    80002f14:	01813083          	ld	ra,24(sp)
    80002f18:	01013403          	ld	s0,16(sp)
    80002f1c:	00813483          	ld	s1,8(sp)
    80002f20:	02010113          	addi	sp,sp,32
    80002f24:	00008067          	ret

0000000080002f28 <_ZN7Console4getcEv>:

char Console::getc() {
    80002f28:	ff010113          	addi	sp,sp,-16
    80002f2c:	00113423          	sd	ra,8(sp)
    80002f30:	00813023          	sd	s0,0(sp)
    80002f34:	01010413          	addi	s0,sp,16
    Console::Instance()->getcSemaphore->wait();
    80002f38:	00000097          	auipc	ra,0x0
    80002f3c:	f0c080e7          	jalr	-244(ra) # 80002e44 <_ZN7Console8InstanceEv>
    80002f40:	46853503          	ld	a0,1128(a0)
    80002f44:	fffff097          	auipc	ra,0xfffff
    80002f48:	eac080e7          	jalr	-340(ra) # 80001df0 <_ZN9Semaphore4waitEv>
    return Console::Instance()->rxBuffer.getc();
    80002f4c:	00000097          	auipc	ra,0x0
    80002f50:	ef8080e7          	jalr	-264(ra) # 80002e44 <_ZN7Console8InstanceEv>
    80002f54:	00000097          	auipc	ra,0x0
    80002f58:	be0080e7          	jalr	-1056(ra) # 80002b34 <_ZN13ConsoleBuffer4getcEv>
}
    80002f5c:	00813083          	ld	ra,8(sp)
    80002f60:	00013403          	ld	s0,0(sp)
    80002f64:	01010113          	addi	sp,sp,16
    80002f68:	00008067          	ret

0000000080002f6c <_ZN7Console10getTxCountEv>:

uint64 Console::getTxCount() {
    80002f6c:	ff010113          	addi	sp,sp,-16
    80002f70:	00113423          	sd	ra,8(sp)
    80002f74:	00813023          	sd	s0,0(sp)
    80002f78:	01010413          	addi	s0,sp,16
    return Console::Instance()->txBuffer.getCount();
    80002f7c:	00000097          	auipc	ra,0x0
    80002f80:	ec8080e7          	jalr	-312(ra) # 80002e44 <_ZN7Console8InstanceEv>
}
    80002f84:	44053503          	ld	a0,1088(a0)
    80002f88:	00813083          	ld	ra,8(sp)
    80002f8c:	00013403          	ld	s0,0(sp)
    80002f90:	01010113          	addi	sp,sp,16
    80002f94:	00008067          	ret

0000000080002f98 <_Z15userMainWrapperPv>:

}
void* __dso_handle = nullptr;


void userMainWrapper(void* args){
    80002f98:	ff010113          	addi	sp,sp,-16
    80002f9c:	00113423          	sd	ra,8(sp)
    80002fa0:	00813023          	sd	s0,0(sp)
    80002fa4:	01010413          	addi	s0,sp,16

    //RiscV::switchToUserMode();
    userMain();
    80002fa8:	00004097          	auipc	ra,0x4
    80002fac:	86c080e7          	jalr	-1940(ra) # 80006814 <userMain>
}
    80002fb0:	00813083          	ld	ra,8(sp)
    80002fb4:	00013403          	ld	s0,0(sp)
    80002fb8:	01010113          	addi	sp,sp,16
    80002fbc:	00008067          	ret

0000000080002fc0 <_Z8idleBodyPv>:
void idleBody(void*) {
    80002fc0:	ff010113          	addi	sp,sp,-16
    80002fc4:	00113423          	sd	ra,8(sp)
    80002fc8:	00813023          	sd	s0,0(sp)
    80002fcc:	01010413          	addi	s0,sp,16
    while (true){
        thread_dispatch();
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	67c080e7          	jalr	1660(ra) # 8000164c <thread_dispatch>
    while (true){
    80002fd8:	ff9ff06f          	j	80002fd0 <_Z8idleBodyPv+0x10>

0000000080002fdc <__cxa_atexit>:
int __cxa_atexit(void (*func)(void *), void *arg, void *d) {
    80002fdc:	ff010113          	addi	sp,sp,-16
    80002fe0:	00813423          	sd	s0,8(sp)
    80002fe4:	01010413          	addi	s0,sp,16
}
    80002fe8:	00000513          	li	a0,0
    80002fec:	00813403          	ld	s0,8(sp)
    80002ff0:	01010113          	addi	sp,sp,16
    80002ff4:	00008067          	ret

0000000080002ff8 <main>:
    }
}

void main() {
    80002ff8:	fd010113          	addi	sp,sp,-48
    80002ffc:	02113423          	sd	ra,40(sp)
    80003000:	02813023          	sd	s0,32(sp)
    80003004:	00913c23          	sd	s1,24(sp)
    80003008:	01213823          	sd	s2,16(sp)
    8000300c:	03010413          	addi	s0,sp,48



    __asm__ volatile("csrw stvec, %[val]" : : [val] "r" (&handle_interrupt));
    80003010:	0000a797          	auipc	a5,0xa
    80003014:	d207b783          	ld	a5,-736(a5) # 8000cd30 <_GLOBAL_OFFSET_TABLE_+0x10>
    80003018:	10579073          	csrw	stvec,a5
//    else {
//        stack_start = (uint64)HEAP_START_ADDR + (MEM_BLOCK_SIZE - (uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE);
//    }
//    uint64 sp = stack_start + 3*(uint64)DEFAULT_STACK_SIZE;
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
     void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    8000301c:	00000097          	auipc	ra,0x0
    80003020:	6f4080e7          	jalr	1780(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80003024:	08100593          	li	a1,129
    80003028:	00000097          	auipc	ra,0x0
    8000302c:	460080e7          	jalr	1120(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    80003030:	000024b7          	lui	s1,0x2
    80003034:	00848493          	addi	s1,s1,8 # 2008 <_entry-0x7fffdff8>
    80003038:	00950533          	add	a0,a0,s1

    __asm__ volatile("mv sp, %[sp]" : : [sp] "r" ((uint64)(stack_top)));
    8000303c:	00050113          	mv	sp,a0

     numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;

    result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80003040:	00000097          	auipc	ra,0x0
    80003044:	6d0080e7          	jalr	1744(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80003048:	08100593          	li	a1,129
    8000304c:	00000097          	auipc	ra,0x0
    80003050:	43c080e7          	jalr	1084(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
    stack = (char*)result + sizeof(Header);
    stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    thread_t  pid;
    Thread::create_thread_kernel(&pid, idleBody, nullptr, stack_top);
    80003054:	009506b3          	add	a3,a0,s1
    80003058:	00000613          	li	a2,0
    8000305c:	00000597          	auipc	a1,0x0
    80003060:	f6458593          	addi	a1,a1,-156 # 80002fc0 <_Z8idleBodyPv>
    80003064:	fdc40913          	addi	s2,s0,-36
    80003068:	00090513          	mv	a0,s2
    8000306c:	fffff097          	auipc	ra,0xfffff
    80003070:	6fc080e7          	jalr	1788(ra) # 80002768 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
    result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80003074:	00000097          	auipc	ra,0x0
    80003078:	69c080e7          	jalr	1692(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    8000307c:	08100593          	li	a1,129
    80003080:	00000097          	auipc	ra,0x0
    80003084:	408080e7          	jalr	1032(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
    stack = (char*)result + sizeof(Header);
    stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;

    Thread::create_thread_kernel(&pid, userMainWrapper, nullptr, stack_top);
    80003088:	009506b3          	add	a3,a0,s1
    8000308c:	00000613          	li	a2,0
    80003090:	00000597          	auipc	a1,0x0
    80003094:	f0858593          	addi	a1,a1,-248 # 80002f98 <_Z15userMainWrapperPv>
    80003098:	00090513          	mv	a0,s2
    8000309c:	fffff097          	auipc	ra,0xfffff
    800030a0:	6cc080e7          	jalr	1740(ra) # 80002768 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
    Console::Instance();
    800030a4:	00000097          	auipc	ra,0x0
    800030a8:	da0080e7          	jalr	-608(ra) # 80002e44 <_ZN7Console8InstanceEv>
    thread_dispatch();
    800030ac:	ffffe097          	auipc	ra,0xffffe
    800030b0:	5a0080e7          	jalr	1440(ra) # 8000164c <thread_dispatch>

}
    800030b4:	02813083          	ld	ra,40(sp)
    800030b8:	02013403          	ld	s0,32(sp)
    800030bc:	01813483          	ld	s1,24(sp)
    800030c0:	01013903          	ld	s2,16(sp)
    800030c4:	03010113          	addi	sp,sp,48
    800030c8:	00008067          	ret

00000000800030cc <interrupt>:
#include "../h/codes.h"
#include "../h/Console.hpp"



extern "C" uint64 interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5){
    800030cc:	fb010113          	addi	sp,sp,-80
    800030d0:	04113423          	sd	ra,72(sp)
    800030d4:	04813023          	sd	s0,64(sp)
    800030d8:	02913c23          	sd	s1,56(sp)
    800030dc:	03213823          	sd	s2,48(sp)
    800030e0:	03313423          	sd	s3,40(sp)
    800030e4:	03413023          	sd	s4,32(sp)
    800030e8:	01513c23          	sd	s5,24(sp)
    800030ec:	01613823          	sd	s6,16(sp)
    800030f0:	01713423          	sd	s7,8(sp)
    800030f4:	01813023          	sd	s8,0(sp)
    800030f8:	05010413          	addi	s0,sp,80
    800030fc:	00050493          	mv	s1,a0
    80003100:	00060a93          	mv	s5,a2
    80003104:	00068b13          	mv	s6,a3
    80003108:	00070b93          	mv	s7,a4
    8000310c:	00078c13          	mv	s8,a5
    uint64 cause = RiscV::r_scause();
    80003110:	fffff097          	auipc	ra,0xfffff
    80003114:	ff0080e7          	jalr	-16(ra) # 80002100 <_ZN5RiscV8r_scauseEv>
    80003118:	00050913          	mv	s2,a0
    uint64 sepc  = RiscV::r_sepc();
    8000311c:	fffff097          	auipc	ra,0xfffff
    80003120:	e84080e7          	jalr	-380(ra) # 80001fa0 <_ZN5RiscV6r_sepcEv>
    80003124:	00050993          	mv	s3,a0
    uint64 sstatus = RiscV::r_sstatus();
    80003128:	fffff097          	auipc	ra,0xfffff
    8000312c:	e9c080e7          	jalr	-356(ra) # 80001fc4 <_ZN5RiscV9r_sstatusEv>
    80003130:	00050a13          	mv	s4,a0

    if(cause == SYS_ECALL || cause == USER_ECALL){
    80003134:	ff890713          	addi	a4,s2,-8
    80003138:	00100793          	li	a5,1
    8000313c:	02e7f663          	bgeu	a5,a4,80003168 <interrupt+0x9c>
                //Console::Instance()->putc((char)a2);
                __putc((char)a2);
                break;
        }
    }
    else if(cause == CONSOLE_INTERRUPT){
    80003140:	fff00793          	li	a5,-1
    80003144:	03f79793          	slli	a5,a5,0x3f
    80003148:	00978793          	addi	a5,a5,9
    8000314c:	14f90e63          	beq	s2,a5,800032a8 <interrupt+0x1dc>
//        }
        console_handler();
   }


    else if(cause == TIMER_INTERRUPT){
    80003150:	fff00793          	li	a5,-1
    80003154:	03f79793          	slli	a5,a5,0x3f
    80003158:	00178793          	addi	a5,a5,1
    8000315c:	1af90063          	beq	s2,a5,800032fc <interrupt+0x230>
        }

    }
    else
    {
        return a0;
    80003160:	00048513          	mv	a0,s1
    80003164:	1680006f          	j	800032cc <interrupt+0x200>
        sepc += 4;
    80003168:	00498993          	addi	s3,s3,4
        switch(a0){
    8000316c:	04200793          	li	a5,66
    80003170:	1497e063          	bltu	a5,s1,800032b0 <interrupt+0x1e4>
    80003174:	00249713          	slli	a4,s1,0x2
    80003178:	00007697          	auipc	a3,0x7
    8000317c:	ea868693          	addi	a3,a3,-344 # 8000a020 <CONSOLE_STATUS+0x10>
    80003180:	00d70733          	add	a4,a4,a3
    80003184:	00072783          	lw	a5,0(a4)
    80003188:	00d787b3          	add	a5,a5,a3
    8000318c:	00078067          	jr	a5
                a0 = (uint64)MemoryAllocator::Instance()->mem_alloc(a2);
    80003190:	00000097          	auipc	ra,0x0
    80003194:	580080e7          	jalr	1408(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80003198:	000a8593          	mv	a1,s5
    8000319c:	00000097          	auipc	ra,0x0
    800031a0:	2ec080e7          	jalr	748(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
    800031a4:	00050493          	mv	s1,a0
                break;
    800031a8:	1080006f          	j	800032b0 <interrupt+0x1e4>
                a0 = (uint64)MemoryAllocator::Instance()->mem_free((void*)a2);
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	564080e7          	jalr	1380(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    800031b4:	000a8593          	mv	a1,s5
    800031b8:	00000097          	auipc	ra,0x0
    800031bc:	608080e7          	jalr	1544(ra) # 800037c0 <_ZN15MemoryAllocator8mem_freeEPv>
    800031c0:	00050493          	mv	s1,a0
                break;
    800031c4:	0ec0006f          	j	800032b0 <interrupt+0x1e4>
                a0 = Thread::create_thread_kernel((thread_t*) a2, (void(*)(void*)) a3, (void*) a4, (void*) a5);
    800031c8:	000c0693          	mv	a3,s8
    800031cc:	000b8613          	mv	a2,s7
    800031d0:	000b0593          	mv	a1,s6
    800031d4:	000a8513          	mv	a0,s5
    800031d8:	fffff097          	auipc	ra,0xfffff
    800031dc:	590080e7          	jalr	1424(ra) # 80002768 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
    800031e0:	00050493          	mv	s1,a0
                break;
    800031e4:	0cc0006f          	j	800032b0 <interrupt+0x1e4>
                a0 = Thread::thread_exit_kernel();
    800031e8:	fffff097          	auipc	ra,0xfffff
    800031ec:	2f8080e7          	jalr	760(ra) # 800024e0 <_ZN6Thread18thread_exit_kernelEv>
    800031f0:	00050493          	mv	s1,a0
                break;
    800031f4:	0bc0006f          	j	800032b0 <interrupt+0x1e4>
                Thread::thread_dispatch_kernel();
    800031f8:	fffff097          	auipc	ra,0xfffff
    800031fc:	444080e7          	jalr	1092(ra) # 8000263c <_ZN6Thread22thread_dispatch_kernelEv>
                break;
    80003200:	0b00006f          	j	800032b0 <interrupt+0x1e4>
                a0 = MemoryAllocator::Instance()->free_memory_remaining();
    80003204:	00000097          	auipc	ra,0x0
    80003208:	50c080e7          	jalr	1292(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    8000320c:	00000097          	auipc	ra,0x0
    80003210:	7cc080e7          	jalr	1996(ra) # 800039d8 <_ZN15MemoryAllocator21free_memory_remainingEv>
    80003214:	00050493          	mv	s1,a0
                break;
    80003218:	0980006f          	j	800032b0 <interrupt+0x1e4>
                a0 = MemoryAllocator::Instance()->get_largest_mem_block();
    8000321c:	00000097          	auipc	ra,0x0
    80003220:	4f4080e7          	jalr	1268(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80003224:	00000097          	auipc	ra,0x0
    80003228:	7d8080e7          	jalr	2008(ra) # 800039fc <_ZN15MemoryAllocator21get_largest_mem_blockEv>
    8000322c:	00050493          	mv	s1,a0
                break;
    80003230:	0800006f          	j	800032b0 <interrupt+0x1e4>
                a0 = Semaphore::sem_open((sem_t*)a2, (unsigned)a3);
    80003234:	000b059b          	sext.w	a1,s6
    80003238:	000a8513          	mv	a0,s5
    8000323c:	fffff097          	auipc	ra,0xfffff
    80003240:	8f8080e7          	jalr	-1800(ra) # 80001b34 <_ZN9Semaphore8sem_openEPjj>
    80003244:	00050493          	mv	s1,a0
                break;
    80003248:	0680006f          	j	800032b0 <interrupt+0x1e4>
                a0 = Semaphore::sem_wait((sem_t)a2);
    8000324c:	000a851b          	sext.w	a0,s5
    80003250:	fffff097          	auipc	ra,0xfffff
    80003254:	a28080e7          	jalr	-1496(ra) # 80001c78 <_ZN9Semaphore8sem_waitEj>
    80003258:	00050493          	mv	s1,a0
                break;
    8000325c:	0540006f          	j	800032b0 <interrupt+0x1e4>
                a0 = Semaphore::sem_signal((sem_t)a2);
    80003260:	000a851b          	sext.w	a0,s5
    80003264:	fffff097          	auipc	ra,0xfffff
    80003268:	bbc080e7          	jalr	-1092(ra) # 80001e20 <_ZN9Semaphore10sem_signalEj>
    8000326c:	00050493          	mv	s1,a0
                break;
    80003270:	0400006f          	j	800032b0 <interrupt+0x1e4>
                a0 = Semaphore::sem_close((sem_t)a2);
    80003274:	000a851b          	sext.w	a0,s5
    80003278:	fffff097          	auipc	ra,0xfffff
    8000327c:	94c080e7          	jalr	-1716(ra) # 80001bc4 <_ZN9Semaphore9sem_closeEj>
    80003280:	00050493          	mv	s1,a0
                break;
    80003284:	02c0006f          	j	800032b0 <interrupt+0x1e4>
                a0 = __getc();
    80003288:	00006097          	auipc	ra,0x6
    8000328c:	fe0080e7          	jalr	-32(ra) # 80009268 <__getc>
    80003290:	00050493          	mv	s1,a0
                break;
    80003294:	01c0006f          	j	800032b0 <interrupt+0x1e4>
                __putc((char)a2);
    80003298:	0ffaf513          	andi	a0,s5,255
    8000329c:	00006097          	auipc	ra,0x6
    800032a0:	f90080e7          	jalr	-112(ra) # 8000922c <__putc>
                break;
    800032a4:	00c0006f          	j	800032b0 <interrupt+0x1e4>
        console_handler();
    800032a8:	00006097          	auipc	ra,0x6
    800032ac:	ff8080e7          	jalr	-8(ra) # 800092a0 <console_handler>
    }

    RiscV::w_sepc(sepc);
    800032b0:	00098513          	mv	a0,s3
    800032b4:	fffff097          	auipc	ra,0xfffff
    800032b8:	dc0080e7          	jalr	-576(ra) # 80002074 <_ZN5RiscV6w_sepcEm>
    RiscV::w_sstatus(sstatus);
    800032bc:	000a0513          	mv	a0,s4
    800032c0:	fffff097          	auipc	ra,0xfffff
    800032c4:	d60080e7          	jalr	-672(ra) # 80002020 <_ZN5RiscV9w_sstatusEm>
    return a0;
    800032c8:	00048513          	mv	a0,s1

}
    800032cc:	04813083          	ld	ra,72(sp)
    800032d0:	04013403          	ld	s0,64(sp)
    800032d4:	03813483          	ld	s1,56(sp)
    800032d8:	03013903          	ld	s2,48(sp)
    800032dc:	02813983          	ld	s3,40(sp)
    800032e0:	02013a03          	ld	s4,32(sp)
    800032e4:	01813a83          	ld	s5,24(sp)
    800032e8:	01013b03          	ld	s6,16(sp)
    800032ec:	00813b83          	ld	s7,8(sp)
    800032f0:	00013c03          	ld	s8,0(sp)
    800032f4:	05010113          	addi	sp,sp,80
    800032f8:	00008067          	ret
        RiscV::mc_sip(RiscV::SIP_SSIP);
    800032fc:	00200513          	li	a0,2
    80003300:	fffff097          	auipc	ra,0xfffff
    80003304:	c30080e7          	jalr	-976(ra) # 80001f30 <_ZN5RiscV6mc_sipEm>
        Thread::incrementtimeSliceCounter();
    80003308:	fffff097          	auipc	ra,0xfffff
    8000330c:	f7c080e7          	jalr	-132(ra) # 80002284 <_ZN6Thread25incrementtimeSliceCounterEv>
        if(Thread::running && Thread::getTimeSliceCounter() >= Thread::running->getTimeSlice()){
    80003310:	0000a797          	auipc	a5,0xa
    80003314:	a307b783          	ld	a5,-1488(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003318:	0007b783          	ld	a5,0(a5)
    8000331c:	f8078ae3          	beqz	a5,800032b0 <interrupt+0x1e4>
    80003320:	fffff097          	auipc	ra,0xfffff
    80003324:	f44080e7          	jalr	-188(ra) # 80002264 <_ZN6Thread19getTimeSliceCounterEv>
    80003328:	00050913          	mv	s2,a0
    8000332c:	0000a797          	auipc	a5,0xa
    80003330:	a147b783          	ld	a5,-1516(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    80003334:	0007b503          	ld	a0,0(a5)
    80003338:	fffff097          	auipc	ra,0xfffff
    8000333c:	f78080e7          	jalr	-136(ra) # 800022b0 <_ZN6Thread12getTimeSliceEv>
    80003340:	f6a968e3          	bltu	s2,a0,800032b0 <interrupt+0x1e4>
            Thread::clearTimeSliceCounter();
    80003344:	fffff097          	auipc	ra,0xfffff
    80003348:	f00080e7          	jalr	-256(ra) # 80002244 <_ZN6Thread21clearTimeSliceCounterEv>
            Thread::thread_dispatch_kernel();
    8000334c:	fffff097          	auipc	ra,0xfffff
    80003350:	2f0080e7          	jalr	752(ra) # 8000263c <_ZN6Thread22thread_dispatch_kernelEv>
    80003354:	f5dff06f          	j	800032b0 <interrupt+0x1e4>

0000000080003358 <_Znwm>:
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"


void* operator new(size_t size) {
    80003358:	ff010113          	addi	sp,sp,-16
    8000335c:	00113423          	sd	ra,8(sp)
    80003360:	00813023          	sd	s0,0(sp)
    80003364:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003368:	ffffe097          	auipc	ra,0xffffe
    8000336c:	198080e7          	jalr	408(ra) # 80001500 <mem_alloc>
}
    80003370:	00813083          	ld	ra,8(sp)
    80003374:	00013403          	ld	s0,0(sp)
    80003378:	01010113          	addi	sp,sp,16
    8000337c:	00008067          	ret

0000000080003380 <_Znam>:

void* operator new[](size_t size) {
    80003380:	ff010113          	addi	sp,sp,-16
    80003384:	00113423          	sd	ra,8(sp)
    80003388:	00813023          	sd	s0,0(sp)
    8000338c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80003390:	ffffe097          	auipc	ra,0xffffe
    80003394:	170080e7          	jalr	368(ra) # 80001500 <mem_alloc>
}
    80003398:	00813083          	ld	ra,8(sp)
    8000339c:	00013403          	ld	s0,0(sp)
    800033a0:	01010113          	addi	sp,sp,16
    800033a4:	00008067          	ret

00000000800033a8 <_ZdlPv>:

void operator delete(void* ptr) noexcept {
    800033a8:	ff010113          	addi	sp,sp,-16
    800033ac:	00113423          	sd	ra,8(sp)
    800033b0:	00813023          	sd	s0,0(sp)
    800033b4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800033b8:	ffffe097          	auipc	ra,0xffffe
    800033bc:	190080e7          	jalr	400(ra) # 80001548 <mem_free>
}
    800033c0:	00813083          	ld	ra,8(sp)
    800033c4:	00013403          	ld	s0,0(sp)
    800033c8:	01010113          	addi	sp,sp,16
    800033cc:	00008067          	ret

00000000800033d0 <_ZdaPv>:

void operator delete[](void* ptr) noexcept {
    800033d0:	ff010113          	addi	sp,sp,-16
    800033d4:	00113423          	sd	ra,8(sp)
    800033d8:	00813023          	sd	s0,0(sp)
    800033dc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    800033e0:	ffffe097          	auipc	ra,0xffffe
    800033e4:	168080e7          	jalr	360(ra) # 80001548 <mem_free>
    800033e8:	00813083          	ld	ra,8(sp)
    800033ec:	00013403          	ld	s0,0(sp)
    800033f0:	01010113          	addi	sp,sp,16
    800033f4:	00008067          	ret

00000000800033f8 <_Z23getWaitStatusForRunningv>:
#include "../h/syscall_c.hpp"
#include "../lib/hw.h"
#include "../h/Thread.hpp"

// Povratak statusa čekanja za tekuću nit
int getWaitStatusForRunning() {
    800033f8:	ff010113          	addi	sp,sp,-16
    800033fc:	00813423          	sd	s0,8(sp)
    80003400:	01010413          	addi	s0,sp,16
    return Thread::running->semWaitStatus;
    80003404:	0000a797          	auipc	a5,0xa
    80003408:	93c7b783          	ld	a5,-1732(a5) # 8000cd40 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000340c:	0007b783          	ld	a5,0(a5)
}
    80003410:	0087a503          	lw	a0,8(a5)
    80003414:	00813403          	ld	s0,8(sp)
    80003418:	01010113          	addi	sp,sp,16
    8000341c:	00008067          	ret

0000000080003420 <_ZN15MemoryAllocator5alignEm>:
    static MemoryAllocator instance;
    return &instance;
}

// Poravnanje adrese
uint64 MemoryAllocator::align(uint64 addr) {
    80003420:	ff010113          	addi	sp,sp,-16
    80003424:	00813423          	sd	s0,8(sp)
    80003428:	01010413          	addi	s0,sp,16
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    8000342c:	03f5f793          	andi	a5,a1,63
    80003430:	00078c63          	beqz	a5,80003448 <_ZN15MemoryAllocator5alignEm+0x28>
    return addr + (MEM_BLOCK_SIZE - addr % MEM_BLOCK_SIZE);
    80003434:	fc05f593          	andi	a1,a1,-64
    80003438:	04058513          	addi	a0,a1,64
}
    8000343c:	00813403          	ld	s0,8(sp)
    80003440:	01010113          	addi	sp,sp,16
    80003444:	00008067          	ret
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    80003448:	00058513          	mv	a0,a1
    8000344c:	ff1ff06f          	j	8000343c <_ZN15MemoryAllocator5alignEm+0x1c>

0000000080003450 <_ZN15MemoryAllocator13getThreadPoolEv>:
    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
}

ThreadPool& MemoryAllocator::getThreadPool() {
    80003450:	ff010113          	addi	sp,sp,-16
    80003454:	00813423          	sd	s0,8(sp)
    80003458:	01010413          	addi	s0,sp,16
    return threadPool;
}
    8000345c:	00850513          	addi	a0,a0,8
    80003460:	00813403          	ld	s0,8(sp)
    80003464:	01010113          	addi	sp,sp,16
    80003468:	00008067          	ret

000000008000346c <_ZN15MemoryAllocator16getSemaphorePoolEv>:

SemaphorePool& MemoryAllocator::getSemaphorePool() {
    8000346c:	ff010113          	addi	sp,sp,-16
    80003470:	00813423          	sd	s0,8(sp)
    80003474:	01010413          	addi	s0,sp,16
    return semaphorePool;
}
    80003478:	01850513          	addi	a0,a0,24
    8000347c:	00813403          	ld	s0,8(sp)
    80003480:	01010113          	addi	sp,sp,16
    80003484:	00008067          	ret

0000000080003488 <_ZN15MemoryAllocator9mem_allocEm>:



void* MemoryAllocator::mem_alloc(uint64 numOfBlocks) {
    80003488:	ff010113          	addi	sp,sp,-16
    8000348c:	00813423          	sd	s0,8(sp)
    80003490:	01010413          	addi	s0,sp,16
    80003494:	00050713          	mv	a4,a0
    FreeMem* temp = fmem_head;
    80003498:	00053503          	ld	a0,0(a0)

    while(temp)
    8000349c:	04050863          	beqz	a0,800034ec <_ZN15MemoryAllocator9mem_allocEm+0x64>
    {
        if(temp->size >= numOfBlocks)
    800034a0:	01053783          	ld	a5,16(a0)
    800034a4:	00b7f663          	bgeu	a5,a1,800034b0 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            header->numOfBlocks = numOfBlocks;

            return addr;
        }

        temp = temp->next;
    800034a8:	00053503          	ld	a0,0(a0)
    while(temp)
    800034ac:	ff1ff06f          	j	8000349c <_ZN15MemoryAllocator9mem_allocEm+0x14>
            if(temp->size == numOfBlocks){
    800034b0:	04b78463          	beq	a5,a1,800034f8 <_ZN15MemoryAllocator9mem_allocEm+0x70>
                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);
    800034b4:	00659693          	slli	a3,a1,0x6
    800034b8:	00d506b3          	add	a3,a0,a3
                newnode->size = temp->size - numOfBlocks;
    800034bc:	40b787b3          	sub	a5,a5,a1
    800034c0:	00f6b823          	sd	a5,16(a3)
                newnode->next = temp->next;
    800034c4:	00053783          	ld	a5,0(a0)
    800034c8:	00f6b023          	sd	a5,0(a3)
                newnode->prev = temp->prev;
    800034cc:	00853783          	ld	a5,8(a0)
    800034d0:	00f6b423          	sd	a5,8(a3)
                if(newnode->prev)
    800034d4:	04078a63          	beqz	a5,80003528 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                    newnode->prev->next = newnode;
    800034d8:	00d7b023          	sd	a3,0(a5)
                if(newnode->next)
    800034dc:	0006b783          	ld	a5,0(a3)
    800034e0:	00078463          	beqz	a5,800034e8 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    newnode->next->prev = newnode;
    800034e4:	00d7b423          	sd	a3,8(a5)
            header->numOfBlocks = numOfBlocks;
    800034e8:	00b53023          	sd	a1,0(a0)
    }

    return nullptr;
}
    800034ec:	00813403          	ld	s0,8(sp)
    800034f0:	01010113          	addi	sp,sp,16
    800034f4:	00008067          	ret
                if(temp->prev)
    800034f8:	00853783          	ld	a5,8(a0)
    800034fc:	02078063          	beqz	a5,8000351c <_ZN15MemoryAllocator9mem_allocEm+0x94>
                    temp->prev->next = temp->next;
    80003500:	00053703          	ld	a4,0(a0)
    80003504:	00e7b023          	sd	a4,0(a5)
                if(temp->next)
    80003508:	00053783          	ld	a5,0(a0)
    8000350c:	fc078ee3          	beqz	a5,800034e8 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    temp->next->prev = temp->prev;
    80003510:	00853703          	ld	a4,8(a0)
    80003514:	00e7b423          	sd	a4,8(a5)
    80003518:	fd1ff06f          	j	800034e8 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    fmem_head = temp->next;
    8000351c:	00053783          	ld	a5,0(a0)
    80003520:	00f73023          	sd	a5,0(a4)
    80003524:	fe5ff06f          	j	80003508 <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    fmem_head = newnode;
    80003528:	00d73023          	sd	a3,0(a4)
    8000352c:	fb1ff06f          	j	800034dc <_ZN15MemoryAllocator9mem_allocEm+0x54>

0000000080003530 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>:
void* MemoryAllocator::mem_alloc_for_managers(size_t N, size_t sizeOfElem){
    80003530:	ff010113          	addi	sp,sp,-16
    80003534:	00813423          	sd	s0,8(sp)
    80003538:	01010413          	addi	s0,sp,16
    8000353c:	00050693          	mv	a3,a0
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80003540:	02c58633          	mul	a2,a1,a2
    80003544:	03f60613          	addi	a2,a2,63
    80003548:	00665713          	srli	a4,a2,0x6
    FreeMem* temp = fmem_head;
    8000354c:	00053503          	ld	a0,0(a0)

    while(temp)
    80003550:	04050663          	beqz	a0,8000359c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
    {
        if(temp->size >= numOfBlocks)
    80003554:	01053783          	ld	a5,16(a0)
    80003558:	00e7f663          	bgeu	a5,a4,80003564 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x34>


            return addr;
        }

        temp = temp->next;
    8000355c:	00053503          	ld	a0,0(a0)
    while(temp)
    80003560:	ff1ff06f          	j	80003550 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x20>
            if(temp->size == numOfBlocks){
    80003564:	04e78263          	beq	a5,a4,800035a8 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x78>
                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);
    80003568:	fc067613          	andi	a2,a2,-64
    8000356c:	00c50633          	add	a2,a0,a2
                newnode->size = temp->size - numOfBlocks;
    80003570:	40e787b3          	sub	a5,a5,a4
    80003574:	00f63823          	sd	a5,16(a2)
                newnode->next = temp->next;
    80003578:	00053783          	ld	a5,0(a0)
    8000357c:	00f63023          	sd	a5,0(a2)
                newnode->prev = temp->prev;
    80003580:	00853783          	ld	a5,8(a0)
    80003584:	00f63423          	sd	a5,8(a2)
                if(newnode->prev)
    80003588:	04078863          	beqz	a5,800035d8 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0xa8>
                    newnode->prev->next = newnode;
    8000358c:	00c7b023          	sd	a2,0(a5)
                if(newnode->next)
    80003590:	00063783          	ld	a5,0(a2)
    80003594:	00078463          	beqz	a5,8000359c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    newnode->next->prev = newnode;
    80003598:	00c7b423          	sd	a2,8(a5)
    }

    return nullptr;
}
    8000359c:	00813403          	ld	s0,8(sp)
    800035a0:	01010113          	addi	sp,sp,16
    800035a4:	00008067          	ret
                if(temp->prev)
    800035a8:	00853783          	ld	a5,8(a0)
    800035ac:	02078063          	beqz	a5,800035cc <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x9c>
                    temp->prev->next = temp->next;
    800035b0:	00053703          	ld	a4,0(a0)
    800035b4:	00e7b023          	sd	a4,0(a5)
                if(temp->next)
    800035b8:	00053783          	ld	a5,0(a0)
    800035bc:	fe0780e3          	beqz	a5,8000359c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    temp->next->prev = temp->prev;
    800035c0:	00853703          	ld	a4,8(a0)
    800035c4:	00e7b423          	sd	a4,8(a5)
    800035c8:	fd5ff06f          	j	8000359c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    fmem_head = temp->next;
    800035cc:	00053783          	ld	a5,0(a0)
    800035d0:	00f6b023          	sd	a5,0(a3)
    800035d4:	fe5ff06f          	j	800035b8 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x88>
                    fmem_head = newnode;
    800035d8:	00c6b023          	sd	a2,0(a3)
    800035dc:	fb5ff06f          	j	80003590 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x60>

00000000800035e0 <_ZN15MemoryAllocatorC1Ev>:
MemoryAllocator::MemoryAllocator() {
    800035e0:	fd010113          	addi	sp,sp,-48
    800035e4:	02113423          	sd	ra,40(sp)
    800035e8:	02813023          	sd	s0,32(sp)
    800035ec:	00913c23          	sd	s1,24(sp)
    800035f0:	01213823          	sd	s2,16(sp)
    800035f4:	01313423          	sd	s3,8(sp)
    800035f8:	01413023          	sd	s4,0(sp)
    800035fc:	03010413          	addi	s0,sp,48
    80003600:	00050493          	mv	s1,a0
    80003604:	00850a13          	addi	s4,a0,8
    80003608:	000a0513          	mv	a0,s4
    8000360c:	ffffe097          	auipc	ra,0xffffe
    80003610:	248080e7          	jalr	584(ra) # 80001854 <_ZN10ThreadPoolC1Ev>
    80003614:	01848993          	addi	s3,s1,24
    80003618:	00098513          	mv	a0,s3
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	65c080e7          	jalr	1628(ra) # 80003c78 <_ZN13SemaphorePoolC1Ev>
    fmem_head = (FreeMem*)(align((uint64)HEAP_START_ADDR) + (uint64)DEFAULT_STACK_SIZE);
    80003624:	00009797          	auipc	a5,0x9
    80003628:	7047b783          	ld	a5,1796(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000362c:	0007b583          	ld	a1,0(a5)
    80003630:	00048513          	mv	a0,s1
    80003634:	00000097          	auipc	ra,0x0
    80003638:	dec080e7          	jalr	-532(ra) # 80003420 <_ZN15MemoryAllocator5alignEm>
    8000363c:	000017b7          	lui	a5,0x1
    80003640:	00f50533          	add	a0,a0,a5
    80003644:	00a4b023          	sd	a0,0(s1)
    fmem_head->next = nullptr;
    80003648:	00053023          	sd	zero,0(a0)
    fmem_head->prev = nullptr;
    8000364c:	0004b783          	ld	a5,0(s1)
    80003650:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
                          (((uint64)HEAP_END_ADDR - (uint64)fmem_head) % MEM_BLOCK_SIZE)) / MEM_BLOCK_SIZE;
    80003654:	0004b703          	ld	a4,0(s1)
    80003658:	00009797          	auipc	a5,0x9
    8000365c:	6f87b783          	ld	a5,1784(a5) # 8000cd50 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003660:	0007b783          	ld	a5,0(a5)
    80003664:	40e787b3          	sub	a5,a5,a4
    uint64 totalBlocks = (((uint64)HEAP_END_ADDR - (uint64)fmem_head) -
    80003668:	0067d793          	srli	a5,a5,0x6
    fmem_head->size = totalBlocks;
    8000366c:	00f73823          	sd	a5,16(a4)
    void* threadManagerPoolAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(Thread));
    80003670:	0a000613          	li	a2,160
    80003674:	00a00593          	li	a1,10
    80003678:	00048513          	mv	a0,s1
    8000367c:	00000097          	auipc	ra,0x0
    80003680:	eb4080e7          	jalr	-332(ra) # 80003530 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    80003684:	00050913          	mv	s2,a0
    void* threadManagerUsedArrayAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(bool));
    80003688:	00100613          	li	a2,1
    8000368c:	00a00593          	li	a1,10
    80003690:	00048513          	mv	a0,s1
    80003694:	00000097          	auipc	ra,0x0
    80003698:	e9c080e7          	jalr	-356(ra) # 80003530 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    8000369c:	00050613          	mv	a2,a0
    threadPool.init(threadManagerPoolAddress, threadManagerUsedArrayAddress);
    800036a0:	00090593          	mv	a1,s2
    800036a4:	000a0513          	mv	a0,s4
    800036a8:	ffffe097          	auipc	ra,0xffffe
    800036ac:	1cc080e7          	jalr	460(ra) # 80001874 <_ZN10ThreadPool4initEPvS0_>
    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    800036b0:	02000613          	li	a2,32
    800036b4:	00a00593          	li	a1,10
    800036b8:	00048513          	mv	a0,s1
    800036bc:	00000097          	auipc	ra,0x0
    800036c0:	e74080e7          	jalr	-396(ra) # 80003530 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    800036c4:	00050913          	mv	s2,a0
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    800036c8:	00100613          	li	a2,1
    800036cc:	00a00593          	li	a1,10
    800036d0:	00048513          	mv	a0,s1
    800036d4:	00000097          	auipc	ra,0x0
    800036d8:	e5c080e7          	jalr	-420(ra) # 80003530 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    800036dc:	00050613          	mv	a2,a0
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
    800036e0:	00090593          	mv	a1,s2
    800036e4:	00098513          	mv	a0,s3
    800036e8:	00000097          	auipc	ra,0x0
    800036ec:	5b0080e7          	jalr	1456(ra) # 80003c98 <_ZN13SemaphorePool4initEPvS0_>
}
    800036f0:	02813083          	ld	ra,40(sp)
    800036f4:	02013403          	ld	s0,32(sp)
    800036f8:	01813483          	ld	s1,24(sp)
    800036fc:	01013903          	ld	s2,16(sp)
    80003700:	00813983          	ld	s3,8(sp)
    80003704:	00013a03          	ld	s4,0(sp)
    80003708:	03010113          	addi	sp,sp,48
    8000370c:	00008067          	ret

0000000080003710 <_ZN15MemoryAllocator8InstanceEv>:
    static MemoryAllocator instance;
    80003710:	0000a797          	auipc	a5,0xa
    80003714:	b607c783          	lbu	a5,-1184(a5) # 8000d270 <_ZGVZN15MemoryAllocator8InstanceEvE8instance>
    80003718:	00078863          	beqz	a5,80003728 <_ZN15MemoryAllocator8InstanceEv+0x18>
}
    8000371c:	0000a517          	auipc	a0,0xa
    80003720:	b5c50513          	addi	a0,a0,-1188 # 8000d278 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80003724:	00008067          	ret
MemoryAllocator* MemoryAllocator::Instance() {
    80003728:	ff010113          	addi	sp,sp,-16
    8000372c:	00113423          	sd	ra,8(sp)
    80003730:	00813023          	sd	s0,0(sp)
    80003734:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80003738:	0000a517          	auipc	a0,0xa
    8000373c:	b4050513          	addi	a0,a0,-1216 # 8000d278 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80003740:	00000097          	auipc	ra,0x0
    80003744:	ea0080e7          	jalr	-352(ra) # 800035e0 <_ZN15MemoryAllocatorC1Ev>
    80003748:	00100793          	li	a5,1
    8000374c:	0000a717          	auipc	a4,0xa
    80003750:	b2f70223          	sb	a5,-1244(a4) # 8000d270 <_ZGVZN15MemoryAllocator8InstanceEvE8instance>
}
    80003754:	0000a517          	auipc	a0,0xa
    80003758:	b2450513          	addi	a0,a0,-1244 # 8000d278 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    8000375c:	00813083          	ld	ra,8(sp)
    80003760:	00013403          	ld	s0,0(sp)
    80003764:	01010113          	addi	sp,sp,16
    80003768:	00008067          	ret

000000008000376c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>:

void MemoryAllocator::tryToJoin(FreeMem *node) {
    8000376c:	ff010113          	addi	sp,sp,-16
    80003770:	00813423          	sd	s0,8(sp)
    80003774:	01010413          	addi	s0,sp,16
    if(!node) return;
    80003778:	00058e63          	beqz	a1,80003794 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    FreeMem* nextnode = node->next;
    8000377c:	0005b783          	ld	a5,0(a1)
    if(nextnode && (char*)nextnode == ((char*)node + node->size * MEM_BLOCK_SIZE)){
    80003780:	00078a63          	beqz	a5,80003794 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    80003784:	0105b683          	ld	a3,16(a1)
    80003788:	00669713          	slli	a4,a3,0x6
    8000378c:	00e58733          	add	a4,a1,a4
    80003790:	00f70863          	beq	a4,a5,800037a0 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x34>
        node->size += nextnode->size;
        node->next = nextnode->next;
        if(node->next)node->next->prev = node;
    }
}
    80003794:	00813403          	ld	s0,8(sp)
    80003798:	01010113          	addi	sp,sp,16
    8000379c:	00008067          	ret
        node->size += nextnode->size;
    800037a0:	0107b703          	ld	a4,16(a5)
    800037a4:	00e686b3          	add	a3,a3,a4
    800037a8:	00d5b823          	sd	a3,16(a1)
        node->next = nextnode->next;
    800037ac:	0007b783          	ld	a5,0(a5)
    800037b0:	00f5b023          	sd	a5,0(a1)
        if(node->next)node->next->prev = node;
    800037b4:	fe0780e3          	beqz	a5,80003794 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    800037b8:	00b7b423          	sd	a1,8(a5)
    800037bc:	fd9ff06f          	j	80003794 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>

00000000800037c0 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {
    if(!ptr) return -1;
    800037c0:	0e058263          	beqz	a1,800038a4 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
int MemoryAllocator::mem_free(void *ptr) {
    800037c4:	fe010113          	addi	sp,sp,-32
    800037c8:	00113c23          	sd	ra,24(sp)
    800037cc:	00813823          	sd	s0,16(sp)
    800037d0:	00913423          	sd	s1,8(sp)
    800037d4:	01213023          	sd	s2,0(sp)
    800037d8:	02010413          	addi	s0,sp,32
    800037dc:	00050913          	mv	s2,a0

    Header* header = (Header*)ptr;

    //outside of the heap error
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    800037e0:	00009797          	auipc	a5,0x9
    800037e4:	5487b783          	ld	a5,1352(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x8>
    800037e8:	0007b783          	ld	a5,0(a5)
    800037ec:	0cf5e063          	bltu	a1,a5,800038ac <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    800037f0:	00009797          	auipc	a5,0x9
    800037f4:	5607b783          	ld	a5,1376(a5) # 8000cd50 <_GLOBAL_OFFSET_TABLE_+0x30>
    800037f8:	0007b783          	ld	a5,0(a5)
    800037fc:	0ab7ec63          	bltu	a5,a1,800038b4 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    //not aligned to a block error
    //if(((char*)header - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;

    FreeMem* newnode = (FreeMem*)header;
    newnode->size = header->numOfBlocks;
    80003800:	0005b783          	ld	a5,0(a1)
    80003804:	00f5b823          	sd	a5,16(a1)
    newnode->prev = nullptr;
    80003808:	0005b423          	sd	zero,8(a1)
    newnode->next = nullptr;
    8000380c:	0005b023          	sd	zero,0(a1)
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    80003810:	00053703          	ld	a4,0(a0)
    80003814:	02070463          	beqz	a4,8000383c <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    80003818:	02e5e663          	bltu	a1,a4,80003844 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
    8000381c:	00070793          	mv	a5,a4
        while(temp->next && (char*)temp->next < (char*)newnode)
    80003820:	00078493          	mv	s1,a5
    80003824:	0007b783          	ld	a5,0(a5)
    80003828:	00078463          	beqz	a5,80003830 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    8000382c:	feb7eae3          	bltu	a5,a1,80003820 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        {
            temp = temp->next;
        }
    }
    if(temp)
    80003830:	00048c63          	beqz	s1,80003848 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    {
        newnode->next = temp->next;
    80003834:	00f5b023          	sd	a5,0(a1)
    80003838:	0140006f          	j	8000384c <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
        temp = 0;
    8000383c:	00070493          	mv	s1,a4
    80003840:	0080006f          	j	80003848 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    80003844:	00000493          	li	s1,0
    }
    else {
        newnode->next = fmem_head;
    80003848:	00e5b023          	sd	a4,0(a1)
    }
    if(newnode->next)
    8000384c:	0005b783          	ld	a5,0(a1)
    80003850:	00078463          	beqz	a5,80003858 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    {
        newnode->next->prev = newnode;
    80003854:	00b7b423          	sd	a1,8(a5)
    }
    if(temp){
    80003858:	04048263          	beqz	s1,8000389c <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        temp->next = newnode;
    8000385c:	00b4b023          	sd	a1,0(s1)
        newnode->prev = temp;
    80003860:	0095b423          	sd	s1,8(a1)
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    80003864:	00090513          	mv	a0,s2
    80003868:	00000097          	auipc	ra,0x0
    8000386c:	f04080e7          	jalr	-252(ra) # 8000376c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(temp);
    80003870:	00048593          	mv	a1,s1
    80003874:	00090513          	mv	a0,s2
    80003878:	00000097          	auipc	ra,0x0
    8000387c:	ef4080e7          	jalr	-268(ra) # 8000376c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    80003880:	00000513          	li	a0,0
}
    80003884:	01813083          	ld	ra,24(sp)
    80003888:	01013403          	ld	s0,16(sp)
    8000388c:	00813483          	ld	s1,8(sp)
    80003890:	00013903          	ld	s2,0(sp)
    80003894:	02010113          	addi	sp,sp,32
    80003898:	00008067          	ret
        fmem_head = newnode;
    8000389c:	00b93023          	sd	a1,0(s2)
    800038a0:	fc5ff06f          	j	80003864 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(!ptr) return -1;
    800038a4:	fff00513          	li	a0,-1
}
    800038a8:	00008067          	ret
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    800038ac:	ffe00513          	li	a0,-2
    800038b0:	fd5ff06f          	j	80003884 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
    800038b4:	ffe00513          	li	a0,-2
    800038b8:	fcdff06f          	j	80003884 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>

00000000800038bc <_ZN15MemoryAllocator15mem_free_kernelEPvmm>:

int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    if(!ptr) return -1;
    800038bc:	0e058e63          	beqz	a1,800039b8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xfc>
int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    800038c0:	fe010113          	addi	sp,sp,-32
    800038c4:	00113c23          	sd	ra,24(sp)
    800038c8:	00813823          	sd	s0,16(sp)
    800038cc:	00913423          	sd	s1,8(sp)
    800038d0:	01213023          	sd	s2,0(sp)
    800038d4:	02010413          	addi	s0,sp,32
    800038d8:	00050913          	mv	s2,a0


    //outside of the heap error
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    800038dc:	00009797          	auipc	a5,0x9
    800038e0:	44c7b783          	ld	a5,1100(a5) # 8000cd28 <_GLOBAL_OFFSET_TABLE_+0x8>
    800038e4:	0007b783          	ld	a5,0(a5)
    800038e8:	0cf5ec63          	bltu	a1,a5,800039c0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x104>
    800038ec:	00009797          	auipc	a5,0x9
    800038f0:	4647b783          	ld	a5,1124(a5) # 8000cd50 <_GLOBAL_OFFSET_TABLE_+0x30>
    800038f4:	0007b783          	ld	a5,0(a5)
    800038f8:	0cb7e863          	bltu	a5,a1,800039c8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x10c>
    //not aligned to a block error
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    800038fc:	00053783          	ld	a5,0(a0)
    80003900:	40f587b3          	sub	a5,a1,a5
    80003904:	03f7f793          	andi	a5,a5,63
    80003908:	0c079463          	bnez	a5,800039d0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x114>
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000390c:	02d60633          	mul	a2,a2,a3
    80003910:	03f60613          	addi	a2,a2,63
    80003914:	00665613          	srli	a2,a2,0x6

    FreeMem* newnode = (FreeMem*)ptr;
    newnode->size = numOfBlocks;
    80003918:	00c5b823          	sd	a2,16(a1)
    newnode->prev = nullptr;
    8000391c:	0005b423          	sd	zero,8(a1)
    newnode->next = nullptr;
    80003920:	0005b023          	sd	zero,0(a1)
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    80003924:	00053703          	ld	a4,0(a0)
    80003928:	02070463          	beqz	a4,80003950 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x94>
    8000392c:	02e5e663          	bltu	a1,a4,80003958 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x9c>
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
    80003930:	00070793          	mv	a5,a4
        while(temp->next && (char*)temp->next < (char*)newnode)
    80003934:	00078493          	mv	s1,a5
    80003938:	0007b783          	ld	a5,0(a5)
    8000393c:	00078463          	beqz	a5,80003944 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x88>
    80003940:	feb7eae3          	bltu	a5,a1,80003934 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x78>
        {
            temp = temp->next;
        }
    }
    if(temp)
    80003944:	00048c63          	beqz	s1,8000395c <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa0>
    {
        newnode->next = temp->next;
    80003948:	00f5b023          	sd	a5,0(a1)
    8000394c:	0140006f          	j	80003960 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa4>
        temp = 0;
    80003950:	00070493          	mv	s1,a4
    80003954:	0080006f          	j	8000395c <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa0>
    80003958:	00000493          	li	s1,0
    }
    else {
        newnode->next = fmem_head;
    8000395c:	00e5b023          	sd	a4,0(a1)
    }
    if(newnode->next)
    80003960:	0005b783          	ld	a5,0(a1)
    80003964:	00078463          	beqz	a5,8000396c <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xb0>
    {
        newnode->next->prev = newnode;
    80003968:	00b7b423          	sd	a1,8(a5)
    }
    if(temp){
    8000396c:	04048263          	beqz	s1,800039b0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xf4>
        temp->next = newnode;
    80003970:	00b4b023          	sd	a1,0(s1)
        newnode->prev = temp;
    80003974:	0095b423          	sd	s1,8(a1)
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    80003978:	00090513          	mv	a0,s2
    8000397c:	00000097          	auipc	ra,0x0
    80003980:	df0080e7          	jalr	-528(ra) # 8000376c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(temp);
    80003984:	00048593          	mv	a1,s1
    80003988:	00090513          	mv	a0,s2
    8000398c:	00000097          	auipc	ra,0x0
    80003990:	de0080e7          	jalr	-544(ra) # 8000376c <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    80003994:	00000513          	li	a0,0
}
    80003998:	01813083          	ld	ra,24(sp)
    8000399c:	01013403          	ld	s0,16(sp)
    800039a0:	00813483          	ld	s1,8(sp)
    800039a4:	00013903          	ld	s2,0(sp)
    800039a8:	02010113          	addi	sp,sp,32
    800039ac:	00008067          	ret
        fmem_head = newnode;
    800039b0:	00b93023          	sd	a1,0(s2)
    800039b4:	fc5ff06f          	j	80003978 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xbc>
    if(!ptr) return -1;
    800039b8:	fff00513          	li	a0,-1
}
    800039bc:	00008067          	ret
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    800039c0:	ffe00513          	li	a0,-2
    800039c4:	fd5ff06f          	j	80003998 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>
    800039c8:	ffe00513          	li	a0,-2
    800039cc:	fcdff06f          	j	80003998 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    800039d0:	ffd00513          	li	a0,-3
    800039d4:	fc5ff06f          	j	80003998 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>

00000000800039d8 <_ZN15MemoryAllocator21free_memory_remainingEv>:

size_t MemoryAllocator::free_memory_remaining() {
    800039d8:	ff010113          	addi	sp,sp,-16
    800039dc:	00813423          	sd	s0,8(sp)
    800039e0:	01010413          	addi	s0,sp,16
    return fmem_head->size * MEM_BLOCK_SIZE;
    800039e4:	00053783          	ld	a5,0(a0)
    800039e8:	0107b503          	ld	a0,16(a5)
}
    800039ec:	00651513          	slli	a0,a0,0x6
    800039f0:	00813403          	ld	s0,8(sp)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret

00000000800039fc <_ZN15MemoryAllocator21get_largest_mem_blockEv>:
size_t MemoryAllocator::get_largest_mem_block() {
    800039fc:	ff010113          	addi	sp,sp,-16
    80003a00:	00813423          	sd	s0,8(sp)
    80003a04:	01010413          	addi	s0,sp,16
    if(fmem_head == nullptr) return 0;
    80003a08:	00053783          	ld	a5,0(a0)
    80003a0c:	02078a63          	beqz	a5,80003a40 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x44>
    FreeMem* temp = fmem_head;
    size_t maxBlocks = temp->size;
    80003a10:	0107b503          	ld	a0,16(a5)
    80003a14:	0080006f          	j	80003a1c <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x20>
    while(temp)
    {
        if(temp->size > maxBlocks){
            maxBlocks = temp->size;
        }
        temp = temp->next;
    80003a18:	0007b783          	ld	a5,0(a5)
    while(temp)
    80003a1c:	00078a63          	beqz	a5,80003a30 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x34>
        if(temp->size > maxBlocks){
    80003a20:	0107b703          	ld	a4,16(a5)
    80003a24:	fee57ae3          	bgeu	a0,a4,80003a18 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x1c>
            maxBlocks = temp->size;
    80003a28:	00070513          	mv	a0,a4
    80003a2c:	fedff06f          	j	80003a18 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x1c>
    }
    return maxBlocks * MEM_BLOCK_SIZE;
    80003a30:	00651513          	slli	a0,a0,0x6

}
    80003a34:	00813403          	ld	s0,8(sp)
    80003a38:	01010113          	addi	sp,sp,16
    80003a3c:	00008067          	ret
    if(fmem_head == nullptr) return 0;
    80003a40:	00000513          	li	a0,0
    80003a44:	ff1ff06f          	j	80003a34 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x38>

0000000080003a48 <_ZN8ListNodeI6ThreadEC1EPS0_>:
#include "../h/List.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Thread.hpp"

template<typename T>
ListNode<T>::ListNode(T* t) : next(nullptr), prev(nullptr), object(t) {}
    80003a48:	ff010113          	addi	sp,sp,-16
    80003a4c:	00813423          	sd	s0,8(sp)
    80003a50:	01010413          	addi	s0,sp,16
    80003a54:	00053023          	sd	zero,0(a0)
    80003a58:	00053423          	sd	zero,8(a0)
    80003a5c:	00b53823          	sd	a1,16(a0)
    80003a60:	00813403          	ld	s0,8(sp)
    80003a64:	01010113          	addi	sp,sp,16
    80003a68:	00008067          	ret

0000000080003a6c <_ZN8ListNodeI6ThreadEnwEm>:


template<typename T>
void* ListNode<T>::operator new(size_t size) {
    80003a6c:	fe010113          	addi	sp,sp,-32
    80003a70:	00113c23          	sd	ra,24(sp)
    80003a74:	00813823          	sd	s0,16(sp)
    80003a78:	00913423          	sd	s1,8(sp)
    80003a7c:	02010413          	addi	s0,sp,32
    uint64 numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80003a80:	04750493          	addi	s1,a0,71
    80003a84:	0064d493          	srli	s1,s1,0x6
    return MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    80003a88:	00000097          	auipc	ra,0x0
    80003a8c:	c88080e7          	jalr	-888(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80003a90:	00048593          	mv	a1,s1
    80003a94:	00000097          	auipc	ra,0x0
    80003a98:	9f4080e7          	jalr	-1548(ra) # 80003488 <_ZN15MemoryAllocator9mem_allocEm>
}
    80003a9c:	01813083          	ld	ra,24(sp)
    80003aa0:	01013403          	ld	s0,16(sp)
    80003aa4:	00813483          	ld	s1,8(sp)
    80003aa8:	02010113          	addi	sp,sp,32
    80003aac:	00008067          	ret

0000000080003ab0 <_ZN8ListNodeI6ThreadEdlEPv>:

template<typename T>
void ListNode<T>::operator delete(void* obj) {
    80003ab0:	fe010113          	addi	sp,sp,-32
    80003ab4:	00113c23          	sd	ra,24(sp)
    80003ab8:	00813823          	sd	s0,16(sp)
    80003abc:	00913423          	sd	s1,8(sp)
    80003ac0:	02010413          	addi	s0,sp,32
    char* header = (char*)obj - sizeof(Header);
    80003ac4:	ff850493          	addi	s1,a0,-8
    MemoryAllocator::Instance()->mem_free(header);
    80003ac8:	00000097          	auipc	ra,0x0
    80003acc:	c48080e7          	jalr	-952(ra) # 80003710 <_ZN15MemoryAllocator8InstanceEv>
    80003ad0:	00048593          	mv	a1,s1
    80003ad4:	00000097          	auipc	ra,0x0
    80003ad8:	cec080e7          	jalr	-788(ra) # 800037c0 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80003adc:	01813083          	ld	ra,24(sp)
    80003ae0:	01013403          	ld	s0,16(sp)
    80003ae4:	00813483          	ld	s1,8(sp)
    80003ae8:	02010113          	addi	sp,sp,32
    80003aec:	00008067          	ret

0000000080003af0 <_ZN4ListI6ThreadEC1Ev>:


template<typename T>
List<T>::List() : head(nullptr), tail(nullptr) {}
    80003af0:	ff010113          	addi	sp,sp,-16
    80003af4:	00813423          	sd	s0,8(sp)
    80003af8:	01010413          	addi	s0,sp,16
    80003afc:	00053023          	sd	zero,0(a0)
    80003b00:	00053423          	sd	zero,8(a0)
    80003b04:	00813403          	ld	s0,8(sp)
    80003b08:	01010113          	addi	sp,sp,16
    80003b0c:	00008067          	ret

0000000080003b10 <_ZN4ListI6ThreadED1Ev>:

template<typename T>
List<T>::~List() {
    ListNode<T>* current = head;
    80003b10:	00053503          	ld	a0,0(a0)
    while (current) {
    80003b14:	04050063          	beqz	a0,80003b54 <_ZN4ListI6ThreadED1Ev+0x44>
List<T>::~List() {
    80003b18:	fe010113          	addi	sp,sp,-32
    80003b1c:	00113c23          	sd	ra,24(sp)
    80003b20:	00813823          	sd	s0,16(sp)
    80003b24:	00913423          	sd	s1,8(sp)
    80003b28:	02010413          	addi	s0,sp,32
        ListNode<T>* next = current->next;
    80003b2c:	00053483          	ld	s1,0(a0)
        delete current;
    80003b30:	00000097          	auipc	ra,0x0
    80003b34:	f80080e7          	jalr	-128(ra) # 80003ab0 <_ZN8ListNodeI6ThreadEdlEPv>
        current = next;
    80003b38:	00048513          	mv	a0,s1
    while (current) {
    80003b3c:	fe0498e3          	bnez	s1,80003b2c <_ZN4ListI6ThreadED1Ev+0x1c>
    }
    head = tail = nullptr;
}
    80003b40:	01813083          	ld	ra,24(sp)
    80003b44:	01013403          	ld	s0,16(sp)
    80003b48:	00813483          	ld	s1,8(sp)
    80003b4c:	02010113          	addi	sp,sp,32
    80003b50:	00008067          	ret
    80003b54:	00008067          	ret

0000000080003b58 <_ZN4ListI6ThreadE7add_endEPS0_>:
bool List<T>::empty() {
    return head == nullptr;
}

template<typename T>
void List<T>::add_end(T* t) {
    80003b58:	fd010113          	addi	sp,sp,-48
    80003b5c:	02113423          	sd	ra,40(sp)
    80003b60:	02813023          	sd	s0,32(sp)
    80003b64:	00913c23          	sd	s1,24(sp)
    80003b68:	01213823          	sd	s2,16(sp)
    80003b6c:	01313423          	sd	s3,8(sp)
    80003b70:	03010413          	addi	s0,sp,48
    80003b74:	00050493          	mv	s1,a0
    80003b78:	00058993          	mv	s3,a1
    ListNode<T>* newnode = new ListNode<T>(t);
    80003b7c:	01800513          	li	a0,24
    80003b80:	00000097          	auipc	ra,0x0
    80003b84:	eec080e7          	jalr	-276(ra) # 80003a6c <_ZN8ListNodeI6ThreadEnwEm>
    80003b88:	00050913          	mv	s2,a0
    80003b8c:	00098593          	mv	a1,s3
    80003b90:	00000097          	auipc	ra,0x0
    80003b94:	eb8080e7          	jalr	-328(ra) # 80003a48 <_ZN8ListNodeI6ThreadEC1EPS0_>
    if (!head) {
    80003b98:	0004b783          	ld	a5,0(s1)
    80003b9c:	02078a63          	beqz	a5,80003bd0 <_ZN4ListI6ThreadE7add_endEPS0_+0x78>
        head = newnode;
    } else {
        tail->next = newnode;
    80003ba0:	0084b783          	ld	a5,8(s1)
    80003ba4:	0127b023          	sd	s2,0(a5)
        newnode->prev = tail;
    80003ba8:	0084b783          	ld	a5,8(s1)
    80003bac:	00f93423          	sd	a5,8(s2)
    }
    tail = newnode;
    80003bb0:	0124b423          	sd	s2,8(s1)
}
    80003bb4:	02813083          	ld	ra,40(sp)
    80003bb8:	02013403          	ld	s0,32(sp)
    80003bbc:	01813483          	ld	s1,24(sp)
    80003bc0:	01013903          	ld	s2,16(sp)
    80003bc4:	00813983          	ld	s3,8(sp)
    80003bc8:	03010113          	addi	sp,sp,48
    80003bcc:	00008067          	ret
        head = newnode;
    80003bd0:	0124b023          	sd	s2,0(s1)
    80003bd4:	fddff06f          	j	80003bb0 <_ZN4ListI6ThreadE7add_endEPS0_+0x58>
    80003bd8:	00050493          	mv	s1,a0
    ListNode<T>* newnode = new ListNode<T>(t);
    80003bdc:	00090513          	mv	a0,s2
    80003be0:	00000097          	auipc	ra,0x0
    80003be4:	ed0080e7          	jalr	-304(ra) # 80003ab0 <_ZN8ListNodeI6ThreadEdlEPv>
    80003be8:	00048513          	mv	a0,s1
    80003bec:	0000a097          	auipc	ra,0xa
    80003bf0:	7cc080e7          	jalr	1996(ra) # 8000e3b8 <_Unwind_Resume>

0000000080003bf4 <_ZN4ListI6ThreadE16remove_beginningEv>:

template<typename T>
T* List<T>::remove_beginning() {
    80003bf4:	fe010113          	addi	sp,sp,-32
    80003bf8:	00113c23          	sd	ra,24(sp)
    80003bfc:	00813823          	sd	s0,16(sp)
    80003c00:	00913423          	sd	s1,8(sp)
    80003c04:	02010413          	addi	s0,sp,32
    80003c08:	00050793          	mv	a5,a0
    if (!head) return nullptr;
    80003c0c:	00053503          	ld	a0,0(a0)
    80003c10:	04050063          	beqz	a0,80003c50 <_ZN4ListI6ThreadE16remove_beginningEv+0x5c>
    ListNode<T>* node = head;
    head = head->next;
    80003c14:	00053703          	ld	a4,0(a0)
    80003c18:	00e7b023          	sd	a4,0(a5)
    if (head)
    80003c1c:	02070663          	beqz	a4,80003c48 <_ZN4ListI6ThreadE16remove_beginningEv+0x54>
        head->prev = nullptr;
    80003c20:	00073423          	sd	zero,8(a4)
    else
        tail = nullptr;

    node->next = nullptr;
    node->prev = nullptr;
    T* obj = node->object;
    80003c24:	01053483          	ld	s1,16(a0)
    delete node;
    80003c28:	00000097          	auipc	ra,0x0
    80003c2c:	e88080e7          	jalr	-376(ra) # 80003ab0 <_ZN8ListNodeI6ThreadEdlEPv>
    return obj;
}
    80003c30:	00048513          	mv	a0,s1
    80003c34:	01813083          	ld	ra,24(sp)
    80003c38:	01013403          	ld	s0,16(sp)
    80003c3c:	00813483          	ld	s1,8(sp)
    80003c40:	02010113          	addi	sp,sp,32
    80003c44:	00008067          	ret
        tail = nullptr;
    80003c48:	0007b423          	sd	zero,8(a5)
    80003c4c:	fd9ff06f          	j	80003c24 <_ZN4ListI6ThreadE16remove_beginningEv+0x30>
    if (!head) return nullptr;
    80003c50:	00050493          	mv	s1,a0
    80003c54:	fddff06f          	j	80003c30 <_ZN4ListI6ThreadE16remove_beginningEv+0x3c>

0000000080003c58 <_ZN4ListI6ThreadE5emptyEv>:
bool List<T>::empty() {
    80003c58:	ff010113          	addi	sp,sp,-16
    80003c5c:	00813423          	sd	s0,8(sp)
    80003c60:	01010413          	addi	s0,sp,16
    return head == nullptr;
    80003c64:	00053503          	ld	a0,0(a0)
}
    80003c68:	00153513          	seqz	a0,a0
    80003c6c:	00813403          	ld	s0,8(sp)
    80003c70:	01010113          	addi	sp,sp,16
    80003c74:	00008067          	ret

0000000080003c78 <_ZN13SemaphorePoolC1Ev>:

#include "../h/SemaphorePool.hpp"

SemaphorePool::SemaphorePool() : pool(nullptr), used(nullptr) {}
    80003c78:	ff010113          	addi	sp,sp,-16
    80003c7c:	00813423          	sd	s0,8(sp)
    80003c80:	01010413          	addi	s0,sp,16
    80003c84:	00053023          	sd	zero,0(a0)
    80003c88:	00053423          	sd	zero,8(a0)
    80003c8c:	00813403          	ld	s0,8(sp)
    80003c90:	01010113          	addi	sp,sp,16
    80003c94:	00008067          	ret

0000000080003c98 <_ZN13SemaphorePool4initEPvS0_>:

void SemaphorePool::init(void* poolStartAddress, void* usedStartAddress) {
    80003c98:	ff010113          	addi	sp,sp,-16
    80003c9c:	00813423          	sd	s0,8(sp)
    80003ca0:	01010413          	addi	s0,sp,16
    pool = (Semaphore*)poolStartAddress;
    80003ca4:	00b53023          	sd	a1,0(a0)
    used = (bool*)usedStartAddress;
    80003ca8:	00c53423          	sd	a2,8(a0)
    for (int i = 0; i < MAX_SEMAPHORES; i++) used[i] = false;
    80003cac:	00000793          	li	a5,0
    80003cb0:	00900713          	li	a4,9
    80003cb4:	00f74c63          	blt	a4,a5,80003ccc <_ZN13SemaphorePool4initEPvS0_+0x34>
    80003cb8:	00853703          	ld	a4,8(a0)
    80003cbc:	00f70733          	add	a4,a4,a5
    80003cc0:	00070023          	sb	zero,0(a4)
    80003cc4:	0017879b          	addiw	a5,a5,1
    80003cc8:	fe9ff06f          	j	80003cb0 <_ZN13SemaphorePool4initEPvS0_+0x18>
}
    80003ccc:	00813403          	ld	s0,8(sp)
    80003cd0:	01010113          	addi	sp,sp,16
    80003cd4:	00008067          	ret

0000000080003cd8 <_ZN13SemaphorePool16getSemaphoreByIdEj>:

Semaphore* SemaphorePool::getSemaphoreById(sem_t id){
    80003cd8:	ff010113          	addi	sp,sp,-16
    80003cdc:	00813423          	sd	s0,8(sp)
    80003ce0:	01010413          	addi	s0,sp,16
    80003ce4:	00050693          	mv	a3,a0
    for(int i = 0; i < MAX_SEMAPHORES; i++){
    80003ce8:	00000793          	li	a5,0
    80003cec:	0080006f          	j	80003cf4 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x1c>
    80003cf0:	0017879b          	addiw	a5,a5,1
    80003cf4:	00900713          	li	a4,9
    80003cf8:	02f74663          	blt	a4,a5,80003d24 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x4c>
        if(used[i] == true && pool[i].myHandle == id){
    80003cfc:	0086b703          	ld	a4,8(a3)
    80003d00:	00f70733          	add	a4,a4,a5
    80003d04:	00074703          	lbu	a4,0(a4)
    80003d08:	fe0704e3          	beqz	a4,80003cf0 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x18>
    80003d0c:	0006b503          	ld	a0,0(a3)
    80003d10:	00579713          	slli	a4,a5,0x5
    80003d14:	00e50533          	add	a0,a0,a4
    80003d18:	00852703          	lw	a4,8(a0)
    80003d1c:	fcb71ae3          	bne	a4,a1,80003cf0 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x18>
    80003d20:	0080006f          	j	80003d28 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x50>
            return &pool[i];
        }
    }
    return nullptr;
    80003d24:	00000513          	li	a0,0
}
    80003d28:	00813403          	ld	s0,8(sp)
    80003d2c:	01010113          	addi	sp,sp,16
    80003d30:	00008067          	ret

0000000080003d34 <_ZN13SemaphorePool8allocateEv>:
Semaphore* SemaphorePool::allocate() {
    80003d34:	ff010113          	addi	sp,sp,-16
    80003d38:	00813423          	sd	s0,8(sp)
    80003d3c:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003d40:	00000793          	li	a5,0
    80003d44:	00900713          	li	a4,9
    80003d48:	02f74c63          	blt	a4,a5,80003d80 <_ZN13SemaphorePool8allocateEv+0x4c>
        if (!used[i]) {
    80003d4c:	00853703          	ld	a4,8(a0)
    80003d50:	00078613          	mv	a2,a5
    80003d54:	00f70733          	add	a4,a4,a5
    80003d58:	00074683          	lbu	a3,0(a4)
    80003d5c:	00068663          	beqz	a3,80003d68 <_ZN13SemaphorePool8allocateEv+0x34>
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003d60:	0017879b          	addiw	a5,a5,1
    80003d64:	fe1ff06f          	j	80003d44 <_ZN13SemaphorePool8allocateEv+0x10>
            used[i] = true;
    80003d68:	00100793          	li	a5,1
    80003d6c:	00f70023          	sb	a5,0(a4)
            return &pool[i];
    80003d70:	00053503          	ld	a0,0(a0)
    80003d74:	00561613          	slli	a2,a2,0x5
    80003d78:	00c50533          	add	a0,a0,a2
    80003d7c:	0080006f          	j	80003d84 <_ZN13SemaphorePool8allocateEv+0x50>
        }
    }
    return nullptr;
    80003d80:	00000513          	li	a0,0
}
    80003d84:	00813403          	ld	s0,8(sp)
    80003d88:	01010113          	addi	sp,sp,16
    80003d8c:	00008067          	ret

0000000080003d90 <_ZN13SemaphorePool10deallocateEP9Semaphore>:

void SemaphorePool::deallocate(Semaphore* obj) {
    80003d90:	ff010113          	addi	sp,sp,-16
    80003d94:	00813423          	sd	s0,8(sp)
    80003d98:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003d9c:	00000793          	li	a5,0
    80003da0:	00900713          	li	a4,9
    80003da4:	02f74663          	blt	a4,a5,80003dd0 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x40>
        if (&pool[i] == obj) {
    80003da8:	00053703          	ld	a4,0(a0)
    80003dac:	00078613          	mv	a2,a5
    80003db0:	00579693          	slli	a3,a5,0x5
    80003db4:	00d70733          	add	a4,a4,a3
    80003db8:	00b70663          	beq	a4,a1,80003dc4 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x34>
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    80003dbc:	0017879b          	addiw	a5,a5,1
    80003dc0:	fe1ff06f          	j	80003da0 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x10>
            used[i] = false;
    80003dc4:	00853783          	ld	a5,8(a0)
    80003dc8:	00c78633          	add	a2,a5,a2
    80003dcc:	00060023          	sb	zero,0(a2)
            return;
        }
    }
}
    80003dd0:	00813403          	ld	s0,8(sp)
    80003dd4:	01010113          	addi	sp,sp,16
    80003dd8:	00008067          	ret

0000000080003ddc <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003ddc:	fe010113          	addi	sp,sp,-32
    80003de0:	00113c23          	sd	ra,24(sp)
    80003de4:	00813823          	sd	s0,16(sp)
    80003de8:	00913423          	sd	s1,8(sp)
    80003dec:	01213023          	sd	s2,0(sp)
    80003df0:	02010413          	addi	s0,sp,32
    80003df4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003df8:	00000913          	li	s2,0
    80003dfc:	00c0006f          	j	80003e08 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003e00:	ffffe097          	auipc	ra,0xffffe
    80003e04:	84c080e7          	jalr	-1972(ra) # 8000164c <thread_dispatch>
    while ((key = getc()) != 0x1b) {
    80003e08:	ffffe097          	auipc	ra,0xffffe
    80003e0c:	9dc080e7          	jalr	-1572(ra) # 800017e4 <getc>
    80003e10:	0005059b          	sext.w	a1,a0
    80003e14:	01b00793          	li	a5,27
    80003e18:	02f58a63          	beq	a1,a5,80003e4c <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003e1c:	0084b503          	ld	a0,8(s1)
    80003e20:	00003097          	auipc	ra,0x3
    80003e24:	0c0080e7          	jalr	192(ra) # 80006ee0 <_ZN6Buffer3putEi>
        i++;
    80003e28:	0019071b          	addiw	a4,s2,1
    80003e2c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003e30:	0004a683          	lw	a3,0(s1)
    80003e34:	0026979b          	slliw	a5,a3,0x2
    80003e38:	00d787bb          	addw	a5,a5,a3
    80003e3c:	0017979b          	slliw	a5,a5,0x1
    80003e40:	02f767bb          	remw	a5,a4,a5
    80003e44:	fc0792e3          	bnez	a5,80003e08 <_ZL16producerKeyboardPv+0x2c>
    80003e48:	fb9ff06f          	j	80003e00 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003e4c:	00100793          	li	a5,1
    80003e50:	00009717          	auipc	a4,0x9
    80003e54:	44f72823          	sw	a5,1104(a4) # 8000d2a0 <_ZL9threadEnd>
    data->buffer->put('!');
    80003e58:	02100593          	li	a1,33
    80003e5c:	0084b503          	ld	a0,8(s1)
    80003e60:	00003097          	auipc	ra,0x3
    80003e64:	080080e7          	jalr	128(ra) # 80006ee0 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003e68:	0104a503          	lw	a0,16(s1)
    80003e6c:	ffffe097          	auipc	ra,0xffffe
    80003e70:	8f8080e7          	jalr	-1800(ra) # 80001764 <sem_signal>
}
    80003e74:	01813083          	ld	ra,24(sp)
    80003e78:	01013403          	ld	s0,16(sp)
    80003e7c:	00813483          	ld	s1,8(sp)
    80003e80:	00013903          	ld	s2,0(sp)
    80003e84:	02010113          	addi	sp,sp,32
    80003e88:	00008067          	ret

0000000080003e8c <_ZL8producerPv>:

static void producer(void *arg) {
    80003e8c:	fe010113          	addi	sp,sp,-32
    80003e90:	00113c23          	sd	ra,24(sp)
    80003e94:	00813823          	sd	s0,16(sp)
    80003e98:	00913423          	sd	s1,8(sp)
    80003e9c:	01213023          	sd	s2,0(sp)
    80003ea0:	02010413          	addi	s0,sp,32
    80003ea4:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ea8:	00000913          	li	s2,0
    80003eac:	00c0006f          	j	80003eb8 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003eb0:	ffffd097          	auipc	ra,0xffffd
    80003eb4:	79c080e7          	jalr	1948(ra) # 8000164c <thread_dispatch>
    while (!threadEnd) {
    80003eb8:	00009797          	auipc	a5,0x9
    80003ebc:	3e87a783          	lw	a5,1000(a5) # 8000d2a0 <_ZL9threadEnd>
    80003ec0:	02079e63          	bnez	a5,80003efc <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003ec4:	0004a583          	lw	a1,0(s1)
    80003ec8:	0305859b          	addiw	a1,a1,48
    80003ecc:	0084b503          	ld	a0,8(s1)
    80003ed0:	00003097          	auipc	ra,0x3
    80003ed4:	010080e7          	jalr	16(ra) # 80006ee0 <_ZN6Buffer3putEi>
        i++;
    80003ed8:	0019071b          	addiw	a4,s2,1
    80003edc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003ee0:	0004a683          	lw	a3,0(s1)
    80003ee4:	0026979b          	slliw	a5,a3,0x2
    80003ee8:	00d787bb          	addw	a5,a5,a3
    80003eec:	0017979b          	slliw	a5,a5,0x1
    80003ef0:	02f767bb          	remw	a5,a4,a5
    80003ef4:	fc0792e3          	bnez	a5,80003eb8 <_ZL8producerPv+0x2c>
    80003ef8:	fb9ff06f          	j	80003eb0 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003efc:	0104a503          	lw	a0,16(s1)
    80003f00:	ffffe097          	auipc	ra,0xffffe
    80003f04:	864080e7          	jalr	-1948(ra) # 80001764 <sem_signal>
}
    80003f08:	01813083          	ld	ra,24(sp)
    80003f0c:	01013403          	ld	s0,16(sp)
    80003f10:	00813483          	ld	s1,8(sp)
    80003f14:	00013903          	ld	s2,0(sp)
    80003f18:	02010113          	addi	sp,sp,32
    80003f1c:	00008067          	ret

0000000080003f20 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003f20:	fd010113          	addi	sp,sp,-48
    80003f24:	02113423          	sd	ra,40(sp)
    80003f28:	02813023          	sd	s0,32(sp)
    80003f2c:	00913c23          	sd	s1,24(sp)
    80003f30:	01213823          	sd	s2,16(sp)
    80003f34:	01313423          	sd	s3,8(sp)
    80003f38:	03010413          	addi	s0,sp,48
    80003f3c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003f40:	00000993          	li	s3,0
    80003f44:	01c0006f          	j	80003f60 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003f48:	ffffd097          	auipc	ra,0xffffd
    80003f4c:	704080e7          	jalr	1796(ra) # 8000164c <thread_dispatch>
    80003f50:	0500006f          	j	80003fa0 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003f54:	00a00513          	li	a0,10
    80003f58:	ffffe097          	auipc	ra,0xffffe
    80003f5c:	8bc080e7          	jalr	-1860(ra) # 80001814 <putc>
    while (!threadEnd) {
    80003f60:	00009797          	auipc	a5,0x9
    80003f64:	3407a783          	lw	a5,832(a5) # 8000d2a0 <_ZL9threadEnd>
    80003f68:	06079063          	bnez	a5,80003fc8 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003f6c:	00893503          	ld	a0,8(s2)
    80003f70:	00003097          	auipc	ra,0x3
    80003f74:	000080e7          	jalr	ra # 80006f70 <_ZN6Buffer3getEv>
        i++;
    80003f78:	0019849b          	addiw	s1,s3,1
    80003f7c:	0004899b          	sext.w	s3,s1
        putc(key);
    80003f80:	0ff57513          	andi	a0,a0,255
    80003f84:	ffffe097          	auipc	ra,0xffffe
    80003f88:	890080e7          	jalr	-1904(ra) # 80001814 <putc>
        if (i % (5 * data->id) == 0) {
    80003f8c:	00092703          	lw	a4,0(s2)
    80003f90:	0027179b          	slliw	a5,a4,0x2
    80003f94:	00e787bb          	addw	a5,a5,a4
    80003f98:	02f4e7bb          	remw	a5,s1,a5
    80003f9c:	fa0786e3          	beqz	a5,80003f48 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003fa0:	05000793          	li	a5,80
    80003fa4:	02f4e4bb          	remw	s1,s1,a5
    80003fa8:	fa049ce3          	bnez	s1,80003f60 <_ZL8consumerPv+0x40>
    80003fac:	fa9ff06f          	j	80003f54 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003fb0:	00893503          	ld	a0,8(s2)
    80003fb4:	00003097          	auipc	ra,0x3
    80003fb8:	fbc080e7          	jalr	-68(ra) # 80006f70 <_ZN6Buffer3getEv>
        putc(key);
    80003fbc:	0ff57513          	andi	a0,a0,255
    80003fc0:	ffffe097          	auipc	ra,0xffffe
    80003fc4:	854080e7          	jalr	-1964(ra) # 80001814 <putc>
    while (data->buffer->getCnt() > 0) {
    80003fc8:	00893503          	ld	a0,8(s2)
    80003fcc:	00003097          	auipc	ra,0x3
    80003fd0:	030080e7          	jalr	48(ra) # 80006ffc <_ZN6Buffer6getCntEv>
    80003fd4:	fca04ee3          	bgtz	a0,80003fb0 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003fd8:	01092503          	lw	a0,16(s2)
    80003fdc:	ffffd097          	auipc	ra,0xffffd
    80003fe0:	788080e7          	jalr	1928(ra) # 80001764 <sem_signal>
}
    80003fe4:	02813083          	ld	ra,40(sp)
    80003fe8:	02013403          	ld	s0,32(sp)
    80003fec:	01813483          	ld	s1,24(sp)
    80003ff0:	01013903          	ld	s2,16(sp)
    80003ff4:	00813983          	ld	s3,8(sp)
    80003ff8:	03010113          	addi	sp,sp,48
    80003ffc:	00008067          	ret

0000000080004000 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80004000:	fa010113          	addi	sp,sp,-96
    80004004:	04113c23          	sd	ra,88(sp)
    80004008:	04813823          	sd	s0,80(sp)
    8000400c:	04913423          	sd	s1,72(sp)
    80004010:	05213023          	sd	s2,64(sp)
    80004014:	03313c23          	sd	s3,56(sp)
    80004018:	06010413          	addi	s0,sp,96
    //char input[30];
    int n, threadNum;

    printString("Unesite broj proizvodjaca?\n");
    8000401c:	00006517          	auipc	a0,0x6
    80004020:	11450513          	addi	a0,a0,276 # 8000a130 <CONSOLE_STATUS+0x120>
    80004024:	00002097          	auipc	ra,0x2
    80004028:	128080e7          	jalr	296(ra) # 8000614c <_Z11printStringPKc>
    //getString(input, 30);
    threadNum = 10;//stringToInt(input);

    printString("Unesite velicinu bafera?\n");
    8000402c:	00006517          	auipc	a0,0x6
    80004030:	12450513          	addi	a0,a0,292 # 8000a150 <CONSOLE_STATUS+0x140>
    80004034:	00002097          	auipc	ra,0x2
    80004038:	118080e7          	jalr	280(ra) # 8000614c <_Z11printStringPKc>
    //getString(input, 30);
    n = 15;//stringToInt(input);

    printString("Broj proizvodjaca "); printInt(threadNum);
    8000403c:	00006517          	auipc	a0,0x6
    80004040:	13450513          	addi	a0,a0,308 # 8000a170 <CONSOLE_STATUS+0x160>
    80004044:	00002097          	auipc	ra,0x2
    80004048:	108080e7          	jalr	264(ra) # 8000614c <_Z11printStringPKc>
    8000404c:	00000613          	li	a2,0
    80004050:	00a00593          	li	a1,10
    80004054:	00a00513          	li	a0,10
    80004058:	00002097          	auipc	ra,0x2
    8000405c:	2a4080e7          	jalr	676(ra) # 800062fc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004060:	00006517          	auipc	a0,0x6
    80004064:	12850513          	addi	a0,a0,296 # 8000a188 <CONSOLE_STATUS+0x178>
    80004068:	00002097          	auipc	ra,0x2
    8000406c:	0e4080e7          	jalr	228(ra) # 8000614c <_Z11printStringPKc>
    80004070:	00000613          	li	a2,0
    80004074:	00a00593          	li	a1,10
    80004078:	00f00513          	li	a0,15
    8000407c:	00002097          	auipc	ra,0x2
    80004080:	280080e7          	jalr	640(ra) # 800062fc <_Z8printIntiii>
    printString(".\n");
    80004084:	00006517          	auipc	a0,0x6
    80004088:	11c50513          	addi	a0,a0,284 # 8000a1a0 <CONSOLE_STATUS+0x190>
    8000408c:	00002097          	auipc	ra,0x2
    80004090:	0c0080e7          	jalr	192(ra) # 8000614c <_Z11printStringPKc>
    } else if (threadNum < 1) {
        printString("Broj proizvodjaca mora biti veci od nula!\n");
        return;
    }

    Buffer *buffer = new Buffer(n);
    80004094:	02800513          	li	a0,40
    80004098:	fffff097          	auipc	ra,0xfffff
    8000409c:	2c0080e7          	jalr	704(ra) # 80003358 <_Znwm>
    800040a0:	00050993          	mv	s3,a0
    800040a4:	00f00593          	li	a1,15
    800040a8:	00003097          	auipc	ra,0x3
    800040ac:	d9c080e7          	jalr	-612(ra) # 80006e44 <_ZN6BufferC1Ei>


    sem_open(&waitForAll, 0);
    800040b0:	00000593          	li	a1,0
    800040b4:	00009517          	auipc	a0,0x9
    800040b8:	1f050513          	addi	a0,a0,496 # 8000d2a4 <_ZL10waitForAll>
    800040bc:	ffffd097          	auipc	ra,0xffffd
    800040c0:	610080e7          	jalr	1552(ra) # 800016cc <sem_open>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    800040c4:	ef010113          	addi	sp,sp,-272
    800040c8:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    800040cc:	00a00793          	li	a5,10
    800040d0:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    800040d4:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    800040d8:	00009797          	auipc	a5,0x9
    800040dc:	1cc7a783          	lw	a5,460(a5) # 8000d2a4 <_ZL10waitForAll>
    800040e0:	10f92023          	sw	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    800040e4:	0f090613          	addi	a2,s2,240
    800040e8:	00000597          	auipc	a1,0x0
    800040ec:	e3858593          	addi	a1,a1,-456 # 80003f20 <_ZL8consumerPv>
    800040f0:	fcc40513          	addi	a0,s0,-52
    800040f4:	ffffd097          	auipc	ra,0xffffd
    800040f8:	4a0080e7          	jalr	1184(ra) # 80001594 <thread_create>

    for (int i = 0; i < threadNum; i++) {
    800040fc:	00000493          	li	s1,0
    80004100:	00900793          	li	a5,9
    80004104:	0697c863          	blt	a5,s1,80004174 <_Z22producerConsumer_C_APIv+0x174>
        data[i].id = i;
    80004108:	00149793          	slli	a5,s1,0x1
    8000410c:	009787b3          	add	a5,a5,s1
    80004110:	00379793          	slli	a5,a5,0x3
    80004114:	00f907b3          	add	a5,s2,a5
    80004118:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000411c:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    80004120:	00009717          	auipc	a4,0x9
    80004124:	18472703          	lw	a4,388(a4) # 8000d2a4 <_ZL10waitForAll>
    80004128:	00e7a823          	sw	a4,16(a5)

        thread_create(threads + i,
    8000412c:	00048713          	mv	a4,s1
    80004130:	00249513          	slli	a0,s1,0x2
    80004134:	fa040793          	addi	a5,s0,-96
    80004138:	00a78533          	add	a0,a5,a0
    8000413c:	02905663          	blez	s1,80004168 <_Z22producerConsumer_C_APIv+0x168>
    80004140:	00000597          	auipc	a1,0x0
    80004144:	d4c58593          	addi	a1,a1,-692 # 80003e8c <_ZL8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80004148:	00171613          	slli	a2,a4,0x1
    8000414c:	00e60633          	add	a2,a2,a4
    80004150:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004154:	00c90633          	add	a2,s2,a2
    80004158:	ffffd097          	auipc	ra,0xffffd
    8000415c:	43c080e7          	jalr	1084(ra) # 80001594 <thread_create>
    for (int i = 0; i < threadNum; i++) {
    80004160:	0014849b          	addiw	s1,s1,1
    80004164:	f9dff06f          	j	80004100 <_Z22producerConsumer_C_APIv+0x100>
        thread_create(threads + i,
    80004168:	00000597          	auipc	a1,0x0
    8000416c:	c7458593          	addi	a1,a1,-908 # 80003ddc <_ZL16producerKeyboardPv>
    80004170:	fd9ff06f          	j	80004148 <_Z22producerConsumer_C_APIv+0x148>
    }

    thread_dispatch();
    80004174:	ffffd097          	auipc	ra,0xffffd
    80004178:	4d8080e7          	jalr	1240(ra) # 8000164c <thread_dispatch>

    for (int i = 0; i <= threadNum; i++) {
    8000417c:	00000493          	li	s1,0
    80004180:	0180006f          	j	80004198 <_Z22producerConsumer_C_APIv+0x198>
        sem_wait(waitForAll);
    80004184:	00009517          	auipc	a0,0x9
    80004188:	12052503          	lw	a0,288(a0) # 8000d2a4 <_ZL10waitForAll>
    8000418c:	ffffd097          	auipc	ra,0xffffd
    80004190:	590080e7          	jalr	1424(ra) # 8000171c <sem_wait>
    for (int i = 0; i <= threadNum; i++) {
    80004194:	0014849b          	addiw	s1,s1,1
    80004198:	00a00793          	li	a5,10
    8000419c:	fe97d4e3          	bge	a5,s1,80004184 <_Z22producerConsumer_C_APIv+0x184>
    }

    sem_close(waitForAll);
    800041a0:	00009517          	auipc	a0,0x9
    800041a4:	10452503          	lw	a0,260(a0) # 8000d2a4 <_ZL10waitForAll>
    800041a8:	ffffd097          	auipc	ra,0xffffd
    800041ac:	5fc080e7          	jalr	1532(ra) # 800017a4 <sem_close>

    delete buffer;
    800041b0:	00098e63          	beqz	s3,800041cc <_Z22producerConsumer_C_APIv+0x1cc>
    800041b4:	00098513          	mv	a0,s3
    800041b8:	00003097          	auipc	ra,0x3
    800041bc:	ecc080e7          	jalr	-308(ra) # 80007084 <_ZN6BufferD1Ev>
    800041c0:	00098513          	mv	a0,s3
    800041c4:	fffff097          	auipc	ra,0xfffff
    800041c8:	1e4080e7          	jalr	484(ra) # 800033a8 <_ZdlPv>

}
    800041cc:	fa040113          	addi	sp,s0,-96
    800041d0:	05813083          	ld	ra,88(sp)
    800041d4:	05013403          	ld	s0,80(sp)
    800041d8:	04813483          	ld	s1,72(sp)
    800041dc:	04013903          	ld	s2,64(sp)
    800041e0:	03813983          	ld	s3,56(sp)
    800041e4:	06010113          	addi	sp,sp,96
    800041e8:	00008067          	ret
    800041ec:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800041f0:	00098513          	mv	a0,s3
    800041f4:	fffff097          	auipc	ra,0xfffff
    800041f8:	1b4080e7          	jalr	436(ra) # 800033a8 <_ZdlPv>
    800041fc:	00048513          	mv	a0,s1
    80004200:	0000a097          	auipc	ra,0xa
    80004204:	1b8080e7          	jalr	440(ra) # 8000e3b8 <_Unwind_Resume>

0000000080004208 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004208:	fe010113          	addi	sp,sp,-32
    8000420c:	00113c23          	sd	ra,24(sp)
    80004210:	00813823          	sd	s0,16(sp)
    80004214:	00913423          	sd	s1,8(sp)
    80004218:	01213023          	sd	s2,0(sp)
    8000421c:	02010413          	addi	s0,sp,32
    80004220:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004224:	00100793          	li	a5,1
    80004228:	02a7f863          	bgeu	a5,a0,80004258 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000422c:	00a00793          	li	a5,10
    80004230:	02f577b3          	remu	a5,a0,a5
    80004234:	02078e63          	beqz	a5,80004270 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004238:	fff48513          	addi	a0,s1,-1
    8000423c:	00000097          	auipc	ra,0x0
    80004240:	fcc080e7          	jalr	-52(ra) # 80004208 <_ZL9fibonaccim>
    80004244:	00050913          	mv	s2,a0
    80004248:	ffe48513          	addi	a0,s1,-2
    8000424c:	00000097          	auipc	ra,0x0
    80004250:	fbc080e7          	jalr	-68(ra) # 80004208 <_ZL9fibonaccim>
    80004254:	00a90533          	add	a0,s2,a0
}
    80004258:	01813083          	ld	ra,24(sp)
    8000425c:	01013403          	ld	s0,16(sp)
    80004260:	00813483          	ld	s1,8(sp)
    80004264:	00013903          	ld	s2,0(sp)
    80004268:	02010113          	addi	sp,sp,32
    8000426c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004270:	ffffd097          	auipc	ra,0xffffd
    80004274:	3dc080e7          	jalr	988(ra) # 8000164c <thread_dispatch>
    80004278:	fc1ff06f          	j	80004238 <_ZL9fibonaccim+0x30>

000000008000427c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000427c:	fe010113          	addi	sp,sp,-32
    80004280:	00113c23          	sd	ra,24(sp)
    80004284:	00813823          	sd	s0,16(sp)
    80004288:	00913423          	sd	s1,8(sp)
    8000428c:	01213023          	sd	s2,0(sp)
    80004290:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004294:	00000913          	li	s2,0
    80004298:	0300006f          	j	800042c8 <_ZN7WorkerA11workerBodyAEPv+0x4c>
        printString("A: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10; j++) {
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    8000429c:	00178793          	addi	a5,a5,1
    800042a0:	01d00713          	li	a4,29
    800042a4:	fef77ce3          	bgeu	a4,a5,8000429c <_ZN7WorkerA11workerBodyAEPv+0x20>
            thread_dispatch();
    800042a8:	ffffd097          	auipc	ra,0xffffd
    800042ac:	3a4080e7          	jalr	932(ra) # 8000164c <thread_dispatch>
        for (uint64 j = 0; j < 10; j++) {
    800042b0:	00148493          	addi	s1,s1,1
    800042b4:	00900793          	li	a5,9
    800042b8:	0097e663          	bltu	a5,s1,800042c4 <_ZN7WorkerA11workerBodyAEPv+0x48>
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    800042bc:	00000793          	li	a5,0
    800042c0:	fe1ff06f          	j	800042a0 <_ZN7WorkerA11workerBodyAEPv+0x24>
    for (uint64 i = 0; i < 10; i++) {
    800042c4:	00190913          	addi	s2,s2,1
    800042c8:	00900793          	li	a5,9
    800042cc:	0527e063          	bltu	a5,s2,8000430c <_ZN7WorkerA11workerBodyAEPv+0x90>
        printString("A: i=");
    800042d0:	00006517          	auipc	a0,0x6
    800042d4:	ed850513          	addi	a0,a0,-296 # 8000a1a8 <CONSOLE_STATUS+0x198>
    800042d8:	00002097          	auipc	ra,0x2
    800042dc:	e74080e7          	jalr	-396(ra) # 8000614c <_Z11printStringPKc>
        printInt(i);
    800042e0:	00000613          	li	a2,0
    800042e4:	00a00593          	li	a1,10
    800042e8:	0009051b          	sext.w	a0,s2
    800042ec:	00002097          	auipc	ra,0x2
    800042f0:	010080e7          	jalr	16(ra) # 800062fc <_Z8printIntiii>
        printString("\n");
    800042f4:	00006517          	auipc	a0,0x6
    800042f8:	e7450513          	addi	a0,a0,-396 # 8000a168 <CONSOLE_STATUS+0x158>
    800042fc:	00002097          	auipc	ra,0x2
    80004300:	e50080e7          	jalr	-432(ra) # 8000614c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    80004304:	00000493          	li	s1,0
    80004308:	fadff06f          	j	800042b4 <_ZN7WorkerA11workerBodyAEPv+0x38>
        }
    }
    printString("A finished!\n");
    8000430c:	00006517          	auipc	a0,0x6
    80004310:	ea450513          	addi	a0,a0,-348 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80004314:	00002097          	auipc	ra,0x2
    80004318:	e38080e7          	jalr	-456(ra) # 8000614c <_Z11printStringPKc>
    finishedA = true;
    8000431c:	00100793          	li	a5,1
    80004320:	00009717          	auipc	a4,0x9
    80004324:	f8f70423          	sb	a5,-120(a4) # 8000d2a8 <_ZL9finishedA>
}
    80004328:	01813083          	ld	ra,24(sp)
    8000432c:	01013403          	ld	s0,16(sp)
    80004330:	00813483          	ld	s1,8(sp)
    80004334:	00013903          	ld	s2,0(sp)
    80004338:	02010113          	addi	sp,sp,32
    8000433c:	00008067          	ret

0000000080004340 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004340:	fe010113          	addi	sp,sp,-32
    80004344:	00113c23          	sd	ra,24(sp)
    80004348:	00813823          	sd	s0,16(sp)
    8000434c:	00913423          	sd	s1,8(sp)
    80004350:	01213023          	sd	s2,0(sp)
    80004354:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004358:	00000913          	li	s2,0
    8000435c:	0300006f          	j	8000438c <_ZN7WorkerB11workerBodyBEPv+0x4c>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10; j++) {
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80004360:	00178793          	addi	a5,a5,1
    80004364:	01d00713          	li	a4,29
    80004368:	fef77ce3          	bgeu	a4,a5,80004360 <_ZN7WorkerB11workerBodyBEPv+0x20>
            thread_dispatch();
    8000436c:	ffffd097          	auipc	ra,0xffffd
    80004370:	2e0080e7          	jalr	736(ra) # 8000164c <thread_dispatch>
        for (uint64 j = 0; j < 10; j++) {
    80004374:	00148493          	addi	s1,s1,1
    80004378:	00900793          	li	a5,9
    8000437c:	0097e663          	bltu	a5,s1,80004388 <_ZN7WorkerB11workerBodyBEPv+0x48>
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80004380:	00000793          	li	a5,0
    80004384:	fe1ff06f          	j	80004364 <_ZN7WorkerB11workerBodyBEPv+0x24>
    for (uint64 i = 0; i < 16; i++) {
    80004388:	00190913          	addi	s2,s2,1
    8000438c:	00f00793          	li	a5,15
    80004390:	0527e063          	bltu	a5,s2,800043d0 <_ZN7WorkerB11workerBodyBEPv+0x90>
        printString("B: i="); printInt(i); printString("\n");
    80004394:	00006517          	auipc	a0,0x6
    80004398:	e2c50513          	addi	a0,a0,-468 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    8000439c:	00002097          	auipc	ra,0x2
    800043a0:	db0080e7          	jalr	-592(ra) # 8000614c <_Z11printStringPKc>
    800043a4:	00000613          	li	a2,0
    800043a8:	00a00593          	li	a1,10
    800043ac:	0009051b          	sext.w	a0,s2
    800043b0:	00002097          	auipc	ra,0x2
    800043b4:	f4c080e7          	jalr	-180(ra) # 800062fc <_Z8printIntiii>
    800043b8:	00006517          	auipc	a0,0x6
    800043bc:	db050513          	addi	a0,a0,-592 # 8000a168 <CONSOLE_STATUS+0x158>
    800043c0:	00002097          	auipc	ra,0x2
    800043c4:	d8c080e7          	jalr	-628(ra) # 8000614c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    800043c8:	00000493          	li	s1,0
    800043cc:	fadff06f          	j	80004378 <_ZN7WorkerB11workerBodyBEPv+0x38>
        }
    }
    printString("B finished!\n");
    800043d0:	00006517          	auipc	a0,0x6
    800043d4:	df850513          	addi	a0,a0,-520 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    800043d8:	00002097          	auipc	ra,0x2
    800043dc:	d74080e7          	jalr	-652(ra) # 8000614c <_Z11printStringPKc>
    finishedB = true;
    800043e0:	00100793          	li	a5,1
    800043e4:	00009717          	auipc	a4,0x9
    800043e8:	ecf702a3          	sb	a5,-315(a4) # 8000d2a9 <_ZL9finishedB>
    thread_dispatch();
    800043ec:	ffffd097          	auipc	ra,0xffffd
    800043f0:	260080e7          	jalr	608(ra) # 8000164c <thread_dispatch>
}
    800043f4:	01813083          	ld	ra,24(sp)
    800043f8:	01013403          	ld	s0,16(sp)
    800043fc:	00813483          	ld	s1,8(sp)
    80004400:	00013903          	ld	s2,0(sp)
    80004404:	02010113          	addi	sp,sp,32
    80004408:	00008067          	ret

000000008000440c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    8000440c:	fe010113          	addi	sp,sp,-32
    80004410:	00113c23          	sd	ra,24(sp)
    80004414:	00813823          	sd	s0,16(sp)
    80004418:	00913423          	sd	s1,8(sp)
    8000441c:	01213023          	sd	s2,0(sp)
    80004420:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004424:	00000493          	li	s1,0
    80004428:	0400006f          	j	80004468 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000442c:	00006517          	auipc	a0,0x6
    80004430:	dac50513          	addi	a0,a0,-596 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80004434:	00002097          	auipc	ra,0x2
    80004438:	d18080e7          	jalr	-744(ra) # 8000614c <_Z11printStringPKc>
    8000443c:	00000613          	li	a2,0
    80004440:	00a00593          	li	a1,10
    80004444:	00048513          	mv	a0,s1
    80004448:	00002097          	auipc	ra,0x2
    8000444c:	eb4080e7          	jalr	-332(ra) # 800062fc <_Z8printIntiii>
    80004450:	00006517          	auipc	a0,0x6
    80004454:	d1850513          	addi	a0,a0,-744 # 8000a168 <CONSOLE_STATUS+0x158>
    80004458:	00002097          	auipc	ra,0x2
    8000445c:	cf4080e7          	jalr	-780(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004460:	0014849b          	addiw	s1,s1,1
    80004464:	0ff4f493          	andi	s1,s1,255
    80004468:	00200793          	li	a5,2
    8000446c:	fc97f0e3          	bgeu	a5,s1,8000442c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004470:	00006517          	auipc	a0,0x6
    80004474:	d7050513          	addi	a0,a0,-656 # 8000a1e0 <CONSOLE_STATUS+0x1d0>
    80004478:	00002097          	auipc	ra,0x2
    8000447c:	cd4080e7          	jalr	-812(ra) # 8000614c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004480:	00700313          	li	t1,7

    thread_dispatch();
    80004484:	ffffd097          	auipc	ra,0xffffd
    80004488:	1c8080e7          	jalr	456(ra) # 8000164c <thread_dispatch>


    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000448c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004490:	00006517          	auipc	a0,0x6
    80004494:	d6050513          	addi	a0,a0,-672 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    80004498:	00002097          	auipc	ra,0x2
    8000449c:	cb4080e7          	jalr	-844(ra) # 8000614c <_Z11printStringPKc>
    800044a0:	00000613          	li	a2,0
    800044a4:	00a00593          	li	a1,10
    800044a8:	0009051b          	sext.w	a0,s2
    800044ac:	00002097          	auipc	ra,0x2
    800044b0:	e50080e7          	jalr	-432(ra) # 800062fc <_Z8printIntiii>
    800044b4:	00006517          	auipc	a0,0x6
    800044b8:	cb450513          	addi	a0,a0,-844 # 8000a168 <CONSOLE_STATUS+0x158>
    800044bc:	00002097          	auipc	ra,0x2
    800044c0:	c90080e7          	jalr	-880(ra) # 8000614c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800044c4:	00c00513          	li	a0,12
    800044c8:	00000097          	auipc	ra,0x0
    800044cc:	d40080e7          	jalr	-704(ra) # 80004208 <_ZL9fibonaccim>
    800044d0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800044d4:	00006517          	auipc	a0,0x6
    800044d8:	d2450513          	addi	a0,a0,-732 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    800044dc:	00002097          	auipc	ra,0x2
    800044e0:	c70080e7          	jalr	-912(ra) # 8000614c <_Z11printStringPKc>
    800044e4:	00000613          	li	a2,0
    800044e8:	00a00593          	li	a1,10
    800044ec:	0009051b          	sext.w	a0,s2
    800044f0:	00002097          	auipc	ra,0x2
    800044f4:	e0c080e7          	jalr	-500(ra) # 800062fc <_Z8printIntiii>
    800044f8:	00006517          	auipc	a0,0x6
    800044fc:	c7050513          	addi	a0,a0,-912 # 8000a168 <CONSOLE_STATUS+0x158>
    80004500:	00002097          	auipc	ra,0x2
    80004504:	c4c080e7          	jalr	-948(ra) # 8000614c <_Z11printStringPKc>
    80004508:	0400006f          	j	80004548 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000450c:	00006517          	auipc	a0,0x6
    80004510:	ccc50513          	addi	a0,a0,-820 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80004514:	00002097          	auipc	ra,0x2
    80004518:	c38080e7          	jalr	-968(ra) # 8000614c <_Z11printStringPKc>
    8000451c:	00000613          	li	a2,0
    80004520:	00a00593          	li	a1,10
    80004524:	00048513          	mv	a0,s1
    80004528:	00002097          	auipc	ra,0x2
    8000452c:	dd4080e7          	jalr	-556(ra) # 800062fc <_Z8printIntiii>
    80004530:	00006517          	auipc	a0,0x6
    80004534:	c3850513          	addi	a0,a0,-968 # 8000a168 <CONSOLE_STATUS+0x158>
    80004538:	00002097          	auipc	ra,0x2
    8000453c:	c14080e7          	jalr	-1004(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004540:	0014849b          	addiw	s1,s1,1
    80004544:	0ff4f493          	andi	s1,s1,255
    80004548:	00500793          	li	a5,5
    8000454c:	fc97f0e3          	bgeu	a5,s1,8000450c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004550:	00006517          	auipc	a0,0x6
    80004554:	c6050513          	addi	a0,a0,-928 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80004558:	00002097          	auipc	ra,0x2
    8000455c:	bf4080e7          	jalr	-1036(ra) # 8000614c <_Z11printStringPKc>
    finishedC = true;
    80004560:	00100793          	li	a5,1
    80004564:	00009717          	auipc	a4,0x9
    80004568:	d4f70323          	sb	a5,-698(a4) # 8000d2aa <_ZL9finishedC>

    thread_dispatch();
    8000456c:	ffffd097          	auipc	ra,0xffffd
    80004570:	0e0080e7          	jalr	224(ra) # 8000164c <thread_dispatch>

}
    80004574:	01813083          	ld	ra,24(sp)
    80004578:	01013403          	ld	s0,16(sp)
    8000457c:	00813483          	ld	s1,8(sp)
    80004580:	00013903          	ld	s2,0(sp)
    80004584:	02010113          	addi	sp,sp,32
    80004588:	00008067          	ret

000000008000458c <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    8000458c:	fe010113          	addi	sp,sp,-32
    80004590:	00113c23          	sd	ra,24(sp)
    80004594:	00813823          	sd	s0,16(sp)
    80004598:	00913423          	sd	s1,8(sp)
    8000459c:	01213023          	sd	s2,0(sp)
    800045a0:	02010413          	addi	s0,sp,32

    uint8 i = 10;
    800045a4:	00a00493          	li	s1,10
    800045a8:	0400006f          	j	800045e8 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800045ac:	00006517          	auipc	a0,0x6
    800045b0:	c5c50513          	addi	a0,a0,-932 # 8000a208 <CONSOLE_STATUS+0x1f8>
    800045b4:	00002097          	auipc	ra,0x2
    800045b8:	b98080e7          	jalr	-1128(ra) # 8000614c <_Z11printStringPKc>
    800045bc:	00000613          	li	a2,0
    800045c0:	00a00593          	li	a1,10
    800045c4:	00048513          	mv	a0,s1
    800045c8:	00002097          	auipc	ra,0x2
    800045cc:	d34080e7          	jalr	-716(ra) # 800062fc <_Z8printIntiii>
    800045d0:	00006517          	auipc	a0,0x6
    800045d4:	b9850513          	addi	a0,a0,-1128 # 8000a168 <CONSOLE_STATUS+0x158>
    800045d8:	00002097          	auipc	ra,0x2
    800045dc:	b74080e7          	jalr	-1164(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800045e0:	0014849b          	addiw	s1,s1,1
    800045e4:	0ff4f493          	andi	s1,s1,255
    800045e8:	00c00793          	li	a5,12
    800045ec:	fc97f0e3          	bgeu	a5,s1,800045ac <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800045f0:	00006517          	auipc	a0,0x6
    800045f4:	c2050513          	addi	a0,a0,-992 # 8000a210 <CONSOLE_STATUS+0x200>
    800045f8:	00002097          	auipc	ra,0x2
    800045fc:	b54080e7          	jalr	-1196(ra) # 8000614c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004600:	00500313          	li	t1,5

    thread_dispatch();
    80004604:	ffffd097          	auipc	ra,0xffffd
    80004608:	048080e7          	jalr	72(ra) # 8000164c <thread_dispatch>


    uint64 result = fibonacci(16);
    8000460c:	01000513          	li	a0,16
    80004610:	00000097          	auipc	ra,0x0
    80004614:	bf8080e7          	jalr	-1032(ra) # 80004208 <_ZL9fibonaccim>
    80004618:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000461c:	00006517          	auipc	a0,0x6
    80004620:	c0450513          	addi	a0,a0,-1020 # 8000a220 <CONSOLE_STATUS+0x210>
    80004624:	00002097          	auipc	ra,0x2
    80004628:	b28080e7          	jalr	-1240(ra) # 8000614c <_Z11printStringPKc>
    8000462c:	00000613          	li	a2,0
    80004630:	00a00593          	li	a1,10
    80004634:	0009051b          	sext.w	a0,s2
    80004638:	00002097          	auipc	ra,0x2
    8000463c:	cc4080e7          	jalr	-828(ra) # 800062fc <_Z8printIntiii>
    80004640:	00006517          	auipc	a0,0x6
    80004644:	b2850513          	addi	a0,a0,-1240 # 8000a168 <CONSOLE_STATUS+0x158>
    80004648:	00002097          	auipc	ra,0x2
    8000464c:	b04080e7          	jalr	-1276(ra) # 8000614c <_Z11printStringPKc>
    80004650:	0400006f          	j	80004690 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004654:	00006517          	auipc	a0,0x6
    80004658:	bb450513          	addi	a0,a0,-1100 # 8000a208 <CONSOLE_STATUS+0x1f8>
    8000465c:	00002097          	auipc	ra,0x2
    80004660:	af0080e7          	jalr	-1296(ra) # 8000614c <_Z11printStringPKc>
    80004664:	00000613          	li	a2,0
    80004668:	00a00593          	li	a1,10
    8000466c:	00048513          	mv	a0,s1
    80004670:	00002097          	auipc	ra,0x2
    80004674:	c8c080e7          	jalr	-884(ra) # 800062fc <_Z8printIntiii>
    80004678:	00006517          	auipc	a0,0x6
    8000467c:	af050513          	addi	a0,a0,-1296 # 8000a168 <CONSOLE_STATUS+0x158>
    80004680:	00002097          	auipc	ra,0x2
    80004684:	acc080e7          	jalr	-1332(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004688:	0014849b          	addiw	s1,s1,1
    8000468c:	0ff4f493          	andi	s1,s1,255
    80004690:	00f00793          	li	a5,15
    80004694:	fc97f0e3          	bgeu	a5,s1,80004654 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004698:	00006517          	auipc	a0,0x6
    8000469c:	b9850513          	addi	a0,a0,-1128 # 8000a230 <CONSOLE_STATUS+0x220>
    800046a0:	00002097          	auipc	ra,0x2
    800046a4:	aac080e7          	jalr	-1364(ra) # 8000614c <_Z11printStringPKc>
    finishedD = true;
    800046a8:	00100793          	li	a5,1
    800046ac:	00009717          	auipc	a4,0x9
    800046b0:	bef70fa3          	sb	a5,-1025(a4) # 8000d2ab <_ZL9finishedD>

    thread_dispatch();
    800046b4:	ffffd097          	auipc	ra,0xffffd
    800046b8:	f98080e7          	jalr	-104(ra) # 8000164c <thread_dispatch>

}
    800046bc:	01813083          	ld	ra,24(sp)
    800046c0:	01013403          	ld	s0,16(sp)
    800046c4:	00813483          	ld	s1,8(sp)
    800046c8:	00013903          	ld	s2,0(sp)
    800046cc:	02010113          	addi	sp,sp,32
    800046d0:	00008067          	ret

00000000800046d4 <_Z20Threads_CPP_API_testv>:

void Threads_CPP_API_test() {
    800046d4:	fc010113          	addi	sp,sp,-64
    800046d8:	02113c23          	sd	ra,56(sp)
    800046dc:	02813823          	sd	s0,48(sp)
    800046e0:	02913423          	sd	s1,40(sp)
    800046e4:	03213023          	sd	s2,32(sp)
    800046e8:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800046ec:	0a000513          	li	a0,160
    800046f0:	ffffe097          	auipc	ra,0xffffe
    800046f4:	040080e7          	jalr	64(ra) # 80002730 <_ZN6ThreadnwEm>
    800046f8:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800046fc:	ffffe097          	auipc	ra,0xffffe
    80004700:	ce0080e7          	jalr	-800(ra) # 800023dc <_ZN6ThreadC1Ev>
    80004704:	00008797          	auipc	a5,0x8
    80004708:	48478793          	addi	a5,a5,1156 # 8000cb88 <_ZTV7WorkerA+0x10>
    8000470c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004710:	fc943023          	sd	s1,-64(s0)
   printString("ThreadA created\n");
    80004714:	00006517          	auipc	a0,0x6
    80004718:	b2c50513          	addi	a0,a0,-1236 # 8000a240 <CONSOLE_STATUS+0x230>
    8000471c:	00002097          	auipc	ra,0x2
    80004720:	a30080e7          	jalr	-1488(ra) # 8000614c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004724:	0a000513          	li	a0,160
    80004728:	ffffe097          	auipc	ra,0xffffe
    8000472c:	008080e7          	jalr	8(ra) # 80002730 <_ZN6ThreadnwEm>
    80004730:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	ca8080e7          	jalr	-856(ra) # 800023dc <_ZN6ThreadC1Ev>
    8000473c:	00008797          	auipc	a5,0x8
    80004740:	47478793          	addi	a5,a5,1140 # 8000cbb0 <_ZTV7WorkerB+0x10>
    80004744:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004748:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000474c:	00006517          	auipc	a0,0x6
    80004750:	b0c50513          	addi	a0,a0,-1268 # 8000a258 <CONSOLE_STATUS+0x248>
    80004754:	00002097          	auipc	ra,0x2
    80004758:	9f8080e7          	jalr	-1544(ra) # 8000614c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000475c:	0a000513          	li	a0,160
    80004760:	ffffe097          	auipc	ra,0xffffe
    80004764:	fd0080e7          	jalr	-48(ra) # 80002730 <_ZN6ThreadnwEm>
    80004768:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000476c:	ffffe097          	auipc	ra,0xffffe
    80004770:	c70080e7          	jalr	-912(ra) # 800023dc <_ZN6ThreadC1Ev>
    80004774:	00008797          	auipc	a5,0x8
    80004778:	46478793          	addi	a5,a5,1124 # 8000cbd8 <_ZTV7WorkerC+0x10>
    8000477c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004780:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004784:	00006517          	auipc	a0,0x6
    80004788:	aec50513          	addi	a0,a0,-1300 # 8000a270 <CONSOLE_STATUS+0x260>
    8000478c:	00002097          	auipc	ra,0x2
    80004790:	9c0080e7          	jalr	-1600(ra) # 8000614c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004794:	0a000513          	li	a0,160
    80004798:	ffffe097          	auipc	ra,0xffffe
    8000479c:	f98080e7          	jalr	-104(ra) # 80002730 <_ZN6ThreadnwEm>
    800047a0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800047a4:	ffffe097          	auipc	ra,0xffffe
    800047a8:	c38080e7          	jalr	-968(ra) # 800023dc <_ZN6ThreadC1Ev>
    800047ac:	00008797          	auipc	a5,0x8
    800047b0:	45478793          	addi	a5,a5,1108 # 8000cc00 <_ZTV7WorkerD+0x10>
    800047b4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800047b8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800047bc:	00006517          	auipc	a0,0x6
    800047c0:	acc50513          	addi	a0,a0,-1332 # 8000a288 <CONSOLE_STATUS+0x278>
    800047c4:	00002097          	auipc	ra,0x2
    800047c8:	988080e7          	jalr	-1656(ra) # 8000614c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800047cc:	00000493          	li	s1,0
    800047d0:	00300793          	li	a5,3
    800047d4:	0297c663          	blt	a5,s1,80004800 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800047d8:	00349793          	slli	a5,s1,0x3
    800047dc:	fe040713          	addi	a4,s0,-32
    800047e0:	00f707b3          	add	a5,a4,a5
    800047e4:	fe07b503          	ld	a0,-32(a5)
    800047e8:	ffffe097          	auipc	ra,0xffffe
    800047ec:	100080e7          	jalr	256(ra) # 800028e8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800047f0:	0014849b          	addiw	s1,s1,1
    800047f4:	fddff06f          	j	800047d0 <_Z20Threads_CPP_API_testv+0xfc>
    }


    while (!(finishedA && finishedB && finishedC && finishedD)) {

        Thread::dispatch();
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	0c8080e7          	jalr	200(ra) # 800028c0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004800:	00009797          	auipc	a5,0x9
    80004804:	aa87c783          	lbu	a5,-1368(a5) # 8000d2a8 <_ZL9finishedA>
    80004808:	fe0788e3          	beqz	a5,800047f8 <_Z20Threads_CPP_API_testv+0x124>
    8000480c:	00009797          	auipc	a5,0x9
    80004810:	a9d7c783          	lbu	a5,-1379(a5) # 8000d2a9 <_ZL9finishedB>
    80004814:	fe0782e3          	beqz	a5,800047f8 <_Z20Threads_CPP_API_testv+0x124>
    80004818:	00009797          	auipc	a5,0x9
    8000481c:	a927c783          	lbu	a5,-1390(a5) # 8000d2aa <_ZL9finishedC>
    80004820:	fc078ce3          	beqz	a5,800047f8 <_Z20Threads_CPP_API_testv+0x124>
    80004824:	00009797          	auipc	a5,0x9
    80004828:	a877c783          	lbu	a5,-1401(a5) # 8000d2ab <_ZL9finishedD>
    8000482c:	fc0786e3          	beqz	a5,800047f8 <_Z20Threads_CPP_API_testv+0x124>
    80004830:	fc040493          	addi	s1,s0,-64
    80004834:	0080006f          	j	8000483c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004838:	00848493          	addi	s1,s1,8
    8000483c:	fe040793          	addi	a5,s0,-32
    80004840:	08f48663          	beq	s1,a5,800048cc <_Z20Threads_CPP_API_testv+0x1f8>
    80004844:	0004b503          	ld	a0,0(s1)
    80004848:	fe0508e3          	beqz	a0,80004838 <_Z20Threads_CPP_API_testv+0x164>
    8000484c:	00053783          	ld	a5,0(a0)
    80004850:	0087b783          	ld	a5,8(a5)
    80004854:	000780e7          	jalr	a5
    80004858:	fe1ff06f          	j	80004838 <_Z20Threads_CPP_API_testv+0x164>
    8000485c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004860:	00048513          	mv	a0,s1
    80004864:	ffffe097          	auipc	ra,0xffffe
    80004868:	fec080e7          	jalr	-20(ra) # 80002850 <_ZN6ThreaddlEPv>
    8000486c:	00090513          	mv	a0,s2
    80004870:	0000a097          	auipc	ra,0xa
    80004874:	b48080e7          	jalr	-1208(ra) # 8000e3b8 <_Unwind_Resume>
    80004878:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000487c:	00048513          	mv	a0,s1
    80004880:	ffffe097          	auipc	ra,0xffffe
    80004884:	fd0080e7          	jalr	-48(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004888:	00090513          	mv	a0,s2
    8000488c:	0000a097          	auipc	ra,0xa
    80004890:	b2c080e7          	jalr	-1236(ra) # 8000e3b8 <_Unwind_Resume>
    80004894:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004898:	00048513          	mv	a0,s1
    8000489c:	ffffe097          	auipc	ra,0xffffe
    800048a0:	fb4080e7          	jalr	-76(ra) # 80002850 <_ZN6ThreaddlEPv>
    800048a4:	00090513          	mv	a0,s2
    800048a8:	0000a097          	auipc	ra,0xa
    800048ac:	b10080e7          	jalr	-1264(ra) # 8000e3b8 <_Unwind_Resume>
    800048b0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800048b4:	00048513          	mv	a0,s1
    800048b8:	ffffe097          	auipc	ra,0xffffe
    800048bc:	f98080e7          	jalr	-104(ra) # 80002850 <_ZN6ThreaddlEPv>
    800048c0:	00090513          	mv	a0,s2
    800048c4:	0000a097          	auipc	ra,0xa
    800048c8:	af4080e7          	jalr	-1292(ra) # 8000e3b8 <_Unwind_Resume>
}
    800048cc:	03813083          	ld	ra,56(sp)
    800048d0:	03013403          	ld	s0,48(sp)
    800048d4:	02813483          	ld	s1,40(sp)
    800048d8:	02013903          	ld	s2,32(sp)
    800048dc:	04010113          	addi	sp,sp,64
    800048e0:	00008067          	ret

00000000800048e4 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800048e4:	ff010113          	addi	sp,sp,-16
    800048e8:	00113423          	sd	ra,8(sp)
    800048ec:	00813023          	sd	s0,0(sp)
    800048f0:	01010413          	addi	s0,sp,16
    800048f4:	00008797          	auipc	a5,0x8
    800048f8:	29478793          	addi	a5,a5,660 # 8000cb88 <_ZTV7WorkerA+0x10>
    800048fc:	00f53023          	sd	a5,0(a0)
    80004900:	ffffe097          	auipc	ra,0xffffe
    80004904:	848080e7          	jalr	-1976(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004908:	00813083          	ld	ra,8(sp)
    8000490c:	00013403          	ld	s0,0(sp)
    80004910:	01010113          	addi	sp,sp,16
    80004914:	00008067          	ret

0000000080004918 <_ZN7WorkerAD0Ev>:
    80004918:	fe010113          	addi	sp,sp,-32
    8000491c:	00113c23          	sd	ra,24(sp)
    80004920:	00813823          	sd	s0,16(sp)
    80004924:	00913423          	sd	s1,8(sp)
    80004928:	02010413          	addi	s0,sp,32
    8000492c:	00050493          	mv	s1,a0
    80004930:	00008797          	auipc	a5,0x8
    80004934:	25878793          	addi	a5,a5,600 # 8000cb88 <_ZTV7WorkerA+0x10>
    80004938:	00f53023          	sd	a5,0(a0)
    8000493c:	ffffe097          	auipc	ra,0xffffe
    80004940:	80c080e7          	jalr	-2036(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004944:	00048513          	mv	a0,s1
    80004948:	ffffe097          	auipc	ra,0xffffe
    8000494c:	f08080e7          	jalr	-248(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004950:	01813083          	ld	ra,24(sp)
    80004954:	01013403          	ld	s0,16(sp)
    80004958:	00813483          	ld	s1,8(sp)
    8000495c:	02010113          	addi	sp,sp,32
    80004960:	00008067          	ret

0000000080004964 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80004964:	ff010113          	addi	sp,sp,-16
    80004968:	00113423          	sd	ra,8(sp)
    8000496c:	00813023          	sd	s0,0(sp)
    80004970:	01010413          	addi	s0,sp,16
    80004974:	00008797          	auipc	a5,0x8
    80004978:	23c78793          	addi	a5,a5,572 # 8000cbb0 <_ZTV7WorkerB+0x10>
    8000497c:	00f53023          	sd	a5,0(a0)
    80004980:	ffffd097          	auipc	ra,0xffffd
    80004984:	7c8080e7          	jalr	1992(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004988:	00813083          	ld	ra,8(sp)
    8000498c:	00013403          	ld	s0,0(sp)
    80004990:	01010113          	addi	sp,sp,16
    80004994:	00008067          	ret

0000000080004998 <_ZN7WorkerBD0Ev>:
    80004998:	fe010113          	addi	sp,sp,-32
    8000499c:	00113c23          	sd	ra,24(sp)
    800049a0:	00813823          	sd	s0,16(sp)
    800049a4:	00913423          	sd	s1,8(sp)
    800049a8:	02010413          	addi	s0,sp,32
    800049ac:	00050493          	mv	s1,a0
    800049b0:	00008797          	auipc	a5,0x8
    800049b4:	20078793          	addi	a5,a5,512 # 8000cbb0 <_ZTV7WorkerB+0x10>
    800049b8:	00f53023          	sd	a5,0(a0)
    800049bc:	ffffd097          	auipc	ra,0xffffd
    800049c0:	78c080e7          	jalr	1932(ra) # 80002148 <_ZN6ThreadD1Ev>
    800049c4:	00048513          	mv	a0,s1
    800049c8:	ffffe097          	auipc	ra,0xffffe
    800049cc:	e88080e7          	jalr	-376(ra) # 80002850 <_ZN6ThreaddlEPv>
    800049d0:	01813083          	ld	ra,24(sp)
    800049d4:	01013403          	ld	s0,16(sp)
    800049d8:	00813483          	ld	s1,8(sp)
    800049dc:	02010113          	addi	sp,sp,32
    800049e0:	00008067          	ret

00000000800049e4 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800049e4:	ff010113          	addi	sp,sp,-16
    800049e8:	00113423          	sd	ra,8(sp)
    800049ec:	00813023          	sd	s0,0(sp)
    800049f0:	01010413          	addi	s0,sp,16
    800049f4:	00008797          	auipc	a5,0x8
    800049f8:	1e478793          	addi	a5,a5,484 # 8000cbd8 <_ZTV7WorkerC+0x10>
    800049fc:	00f53023          	sd	a5,0(a0)
    80004a00:	ffffd097          	auipc	ra,0xffffd
    80004a04:	748080e7          	jalr	1864(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004a08:	00813083          	ld	ra,8(sp)
    80004a0c:	00013403          	ld	s0,0(sp)
    80004a10:	01010113          	addi	sp,sp,16
    80004a14:	00008067          	ret

0000000080004a18 <_ZN7WorkerCD0Ev>:
    80004a18:	fe010113          	addi	sp,sp,-32
    80004a1c:	00113c23          	sd	ra,24(sp)
    80004a20:	00813823          	sd	s0,16(sp)
    80004a24:	00913423          	sd	s1,8(sp)
    80004a28:	02010413          	addi	s0,sp,32
    80004a2c:	00050493          	mv	s1,a0
    80004a30:	00008797          	auipc	a5,0x8
    80004a34:	1a878793          	addi	a5,a5,424 # 8000cbd8 <_ZTV7WorkerC+0x10>
    80004a38:	00f53023          	sd	a5,0(a0)
    80004a3c:	ffffd097          	auipc	ra,0xffffd
    80004a40:	70c080e7          	jalr	1804(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004a44:	00048513          	mv	a0,s1
    80004a48:	ffffe097          	auipc	ra,0xffffe
    80004a4c:	e08080e7          	jalr	-504(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004a50:	01813083          	ld	ra,24(sp)
    80004a54:	01013403          	ld	s0,16(sp)
    80004a58:	00813483          	ld	s1,8(sp)
    80004a5c:	02010113          	addi	sp,sp,32
    80004a60:	00008067          	ret

0000000080004a64 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80004a64:	ff010113          	addi	sp,sp,-16
    80004a68:	00113423          	sd	ra,8(sp)
    80004a6c:	00813023          	sd	s0,0(sp)
    80004a70:	01010413          	addi	s0,sp,16
    80004a74:	00008797          	auipc	a5,0x8
    80004a78:	18c78793          	addi	a5,a5,396 # 8000cc00 <_ZTV7WorkerD+0x10>
    80004a7c:	00f53023          	sd	a5,0(a0)
    80004a80:	ffffd097          	auipc	ra,0xffffd
    80004a84:	6c8080e7          	jalr	1736(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004a88:	00813083          	ld	ra,8(sp)
    80004a8c:	00013403          	ld	s0,0(sp)
    80004a90:	01010113          	addi	sp,sp,16
    80004a94:	00008067          	ret

0000000080004a98 <_ZN7WorkerDD0Ev>:
    80004a98:	fe010113          	addi	sp,sp,-32
    80004a9c:	00113c23          	sd	ra,24(sp)
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00913423          	sd	s1,8(sp)
    80004aa8:	02010413          	addi	s0,sp,32
    80004aac:	00050493          	mv	s1,a0
    80004ab0:	00008797          	auipc	a5,0x8
    80004ab4:	15078793          	addi	a5,a5,336 # 8000cc00 <_ZTV7WorkerD+0x10>
    80004ab8:	00f53023          	sd	a5,0(a0)
    80004abc:	ffffd097          	auipc	ra,0xffffd
    80004ac0:	68c080e7          	jalr	1676(ra) # 80002148 <_ZN6ThreadD1Ev>
    80004ac4:	00048513          	mv	a0,s1
    80004ac8:	ffffe097          	auipc	ra,0xffffe
    80004acc:	d88080e7          	jalr	-632(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004ad0:	01813083          	ld	ra,24(sp)
    80004ad4:	01013403          	ld	s0,16(sp)
    80004ad8:	00813483          	ld	s1,8(sp)
    80004adc:	02010113          	addi	sp,sp,32
    80004ae0:	00008067          	ret

0000000080004ae4 <_ZN7WorkerA3runEv>:
    void run() override {
    80004ae4:	ff010113          	addi	sp,sp,-16
    80004ae8:	00113423          	sd	ra,8(sp)
    80004aec:	00813023          	sd	s0,0(sp)
    80004af0:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004af4:	00000593          	li	a1,0
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	784080e7          	jalr	1924(ra) # 8000427c <_ZN7WorkerA11workerBodyAEPv>
    }
    80004b00:	00813083          	ld	ra,8(sp)
    80004b04:	00013403          	ld	s0,0(sp)
    80004b08:	01010113          	addi	sp,sp,16
    80004b0c:	00008067          	ret

0000000080004b10 <_ZN7WorkerB3runEv>:
    void run() override {
    80004b10:	ff010113          	addi	sp,sp,-16
    80004b14:	00113423          	sd	ra,8(sp)
    80004b18:	00813023          	sd	s0,0(sp)
    80004b1c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004b20:	00000593          	li	a1,0
    80004b24:	00000097          	auipc	ra,0x0
    80004b28:	81c080e7          	jalr	-2020(ra) # 80004340 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004b2c:	00813083          	ld	ra,8(sp)
    80004b30:	00013403          	ld	s0,0(sp)
    80004b34:	01010113          	addi	sp,sp,16
    80004b38:	00008067          	ret

0000000080004b3c <_ZN7WorkerC3runEv>:
    void run() override {
    80004b3c:	ff010113          	addi	sp,sp,-16
    80004b40:	00113423          	sd	ra,8(sp)
    80004b44:	00813023          	sd	s0,0(sp)
    80004b48:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004b4c:	00000593          	li	a1,0
    80004b50:	00000097          	auipc	ra,0x0
    80004b54:	8bc080e7          	jalr	-1860(ra) # 8000440c <_ZN7WorkerC11workerBodyCEPv>
    }
    80004b58:	00813083          	ld	ra,8(sp)
    80004b5c:	00013403          	ld	s0,0(sp)
    80004b60:	01010113          	addi	sp,sp,16
    80004b64:	00008067          	ret

0000000080004b68 <_ZN7WorkerD3runEv>:
    void run() override {
    80004b68:	ff010113          	addi	sp,sp,-16
    80004b6c:	00113423          	sd	ra,8(sp)
    80004b70:	00813023          	sd	s0,0(sp)
    80004b74:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80004b78:	00000593          	li	a1,0
    80004b7c:	00000097          	auipc	ra,0x0
    80004b80:	a10080e7          	jalr	-1520(ra) # 8000458c <_ZN7WorkerD11workerBodyDEPv>
    }
    80004b84:	00813083          	ld	ra,8(sp)
    80004b88:	00013403          	ld	s0,0(sp)
    80004b8c:	01010113          	addi	sp,sp,16
    80004b90:	00008067          	ret

0000000080004b94 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004b94:	f8010113          	addi	sp,sp,-128
    80004b98:	06113c23          	sd	ra,120(sp)
    80004b9c:	06813823          	sd	s0,112(sp)
    80004ba0:	06913423          	sd	s1,104(sp)
    80004ba4:	07213023          	sd	s2,96(sp)
    80004ba8:	05313c23          	sd	s3,88(sp)
    80004bac:	05413823          	sd	s4,80(sp)
    80004bb0:	05513423          	sd	s5,72(sp)
    80004bb4:	05613023          	sd	s6,64(sp)
    80004bb8:	03713c23          	sd	s7,56(sp)
    80004bbc:	03813823          	sd	s8,48(sp)
    80004bc0:	03913423          	sd	s9,40(sp)
    80004bc4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004bc8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004bcc:	00005517          	auipc	a0,0x5
    80004bd0:	56450513          	addi	a0,a0,1380 # 8000a130 <CONSOLE_STATUS+0x120>
    80004bd4:	00001097          	auipc	ra,0x1
    80004bd8:	578080e7          	jalr	1400(ra) # 8000614c <_Z11printStringPKc>
    getString(input, 30);
    80004bdc:	01e00593          	li	a1,30
    80004be0:	f8040493          	addi	s1,s0,-128
    80004be4:	00048513          	mv	a0,s1
    80004be8:	00001097          	auipc	ra,0x1
    80004bec:	5ec080e7          	jalr	1516(ra) # 800061d4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004bf0:	00048513          	mv	a0,s1
    80004bf4:	00001097          	auipc	ra,0x1
    80004bf8:	6b8080e7          	jalr	1720(ra) # 800062ac <_Z11stringToIntPKc>
    80004bfc:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004c00:	00005517          	auipc	a0,0x5
    80004c04:	55050513          	addi	a0,a0,1360 # 8000a150 <CONSOLE_STATUS+0x140>
    80004c08:	00001097          	auipc	ra,0x1
    80004c0c:	544080e7          	jalr	1348(ra) # 8000614c <_Z11printStringPKc>
    getString(input, 30);
    80004c10:	01e00593          	li	a1,30
    80004c14:	00048513          	mv	a0,s1
    80004c18:	00001097          	auipc	ra,0x1
    80004c1c:	5bc080e7          	jalr	1468(ra) # 800061d4 <_Z9getStringPci>
    n = stringToInt(input);
    80004c20:	00048513          	mv	a0,s1
    80004c24:	00001097          	auipc	ra,0x1
    80004c28:	688080e7          	jalr	1672(ra) # 800062ac <_Z11stringToIntPKc>
    80004c2c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004c30:	00005517          	auipc	a0,0x5
    80004c34:	54050513          	addi	a0,a0,1344 # 8000a170 <CONSOLE_STATUS+0x160>
    80004c38:	00001097          	auipc	ra,0x1
    80004c3c:	514080e7          	jalr	1300(ra) # 8000614c <_Z11printStringPKc>
    printInt(threadNum);
    80004c40:	00000613          	li	a2,0
    80004c44:	00a00593          	li	a1,10
    80004c48:	00098513          	mv	a0,s3
    80004c4c:	00001097          	auipc	ra,0x1
    80004c50:	6b0080e7          	jalr	1712(ra) # 800062fc <_Z8printIntiii>
    printString(" i velicina bafera ");
    80004c54:	00005517          	auipc	a0,0x5
    80004c58:	53450513          	addi	a0,a0,1332 # 8000a188 <CONSOLE_STATUS+0x178>
    80004c5c:	00001097          	auipc	ra,0x1
    80004c60:	4f0080e7          	jalr	1264(ra) # 8000614c <_Z11printStringPKc>
    printInt(n);
    80004c64:	00000613          	li	a2,0
    80004c68:	00a00593          	li	a1,10
    80004c6c:	00048513          	mv	a0,s1
    80004c70:	00001097          	auipc	ra,0x1
    80004c74:	68c080e7          	jalr	1676(ra) # 800062fc <_Z8printIntiii>
    printString(".\n");
    80004c78:	00005517          	auipc	a0,0x5
    80004c7c:	52850513          	addi	a0,a0,1320 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80004c80:	00001097          	auipc	ra,0x1
    80004c84:	4cc080e7          	jalr	1228(ra) # 8000614c <_Z11printStringPKc>
    if (threadNum > n) {
    80004c88:	0334c463          	blt	s1,s3,80004cb0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80004c8c:	03305c63          	blez	s3,80004cc4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004c90:	03800513          	li	a0,56
    80004c94:	ffffe097          	auipc	ra,0xffffe
    80004c98:	6c4080e7          	jalr	1732(ra) # 80003358 <_Znwm>
    80004c9c:	00050a93          	mv	s5,a0
    80004ca0:	00048593          	mv	a1,s1
    80004ca4:	00001097          	auipc	ra,0x1
    80004ca8:	778080e7          	jalr	1912(ra) # 8000641c <_ZN9BufferCPPC1Ei>
    80004cac:	0300006f          	j	80004cdc <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004cb0:	00005517          	auipc	a0,0x5
    80004cb4:	5f050513          	addi	a0,a0,1520 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80004cb8:	00001097          	auipc	ra,0x1
    80004cbc:	494080e7          	jalr	1172(ra) # 8000614c <_Z11printStringPKc>
        return;
    80004cc0:	0140006f          	j	80004cd4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004cc4:	00005517          	auipc	a0,0x5
    80004cc8:	61c50513          	addi	a0,a0,1564 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80004ccc:	00001097          	auipc	ra,0x1
    80004cd0:	480080e7          	jalr	1152(ra) # 8000614c <_Z11printStringPKc>
        return;
    80004cd4:	000c0113          	mv	sp,s8
    80004cd8:	2140006f          	j	80004eec <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004cdc:	02000513          	li	a0,32
    80004ce0:	ffffd097          	auipc	ra,0xffffd
    80004ce4:	d94080e7          	jalr	-620(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80004ce8:	00050913          	mv	s2,a0
    80004cec:	00000593          	li	a1,0
    80004cf0:	ffffd097          	auipc	ra,0xffffd
    80004cf4:	d18080e7          	jalr	-744(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80004cf8:	00008797          	auipc	a5,0x8
    80004cfc:	5d27b023          	sd	s2,1472(a5) # 8000d2b8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004d00:	00399793          	slli	a5,s3,0x3
    80004d04:	00f78793          	addi	a5,a5,15
    80004d08:	ff07f793          	andi	a5,a5,-16
    80004d0c:	40f10133          	sub	sp,sp,a5
    80004d10:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004d14:	0019871b          	addiw	a4,s3,1
    80004d18:	00171793          	slli	a5,a4,0x1
    80004d1c:	00e787b3          	add	a5,a5,a4
    80004d20:	00379793          	slli	a5,a5,0x3
    80004d24:	00f78793          	addi	a5,a5,15
    80004d28:	ff07f793          	andi	a5,a5,-16
    80004d2c:	40f10133          	sub	sp,sp,a5
    80004d30:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004d34:	00199493          	slli	s1,s3,0x1
    80004d38:	013484b3          	add	s1,s1,s3
    80004d3c:	00349493          	slli	s1,s1,0x3
    80004d40:	009b04b3          	add	s1,s6,s1
    80004d44:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004d48:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004d4c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004d50:	0a800513          	li	a0,168
    80004d54:	ffffe097          	auipc	ra,0xffffe
    80004d58:	9dc080e7          	jalr	-1572(ra) # 80002730 <_ZN6ThreadnwEm>
    80004d5c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004d60:	ffffd097          	auipc	ra,0xffffd
    80004d64:	67c080e7          	jalr	1660(ra) # 800023dc <_ZN6ThreadC1Ev>
    80004d68:	00008797          	auipc	a5,0x8
    80004d6c:	f1078793          	addi	a5,a5,-240 # 8000cc78 <_ZTV8Consumer+0x10>
    80004d70:	00fbb023          	sd	a5,0(s7)
    80004d74:	0a9bb023          	sd	s1,160(s7)
    consumer->start();
    80004d78:	000b8513          	mv	a0,s7
    80004d7c:	ffffe097          	auipc	ra,0xffffe
    80004d80:	b6c080e7          	jalr	-1172(ra) # 800028e8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004d84:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80004d88:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004d8c:	00008797          	auipc	a5,0x8
    80004d90:	52c7b783          	ld	a5,1324(a5) # 8000d2b8 <_ZL10waitForAll>
    80004d94:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004d98:	0a800513          	li	a0,168
    80004d9c:	ffffe097          	auipc	ra,0xffffe
    80004da0:	994080e7          	jalr	-1644(ra) # 80002730 <_ZN6ThreadnwEm>
    80004da4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004da8:	ffffd097          	auipc	ra,0xffffd
    80004dac:	634080e7          	jalr	1588(ra) # 800023dc <_ZN6ThreadC1Ev>
    80004db0:	00008797          	auipc	a5,0x8
    80004db4:	e7878793          	addi	a5,a5,-392 # 8000cc28 <_ZTV16ProducerKeyborad+0x10>
    80004db8:	00f4b023          	sd	a5,0(s1)
    80004dbc:	0b64b023          	sd	s6,160(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004dc0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004dc4:	00048513          	mv	a0,s1
    80004dc8:	ffffe097          	auipc	ra,0xffffe
    80004dcc:	b20080e7          	jalr	-1248(ra) # 800028e8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004dd0:	00100913          	li	s2,1
    80004dd4:	0300006f          	j	80004e04 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004dd8:	00008797          	auipc	a5,0x8
    80004ddc:	e7878793          	addi	a5,a5,-392 # 8000cc50 <_ZTV8Producer+0x10>
    80004de0:	00fcb023          	sd	a5,0(s9)
    80004de4:	0a9cb023          	sd	s1,160(s9)
        producers[i] = new Producer(&threadData[i]);
    80004de8:	00391793          	slli	a5,s2,0x3
    80004dec:	00fa07b3          	add	a5,s4,a5
    80004df0:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004df4:	000c8513          	mv	a0,s9
    80004df8:	ffffe097          	auipc	ra,0xffffe
    80004dfc:	af0080e7          	jalr	-1296(ra) # 800028e8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004e00:	0019091b          	addiw	s2,s2,1
    80004e04:	05395263          	bge	s2,s3,80004e48 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004e08:	00191493          	slli	s1,s2,0x1
    80004e0c:	012484b3          	add	s1,s1,s2
    80004e10:	00349493          	slli	s1,s1,0x3
    80004e14:	009b04b3          	add	s1,s6,s1
    80004e18:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004e1c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004e20:	00008797          	auipc	a5,0x8
    80004e24:	4987b783          	ld	a5,1176(a5) # 8000d2b8 <_ZL10waitForAll>
    80004e28:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004e2c:	0a800513          	li	a0,168
    80004e30:	ffffe097          	auipc	ra,0xffffe
    80004e34:	900080e7          	jalr	-1792(ra) # 80002730 <_ZN6ThreadnwEm>
    80004e38:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004e3c:	ffffd097          	auipc	ra,0xffffd
    80004e40:	5a0080e7          	jalr	1440(ra) # 800023dc <_ZN6ThreadC1Ev>
    80004e44:	f95ff06f          	j	80004dd8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004e48:	ffffe097          	auipc	ra,0xffffe
    80004e4c:	a78080e7          	jalr	-1416(ra) # 800028c0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004e50:	00000493          	li	s1,0
    80004e54:	0099ce63          	blt	s3,s1,80004e70 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004e58:	00008517          	auipc	a0,0x8
    80004e5c:	46053503          	ld	a0,1120(a0) # 8000d2b8 <_ZL10waitForAll>
    80004e60:	ffffd097          	auipc	ra,0xffffd
    80004e64:	f90080e7          	jalr	-112(ra) # 80001df0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004e68:	0014849b          	addiw	s1,s1,1
    80004e6c:	fe9ff06f          	j	80004e54 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004e70:	00008517          	auipc	a0,0x8
    80004e74:	44853503          	ld	a0,1096(a0) # 8000d2b8 <_ZL10waitForAll>
    80004e78:	00050863          	beqz	a0,80004e88 <_Z20testConsumerProducerv+0x2f4>
    80004e7c:	00053783          	ld	a5,0(a0)
    80004e80:	0087b783          	ld	a5,8(a5)
    80004e84:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80004e88:	00000493          	li	s1,0
    80004e8c:	0080006f          	j	80004e94 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004e90:	0014849b          	addiw	s1,s1,1
    80004e94:	0334d263          	bge	s1,s3,80004eb8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004e98:	00349793          	slli	a5,s1,0x3
    80004e9c:	00fa07b3          	add	a5,s4,a5
    80004ea0:	0007b503          	ld	a0,0(a5)
    80004ea4:	fe0506e3          	beqz	a0,80004e90 <_Z20testConsumerProducerv+0x2fc>
    80004ea8:	00053783          	ld	a5,0(a0)
    80004eac:	0087b783          	ld	a5,8(a5)
    80004eb0:	000780e7          	jalr	a5
    80004eb4:	fddff06f          	j	80004e90 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004eb8:	000b8a63          	beqz	s7,80004ecc <_Z20testConsumerProducerv+0x338>
    80004ebc:	000bb783          	ld	a5,0(s7)
    80004ec0:	0087b783          	ld	a5,8(a5)
    80004ec4:	000b8513          	mv	a0,s7
    80004ec8:	000780e7          	jalr	a5
    delete buffer;
    80004ecc:	000a8e63          	beqz	s5,80004ee8 <_Z20testConsumerProducerv+0x354>
    80004ed0:	000a8513          	mv	a0,s5
    80004ed4:	00002097          	auipc	ra,0x2
    80004ed8:	840080e7          	jalr	-1984(ra) # 80006714 <_ZN9BufferCPPD1Ev>
    80004edc:	000a8513          	mv	a0,s5
    80004ee0:	ffffe097          	auipc	ra,0xffffe
    80004ee4:	4c8080e7          	jalr	1224(ra) # 800033a8 <_ZdlPv>
    80004ee8:	000c0113          	mv	sp,s8
}
    80004eec:	f8040113          	addi	sp,s0,-128
    80004ef0:	07813083          	ld	ra,120(sp)
    80004ef4:	07013403          	ld	s0,112(sp)
    80004ef8:	06813483          	ld	s1,104(sp)
    80004efc:	06013903          	ld	s2,96(sp)
    80004f00:	05813983          	ld	s3,88(sp)
    80004f04:	05013a03          	ld	s4,80(sp)
    80004f08:	04813a83          	ld	s5,72(sp)
    80004f0c:	04013b03          	ld	s6,64(sp)
    80004f10:	03813b83          	ld	s7,56(sp)
    80004f14:	03013c03          	ld	s8,48(sp)
    80004f18:	02813c83          	ld	s9,40(sp)
    80004f1c:	08010113          	addi	sp,sp,128
    80004f20:	00008067          	ret
    80004f24:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004f28:	000a8513          	mv	a0,s5
    80004f2c:	ffffe097          	auipc	ra,0xffffe
    80004f30:	47c080e7          	jalr	1148(ra) # 800033a8 <_ZdlPv>
    80004f34:	00048513          	mv	a0,s1
    80004f38:	00009097          	auipc	ra,0x9
    80004f3c:	480080e7          	jalr	1152(ra) # 8000e3b8 <_Unwind_Resume>
    80004f40:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004f44:	00090513          	mv	a0,s2
    80004f48:	ffffd097          	auipc	ra,0xffffd
    80004f4c:	b64080e7          	jalr	-1180(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80004f50:	00048513          	mv	a0,s1
    80004f54:	00009097          	auipc	ra,0x9
    80004f58:	464080e7          	jalr	1124(ra) # 8000e3b8 <_Unwind_Resume>
    80004f5c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004f60:	000b8513          	mv	a0,s7
    80004f64:	ffffe097          	auipc	ra,0xffffe
    80004f68:	8ec080e7          	jalr	-1812(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004f6c:	00048513          	mv	a0,s1
    80004f70:	00009097          	auipc	ra,0x9
    80004f74:	448080e7          	jalr	1096(ra) # 8000e3b8 <_Unwind_Resume>
    80004f78:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004f7c:	00048513          	mv	a0,s1
    80004f80:	ffffe097          	auipc	ra,0xffffe
    80004f84:	8d0080e7          	jalr	-1840(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004f88:	00090513          	mv	a0,s2
    80004f8c:	00009097          	auipc	ra,0x9
    80004f90:	42c080e7          	jalr	1068(ra) # 8000e3b8 <_Unwind_Resume>
    80004f94:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004f98:	000c8513          	mv	a0,s9
    80004f9c:	ffffe097          	auipc	ra,0xffffe
    80004fa0:	8b4080e7          	jalr	-1868(ra) # 80002850 <_ZN6ThreaddlEPv>
    80004fa4:	00048513          	mv	a0,s1
    80004fa8:	00009097          	auipc	ra,0x9
    80004fac:	410080e7          	jalr	1040(ra) # 8000e3b8 <_Unwind_Resume>

0000000080004fb0 <_ZN8Consumer3runEv>:
    void run() override {
    80004fb0:	fd010113          	addi	sp,sp,-48
    80004fb4:	02113423          	sd	ra,40(sp)
    80004fb8:	02813023          	sd	s0,32(sp)
    80004fbc:	00913c23          	sd	s1,24(sp)
    80004fc0:	01213823          	sd	s2,16(sp)
    80004fc4:	01313423          	sd	s3,8(sp)
    80004fc8:	03010413          	addi	s0,sp,48
    80004fcc:	00050913          	mv	s2,a0
        int i = 0;
    80004fd0:	00000993          	li	s3,0
    80004fd4:	0100006f          	j	80004fe4 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004fd8:	00a00513          	li	a0,10
    80004fdc:	ffffe097          	auipc	ra,0xffffe
    80004fe0:	ef4080e7          	jalr	-268(ra) # 80002ed0 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004fe4:	00008797          	auipc	a5,0x8
    80004fe8:	2cc7a783          	lw	a5,716(a5) # 8000d2b0 <_ZL9threadEnd>
    80004fec:	04079a63          	bnez	a5,80005040 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004ff0:	0a093783          	ld	a5,160(s2)
    80004ff4:	0087b503          	ld	a0,8(a5)
    80004ff8:	00001097          	auipc	ra,0x1
    80004ffc:	608080e7          	jalr	1544(ra) # 80006600 <_ZN9BufferCPP3getEv>
            i++;
    80005000:	0019849b          	addiw	s1,s3,1
    80005004:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80005008:	0ff57513          	andi	a0,a0,255
    8000500c:	ffffe097          	auipc	ra,0xffffe
    80005010:	ec4080e7          	jalr	-316(ra) # 80002ed0 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80005014:	05000793          	li	a5,80
    80005018:	02f4e4bb          	remw	s1,s1,a5
    8000501c:	fc0494e3          	bnez	s1,80004fe4 <_ZN8Consumer3runEv+0x34>
    80005020:	fb9ff06f          	j	80004fd8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80005024:	0a093783          	ld	a5,160(s2)
    80005028:	0087b503          	ld	a0,8(a5)
    8000502c:	00001097          	auipc	ra,0x1
    80005030:	5d4080e7          	jalr	1492(ra) # 80006600 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80005034:	0ff57513          	andi	a0,a0,255
    80005038:	ffffe097          	auipc	ra,0xffffe
    8000503c:	e98080e7          	jalr	-360(ra) # 80002ed0 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80005040:	0a093783          	ld	a5,160(s2)
    80005044:	0087b503          	ld	a0,8(a5)
    80005048:	00001097          	auipc	ra,0x1
    8000504c:	644080e7          	jalr	1604(ra) # 8000668c <_ZN9BufferCPP6getCntEv>
    80005050:	fca04ae3          	bgtz	a0,80005024 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80005054:	0a093783          	ld	a5,160(s2)
    80005058:	0107b503          	ld	a0,16(a5)
    8000505c:	ffffd097          	auipc	ra,0xffffd
    80005060:	e6c080e7          	jalr	-404(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
    }
    80005064:	02813083          	ld	ra,40(sp)
    80005068:	02013403          	ld	s0,32(sp)
    8000506c:	01813483          	ld	s1,24(sp)
    80005070:	01013903          	ld	s2,16(sp)
    80005074:	00813983          	ld	s3,8(sp)
    80005078:	03010113          	addi	sp,sp,48
    8000507c:	00008067          	ret

0000000080005080 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80005080:	ff010113          	addi	sp,sp,-16
    80005084:	00113423          	sd	ra,8(sp)
    80005088:	00813023          	sd	s0,0(sp)
    8000508c:	01010413          	addi	s0,sp,16
    80005090:	00008797          	auipc	a5,0x8
    80005094:	be878793          	addi	a5,a5,-1048 # 8000cc78 <_ZTV8Consumer+0x10>
    80005098:	00f53023          	sd	a5,0(a0)
    8000509c:	ffffd097          	auipc	ra,0xffffd
    800050a0:	0ac080e7          	jalr	172(ra) # 80002148 <_ZN6ThreadD1Ev>
    800050a4:	00813083          	ld	ra,8(sp)
    800050a8:	00013403          	ld	s0,0(sp)
    800050ac:	01010113          	addi	sp,sp,16
    800050b0:	00008067          	ret

00000000800050b4 <_ZN8ConsumerD0Ev>:
    800050b4:	fe010113          	addi	sp,sp,-32
    800050b8:	00113c23          	sd	ra,24(sp)
    800050bc:	00813823          	sd	s0,16(sp)
    800050c0:	00913423          	sd	s1,8(sp)
    800050c4:	02010413          	addi	s0,sp,32
    800050c8:	00050493          	mv	s1,a0
    800050cc:	00008797          	auipc	a5,0x8
    800050d0:	bac78793          	addi	a5,a5,-1108 # 8000cc78 <_ZTV8Consumer+0x10>
    800050d4:	00f53023          	sd	a5,0(a0)
    800050d8:	ffffd097          	auipc	ra,0xffffd
    800050dc:	070080e7          	jalr	112(ra) # 80002148 <_ZN6ThreadD1Ev>
    800050e0:	00048513          	mv	a0,s1
    800050e4:	ffffd097          	auipc	ra,0xffffd
    800050e8:	76c080e7          	jalr	1900(ra) # 80002850 <_ZN6ThreaddlEPv>
    800050ec:	01813083          	ld	ra,24(sp)
    800050f0:	01013403          	ld	s0,16(sp)
    800050f4:	00813483          	ld	s1,8(sp)
    800050f8:	02010113          	addi	sp,sp,32
    800050fc:	00008067          	ret

0000000080005100 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80005100:	ff010113          	addi	sp,sp,-16
    80005104:	00113423          	sd	ra,8(sp)
    80005108:	00813023          	sd	s0,0(sp)
    8000510c:	01010413          	addi	s0,sp,16
    80005110:	00008797          	auipc	a5,0x8
    80005114:	b1878793          	addi	a5,a5,-1256 # 8000cc28 <_ZTV16ProducerKeyborad+0x10>
    80005118:	00f53023          	sd	a5,0(a0)
    8000511c:	ffffd097          	auipc	ra,0xffffd
    80005120:	02c080e7          	jalr	44(ra) # 80002148 <_ZN6ThreadD1Ev>
    80005124:	00813083          	ld	ra,8(sp)
    80005128:	00013403          	ld	s0,0(sp)
    8000512c:	01010113          	addi	sp,sp,16
    80005130:	00008067          	ret

0000000080005134 <_ZN16ProducerKeyboradD0Ev>:
    80005134:	fe010113          	addi	sp,sp,-32
    80005138:	00113c23          	sd	ra,24(sp)
    8000513c:	00813823          	sd	s0,16(sp)
    80005140:	00913423          	sd	s1,8(sp)
    80005144:	02010413          	addi	s0,sp,32
    80005148:	00050493          	mv	s1,a0
    8000514c:	00008797          	auipc	a5,0x8
    80005150:	adc78793          	addi	a5,a5,-1316 # 8000cc28 <_ZTV16ProducerKeyborad+0x10>
    80005154:	00f53023          	sd	a5,0(a0)
    80005158:	ffffd097          	auipc	ra,0xffffd
    8000515c:	ff0080e7          	jalr	-16(ra) # 80002148 <_ZN6ThreadD1Ev>
    80005160:	00048513          	mv	a0,s1
    80005164:	ffffd097          	auipc	ra,0xffffd
    80005168:	6ec080e7          	jalr	1772(ra) # 80002850 <_ZN6ThreaddlEPv>
    8000516c:	01813083          	ld	ra,24(sp)
    80005170:	01013403          	ld	s0,16(sp)
    80005174:	00813483          	ld	s1,8(sp)
    80005178:	02010113          	addi	sp,sp,32
    8000517c:	00008067          	ret

0000000080005180 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80005180:	ff010113          	addi	sp,sp,-16
    80005184:	00113423          	sd	ra,8(sp)
    80005188:	00813023          	sd	s0,0(sp)
    8000518c:	01010413          	addi	s0,sp,16
    80005190:	00008797          	auipc	a5,0x8
    80005194:	ac078793          	addi	a5,a5,-1344 # 8000cc50 <_ZTV8Producer+0x10>
    80005198:	00f53023          	sd	a5,0(a0)
    8000519c:	ffffd097          	auipc	ra,0xffffd
    800051a0:	fac080e7          	jalr	-84(ra) # 80002148 <_ZN6ThreadD1Ev>
    800051a4:	00813083          	ld	ra,8(sp)
    800051a8:	00013403          	ld	s0,0(sp)
    800051ac:	01010113          	addi	sp,sp,16
    800051b0:	00008067          	ret

00000000800051b4 <_ZN8ProducerD0Ev>:
    800051b4:	fe010113          	addi	sp,sp,-32
    800051b8:	00113c23          	sd	ra,24(sp)
    800051bc:	00813823          	sd	s0,16(sp)
    800051c0:	00913423          	sd	s1,8(sp)
    800051c4:	02010413          	addi	s0,sp,32
    800051c8:	00050493          	mv	s1,a0
    800051cc:	00008797          	auipc	a5,0x8
    800051d0:	a8478793          	addi	a5,a5,-1404 # 8000cc50 <_ZTV8Producer+0x10>
    800051d4:	00f53023          	sd	a5,0(a0)
    800051d8:	ffffd097          	auipc	ra,0xffffd
    800051dc:	f70080e7          	jalr	-144(ra) # 80002148 <_ZN6ThreadD1Ev>
    800051e0:	00048513          	mv	a0,s1
    800051e4:	ffffd097          	auipc	ra,0xffffd
    800051e8:	66c080e7          	jalr	1644(ra) # 80002850 <_ZN6ThreaddlEPv>
    800051ec:	01813083          	ld	ra,24(sp)
    800051f0:	01013403          	ld	s0,16(sp)
    800051f4:	00813483          	ld	s1,8(sp)
    800051f8:	02010113          	addi	sp,sp,32
    800051fc:	00008067          	ret

0000000080005200 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80005200:	fe010113          	addi	sp,sp,-32
    80005204:	00113c23          	sd	ra,24(sp)
    80005208:	00813823          	sd	s0,16(sp)
    8000520c:	00913423          	sd	s1,8(sp)
    80005210:	02010413          	addi	s0,sp,32
    80005214:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80005218:	ffffc097          	auipc	ra,0xffffc
    8000521c:	5cc080e7          	jalr	1484(ra) # 800017e4 <getc>
    80005220:	0005059b          	sext.w	a1,a0
    80005224:	01b00793          	li	a5,27
    80005228:	00f58c63          	beq	a1,a5,80005240 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000522c:	0a04b783          	ld	a5,160(s1)
    80005230:	0087b503          	ld	a0,8(a5)
    80005234:	00001097          	auipc	ra,0x1
    80005238:	33c080e7          	jalr	828(ra) # 80006570 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000523c:	fddff06f          	j	80005218 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80005240:	00100793          	li	a5,1
    80005244:	00008717          	auipc	a4,0x8
    80005248:	06f72623          	sw	a5,108(a4) # 8000d2b0 <_ZL9threadEnd>
        td->buffer->put('!');
    8000524c:	0a04b783          	ld	a5,160(s1)
    80005250:	02100593          	li	a1,33
    80005254:	0087b503          	ld	a0,8(a5)
    80005258:	00001097          	auipc	ra,0x1
    8000525c:	318080e7          	jalr	792(ra) # 80006570 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80005260:	0a04b783          	ld	a5,160(s1)
    80005264:	0107b503          	ld	a0,16(a5)
    80005268:	ffffd097          	auipc	ra,0xffffd
    8000526c:	c60080e7          	jalr	-928(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
    }
    80005270:	01813083          	ld	ra,24(sp)
    80005274:	01013403          	ld	s0,16(sp)
    80005278:	00813483          	ld	s1,8(sp)
    8000527c:	02010113          	addi	sp,sp,32
    80005280:	00008067          	ret

0000000080005284 <_ZN8Producer3runEv>:
    void run() override {
    80005284:	fe010113          	addi	sp,sp,-32
    80005288:	00113c23          	sd	ra,24(sp)
    8000528c:	00813823          	sd	s0,16(sp)
    80005290:	00913423          	sd	s1,8(sp)
    80005294:	02010413          	addi	s0,sp,32
    80005298:	00050493          	mv	s1,a0
        while (!threadEnd) {
    8000529c:	00008797          	auipc	a5,0x8
    800052a0:	0147a783          	lw	a5,20(a5) # 8000d2b0 <_ZL9threadEnd>
    800052a4:	02079063          	bnez	a5,800052c4 <_ZN8Producer3runEv+0x40>
            td->buffer->put(td->id + '0');
    800052a8:	0a04b783          	ld	a5,160(s1)
    800052ac:	0007a583          	lw	a1,0(a5)
    800052b0:	0305859b          	addiw	a1,a1,48
    800052b4:	0087b503          	ld	a0,8(a5)
    800052b8:	00001097          	auipc	ra,0x1
    800052bc:	2b8080e7          	jalr	696(ra) # 80006570 <_ZN9BufferCPP3putEi>
        while (!threadEnd) {
    800052c0:	fddff06f          	j	8000529c <_ZN8Producer3runEv+0x18>
        td->sem->signal();
    800052c4:	0a04b783          	ld	a5,160(s1)
    800052c8:	0107b503          	ld	a0,16(a5)
    800052cc:	ffffd097          	auipc	ra,0xffffd
    800052d0:	bfc080e7          	jalr	-1028(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
    }
    800052d4:	01813083          	ld	ra,24(sp)
    800052d8:	01013403          	ld	s0,16(sp)
    800052dc:	00813483          	ld	s1,8(sp)
    800052e0:	02010113          	addi	sp,sp,32
    800052e4:	00008067          	ret

00000000800052e8 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800052e8:	fe010113          	addi	sp,sp,-32
    800052ec:	00113c23          	sd	ra,24(sp)
    800052f0:	00813823          	sd	s0,16(sp)
    800052f4:	00913423          	sd	s1,8(sp)
    800052f8:	01213023          	sd	s2,0(sp)
    800052fc:	02010413          	addi	s0,sp,32
    80005300:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005304:	00100793          	li	a5,1
    80005308:	02a7f863          	bgeu	a5,a0,80005338 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000530c:	00a00793          	li	a5,10
    80005310:	02f577b3          	remu	a5,a0,a5
    80005314:	02078e63          	beqz	a5,80005350 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005318:	fff48513          	addi	a0,s1,-1
    8000531c:	00000097          	auipc	ra,0x0
    80005320:	fcc080e7          	jalr	-52(ra) # 800052e8 <_ZL9fibonaccim>
    80005324:	00050913          	mv	s2,a0
    80005328:	ffe48513          	addi	a0,s1,-2
    8000532c:	00000097          	auipc	ra,0x0
    80005330:	fbc080e7          	jalr	-68(ra) # 800052e8 <_ZL9fibonaccim>
    80005334:	00a90533          	add	a0,s2,a0
}
    80005338:	01813083          	ld	ra,24(sp)
    8000533c:	01013403          	ld	s0,16(sp)
    80005340:	00813483          	ld	s1,8(sp)
    80005344:	00013903          	ld	s2,0(sp)
    80005348:	02010113          	addi	sp,sp,32
    8000534c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005350:	ffffc097          	auipc	ra,0xffffc
    80005354:	2fc080e7          	jalr	764(ra) # 8000164c <thread_dispatch>
    80005358:	fc1ff06f          	j	80005318 <_ZL9fibonaccim+0x30>

000000008000535c <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    8000535c:	fe010113          	addi	sp,sp,-32
    80005360:	00113c23          	sd	ra,24(sp)
    80005364:	00813823          	sd	s0,16(sp)
    80005368:	00913423          	sd	s1,8(sp)
    8000536c:	01213023          	sd	s2,0(sp)
    80005370:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005374:	00a00493          	li	s1,10
    80005378:	0400006f          	j	800053b8 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000537c:	00005517          	auipc	a0,0x5
    80005380:	e8c50513          	addi	a0,a0,-372 # 8000a208 <CONSOLE_STATUS+0x1f8>
    80005384:	00001097          	auipc	ra,0x1
    80005388:	dc8080e7          	jalr	-568(ra) # 8000614c <_Z11printStringPKc>
    8000538c:	00000613          	li	a2,0
    80005390:	00a00593          	li	a1,10
    80005394:	00048513          	mv	a0,s1
    80005398:	00001097          	auipc	ra,0x1
    8000539c:	f64080e7          	jalr	-156(ra) # 800062fc <_Z8printIntiii>
    800053a0:	00005517          	auipc	a0,0x5
    800053a4:	dc850513          	addi	a0,a0,-568 # 8000a168 <CONSOLE_STATUS+0x158>
    800053a8:	00001097          	auipc	ra,0x1
    800053ac:	da4080e7          	jalr	-604(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800053b0:	0014849b          	addiw	s1,s1,1
    800053b4:	0ff4f493          	andi	s1,s1,255
    800053b8:	00c00793          	li	a5,12
    800053bc:	fc97f0e3          	bgeu	a5,s1,8000537c <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800053c0:	00005517          	auipc	a0,0x5
    800053c4:	e5050513          	addi	a0,a0,-432 # 8000a210 <CONSOLE_STATUS+0x200>
    800053c8:	00001097          	auipc	ra,0x1
    800053cc:	d84080e7          	jalr	-636(ra) # 8000614c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800053d0:	00500313          	li	t1,5
    thread_dispatch();
    800053d4:	ffffc097          	auipc	ra,0xffffc
    800053d8:	278080e7          	jalr	632(ra) # 8000164c <thread_dispatch>

    uint64 result = fibonacci(16);
    800053dc:	01000513          	li	a0,16
    800053e0:	00000097          	auipc	ra,0x0
    800053e4:	f08080e7          	jalr	-248(ra) # 800052e8 <_ZL9fibonaccim>
    800053e8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800053ec:	00005517          	auipc	a0,0x5
    800053f0:	e3450513          	addi	a0,a0,-460 # 8000a220 <CONSOLE_STATUS+0x210>
    800053f4:	00001097          	auipc	ra,0x1
    800053f8:	d58080e7          	jalr	-680(ra) # 8000614c <_Z11printStringPKc>
    800053fc:	00000613          	li	a2,0
    80005400:	00a00593          	li	a1,10
    80005404:	0009051b          	sext.w	a0,s2
    80005408:	00001097          	auipc	ra,0x1
    8000540c:	ef4080e7          	jalr	-268(ra) # 800062fc <_Z8printIntiii>
    80005410:	00005517          	auipc	a0,0x5
    80005414:	d5850513          	addi	a0,a0,-680 # 8000a168 <CONSOLE_STATUS+0x158>
    80005418:	00001097          	auipc	ra,0x1
    8000541c:	d34080e7          	jalr	-716(ra) # 8000614c <_Z11printStringPKc>
    80005420:	0400006f          	j	80005460 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005424:	00005517          	auipc	a0,0x5
    80005428:	de450513          	addi	a0,a0,-540 # 8000a208 <CONSOLE_STATUS+0x1f8>
    8000542c:	00001097          	auipc	ra,0x1
    80005430:	d20080e7          	jalr	-736(ra) # 8000614c <_Z11printStringPKc>
    80005434:	00000613          	li	a2,0
    80005438:	00a00593          	li	a1,10
    8000543c:	00048513          	mv	a0,s1
    80005440:	00001097          	auipc	ra,0x1
    80005444:	ebc080e7          	jalr	-324(ra) # 800062fc <_Z8printIntiii>
    80005448:	00005517          	auipc	a0,0x5
    8000544c:	d2050513          	addi	a0,a0,-736 # 8000a168 <CONSOLE_STATUS+0x158>
    80005450:	00001097          	auipc	ra,0x1
    80005454:	cfc080e7          	jalr	-772(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005458:	0014849b          	addiw	s1,s1,1
    8000545c:	0ff4f493          	andi	s1,s1,255
    80005460:	00f00793          	li	a5,15
    80005464:	fc97f0e3          	bgeu	a5,s1,80005424 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005468:	00005517          	auipc	a0,0x5
    8000546c:	dc850513          	addi	a0,a0,-568 # 8000a230 <CONSOLE_STATUS+0x220>
    80005470:	00001097          	auipc	ra,0x1
    80005474:	cdc080e7          	jalr	-804(ra) # 8000614c <_Z11printStringPKc>
    finishedD = true;
    80005478:	00100793          	li	a5,1
    8000547c:	00008717          	auipc	a4,0x8
    80005480:	e4f70223          	sb	a5,-444(a4) # 8000d2c0 <_ZL9finishedD>
    thread_dispatch();
    80005484:	ffffc097          	auipc	ra,0xffffc
    80005488:	1c8080e7          	jalr	456(ra) # 8000164c <thread_dispatch>
}
    8000548c:	01813083          	ld	ra,24(sp)
    80005490:	01013403          	ld	s0,16(sp)
    80005494:	00813483          	ld	s1,8(sp)
    80005498:	00013903          	ld	s2,0(sp)
    8000549c:	02010113          	addi	sp,sp,32
    800054a0:	00008067          	ret

00000000800054a4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800054a4:	fe010113          	addi	sp,sp,-32
    800054a8:	00113c23          	sd	ra,24(sp)
    800054ac:	00813823          	sd	s0,16(sp)
    800054b0:	00913423          	sd	s1,8(sp)
    800054b4:	01213023          	sd	s2,0(sp)
    800054b8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800054bc:	00000493          	li	s1,0
    800054c0:	0400006f          	j	80005500 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800054c4:	00005517          	auipc	a0,0x5
    800054c8:	d1450513          	addi	a0,a0,-748 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    800054cc:	00001097          	auipc	ra,0x1
    800054d0:	c80080e7          	jalr	-896(ra) # 8000614c <_Z11printStringPKc>
    800054d4:	00000613          	li	a2,0
    800054d8:	00a00593          	li	a1,10
    800054dc:	00048513          	mv	a0,s1
    800054e0:	00001097          	auipc	ra,0x1
    800054e4:	e1c080e7          	jalr	-484(ra) # 800062fc <_Z8printIntiii>
    800054e8:	00005517          	auipc	a0,0x5
    800054ec:	c8050513          	addi	a0,a0,-896 # 8000a168 <CONSOLE_STATUS+0x158>
    800054f0:	00001097          	auipc	ra,0x1
    800054f4:	c5c080e7          	jalr	-932(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 3; i++) {
    800054f8:	0014849b          	addiw	s1,s1,1
    800054fc:	0ff4f493          	andi	s1,s1,255
    80005500:	00200793          	li	a5,2
    80005504:	fc97f0e3          	bgeu	a5,s1,800054c4 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005508:	00005517          	auipc	a0,0x5
    8000550c:	cd850513          	addi	a0,a0,-808 # 8000a1e0 <CONSOLE_STATUS+0x1d0>
    80005510:	00001097          	auipc	ra,0x1
    80005514:	c3c080e7          	jalr	-964(ra) # 8000614c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005518:	00700313          	li	t1,7
    thread_dispatch();
    8000551c:	ffffc097          	auipc	ra,0xffffc
    80005520:	130080e7          	jalr	304(ra) # 8000164c <thread_dispatch>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005524:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005528:	00005517          	auipc	a0,0x5
    8000552c:	cc850513          	addi	a0,a0,-824 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    80005530:	00001097          	auipc	ra,0x1
    80005534:	c1c080e7          	jalr	-996(ra) # 8000614c <_Z11printStringPKc>
    80005538:	00000613          	li	a2,0
    8000553c:	00a00593          	li	a1,10
    80005540:	0009051b          	sext.w	a0,s2
    80005544:	00001097          	auipc	ra,0x1
    80005548:	db8080e7          	jalr	-584(ra) # 800062fc <_Z8printIntiii>
    8000554c:	00005517          	auipc	a0,0x5
    80005550:	c1c50513          	addi	a0,a0,-996 # 8000a168 <CONSOLE_STATUS+0x158>
    80005554:	00001097          	auipc	ra,0x1
    80005558:	bf8080e7          	jalr	-1032(ra) # 8000614c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    8000555c:	00c00513          	li	a0,12
    80005560:	00000097          	auipc	ra,0x0
    80005564:	d88080e7          	jalr	-632(ra) # 800052e8 <_ZL9fibonaccim>
    80005568:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    8000556c:	00005517          	auipc	a0,0x5
    80005570:	c8c50513          	addi	a0,a0,-884 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80005574:	00001097          	auipc	ra,0x1
    80005578:	bd8080e7          	jalr	-1064(ra) # 8000614c <_Z11printStringPKc>
    8000557c:	00000613          	li	a2,0
    80005580:	00a00593          	li	a1,10
    80005584:	0009051b          	sext.w	a0,s2
    80005588:	00001097          	auipc	ra,0x1
    8000558c:	d74080e7          	jalr	-652(ra) # 800062fc <_Z8printIntiii>
    80005590:	00005517          	auipc	a0,0x5
    80005594:	bd850513          	addi	a0,a0,-1064 # 8000a168 <CONSOLE_STATUS+0x158>
    80005598:	00001097          	auipc	ra,0x1
    8000559c:	bb4080e7          	jalr	-1100(ra) # 8000614c <_Z11printStringPKc>
    800055a0:	0400006f          	j	800055e0 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800055a4:	00005517          	auipc	a0,0x5
    800055a8:	c3450513          	addi	a0,a0,-972 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    800055ac:	00001097          	auipc	ra,0x1
    800055b0:	ba0080e7          	jalr	-1120(ra) # 8000614c <_Z11printStringPKc>
    800055b4:	00000613          	li	a2,0
    800055b8:	00a00593          	li	a1,10
    800055bc:	00048513          	mv	a0,s1
    800055c0:	00001097          	auipc	ra,0x1
    800055c4:	d3c080e7          	jalr	-708(ra) # 800062fc <_Z8printIntiii>
    800055c8:	00005517          	auipc	a0,0x5
    800055cc:	ba050513          	addi	a0,a0,-1120 # 8000a168 <CONSOLE_STATUS+0x158>
    800055d0:	00001097          	auipc	ra,0x1
    800055d4:	b7c080e7          	jalr	-1156(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 6; i++) {
    800055d8:	0014849b          	addiw	s1,s1,1
    800055dc:	0ff4f493          	andi	s1,s1,255
    800055e0:	00500793          	li	a5,5
    800055e4:	fc97f0e3          	bgeu	a5,s1,800055a4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800055e8:	00005517          	auipc	a0,0x5
    800055ec:	bc850513          	addi	a0,a0,-1080 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    800055f0:	00001097          	auipc	ra,0x1
    800055f4:	b5c080e7          	jalr	-1188(ra) # 8000614c <_Z11printStringPKc>
    finishedC = true;
    800055f8:	00100793          	li	a5,1
    800055fc:	00008717          	auipc	a4,0x8
    80005600:	ccf702a3          	sb	a5,-827(a4) # 8000d2c1 <_ZL9finishedC>
    thread_dispatch();
    80005604:	ffffc097          	auipc	ra,0xffffc
    80005608:	048080e7          	jalr	72(ra) # 8000164c <thread_dispatch>
}
    8000560c:	01813083          	ld	ra,24(sp)
    80005610:	01013403          	ld	s0,16(sp)
    80005614:	00813483          	ld	s1,8(sp)
    80005618:	00013903          	ld	s2,0(sp)
    8000561c:	02010113          	addi	sp,sp,32
    80005620:	00008067          	ret

0000000080005624 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005624:	fe010113          	addi	sp,sp,-32
    80005628:	00113c23          	sd	ra,24(sp)
    8000562c:	00813823          	sd	s0,16(sp)
    80005630:	00913423          	sd	s1,8(sp)
    80005634:	01213023          	sd	s2,0(sp)
    80005638:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000563c:	00000913          	li	s2,0
    80005640:	0380006f          	j	80005678 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80005644:	ffffc097          	auipc	ra,0xffffc
    80005648:	008080e7          	jalr	8(ra) # 8000164c <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    8000564c:	00148493          	addi	s1,s1,1
    80005650:	000027b7          	lui	a5,0x2
    80005654:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005658:	0097ee63          	bltu	a5,s1,80005674 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000565c:	00000713          	li	a4,0
    80005660:	000077b7          	lui	a5,0x7
    80005664:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005668:	fce7eee3          	bltu	a5,a4,80005644 <_ZL11workerBodyBPv+0x20>
    8000566c:	00170713          	addi	a4,a4,1
    80005670:	ff1ff06f          	j	80005660 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005674:	00190913          	addi	s2,s2,1
    80005678:	00f00793          	li	a5,15
    8000567c:	0527e063          	bltu	a5,s2,800056bc <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80005680:	00005517          	auipc	a0,0x5
    80005684:	b4050513          	addi	a0,a0,-1216 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80005688:	00001097          	auipc	ra,0x1
    8000568c:	ac4080e7          	jalr	-1340(ra) # 8000614c <_Z11printStringPKc>
    80005690:	00000613          	li	a2,0
    80005694:	00a00593          	li	a1,10
    80005698:	0009051b          	sext.w	a0,s2
    8000569c:	00001097          	auipc	ra,0x1
    800056a0:	c60080e7          	jalr	-928(ra) # 800062fc <_Z8printIntiii>
    800056a4:	00005517          	auipc	a0,0x5
    800056a8:	ac450513          	addi	a0,a0,-1340 # 8000a168 <CONSOLE_STATUS+0x158>
    800056ac:	00001097          	auipc	ra,0x1
    800056b0:	aa0080e7          	jalr	-1376(ra) # 8000614c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800056b4:	00000493          	li	s1,0
    800056b8:	f99ff06f          	j	80005650 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    800056bc:	00005517          	auipc	a0,0x5
    800056c0:	b0c50513          	addi	a0,a0,-1268 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    800056c4:	00001097          	auipc	ra,0x1
    800056c8:	a88080e7          	jalr	-1400(ra) # 8000614c <_Z11printStringPKc>
    finishedB = true;
    800056cc:	00100793          	li	a5,1
    800056d0:	00008717          	auipc	a4,0x8
    800056d4:	bef70923          	sb	a5,-1038(a4) # 8000d2c2 <_ZL9finishedB>
    thread_dispatch();
    800056d8:	ffffc097          	auipc	ra,0xffffc
    800056dc:	f74080e7          	jalr	-140(ra) # 8000164c <thread_dispatch>
}
    800056e0:	01813083          	ld	ra,24(sp)
    800056e4:	01013403          	ld	s0,16(sp)
    800056e8:	00813483          	ld	s1,8(sp)
    800056ec:	00013903          	ld	s2,0(sp)
    800056f0:	02010113          	addi	sp,sp,32
    800056f4:	00008067          	ret

00000000800056f8 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800056f8:	fe010113          	addi	sp,sp,-32
    800056fc:	00113c23          	sd	ra,24(sp)
    80005700:	00813823          	sd	s0,16(sp)
    80005704:	00913423          	sd	s1,8(sp)
    80005708:	01213023          	sd	s2,0(sp)
    8000570c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005710:	00000913          	li	s2,0
    80005714:	0380006f          	j	8000574c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005718:	ffffc097          	auipc	ra,0xffffc
    8000571c:	f34080e7          	jalr	-204(ra) # 8000164c <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    80005720:	00148493          	addi	s1,s1,1
    80005724:	000027b7          	lui	a5,0x2
    80005728:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000572c:	0097ee63          	bltu	a5,s1,80005748 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005730:	00000713          	li	a4,0
    80005734:	000077b7          	lui	a5,0x7
    80005738:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000573c:	fce7eee3          	bltu	a5,a4,80005718 <_ZL11workerBodyAPv+0x20>
    80005740:	00170713          	addi	a4,a4,1
    80005744:	ff1ff06f          	j	80005734 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005748:	00190913          	addi	s2,s2,1
    8000574c:	00900793          	li	a5,9
    80005750:	0527e063          	bltu	a5,s2,80005790 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005754:	00005517          	auipc	a0,0x5
    80005758:	a5450513          	addi	a0,a0,-1452 # 8000a1a8 <CONSOLE_STATUS+0x198>
    8000575c:	00001097          	auipc	ra,0x1
    80005760:	9f0080e7          	jalr	-1552(ra) # 8000614c <_Z11printStringPKc>
    80005764:	00000613          	li	a2,0
    80005768:	00a00593          	li	a1,10
    8000576c:	0009051b          	sext.w	a0,s2
    80005770:	00001097          	auipc	ra,0x1
    80005774:	b8c080e7          	jalr	-1140(ra) # 800062fc <_Z8printIntiii>
    80005778:	00005517          	auipc	a0,0x5
    8000577c:	9f050513          	addi	a0,a0,-1552 # 8000a168 <CONSOLE_STATUS+0x158>
    80005780:	00001097          	auipc	ra,0x1
    80005784:	9cc080e7          	jalr	-1588(ra) # 8000614c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005788:	00000493          	li	s1,0
    8000578c:	f99ff06f          	j	80005724 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005790:	00005517          	auipc	a0,0x5
    80005794:	a2050513          	addi	a0,a0,-1504 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80005798:	00001097          	auipc	ra,0x1
    8000579c:	9b4080e7          	jalr	-1612(ra) # 8000614c <_Z11printStringPKc>
    finishedA = true;
    800057a0:	00100793          	li	a5,1
    800057a4:	00008717          	auipc	a4,0x8
    800057a8:	b0f70fa3          	sb	a5,-1249(a4) # 8000d2c3 <_ZL9finishedA>
}
    800057ac:	01813083          	ld	ra,24(sp)
    800057b0:	01013403          	ld	s0,16(sp)
    800057b4:	00813483          	ld	s1,8(sp)
    800057b8:	00013903          	ld	s2,0(sp)
    800057bc:	02010113          	addi	sp,sp,32
    800057c0:	00008067          	ret

00000000800057c4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800057c4:	fe010113          	addi	sp,sp,-32
    800057c8:	00113c23          	sd	ra,24(sp)
    800057cc:	00813823          	sd	s0,16(sp)
    800057d0:	02010413          	addi	s0,sp,32
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800057d4:	00000613          	li	a2,0
    800057d8:	00000597          	auipc	a1,0x0
    800057dc:	f2058593          	addi	a1,a1,-224 # 800056f8 <_ZL11workerBodyAPv>
    800057e0:	fe040513          	addi	a0,s0,-32
    800057e4:	ffffc097          	auipc	ra,0xffffc
    800057e8:	db0080e7          	jalr	-592(ra) # 80001594 <thread_create>
    printString("ThreadA created\n");
    800057ec:	00005517          	auipc	a0,0x5
    800057f0:	a5450513          	addi	a0,a0,-1452 # 8000a240 <CONSOLE_STATUS+0x230>
    800057f4:	00001097          	auipc	ra,0x1
    800057f8:	958080e7          	jalr	-1704(ra) # 8000614c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800057fc:	00000613          	li	a2,0
    80005800:	00000597          	auipc	a1,0x0
    80005804:	e2458593          	addi	a1,a1,-476 # 80005624 <_ZL11workerBodyBPv>
    80005808:	fe440513          	addi	a0,s0,-28
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	d88080e7          	jalr	-632(ra) # 80001594 <thread_create>
    printString("ThreadB created\n");
    80005814:	00005517          	auipc	a0,0x5
    80005818:	a4450513          	addi	a0,a0,-1468 # 8000a258 <CONSOLE_STATUS+0x248>
    8000581c:	00001097          	auipc	ra,0x1
    80005820:	930080e7          	jalr	-1744(ra) # 8000614c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005824:	00000613          	li	a2,0
    80005828:	00000597          	auipc	a1,0x0
    8000582c:	c7c58593          	addi	a1,a1,-900 # 800054a4 <_ZL11workerBodyCPv>
    80005830:	fe840513          	addi	a0,s0,-24
    80005834:	ffffc097          	auipc	ra,0xffffc
    80005838:	d60080e7          	jalr	-672(ra) # 80001594 <thread_create>
    printString("ThreadC created\n");
    8000583c:	00005517          	auipc	a0,0x5
    80005840:	a3450513          	addi	a0,a0,-1484 # 8000a270 <CONSOLE_STATUS+0x260>
    80005844:	00001097          	auipc	ra,0x1
    80005848:	908080e7          	jalr	-1784(ra) # 8000614c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000584c:	00000613          	li	a2,0
    80005850:	00000597          	auipc	a1,0x0
    80005854:	b0c58593          	addi	a1,a1,-1268 # 8000535c <_ZL11workerBodyDPv>
    80005858:	fec40513          	addi	a0,s0,-20
    8000585c:	ffffc097          	auipc	ra,0xffffc
    80005860:	d38080e7          	jalr	-712(ra) # 80001594 <thread_create>
    printString("ThreadD created\n");
    80005864:	00005517          	auipc	a0,0x5
    80005868:	a2450513          	addi	a0,a0,-1500 # 8000a288 <CONSOLE_STATUS+0x278>
    8000586c:	00001097          	auipc	ra,0x1
    80005870:	8e0080e7          	jalr	-1824(ra) # 8000614c <_Z11printStringPKc>
    80005874:	00c0006f          	j	80005880 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005878:	ffffc097          	auipc	ra,0xffffc
    8000587c:	dd4080e7          	jalr	-556(ra) # 8000164c <thread_dispatch>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005880:	00008797          	auipc	a5,0x8
    80005884:	a437c783          	lbu	a5,-1469(a5) # 8000d2c3 <_ZL9finishedA>
    80005888:	fe0788e3          	beqz	a5,80005878 <_Z18Threads_C_API_testv+0xb4>
    8000588c:	00008797          	auipc	a5,0x8
    80005890:	a367c783          	lbu	a5,-1482(a5) # 8000d2c2 <_ZL9finishedB>
    80005894:	fe0782e3          	beqz	a5,80005878 <_Z18Threads_C_API_testv+0xb4>
    80005898:	00008797          	auipc	a5,0x8
    8000589c:	a297c783          	lbu	a5,-1495(a5) # 8000d2c1 <_ZL9finishedC>
    800058a0:	fc078ce3          	beqz	a5,80005878 <_Z18Threads_C_API_testv+0xb4>
    800058a4:	00008797          	auipc	a5,0x8
    800058a8:	a1c7c783          	lbu	a5,-1508(a5) # 8000d2c0 <_ZL9finishedD>
    800058ac:	fc0786e3          	beqz	a5,80005878 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800058b0:	01813083          	ld	ra,24(sp)
    800058b4:	01013403          	ld	s0,16(sp)
    800058b8:	02010113          	addi	sp,sp,32
    800058bc:	00008067          	ret

00000000800058c0 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800058c0:	fd010113          	addi	sp,sp,-48
    800058c4:	02113423          	sd	ra,40(sp)
    800058c8:	02813023          	sd	s0,32(sp)
    800058cc:	00913c23          	sd	s1,24(sp)
    800058d0:	01213823          	sd	s2,16(sp)
    800058d4:	01313423          	sd	s3,8(sp)
    800058d8:	03010413          	addi	s0,sp,48
    800058dc:	00050993          	mv	s3,a0
    800058e0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    800058e4:	00000913          	li	s2,0
    800058e8:	00c0006f          	j	800058f4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800058ec:	ffffd097          	auipc	ra,0xffffd
    800058f0:	fd4080e7          	jalr	-44(ra) # 800028c0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    800058f4:	ffffc097          	auipc	ra,0xffffc
    800058f8:	ef0080e7          	jalr	-272(ra) # 800017e4 <getc>
    800058fc:	0005059b          	sext.w	a1,a0
    80005900:	01b00793          	li	a5,27
    80005904:	02f58a63          	beq	a1,a5,80005938 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005908:	0084b503          	ld	a0,8(s1)
    8000590c:	00001097          	auipc	ra,0x1
    80005910:	c64080e7          	jalr	-924(ra) # 80006570 <_ZN9BufferCPP3putEi>
        i++;
    80005914:	0019071b          	addiw	a4,s2,1
    80005918:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000591c:	0004a683          	lw	a3,0(s1)
    80005920:	0026979b          	slliw	a5,a3,0x2
    80005924:	00d787bb          	addw	a5,a5,a3
    80005928:	0017979b          	slliw	a5,a5,0x1
    8000592c:	02f767bb          	remw	a5,a4,a5
    80005930:	fc0792e3          	bnez	a5,800058f4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80005934:	fb9ff06f          	j	800058ec <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005938:	00100793          	li	a5,1
    8000593c:	00008717          	auipc	a4,0x8
    80005940:	98f72623          	sw	a5,-1652(a4) # 8000d2c8 <_ZL9threadEnd>
    td->buffer->put('!');
    80005944:	0a09b783          	ld	a5,160(s3)
    80005948:	02100593          	li	a1,33
    8000594c:	0087b503          	ld	a0,8(a5)
    80005950:	00001097          	auipc	ra,0x1
    80005954:	c20080e7          	jalr	-992(ra) # 80006570 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005958:	0104b503          	ld	a0,16(s1)
    8000595c:	ffffc097          	auipc	ra,0xffffc
    80005960:	56c080e7          	jalr	1388(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
}
    80005964:	02813083          	ld	ra,40(sp)
    80005968:	02013403          	ld	s0,32(sp)
    8000596c:	01813483          	ld	s1,24(sp)
    80005970:	01013903          	ld	s2,16(sp)
    80005974:	00813983          	ld	s3,8(sp)
    80005978:	03010113          	addi	sp,sp,48
    8000597c:	00008067          	ret

0000000080005980 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80005980:	fe010113          	addi	sp,sp,-32
    80005984:	00113c23          	sd	ra,24(sp)
    80005988:	00813823          	sd	s0,16(sp)
    8000598c:	00913423          	sd	s1,8(sp)
    80005990:	01213023          	sd	s2,0(sp)
    80005994:	02010413          	addi	s0,sp,32
    80005998:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000599c:	00000913          	li	s2,0
    800059a0:	00c0006f          	j	800059ac <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800059a4:	ffffd097          	auipc	ra,0xffffd
    800059a8:	f1c080e7          	jalr	-228(ra) # 800028c0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800059ac:	00008797          	auipc	a5,0x8
    800059b0:	91c7a783          	lw	a5,-1764(a5) # 8000d2c8 <_ZL9threadEnd>
    800059b4:	02079e63          	bnez	a5,800059f0 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800059b8:	0004a583          	lw	a1,0(s1)
    800059bc:	0305859b          	addiw	a1,a1,48
    800059c0:	0084b503          	ld	a0,8(s1)
    800059c4:	00001097          	auipc	ra,0x1
    800059c8:	bac080e7          	jalr	-1108(ra) # 80006570 <_ZN9BufferCPP3putEi>
        i++;
    800059cc:	0019071b          	addiw	a4,s2,1
    800059d0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800059d4:	0004a683          	lw	a3,0(s1)
    800059d8:	0026979b          	slliw	a5,a3,0x2
    800059dc:	00d787bb          	addw	a5,a5,a3
    800059e0:	0017979b          	slliw	a5,a5,0x1
    800059e4:	02f767bb          	remw	a5,a4,a5
    800059e8:	fc0792e3          	bnez	a5,800059ac <_ZN12ProducerSync8producerEPv+0x2c>
    800059ec:	fb9ff06f          	j	800059a4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    800059f0:	0104b503          	ld	a0,16(s1)
    800059f4:	ffffc097          	auipc	ra,0xffffc
    800059f8:	4d4080e7          	jalr	1236(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
}
    800059fc:	01813083          	ld	ra,24(sp)
    80005a00:	01013403          	ld	s0,16(sp)
    80005a04:	00813483          	ld	s1,8(sp)
    80005a08:	00013903          	ld	s2,0(sp)
    80005a0c:	02010113          	addi	sp,sp,32
    80005a10:	00008067          	ret

0000000080005a14 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80005a14:	fd010113          	addi	sp,sp,-48
    80005a18:	02113423          	sd	ra,40(sp)
    80005a1c:	02813023          	sd	s0,32(sp)
    80005a20:	00913c23          	sd	s1,24(sp)
    80005a24:	01213823          	sd	s2,16(sp)
    80005a28:	01313423          	sd	s3,8(sp)
    80005a2c:	01413023          	sd	s4,0(sp)
    80005a30:	03010413          	addi	s0,sp,48
    80005a34:	00050993          	mv	s3,a0
    80005a38:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005a3c:	00000a13          	li	s4,0
    80005a40:	01c0006f          	j	80005a5c <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80005a44:	ffffd097          	auipc	ra,0xffffd
    80005a48:	e7c080e7          	jalr	-388(ra) # 800028c0 <_ZN6Thread8dispatchEv>
    80005a4c:	0500006f          	j	80005a9c <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005a50:	00a00513          	li	a0,10
    80005a54:	ffffc097          	auipc	ra,0xffffc
    80005a58:	dc0080e7          	jalr	-576(ra) # 80001814 <putc>
    while (!threadEnd) {
    80005a5c:	00008797          	auipc	a5,0x8
    80005a60:	86c7a783          	lw	a5,-1940(a5) # 8000d2c8 <_ZL9threadEnd>
    80005a64:	06079263          	bnez	a5,80005ac8 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005a68:	00893503          	ld	a0,8(s2)
    80005a6c:	00001097          	auipc	ra,0x1
    80005a70:	b94080e7          	jalr	-1132(ra) # 80006600 <_ZN9BufferCPP3getEv>
        i++;
    80005a74:	001a049b          	addiw	s1,s4,1
    80005a78:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005a7c:	0ff57513          	andi	a0,a0,255
    80005a80:	ffffc097          	auipc	ra,0xffffc
    80005a84:	d94080e7          	jalr	-620(ra) # 80001814 <putc>
        if (i % (5 * data->id) == 0) {
    80005a88:	00092703          	lw	a4,0(s2)
    80005a8c:	0027179b          	slliw	a5,a4,0x2
    80005a90:	00e787bb          	addw	a5,a5,a4
    80005a94:	02f4e7bb          	remw	a5,s1,a5
    80005a98:	fa0786e3          	beqz	a5,80005a44 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005a9c:	05000793          	li	a5,80
    80005aa0:	02f4e4bb          	remw	s1,s1,a5
    80005aa4:	fa049ce3          	bnez	s1,80005a5c <_ZN12ConsumerSync8consumerEPv+0x48>
    80005aa8:	fa9ff06f          	j	80005a50 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005aac:	0a09b783          	ld	a5,160(s3)
    80005ab0:	0087b503          	ld	a0,8(a5)
    80005ab4:	00001097          	auipc	ra,0x1
    80005ab8:	b4c080e7          	jalr	-1204(ra) # 80006600 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005abc:	0ff57513          	andi	a0,a0,255
    80005ac0:	ffffd097          	auipc	ra,0xffffd
    80005ac4:	410080e7          	jalr	1040(ra) # 80002ed0 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005ac8:	0a09b783          	ld	a5,160(s3)
    80005acc:	0087b503          	ld	a0,8(a5)
    80005ad0:	00001097          	auipc	ra,0x1
    80005ad4:	bbc080e7          	jalr	-1092(ra) # 8000668c <_ZN9BufferCPP6getCntEv>
    80005ad8:	fca04ae3          	bgtz	a0,80005aac <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005adc:	01093503          	ld	a0,16(s2)
    80005ae0:	ffffc097          	auipc	ra,0xffffc
    80005ae4:	3e8080e7          	jalr	1000(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
}
    80005ae8:	02813083          	ld	ra,40(sp)
    80005aec:	02013403          	ld	s0,32(sp)
    80005af0:	01813483          	ld	s1,24(sp)
    80005af4:	01013903          	ld	s2,16(sp)
    80005af8:	00813983          	ld	s3,8(sp)
    80005afc:	00013a03          	ld	s4,0(sp)
    80005b00:	03010113          	addi	sp,sp,48
    80005b04:	00008067          	ret

0000000080005b08 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005b08:	f8010113          	addi	sp,sp,-128
    80005b0c:	06113c23          	sd	ra,120(sp)
    80005b10:	06813823          	sd	s0,112(sp)
    80005b14:	06913423          	sd	s1,104(sp)
    80005b18:	07213023          	sd	s2,96(sp)
    80005b1c:	05313c23          	sd	s3,88(sp)
    80005b20:	05413823          	sd	s4,80(sp)
    80005b24:	05513423          	sd	s5,72(sp)
    80005b28:	05613023          	sd	s6,64(sp)
    80005b2c:	03713c23          	sd	s7,56(sp)
    80005b30:	03813823          	sd	s8,48(sp)
    80005b34:	03913423          	sd	s9,40(sp)
    80005b38:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005b3c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005b40:	00004517          	auipc	a0,0x4
    80005b44:	5f050513          	addi	a0,a0,1520 # 8000a130 <CONSOLE_STATUS+0x120>
    80005b48:	00000097          	auipc	ra,0x0
    80005b4c:	604080e7          	jalr	1540(ra) # 8000614c <_Z11printStringPKc>
    getString(input, 30);
    80005b50:	01e00593          	li	a1,30
    80005b54:	f8040493          	addi	s1,s0,-128
    80005b58:	00048513          	mv	a0,s1
    80005b5c:	00000097          	auipc	ra,0x0
    80005b60:	678080e7          	jalr	1656(ra) # 800061d4 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005b64:	00048513          	mv	a0,s1
    80005b68:	00000097          	auipc	ra,0x0
    80005b6c:	744080e7          	jalr	1860(ra) # 800062ac <_Z11stringToIntPKc>
    80005b70:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005b74:	00004517          	auipc	a0,0x4
    80005b78:	5dc50513          	addi	a0,a0,1500 # 8000a150 <CONSOLE_STATUS+0x140>
    80005b7c:	00000097          	auipc	ra,0x0
    80005b80:	5d0080e7          	jalr	1488(ra) # 8000614c <_Z11printStringPKc>
    getString(input, 30);
    80005b84:	01e00593          	li	a1,30
    80005b88:	00048513          	mv	a0,s1
    80005b8c:	00000097          	auipc	ra,0x0
    80005b90:	648080e7          	jalr	1608(ra) # 800061d4 <_Z9getStringPci>
    n = stringToInt(input);
    80005b94:	00048513          	mv	a0,s1
    80005b98:	00000097          	auipc	ra,0x0
    80005b9c:	714080e7          	jalr	1812(ra) # 800062ac <_Z11stringToIntPKc>
    80005ba0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005ba4:	00004517          	auipc	a0,0x4
    80005ba8:	5cc50513          	addi	a0,a0,1484 # 8000a170 <CONSOLE_STATUS+0x160>
    80005bac:	00000097          	auipc	ra,0x0
    80005bb0:	5a0080e7          	jalr	1440(ra) # 8000614c <_Z11printStringPKc>
    80005bb4:	00000613          	li	a2,0
    80005bb8:	00a00593          	li	a1,10
    80005bbc:	00090513          	mv	a0,s2
    80005bc0:	00000097          	auipc	ra,0x0
    80005bc4:	73c080e7          	jalr	1852(ra) # 800062fc <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005bc8:	00004517          	auipc	a0,0x4
    80005bcc:	5c050513          	addi	a0,a0,1472 # 8000a188 <CONSOLE_STATUS+0x178>
    80005bd0:	00000097          	auipc	ra,0x0
    80005bd4:	57c080e7          	jalr	1404(ra) # 8000614c <_Z11printStringPKc>
    80005bd8:	00000613          	li	a2,0
    80005bdc:	00a00593          	li	a1,10
    80005be0:	00048513          	mv	a0,s1
    80005be4:	00000097          	auipc	ra,0x0
    80005be8:	718080e7          	jalr	1816(ra) # 800062fc <_Z8printIntiii>
    printString(".\n");
    80005bec:	00004517          	auipc	a0,0x4
    80005bf0:	5b450513          	addi	a0,a0,1460 # 8000a1a0 <CONSOLE_STATUS+0x190>
    80005bf4:	00000097          	auipc	ra,0x0
    80005bf8:	558080e7          	jalr	1368(ra) # 8000614c <_Z11printStringPKc>
    if(threadNum > n) {
    80005bfc:	0324c463          	blt	s1,s2,80005c24 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005c00:	03205c63          	blez	s2,80005c38 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005c04:	03800513          	li	a0,56
    80005c08:	ffffd097          	auipc	ra,0xffffd
    80005c0c:	750080e7          	jalr	1872(ra) # 80003358 <_Znwm>
    80005c10:	00050a93          	mv	s5,a0
    80005c14:	00048593          	mv	a1,s1
    80005c18:	00001097          	auipc	ra,0x1
    80005c1c:	804080e7          	jalr	-2044(ra) # 8000641c <_ZN9BufferCPPC1Ei>
    80005c20:	0300006f          	j	80005c50 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80005c24:	00004517          	auipc	a0,0x4
    80005c28:	67c50513          	addi	a0,a0,1660 # 8000a2a0 <CONSOLE_STATUS+0x290>
    80005c2c:	00000097          	auipc	ra,0x0
    80005c30:	520080e7          	jalr	1312(ra) # 8000614c <_Z11printStringPKc>
        return;
    80005c34:	0140006f          	j	80005c48 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005c38:	00004517          	auipc	a0,0x4
    80005c3c:	6a850513          	addi	a0,a0,1704 # 8000a2e0 <CONSOLE_STATUS+0x2d0>
    80005c40:	00000097          	auipc	ra,0x0
    80005c44:	50c080e7          	jalr	1292(ra) # 8000614c <_Z11printStringPKc>
        return;
    80005c48:	000b8113          	mv	sp,s7
    80005c4c:	2380006f          	j	80005e84 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005c50:	02000513          	li	a0,32
    80005c54:	ffffc097          	auipc	ra,0xffffc
    80005c58:	e20080e7          	jalr	-480(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80005c5c:	00050493          	mv	s1,a0
    80005c60:	00000593          	li	a1,0
    80005c64:	ffffc097          	auipc	ra,0xffffc
    80005c68:	da4080e7          	jalr	-604(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80005c6c:	00007797          	auipc	a5,0x7
    80005c70:	6697b223          	sd	s1,1636(a5) # 8000d2d0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005c74:	00391793          	slli	a5,s2,0x3
    80005c78:	00f78793          	addi	a5,a5,15
    80005c7c:	ff07f793          	andi	a5,a5,-16
    80005c80:	40f10133          	sub	sp,sp,a5
    80005c84:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005c88:	0019071b          	addiw	a4,s2,1
    80005c8c:	00171793          	slli	a5,a4,0x1
    80005c90:	00e787b3          	add	a5,a5,a4
    80005c94:	00379793          	slli	a5,a5,0x3
    80005c98:	00f78793          	addi	a5,a5,15
    80005c9c:	ff07f793          	andi	a5,a5,-16
    80005ca0:	40f10133          	sub	sp,sp,a5
    80005ca4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005ca8:	00191c13          	slli	s8,s2,0x1
    80005cac:	012c07b3          	add	a5,s8,s2
    80005cb0:	00379793          	slli	a5,a5,0x3
    80005cb4:	00fa07b3          	add	a5,s4,a5
    80005cb8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005cbc:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80005cc0:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005cc4:	0a800513          	li	a0,168
    80005cc8:	ffffd097          	auipc	ra,0xffffd
    80005ccc:	a68080e7          	jalr	-1432(ra) # 80002730 <_ZN6ThreadnwEm>
    80005cd0:	00050b13          	mv	s6,a0
    80005cd4:	012c0c33          	add	s8,s8,s2
    80005cd8:	003c1c13          	slli	s8,s8,0x3
    80005cdc:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005ce0:	ffffc097          	auipc	ra,0xffffc
    80005ce4:	6fc080e7          	jalr	1788(ra) # 800023dc <_ZN6ThreadC1Ev>
    80005ce8:	00007797          	auipc	a5,0x7
    80005cec:	00878793          	addi	a5,a5,8 # 8000ccf0 <_ZTV12ConsumerSync+0x10>
    80005cf0:	00fb3023          	sd	a5,0(s6)
    80005cf4:	0b8b3023          	sd	s8,160(s6)
    consumerThread->start();
    80005cf8:	000b0513          	mv	a0,s6
    80005cfc:	ffffd097          	auipc	ra,0xffffd
    80005d00:	bec080e7          	jalr	-1044(ra) # 800028e8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005d04:	00000493          	li	s1,0
    80005d08:	0380006f          	j	80005d40 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005d0c:	00007797          	auipc	a5,0x7
    80005d10:	fbc78793          	addi	a5,a5,-68 # 8000ccc8 <_ZTV12ProducerSync+0x10>
    80005d14:	00fcb023          	sd	a5,0(s9)
    80005d18:	0b8cb023          	sd	s8,160(s9)
            threads[i] = new ProducerSync(data+i);
    80005d1c:	00349793          	slli	a5,s1,0x3
    80005d20:	00f987b3          	add	a5,s3,a5
    80005d24:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005d28:	00349793          	slli	a5,s1,0x3
    80005d2c:	00f987b3          	add	a5,s3,a5
    80005d30:	0007b503          	ld	a0,0(a5)
    80005d34:	ffffd097          	auipc	ra,0xffffd
    80005d38:	bb4080e7          	jalr	-1100(ra) # 800028e8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005d3c:	0014849b          	addiw	s1,s1,1
    80005d40:	0b24d063          	bge	s1,s2,80005de0 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80005d44:	00149793          	slli	a5,s1,0x1
    80005d48:	009787b3          	add	a5,a5,s1
    80005d4c:	00379793          	slli	a5,a5,0x3
    80005d50:	00fa07b3          	add	a5,s4,a5
    80005d54:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005d58:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005d5c:	00007717          	auipc	a4,0x7
    80005d60:	57473703          	ld	a4,1396(a4) # 8000d2d0 <_ZL10waitForAll>
    80005d64:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005d68:	02905863          	blez	s1,80005d98 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005d6c:	0a800513          	li	a0,168
    80005d70:	ffffd097          	auipc	ra,0xffffd
    80005d74:	9c0080e7          	jalr	-1600(ra) # 80002730 <_ZN6ThreadnwEm>
    80005d78:	00050c93          	mv	s9,a0
    80005d7c:	00149c13          	slli	s8,s1,0x1
    80005d80:	009c0c33          	add	s8,s8,s1
    80005d84:	003c1c13          	slli	s8,s8,0x3
    80005d88:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005d8c:	ffffc097          	auipc	ra,0xffffc
    80005d90:	650080e7          	jalr	1616(ra) # 800023dc <_ZN6ThreadC1Ev>
    80005d94:	f79ff06f          	j	80005d0c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005d98:	0a800513          	li	a0,168
    80005d9c:	ffffd097          	auipc	ra,0xffffd
    80005da0:	994080e7          	jalr	-1644(ra) # 80002730 <_ZN6ThreadnwEm>
    80005da4:	00050c93          	mv	s9,a0
    80005da8:	00149c13          	slli	s8,s1,0x1
    80005dac:	009c0c33          	add	s8,s8,s1
    80005db0:	003c1c13          	slli	s8,s8,0x3
    80005db4:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005db8:	ffffc097          	auipc	ra,0xffffc
    80005dbc:	624080e7          	jalr	1572(ra) # 800023dc <_ZN6ThreadC1Ev>
    80005dc0:	00007797          	auipc	a5,0x7
    80005dc4:	ee078793          	addi	a5,a5,-288 # 8000cca0 <_ZTV16ProducerKeyboard+0x10>
    80005dc8:	00fcb023          	sd	a5,0(s9)
    80005dcc:	0b8cb023          	sd	s8,160(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005dd0:	00349793          	slli	a5,s1,0x3
    80005dd4:	00f987b3          	add	a5,s3,a5
    80005dd8:	0197b023          	sd	s9,0(a5)
    80005ddc:	f4dff06f          	j	80005d28 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005de0:	ffffd097          	auipc	ra,0xffffd
    80005de4:	ae0080e7          	jalr	-1312(ra) # 800028c0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005de8:	00000493          	li	s1,0
    80005dec:	00994e63          	blt	s2,s1,80005e08 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005df0:	00007517          	auipc	a0,0x7
    80005df4:	4e053503          	ld	a0,1248(a0) # 8000d2d0 <_ZL10waitForAll>
    80005df8:	ffffc097          	auipc	ra,0xffffc
    80005dfc:	ff8080e7          	jalr	-8(ra) # 80001df0 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005e00:	0014849b          	addiw	s1,s1,1
    80005e04:	fe9ff06f          	j	80005dec <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005e08:	00000493          	li	s1,0
    80005e0c:	0080006f          	j	80005e14 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005e10:	0014849b          	addiw	s1,s1,1
    80005e14:	0324d263          	bge	s1,s2,80005e38 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005e18:	00349793          	slli	a5,s1,0x3
    80005e1c:	00f987b3          	add	a5,s3,a5
    80005e20:	0007b503          	ld	a0,0(a5)
    80005e24:	fe0506e3          	beqz	a0,80005e10 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005e28:	00053783          	ld	a5,0(a0)
    80005e2c:	0087b783          	ld	a5,8(a5)
    80005e30:	000780e7          	jalr	a5
    80005e34:	fddff06f          	j	80005e10 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005e38:	000b0a63          	beqz	s6,80005e4c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005e3c:	000b3783          	ld	a5,0(s6)
    80005e40:	0087b783          	ld	a5,8(a5)
    80005e44:	000b0513          	mv	a0,s6
    80005e48:	000780e7          	jalr	a5
    delete waitForAll;
    80005e4c:	00007517          	auipc	a0,0x7
    80005e50:	48453503          	ld	a0,1156(a0) # 8000d2d0 <_ZL10waitForAll>
    80005e54:	00050863          	beqz	a0,80005e64 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005e58:	00053783          	ld	a5,0(a0)
    80005e5c:	0087b783          	ld	a5,8(a5)
    80005e60:	000780e7          	jalr	a5
    delete buffer;
    80005e64:	000a8e63          	beqz	s5,80005e80 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005e68:	000a8513          	mv	a0,s5
    80005e6c:	00001097          	auipc	ra,0x1
    80005e70:	8a8080e7          	jalr	-1880(ra) # 80006714 <_ZN9BufferCPPD1Ev>
    80005e74:	000a8513          	mv	a0,s5
    80005e78:	ffffd097          	auipc	ra,0xffffd
    80005e7c:	530080e7          	jalr	1328(ra) # 800033a8 <_ZdlPv>
    80005e80:	000b8113          	mv	sp,s7

}
    80005e84:	f8040113          	addi	sp,s0,-128
    80005e88:	07813083          	ld	ra,120(sp)
    80005e8c:	07013403          	ld	s0,112(sp)
    80005e90:	06813483          	ld	s1,104(sp)
    80005e94:	06013903          	ld	s2,96(sp)
    80005e98:	05813983          	ld	s3,88(sp)
    80005e9c:	05013a03          	ld	s4,80(sp)
    80005ea0:	04813a83          	ld	s5,72(sp)
    80005ea4:	04013b03          	ld	s6,64(sp)
    80005ea8:	03813b83          	ld	s7,56(sp)
    80005eac:	03013c03          	ld	s8,48(sp)
    80005eb0:	02813c83          	ld	s9,40(sp)
    80005eb4:	08010113          	addi	sp,sp,128
    80005eb8:	00008067          	ret
    80005ebc:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005ec0:	000a8513          	mv	a0,s5
    80005ec4:	ffffd097          	auipc	ra,0xffffd
    80005ec8:	4e4080e7          	jalr	1252(ra) # 800033a8 <_ZdlPv>
    80005ecc:	00048513          	mv	a0,s1
    80005ed0:	00008097          	auipc	ra,0x8
    80005ed4:	4e8080e7          	jalr	1256(ra) # 8000e3b8 <_Unwind_Resume>
    80005ed8:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005edc:	00048513          	mv	a0,s1
    80005ee0:	ffffc097          	auipc	ra,0xffffc
    80005ee4:	bcc080e7          	jalr	-1076(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80005ee8:	00090513          	mv	a0,s2
    80005eec:	00008097          	auipc	ra,0x8
    80005ef0:	4cc080e7          	jalr	1228(ra) # 8000e3b8 <_Unwind_Resume>
    80005ef4:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005ef8:	000b0513          	mv	a0,s6
    80005efc:	ffffd097          	auipc	ra,0xffffd
    80005f00:	954080e7          	jalr	-1708(ra) # 80002850 <_ZN6ThreaddlEPv>
    80005f04:	00048513          	mv	a0,s1
    80005f08:	00008097          	auipc	ra,0x8
    80005f0c:	4b0080e7          	jalr	1200(ra) # 8000e3b8 <_Unwind_Resume>
    80005f10:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005f14:	000c8513          	mv	a0,s9
    80005f18:	ffffd097          	auipc	ra,0xffffd
    80005f1c:	938080e7          	jalr	-1736(ra) # 80002850 <_ZN6ThreaddlEPv>
    80005f20:	00048513          	mv	a0,s1
    80005f24:	00008097          	auipc	ra,0x8
    80005f28:	494080e7          	jalr	1172(ra) # 8000e3b8 <_Unwind_Resume>
    80005f2c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005f30:	000c8513          	mv	a0,s9
    80005f34:	ffffd097          	auipc	ra,0xffffd
    80005f38:	91c080e7          	jalr	-1764(ra) # 80002850 <_ZN6ThreaddlEPv>
    80005f3c:	00048513          	mv	a0,s1
    80005f40:	00008097          	auipc	ra,0x8
    80005f44:	478080e7          	jalr	1144(ra) # 8000e3b8 <_Unwind_Resume>

0000000080005f48 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005f48:	ff010113          	addi	sp,sp,-16
    80005f4c:	00113423          	sd	ra,8(sp)
    80005f50:	00813023          	sd	s0,0(sp)
    80005f54:	01010413          	addi	s0,sp,16
    80005f58:	00007797          	auipc	a5,0x7
    80005f5c:	d9878793          	addi	a5,a5,-616 # 8000ccf0 <_ZTV12ConsumerSync+0x10>
    80005f60:	00f53023          	sd	a5,0(a0)
    80005f64:	ffffc097          	auipc	ra,0xffffc
    80005f68:	1e4080e7          	jalr	484(ra) # 80002148 <_ZN6ThreadD1Ev>
    80005f6c:	00813083          	ld	ra,8(sp)
    80005f70:	00013403          	ld	s0,0(sp)
    80005f74:	01010113          	addi	sp,sp,16
    80005f78:	00008067          	ret

0000000080005f7c <_ZN12ConsumerSyncD0Ev>:
    80005f7c:	fe010113          	addi	sp,sp,-32
    80005f80:	00113c23          	sd	ra,24(sp)
    80005f84:	00813823          	sd	s0,16(sp)
    80005f88:	00913423          	sd	s1,8(sp)
    80005f8c:	02010413          	addi	s0,sp,32
    80005f90:	00050493          	mv	s1,a0
    80005f94:	00007797          	auipc	a5,0x7
    80005f98:	d5c78793          	addi	a5,a5,-676 # 8000ccf0 <_ZTV12ConsumerSync+0x10>
    80005f9c:	00f53023          	sd	a5,0(a0)
    80005fa0:	ffffc097          	auipc	ra,0xffffc
    80005fa4:	1a8080e7          	jalr	424(ra) # 80002148 <_ZN6ThreadD1Ev>
    80005fa8:	00048513          	mv	a0,s1
    80005fac:	ffffd097          	auipc	ra,0xffffd
    80005fb0:	8a4080e7          	jalr	-1884(ra) # 80002850 <_ZN6ThreaddlEPv>
    80005fb4:	01813083          	ld	ra,24(sp)
    80005fb8:	01013403          	ld	s0,16(sp)
    80005fbc:	00813483          	ld	s1,8(sp)
    80005fc0:	02010113          	addi	sp,sp,32
    80005fc4:	00008067          	ret

0000000080005fc8 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005fc8:	ff010113          	addi	sp,sp,-16
    80005fcc:	00113423          	sd	ra,8(sp)
    80005fd0:	00813023          	sd	s0,0(sp)
    80005fd4:	01010413          	addi	s0,sp,16
    80005fd8:	00007797          	auipc	a5,0x7
    80005fdc:	cf078793          	addi	a5,a5,-784 # 8000ccc8 <_ZTV12ProducerSync+0x10>
    80005fe0:	00f53023          	sd	a5,0(a0)
    80005fe4:	ffffc097          	auipc	ra,0xffffc
    80005fe8:	164080e7          	jalr	356(ra) # 80002148 <_ZN6ThreadD1Ev>
    80005fec:	00813083          	ld	ra,8(sp)
    80005ff0:	00013403          	ld	s0,0(sp)
    80005ff4:	01010113          	addi	sp,sp,16
    80005ff8:	00008067          	ret

0000000080005ffc <_ZN12ProducerSyncD0Ev>:
    80005ffc:	fe010113          	addi	sp,sp,-32
    80006000:	00113c23          	sd	ra,24(sp)
    80006004:	00813823          	sd	s0,16(sp)
    80006008:	00913423          	sd	s1,8(sp)
    8000600c:	02010413          	addi	s0,sp,32
    80006010:	00050493          	mv	s1,a0
    80006014:	00007797          	auipc	a5,0x7
    80006018:	cb478793          	addi	a5,a5,-844 # 8000ccc8 <_ZTV12ProducerSync+0x10>
    8000601c:	00f53023          	sd	a5,0(a0)
    80006020:	ffffc097          	auipc	ra,0xffffc
    80006024:	128080e7          	jalr	296(ra) # 80002148 <_ZN6ThreadD1Ev>
    80006028:	00048513          	mv	a0,s1
    8000602c:	ffffd097          	auipc	ra,0xffffd
    80006030:	824080e7          	jalr	-2012(ra) # 80002850 <_ZN6ThreaddlEPv>
    80006034:	01813083          	ld	ra,24(sp)
    80006038:	01013403          	ld	s0,16(sp)
    8000603c:	00813483          	ld	s1,8(sp)
    80006040:	02010113          	addi	sp,sp,32
    80006044:	00008067          	ret

0000000080006048 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80006048:	ff010113          	addi	sp,sp,-16
    8000604c:	00113423          	sd	ra,8(sp)
    80006050:	00813023          	sd	s0,0(sp)
    80006054:	01010413          	addi	s0,sp,16
    80006058:	00007797          	auipc	a5,0x7
    8000605c:	c4878793          	addi	a5,a5,-952 # 8000cca0 <_ZTV16ProducerKeyboard+0x10>
    80006060:	00f53023          	sd	a5,0(a0)
    80006064:	ffffc097          	auipc	ra,0xffffc
    80006068:	0e4080e7          	jalr	228(ra) # 80002148 <_ZN6ThreadD1Ev>
    8000606c:	00813083          	ld	ra,8(sp)
    80006070:	00013403          	ld	s0,0(sp)
    80006074:	01010113          	addi	sp,sp,16
    80006078:	00008067          	ret

000000008000607c <_ZN16ProducerKeyboardD0Ev>:
    8000607c:	fe010113          	addi	sp,sp,-32
    80006080:	00113c23          	sd	ra,24(sp)
    80006084:	00813823          	sd	s0,16(sp)
    80006088:	00913423          	sd	s1,8(sp)
    8000608c:	02010413          	addi	s0,sp,32
    80006090:	00050493          	mv	s1,a0
    80006094:	00007797          	auipc	a5,0x7
    80006098:	c0c78793          	addi	a5,a5,-1012 # 8000cca0 <_ZTV16ProducerKeyboard+0x10>
    8000609c:	00f53023          	sd	a5,0(a0)
    800060a0:	ffffc097          	auipc	ra,0xffffc
    800060a4:	0a8080e7          	jalr	168(ra) # 80002148 <_ZN6ThreadD1Ev>
    800060a8:	00048513          	mv	a0,s1
    800060ac:	ffffc097          	auipc	ra,0xffffc
    800060b0:	7a4080e7          	jalr	1956(ra) # 80002850 <_ZN6ThreaddlEPv>
    800060b4:	01813083          	ld	ra,24(sp)
    800060b8:	01013403          	ld	s0,16(sp)
    800060bc:	00813483          	ld	s1,8(sp)
    800060c0:	02010113          	addi	sp,sp,32
    800060c4:	00008067          	ret

00000000800060c8 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800060c8:	ff010113          	addi	sp,sp,-16
    800060cc:	00113423          	sd	ra,8(sp)
    800060d0:	00813023          	sd	s0,0(sp)
    800060d4:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    800060d8:	0a053583          	ld	a1,160(a0)
    800060dc:	fffff097          	auipc	ra,0xfffff
    800060e0:	7e4080e7          	jalr	2020(ra) # 800058c0 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    800060e4:	00813083          	ld	ra,8(sp)
    800060e8:	00013403          	ld	s0,0(sp)
    800060ec:	01010113          	addi	sp,sp,16
    800060f0:	00008067          	ret

00000000800060f4 <_ZN12ProducerSync3runEv>:
    void run() override {
    800060f4:	ff010113          	addi	sp,sp,-16
    800060f8:	00113423          	sd	ra,8(sp)
    800060fc:	00813023          	sd	s0,0(sp)
    80006100:	01010413          	addi	s0,sp,16
        producer(td);
    80006104:	0a053583          	ld	a1,160(a0)
    80006108:	00000097          	auipc	ra,0x0
    8000610c:	878080e7          	jalr	-1928(ra) # 80005980 <_ZN12ProducerSync8producerEPv>
    }
    80006110:	00813083          	ld	ra,8(sp)
    80006114:	00013403          	ld	s0,0(sp)
    80006118:	01010113          	addi	sp,sp,16
    8000611c:	00008067          	ret

0000000080006120 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80006120:	ff010113          	addi	sp,sp,-16
    80006124:	00113423          	sd	ra,8(sp)
    80006128:	00813023          	sd	s0,0(sp)
    8000612c:	01010413          	addi	s0,sp,16
        consumer(td);
    80006130:	0a053583          	ld	a1,160(a0)
    80006134:	00000097          	auipc	ra,0x0
    80006138:	8e0080e7          	jalr	-1824(ra) # 80005a14 <_ZN12ConsumerSync8consumerEPv>
    }
    8000613c:	00813083          	ld	ra,8(sp)
    80006140:	00013403          	ld	s0,0(sp)
    80006144:	01010113          	addi	sp,sp,16
    80006148:	00008067          	ret

000000008000614c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000614c:	fe010113          	addi	sp,sp,-32
    80006150:	00113c23          	sd	ra,24(sp)
    80006154:	00813823          	sd	s0,16(sp)
    80006158:	00913423          	sd	s1,8(sp)
    8000615c:	02010413          	addi	s0,sp,32
    80006160:	00050493          	mv	s1,a0
    LOCK();
    80006164:	00100613          	li	a2,1
    80006168:	00000593          	li	a1,0
    8000616c:	00007517          	auipc	a0,0x7
    80006170:	16c50513          	addi	a0,a0,364 # 8000d2d8 <lockPrint>
    80006174:	ffffb097          	auipc	ra,0xffffb
    80006178:	164080e7          	jalr	356(ra) # 800012d8 <copy_and_swap>
    8000617c:	00050863          	beqz	a0,8000618c <_Z11printStringPKc+0x40>
    80006180:	ffffb097          	auipc	ra,0xffffb
    80006184:	4cc080e7          	jalr	1228(ra) # 8000164c <thread_dispatch>
    80006188:	fddff06f          	j	80006164 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000618c:	0004c503          	lbu	a0,0(s1)
    80006190:	00050a63          	beqz	a0,800061a4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80006194:	ffffb097          	auipc	ra,0xffffb
    80006198:	680080e7          	jalr	1664(ra) # 80001814 <putc>
        string++;
    8000619c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800061a0:	fedff06f          	j	8000618c <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800061a4:	00000613          	li	a2,0
    800061a8:	00100593          	li	a1,1
    800061ac:	00007517          	auipc	a0,0x7
    800061b0:	12c50513          	addi	a0,a0,300 # 8000d2d8 <lockPrint>
    800061b4:	ffffb097          	auipc	ra,0xffffb
    800061b8:	124080e7          	jalr	292(ra) # 800012d8 <copy_and_swap>
    800061bc:	fe0514e3          	bnez	a0,800061a4 <_Z11printStringPKc+0x58>
}
    800061c0:	01813083          	ld	ra,24(sp)
    800061c4:	01013403          	ld	s0,16(sp)
    800061c8:	00813483          	ld	s1,8(sp)
    800061cc:	02010113          	addi	sp,sp,32
    800061d0:	00008067          	ret

00000000800061d4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800061d4:	fd010113          	addi	sp,sp,-48
    800061d8:	02113423          	sd	ra,40(sp)
    800061dc:	02813023          	sd	s0,32(sp)
    800061e0:	00913c23          	sd	s1,24(sp)
    800061e4:	01213823          	sd	s2,16(sp)
    800061e8:	01313423          	sd	s3,8(sp)
    800061ec:	01413023          	sd	s4,0(sp)
    800061f0:	03010413          	addi	s0,sp,48
    800061f4:	00050993          	mv	s3,a0
    800061f8:	00058a13          	mv	s4,a1
    LOCK();
    800061fc:	00100613          	li	a2,1
    80006200:	00000593          	li	a1,0
    80006204:	00007517          	auipc	a0,0x7
    80006208:	0d450513          	addi	a0,a0,212 # 8000d2d8 <lockPrint>
    8000620c:	ffffb097          	auipc	ra,0xffffb
    80006210:	0cc080e7          	jalr	204(ra) # 800012d8 <copy_and_swap>
    80006214:	00050863          	beqz	a0,80006224 <_Z9getStringPci+0x50>
    80006218:	ffffb097          	auipc	ra,0xffffb
    8000621c:	434080e7          	jalr	1076(ra) # 8000164c <thread_dispatch>
    80006220:	fddff06f          	j	800061fc <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80006224:	00000913          	li	s2,0
    80006228:	00090493          	mv	s1,s2
    8000622c:	0019091b          	addiw	s2,s2,1
    80006230:	03495a63          	bge	s2,s4,80006264 <_Z9getStringPci+0x90>
        cc = getc();
    80006234:	ffffb097          	auipc	ra,0xffffb
    80006238:	5b0080e7          	jalr	1456(ra) # 800017e4 <getc>
        if(cc < 1)
    8000623c:	02050463          	beqz	a0,80006264 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80006240:	009984b3          	add	s1,s3,s1
    80006244:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80006248:	00a00793          	li	a5,10
    8000624c:	00f50a63          	beq	a0,a5,80006260 <_Z9getStringPci+0x8c>
    80006250:	00d00793          	li	a5,13
    80006254:	fcf51ae3          	bne	a0,a5,80006228 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80006258:	00090493          	mv	s1,s2
    8000625c:	0080006f          	j	80006264 <_Z9getStringPci+0x90>
    80006260:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80006264:	009984b3          	add	s1,s3,s1
    80006268:	00048023          	sb	zero,0(s1)

    UNLOCK();
    8000626c:	00000613          	li	a2,0
    80006270:	00100593          	li	a1,1
    80006274:	00007517          	auipc	a0,0x7
    80006278:	06450513          	addi	a0,a0,100 # 8000d2d8 <lockPrint>
    8000627c:	ffffb097          	auipc	ra,0xffffb
    80006280:	05c080e7          	jalr	92(ra) # 800012d8 <copy_and_swap>
    80006284:	fe0514e3          	bnez	a0,8000626c <_Z9getStringPci+0x98>
    return buf;
}
    80006288:	00098513          	mv	a0,s3
    8000628c:	02813083          	ld	ra,40(sp)
    80006290:	02013403          	ld	s0,32(sp)
    80006294:	01813483          	ld	s1,24(sp)
    80006298:	01013903          	ld	s2,16(sp)
    8000629c:	00813983          	ld	s3,8(sp)
    800062a0:	00013a03          	ld	s4,0(sp)
    800062a4:	03010113          	addi	sp,sp,48
    800062a8:	00008067          	ret

00000000800062ac <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800062ac:	ff010113          	addi	sp,sp,-16
    800062b0:	00813423          	sd	s0,8(sp)
    800062b4:	01010413          	addi	s0,sp,16
    800062b8:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800062bc:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800062c0:	0006c603          	lbu	a2,0(a3)
    800062c4:	fd06071b          	addiw	a4,a2,-48
    800062c8:	0ff77713          	andi	a4,a4,255
    800062cc:	00900793          	li	a5,9
    800062d0:	02e7e063          	bltu	a5,a4,800062f0 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800062d4:	0025179b          	slliw	a5,a0,0x2
    800062d8:	00a787bb          	addw	a5,a5,a0
    800062dc:	0017979b          	slliw	a5,a5,0x1
    800062e0:	00168693          	addi	a3,a3,1
    800062e4:	00c787bb          	addw	a5,a5,a2
    800062e8:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800062ec:	fd5ff06f          	j	800062c0 <_Z11stringToIntPKc+0x14>
    return n;
}
    800062f0:	00813403          	ld	s0,8(sp)
    800062f4:	01010113          	addi	sp,sp,16
    800062f8:	00008067          	ret

00000000800062fc <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800062fc:	fc010113          	addi	sp,sp,-64
    80006300:	02113c23          	sd	ra,56(sp)
    80006304:	02813823          	sd	s0,48(sp)
    80006308:	02913423          	sd	s1,40(sp)
    8000630c:	03213023          	sd	s2,32(sp)
    80006310:	01313c23          	sd	s3,24(sp)
    80006314:	04010413          	addi	s0,sp,64
    80006318:	00050493          	mv	s1,a0
    8000631c:	00058913          	mv	s2,a1
    80006320:	00060993          	mv	s3,a2
    LOCK();
    80006324:	00100613          	li	a2,1
    80006328:	00000593          	li	a1,0
    8000632c:	00007517          	auipc	a0,0x7
    80006330:	fac50513          	addi	a0,a0,-84 # 8000d2d8 <lockPrint>
    80006334:	ffffb097          	auipc	ra,0xffffb
    80006338:	fa4080e7          	jalr	-92(ra) # 800012d8 <copy_and_swap>
    8000633c:	00050863          	beqz	a0,8000634c <_Z8printIntiii+0x50>
    80006340:	ffffb097          	auipc	ra,0xffffb
    80006344:	30c080e7          	jalr	780(ra) # 8000164c <thread_dispatch>
    80006348:	fddff06f          	j	80006324 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000634c:	00098463          	beqz	s3,80006354 <_Z8printIntiii+0x58>
    80006350:	0804c463          	bltz	s1,800063d8 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80006354:	0004851b          	sext.w	a0,s1
    neg = 0;
    80006358:	00000593          	li	a1,0
    }

    i = 0;
    8000635c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80006360:	0009079b          	sext.w	a5,s2
    80006364:	0325773b          	remuw	a4,a0,s2
    80006368:	00048613          	mv	a2,s1
    8000636c:	0014849b          	addiw	s1,s1,1
    80006370:	02071693          	slli	a3,a4,0x20
    80006374:	0206d693          	srli	a3,a3,0x20
    80006378:	00007717          	auipc	a4,0x7
    8000637c:	99070713          	addi	a4,a4,-1648 # 8000cd08 <digits>
    80006380:	00d70733          	add	a4,a4,a3
    80006384:	00074683          	lbu	a3,0(a4)
    80006388:	fd040713          	addi	a4,s0,-48
    8000638c:	00c70733          	add	a4,a4,a2
    80006390:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80006394:	0005071b          	sext.w	a4,a0
    80006398:	0325553b          	divuw	a0,a0,s2
    8000639c:	fcf772e3          	bgeu	a4,a5,80006360 <_Z8printIntiii+0x64>
    if(neg)
    800063a0:	00058c63          	beqz	a1,800063b8 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800063a4:	fd040793          	addi	a5,s0,-48
    800063a8:	009784b3          	add	s1,a5,s1
    800063ac:	02d00793          	li	a5,45
    800063b0:	fef48823          	sb	a5,-16(s1)
    800063b4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800063b8:	fff4849b          	addiw	s1,s1,-1
    800063bc:	0204c463          	bltz	s1,800063e4 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    800063c0:	fd040793          	addi	a5,s0,-48
    800063c4:	009787b3          	add	a5,a5,s1
    800063c8:	ff07c503          	lbu	a0,-16(a5)
    800063cc:	ffffb097          	auipc	ra,0xffffb
    800063d0:	448080e7          	jalr	1096(ra) # 80001814 <putc>
    800063d4:	fe5ff06f          	j	800063b8 <_Z8printIntiii+0xbc>
        x = -xx;
    800063d8:	4090053b          	negw	a0,s1
        neg = 1;
    800063dc:	00100593          	li	a1,1
        x = -xx;
    800063e0:	f7dff06f          	j	8000635c <_Z8printIntiii+0x60>

    UNLOCK();
    800063e4:	00000613          	li	a2,0
    800063e8:	00100593          	li	a1,1
    800063ec:	00007517          	auipc	a0,0x7
    800063f0:	eec50513          	addi	a0,a0,-276 # 8000d2d8 <lockPrint>
    800063f4:	ffffb097          	auipc	ra,0xffffb
    800063f8:	ee4080e7          	jalr	-284(ra) # 800012d8 <copy_and_swap>
    800063fc:	fe0514e3          	bnez	a0,800063e4 <_Z8printIntiii+0xe8>
    80006400:	03813083          	ld	ra,56(sp)
    80006404:	03013403          	ld	s0,48(sp)
    80006408:	02813483          	ld	s1,40(sp)
    8000640c:	02013903          	ld	s2,32(sp)
    80006410:	01813983          	ld	s3,24(sp)
    80006414:	04010113          	addi	sp,sp,64
    80006418:	00008067          	ret

000000008000641c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000641c:	fd010113          	addi	sp,sp,-48
    80006420:	02113423          	sd	ra,40(sp)
    80006424:	02813023          	sd	s0,32(sp)
    80006428:	00913c23          	sd	s1,24(sp)
    8000642c:	01213823          	sd	s2,16(sp)
    80006430:	01313423          	sd	s3,8(sp)
    80006434:	03010413          	addi	s0,sp,48
    80006438:	00050493          	mv	s1,a0
    8000643c:	00058913          	mv	s2,a1
    80006440:	0015879b          	addiw	a5,a1,1
    80006444:	0007851b          	sext.w	a0,a5
    80006448:	00f4a023          	sw	a5,0(s1)
    8000644c:	0004a823          	sw	zero,16(s1)
    80006450:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006454:	00251513          	slli	a0,a0,0x2
    80006458:	ffffb097          	auipc	ra,0xffffb
    8000645c:	0a8080e7          	jalr	168(ra) # 80001500 <mem_alloc>
    80006460:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80006464:	02000513          	li	a0,32
    80006468:	ffffb097          	auipc	ra,0xffffb
    8000646c:	60c080e7          	jalr	1548(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80006470:	00050993          	mv	s3,a0
    80006474:	00000593          	li	a1,0
    80006478:	ffffb097          	auipc	ra,0xffffb
    8000647c:	590080e7          	jalr	1424(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    80006480:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006484:	02000513          	li	a0,32
    80006488:	ffffb097          	auipc	ra,0xffffb
    8000648c:	5ec080e7          	jalr	1516(ra) # 80001a74 <_ZN9SemaphorenwEm>
    80006490:	00050993          	mv	s3,a0
    80006494:	00090593          	mv	a1,s2
    80006498:	ffffb097          	auipc	ra,0xffffb
    8000649c:	570080e7          	jalr	1392(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    800064a0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800064a4:	02000513          	li	a0,32
    800064a8:	ffffb097          	auipc	ra,0xffffb
    800064ac:	5cc080e7          	jalr	1484(ra) # 80001a74 <_ZN9SemaphorenwEm>
    800064b0:	00050913          	mv	s2,a0
    800064b4:	00100593          	li	a1,1
    800064b8:	ffffb097          	auipc	ra,0xffffb
    800064bc:	550080e7          	jalr	1360(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    800064c0:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800064c4:	02000513          	li	a0,32
    800064c8:	ffffb097          	auipc	ra,0xffffb
    800064cc:	5ac080e7          	jalr	1452(ra) # 80001a74 <_ZN9SemaphorenwEm>
    800064d0:	00050913          	mv	s2,a0
    800064d4:	00100593          	li	a1,1
    800064d8:	ffffb097          	auipc	ra,0xffffb
    800064dc:	530080e7          	jalr	1328(ra) # 80001a08 <_ZN9SemaphoreC1Ej>
    800064e0:	0324b823          	sd	s2,48(s1)
}
    800064e4:	02813083          	ld	ra,40(sp)
    800064e8:	02013403          	ld	s0,32(sp)
    800064ec:	01813483          	ld	s1,24(sp)
    800064f0:	01013903          	ld	s2,16(sp)
    800064f4:	00813983          	ld	s3,8(sp)
    800064f8:	03010113          	addi	sp,sp,48
    800064fc:	00008067          	ret
    80006500:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006504:	00098513          	mv	a0,s3
    80006508:	ffffb097          	auipc	ra,0xffffb
    8000650c:	5a4080e7          	jalr	1444(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80006510:	00048513          	mv	a0,s1
    80006514:	00008097          	auipc	ra,0x8
    80006518:	ea4080e7          	jalr	-348(ra) # 8000e3b8 <_Unwind_Resume>
    8000651c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80006520:	00098513          	mv	a0,s3
    80006524:	ffffb097          	auipc	ra,0xffffb
    80006528:	588080e7          	jalr	1416(ra) # 80001aac <_ZN9SemaphoredlEPv>
    8000652c:	00048513          	mv	a0,s1
    80006530:	00008097          	auipc	ra,0x8
    80006534:	e88080e7          	jalr	-376(ra) # 8000e3b8 <_Unwind_Resume>
    80006538:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000653c:	00090513          	mv	a0,s2
    80006540:	ffffb097          	auipc	ra,0xffffb
    80006544:	56c080e7          	jalr	1388(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80006548:	00048513          	mv	a0,s1
    8000654c:	00008097          	auipc	ra,0x8
    80006550:	e6c080e7          	jalr	-404(ra) # 8000e3b8 <_Unwind_Resume>
    80006554:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80006558:	00090513          	mv	a0,s2
    8000655c:	ffffb097          	auipc	ra,0xffffb
    80006560:	550080e7          	jalr	1360(ra) # 80001aac <_ZN9SemaphoredlEPv>
    80006564:	00048513          	mv	a0,s1
    80006568:	00008097          	auipc	ra,0x8
    8000656c:	e50080e7          	jalr	-432(ra) # 8000e3b8 <_Unwind_Resume>

0000000080006570 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80006570:	fe010113          	addi	sp,sp,-32
    80006574:	00113c23          	sd	ra,24(sp)
    80006578:	00813823          	sd	s0,16(sp)
    8000657c:	00913423          	sd	s1,8(sp)
    80006580:	01213023          	sd	s2,0(sp)
    80006584:	02010413          	addi	s0,sp,32
    80006588:	00050493          	mv	s1,a0
    8000658c:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80006590:	01853503          	ld	a0,24(a0)
    80006594:	ffffc097          	auipc	ra,0xffffc
    80006598:	85c080e7          	jalr	-1956(ra) # 80001df0 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    8000659c:	0304b503          	ld	a0,48(s1)
    800065a0:	ffffc097          	auipc	ra,0xffffc
    800065a4:	850080e7          	jalr	-1968(ra) # 80001df0 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800065a8:	0084b783          	ld	a5,8(s1)
    800065ac:	0144a703          	lw	a4,20(s1)
    800065b0:	00271713          	slli	a4,a4,0x2
    800065b4:	00e787b3          	add	a5,a5,a4
    800065b8:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800065bc:	0144a783          	lw	a5,20(s1)
    800065c0:	0017879b          	addiw	a5,a5,1
    800065c4:	0004a703          	lw	a4,0(s1)
    800065c8:	02e7e7bb          	remw	a5,a5,a4
    800065cc:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800065d0:	0304b503          	ld	a0,48(s1)
    800065d4:	ffffc097          	auipc	ra,0xffffc
    800065d8:	8f4080e7          	jalr	-1804(ra) # 80001ec8 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800065dc:	0204b503          	ld	a0,32(s1)
    800065e0:	ffffc097          	auipc	ra,0xffffc
    800065e4:	8e8080e7          	jalr	-1816(ra) # 80001ec8 <_ZN9Semaphore6signalEv>

}
    800065e8:	01813083          	ld	ra,24(sp)
    800065ec:	01013403          	ld	s0,16(sp)
    800065f0:	00813483          	ld	s1,8(sp)
    800065f4:	00013903          	ld	s2,0(sp)
    800065f8:	02010113          	addi	sp,sp,32
    800065fc:	00008067          	ret

0000000080006600 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80006600:	fe010113          	addi	sp,sp,-32
    80006604:	00113c23          	sd	ra,24(sp)
    80006608:	00813823          	sd	s0,16(sp)
    8000660c:	00913423          	sd	s1,8(sp)
    80006610:	01213023          	sd	s2,0(sp)
    80006614:	02010413          	addi	s0,sp,32
    80006618:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000661c:	02053503          	ld	a0,32(a0)
    80006620:	ffffb097          	auipc	ra,0xffffb
    80006624:	7d0080e7          	jalr	2000(ra) # 80001df0 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80006628:	0284b503          	ld	a0,40(s1)
    8000662c:	ffffb097          	auipc	ra,0xffffb
    80006630:	7c4080e7          	jalr	1988(ra) # 80001df0 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80006634:	0084b703          	ld	a4,8(s1)
    80006638:	0104a783          	lw	a5,16(s1)
    8000663c:	00279693          	slli	a3,a5,0x2
    80006640:	00d70733          	add	a4,a4,a3
    80006644:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006648:	0017879b          	addiw	a5,a5,1
    8000664c:	0004a703          	lw	a4,0(s1)
    80006650:	02e7e7bb          	remw	a5,a5,a4
    80006654:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80006658:	0284b503          	ld	a0,40(s1)
    8000665c:	ffffc097          	auipc	ra,0xffffc
    80006660:	86c080e7          	jalr	-1940(ra) # 80001ec8 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006664:	0184b503          	ld	a0,24(s1)
    80006668:	ffffc097          	auipc	ra,0xffffc
    8000666c:	860080e7          	jalr	-1952(ra) # 80001ec8 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006670:	00090513          	mv	a0,s2
    80006674:	01813083          	ld	ra,24(sp)
    80006678:	01013403          	ld	s0,16(sp)
    8000667c:	00813483          	ld	s1,8(sp)
    80006680:	00013903          	ld	s2,0(sp)
    80006684:	02010113          	addi	sp,sp,32
    80006688:	00008067          	ret

000000008000668c <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    8000668c:	fe010113          	addi	sp,sp,-32
    80006690:	00113c23          	sd	ra,24(sp)
    80006694:	00813823          	sd	s0,16(sp)
    80006698:	00913423          	sd	s1,8(sp)
    8000669c:	01213023          	sd	s2,0(sp)
    800066a0:	02010413          	addi	s0,sp,32
    800066a4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800066a8:	02853503          	ld	a0,40(a0)
    800066ac:	ffffb097          	auipc	ra,0xffffb
    800066b0:	744080e7          	jalr	1860(ra) # 80001df0 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800066b4:	0304b503          	ld	a0,48(s1)
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	738080e7          	jalr	1848(ra) # 80001df0 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800066c0:	0144a783          	lw	a5,20(s1)
    800066c4:	0104a903          	lw	s2,16(s1)
    800066c8:	0327ce63          	blt	a5,s2,80006704 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800066cc:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800066d0:	0304b503          	ld	a0,48(s1)
    800066d4:	ffffb097          	auipc	ra,0xffffb
    800066d8:	7f4080e7          	jalr	2036(ra) # 80001ec8 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800066dc:	0284b503          	ld	a0,40(s1)
    800066e0:	ffffb097          	auipc	ra,0xffffb
    800066e4:	7e8080e7          	jalr	2024(ra) # 80001ec8 <_ZN9Semaphore6signalEv>

    return ret;
}
    800066e8:	00090513          	mv	a0,s2
    800066ec:	01813083          	ld	ra,24(sp)
    800066f0:	01013403          	ld	s0,16(sp)
    800066f4:	00813483          	ld	s1,8(sp)
    800066f8:	00013903          	ld	s2,0(sp)
    800066fc:	02010113          	addi	sp,sp,32
    80006700:	00008067          	ret
        ret = cap - head + tail;
    80006704:	0004a703          	lw	a4,0(s1)
    80006708:	4127093b          	subw	s2,a4,s2
    8000670c:	00f9093b          	addw	s2,s2,a5
    80006710:	fc1ff06f          	j	800066d0 <_ZN9BufferCPP6getCntEv+0x44>

0000000080006714 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80006714:	fe010113          	addi	sp,sp,-32
    80006718:	00113c23          	sd	ra,24(sp)
    8000671c:	00813823          	sd	s0,16(sp)
    80006720:	00913423          	sd	s1,8(sp)
    80006724:	02010413          	addi	s0,sp,32
    80006728:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000672c:	00a00513          	li	a0,10
    80006730:	ffffc097          	auipc	ra,0xffffc
    80006734:	7a0080e7          	jalr	1952(ra) # 80002ed0 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80006738:	00004517          	auipc	a0,0x4
    8000673c:	bd850513          	addi	a0,a0,-1064 # 8000a310 <CONSOLE_STATUS+0x300>
    80006740:	00000097          	auipc	ra,0x0
    80006744:	a0c080e7          	jalr	-1524(ra) # 8000614c <_Z11printStringPKc>
    while (getCnt()) {
    80006748:	00048513          	mv	a0,s1
    8000674c:	00000097          	auipc	ra,0x0
    80006750:	f40080e7          	jalr	-192(ra) # 8000668c <_ZN9BufferCPP6getCntEv>
    80006754:	02050c63          	beqz	a0,8000678c <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80006758:	0084b783          	ld	a5,8(s1)
    8000675c:	0104a703          	lw	a4,16(s1)
    80006760:	00271713          	slli	a4,a4,0x2
    80006764:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006768:	0007c503          	lbu	a0,0(a5)
    8000676c:	ffffc097          	auipc	ra,0xffffc
    80006770:	764080e7          	jalr	1892(ra) # 80002ed0 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006774:	0104a783          	lw	a5,16(s1)
    80006778:	0017879b          	addiw	a5,a5,1
    8000677c:	0004a703          	lw	a4,0(s1)
    80006780:	02e7e7bb          	remw	a5,a5,a4
    80006784:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006788:	fc1ff06f          	j	80006748 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    8000678c:	02100513          	li	a0,33
    80006790:	ffffc097          	auipc	ra,0xffffc
    80006794:	740080e7          	jalr	1856(ra) # 80002ed0 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006798:	00a00513          	li	a0,10
    8000679c:	ffffc097          	auipc	ra,0xffffc
    800067a0:	734080e7          	jalr	1844(ra) # 80002ed0 <_ZN7Console4putcEc>
    mem_free(buffer);
    800067a4:	0084b503          	ld	a0,8(s1)
    800067a8:	ffffb097          	auipc	ra,0xffffb
    800067ac:	da0080e7          	jalr	-608(ra) # 80001548 <mem_free>
    delete itemAvailable;
    800067b0:	0204b503          	ld	a0,32(s1)
    800067b4:	00050863          	beqz	a0,800067c4 <_ZN9BufferCPPD1Ev+0xb0>
    800067b8:	00053783          	ld	a5,0(a0)
    800067bc:	0087b783          	ld	a5,8(a5)
    800067c0:	000780e7          	jalr	a5
    delete spaceAvailable;
    800067c4:	0184b503          	ld	a0,24(s1)
    800067c8:	00050863          	beqz	a0,800067d8 <_ZN9BufferCPPD1Ev+0xc4>
    800067cc:	00053783          	ld	a5,0(a0)
    800067d0:	0087b783          	ld	a5,8(a5)
    800067d4:	000780e7          	jalr	a5
    delete mutexTail;
    800067d8:	0304b503          	ld	a0,48(s1)
    800067dc:	00050863          	beqz	a0,800067ec <_ZN9BufferCPPD1Ev+0xd8>
    800067e0:	00053783          	ld	a5,0(a0)
    800067e4:	0087b783          	ld	a5,8(a5)
    800067e8:	000780e7          	jalr	a5
    delete mutexHead;
    800067ec:	0284b503          	ld	a0,40(s1)
    800067f0:	00050863          	beqz	a0,80006800 <_ZN9BufferCPPD1Ev+0xec>
    800067f4:	00053783          	ld	a5,0(a0)
    800067f8:	0087b783          	ld	a5,8(a5)
    800067fc:	000780e7          	jalr	a5
}
    80006800:	01813083          	ld	ra,24(sp)
    80006804:	01013403          	ld	s0,16(sp)
    80006808:	00813483          	ld	s1,8(sp)
    8000680c:	02010113          	addi	sp,sp,32
    80006810:	00008067          	ret

0000000080006814 <userMain>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

extern "C" void userMain() {
    80006814:	ff010113          	addi	sp,sp,-16
    80006818:	00113423          	sd	ra,8(sp)
    8000681c:	00813023          	sd	s0,0(sp)
    80006820:	01010413          	addi	s0,sp,16
    printString("Unesite broj testa? [1-7]\n");
    80006824:	00004517          	auipc	a0,0x4
    80006828:	b0450513          	addi	a0,a0,-1276 # 8000a328 <CONSOLE_STATUS+0x318>
    8000682c:	00000097          	auipc	ra,0x0
    80006830:	920080e7          	jalr	-1760(ra) # 8000614c <_Z11printStringPKc>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
#endif
            break;
        case 3:
#if LEVEL_3_IMPLEMENTED == 1
            producerConsumer_C_API();
    80006834:	ffffd097          	auipc	ra,0xffffd
    80006838:	7cc080e7          	jalr	1996(ra) # 80004000 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000683c:	00004517          	auipc	a0,0x4
    80006840:	b0c50513          	addi	a0,a0,-1268 # 8000a348 <CONSOLE_STATUS+0x338>
    80006844:	00000097          	auipc	ra,0x0
    80006848:	908080e7          	jalr	-1784(ra) # 8000614c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    8000684c:	00813083          	ld	ra,8(sp)
    80006850:	00013403          	ld	s0,0(sp)
    80006854:	01010113          	addi	sp,sp,16
    80006858:	00008067          	ret

000000008000685c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000685c:	fe010113          	addi	sp,sp,-32
    80006860:	00113c23          	sd	ra,24(sp)
    80006864:	00813823          	sd	s0,16(sp)
    80006868:	00913423          	sd	s1,8(sp)
    8000686c:	01213023          	sd	s2,0(sp)
    80006870:	02010413          	addi	s0,sp,32
    80006874:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80006878:	00100793          	li	a5,1
    8000687c:	02a7f863          	bgeu	a5,a0,800068ac <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006880:	00a00793          	li	a5,10
    80006884:	02f577b3          	remu	a5,a0,a5
    80006888:	02078e63          	beqz	a5,800068c4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    8000688c:	fff48513          	addi	a0,s1,-1
    80006890:	00000097          	auipc	ra,0x0
    80006894:	fcc080e7          	jalr	-52(ra) # 8000685c <_ZL9fibonaccim>
    80006898:	00050913          	mv	s2,a0
    8000689c:	ffe48513          	addi	a0,s1,-2
    800068a0:	00000097          	auipc	ra,0x0
    800068a4:	fbc080e7          	jalr	-68(ra) # 8000685c <_ZL9fibonaccim>
    800068a8:	00a90533          	add	a0,s2,a0
}
    800068ac:	01813083          	ld	ra,24(sp)
    800068b0:	01013403          	ld	s0,16(sp)
    800068b4:	00813483          	ld	s1,8(sp)
    800068b8:	00013903          	ld	s2,0(sp)
    800068bc:	02010113          	addi	sp,sp,32
    800068c0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800068c4:	ffffb097          	auipc	ra,0xffffb
    800068c8:	d88080e7          	jalr	-632(ra) # 8000164c <thread_dispatch>
    800068cc:	fc1ff06f          	j	8000688c <_ZL9fibonaccim+0x30>

00000000800068d0 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800068d0:	fe010113          	addi	sp,sp,-32
    800068d4:	00113c23          	sd	ra,24(sp)
    800068d8:	00813823          	sd	s0,16(sp)
    800068dc:	00913423          	sd	s1,8(sp)
    800068e0:	01213023          	sd	s2,0(sp)
    800068e4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800068e8:	00a00493          	li	s1,10
    800068ec:	0400006f          	j	8000692c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800068f0:	00004517          	auipc	a0,0x4
    800068f4:	91850513          	addi	a0,a0,-1768 # 8000a208 <CONSOLE_STATUS+0x1f8>
    800068f8:	00000097          	auipc	ra,0x0
    800068fc:	854080e7          	jalr	-1964(ra) # 8000614c <_Z11printStringPKc>
    80006900:	00000613          	li	a2,0
    80006904:	00a00593          	li	a1,10
    80006908:	00048513          	mv	a0,s1
    8000690c:	00000097          	auipc	ra,0x0
    80006910:	9f0080e7          	jalr	-1552(ra) # 800062fc <_Z8printIntiii>
    80006914:	00004517          	auipc	a0,0x4
    80006918:	85450513          	addi	a0,a0,-1964 # 8000a168 <CONSOLE_STATUS+0x158>
    8000691c:	00000097          	auipc	ra,0x0
    80006920:	830080e7          	jalr	-2000(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006924:	0014849b          	addiw	s1,s1,1
    80006928:	0ff4f493          	andi	s1,s1,255
    8000692c:	00c00793          	li	a5,12
    80006930:	fc97f0e3          	bgeu	a5,s1,800068f0 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006934:	00004517          	auipc	a0,0x4
    80006938:	8dc50513          	addi	a0,a0,-1828 # 8000a210 <CONSOLE_STATUS+0x200>
    8000693c:	00000097          	auipc	ra,0x0
    80006940:	810080e7          	jalr	-2032(ra) # 8000614c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006944:	00500313          	li	t1,5
    thread_dispatch();
    80006948:	ffffb097          	auipc	ra,0xffffb
    8000694c:	d04080e7          	jalr	-764(ra) # 8000164c <thread_dispatch>

    uint64 result = fibonacci(16);
    80006950:	01000513          	li	a0,16
    80006954:	00000097          	auipc	ra,0x0
    80006958:	f08080e7          	jalr	-248(ra) # 8000685c <_ZL9fibonaccim>
    8000695c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006960:	00004517          	auipc	a0,0x4
    80006964:	8c050513          	addi	a0,a0,-1856 # 8000a220 <CONSOLE_STATUS+0x210>
    80006968:	fffff097          	auipc	ra,0xfffff
    8000696c:	7e4080e7          	jalr	2020(ra) # 8000614c <_Z11printStringPKc>
    80006970:	00000613          	li	a2,0
    80006974:	00a00593          	li	a1,10
    80006978:	0009051b          	sext.w	a0,s2
    8000697c:	00000097          	auipc	ra,0x0
    80006980:	980080e7          	jalr	-1664(ra) # 800062fc <_Z8printIntiii>
    80006984:	00003517          	auipc	a0,0x3
    80006988:	7e450513          	addi	a0,a0,2020 # 8000a168 <CONSOLE_STATUS+0x158>
    8000698c:	fffff097          	auipc	ra,0xfffff
    80006990:	7c0080e7          	jalr	1984(ra) # 8000614c <_Z11printStringPKc>
    80006994:	0400006f          	j	800069d4 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006998:	00004517          	auipc	a0,0x4
    8000699c:	87050513          	addi	a0,a0,-1936 # 8000a208 <CONSOLE_STATUS+0x1f8>
    800069a0:	fffff097          	auipc	ra,0xfffff
    800069a4:	7ac080e7          	jalr	1964(ra) # 8000614c <_Z11printStringPKc>
    800069a8:	00000613          	li	a2,0
    800069ac:	00a00593          	li	a1,10
    800069b0:	00048513          	mv	a0,s1
    800069b4:	00000097          	auipc	ra,0x0
    800069b8:	948080e7          	jalr	-1720(ra) # 800062fc <_Z8printIntiii>
    800069bc:	00003517          	auipc	a0,0x3
    800069c0:	7ac50513          	addi	a0,a0,1964 # 8000a168 <CONSOLE_STATUS+0x158>
    800069c4:	fffff097          	auipc	ra,0xfffff
    800069c8:	788080e7          	jalr	1928(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800069cc:	0014849b          	addiw	s1,s1,1
    800069d0:	0ff4f493          	andi	s1,s1,255
    800069d4:	00f00793          	li	a5,15
    800069d8:	fc97f0e3          	bgeu	a5,s1,80006998 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800069dc:	00004517          	auipc	a0,0x4
    800069e0:	85450513          	addi	a0,a0,-1964 # 8000a230 <CONSOLE_STATUS+0x220>
    800069e4:	fffff097          	auipc	ra,0xfffff
    800069e8:	768080e7          	jalr	1896(ra) # 8000614c <_Z11printStringPKc>
    finishedD = true;
    800069ec:	00100793          	li	a5,1
    800069f0:	00007717          	auipc	a4,0x7
    800069f4:	8ef70823          	sb	a5,-1808(a4) # 8000d2e0 <_ZL9finishedD>
    thread_dispatch();
    800069f8:	ffffb097          	auipc	ra,0xffffb
    800069fc:	c54080e7          	jalr	-940(ra) # 8000164c <thread_dispatch>
}
    80006a00:	01813083          	ld	ra,24(sp)
    80006a04:	01013403          	ld	s0,16(sp)
    80006a08:	00813483          	ld	s1,8(sp)
    80006a0c:	00013903          	ld	s2,0(sp)
    80006a10:	02010113          	addi	sp,sp,32
    80006a14:	00008067          	ret

0000000080006a18 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006a18:	fe010113          	addi	sp,sp,-32
    80006a1c:	00113c23          	sd	ra,24(sp)
    80006a20:	00813823          	sd	s0,16(sp)
    80006a24:	00913423          	sd	s1,8(sp)
    80006a28:	01213023          	sd	s2,0(sp)
    80006a2c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006a30:	00000493          	li	s1,0
    80006a34:	0400006f          	j	80006a74 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006a38:	00003517          	auipc	a0,0x3
    80006a3c:	7a050513          	addi	a0,a0,1952 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80006a40:	fffff097          	auipc	ra,0xfffff
    80006a44:	70c080e7          	jalr	1804(ra) # 8000614c <_Z11printStringPKc>
    80006a48:	00000613          	li	a2,0
    80006a4c:	00a00593          	li	a1,10
    80006a50:	00048513          	mv	a0,s1
    80006a54:	00000097          	auipc	ra,0x0
    80006a58:	8a8080e7          	jalr	-1880(ra) # 800062fc <_Z8printIntiii>
    80006a5c:	00003517          	auipc	a0,0x3
    80006a60:	70c50513          	addi	a0,a0,1804 # 8000a168 <CONSOLE_STATUS+0x158>
    80006a64:	fffff097          	auipc	ra,0xfffff
    80006a68:	6e8080e7          	jalr	1768(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006a6c:	0014849b          	addiw	s1,s1,1
    80006a70:	0ff4f493          	andi	s1,s1,255
    80006a74:	00200793          	li	a5,2
    80006a78:	fc97f0e3          	bgeu	a5,s1,80006a38 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006a7c:	00003517          	auipc	a0,0x3
    80006a80:	76450513          	addi	a0,a0,1892 # 8000a1e0 <CONSOLE_STATUS+0x1d0>
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	6c8080e7          	jalr	1736(ra) # 8000614c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006a8c:	00700313          	li	t1,7
    thread_dispatch();
    80006a90:	ffffb097          	auipc	ra,0xffffb
    80006a94:	bbc080e7          	jalr	-1092(ra) # 8000164c <thread_dispatch>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006a98:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006a9c:	00003517          	auipc	a0,0x3
    80006aa0:	75450513          	addi	a0,a0,1876 # 8000a1f0 <CONSOLE_STATUS+0x1e0>
    80006aa4:	fffff097          	auipc	ra,0xfffff
    80006aa8:	6a8080e7          	jalr	1704(ra) # 8000614c <_Z11printStringPKc>
    80006aac:	00000613          	li	a2,0
    80006ab0:	00a00593          	li	a1,10
    80006ab4:	0009051b          	sext.w	a0,s2
    80006ab8:	00000097          	auipc	ra,0x0
    80006abc:	844080e7          	jalr	-1980(ra) # 800062fc <_Z8printIntiii>
    80006ac0:	00003517          	auipc	a0,0x3
    80006ac4:	6a850513          	addi	a0,a0,1704 # 8000a168 <CONSOLE_STATUS+0x158>
    80006ac8:	fffff097          	auipc	ra,0xfffff
    80006acc:	684080e7          	jalr	1668(ra) # 8000614c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006ad0:	00c00513          	li	a0,12
    80006ad4:	00000097          	auipc	ra,0x0
    80006ad8:	d88080e7          	jalr	-632(ra) # 8000685c <_ZL9fibonaccim>
    80006adc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006ae0:	00003517          	auipc	a0,0x3
    80006ae4:	71850513          	addi	a0,a0,1816 # 8000a1f8 <CONSOLE_STATUS+0x1e8>
    80006ae8:	fffff097          	auipc	ra,0xfffff
    80006aec:	664080e7          	jalr	1636(ra) # 8000614c <_Z11printStringPKc>
    80006af0:	00000613          	li	a2,0
    80006af4:	00a00593          	li	a1,10
    80006af8:	0009051b          	sext.w	a0,s2
    80006afc:	00000097          	auipc	ra,0x0
    80006b00:	800080e7          	jalr	-2048(ra) # 800062fc <_Z8printIntiii>
    80006b04:	00003517          	auipc	a0,0x3
    80006b08:	66450513          	addi	a0,a0,1636 # 8000a168 <CONSOLE_STATUS+0x158>
    80006b0c:	fffff097          	auipc	ra,0xfffff
    80006b10:	640080e7          	jalr	1600(ra) # 8000614c <_Z11printStringPKc>
    80006b14:	0400006f          	j	80006b54 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006b18:	00003517          	auipc	a0,0x3
    80006b1c:	6c050513          	addi	a0,a0,1728 # 8000a1d8 <CONSOLE_STATUS+0x1c8>
    80006b20:	fffff097          	auipc	ra,0xfffff
    80006b24:	62c080e7          	jalr	1580(ra) # 8000614c <_Z11printStringPKc>
    80006b28:	00000613          	li	a2,0
    80006b2c:	00a00593          	li	a1,10
    80006b30:	00048513          	mv	a0,s1
    80006b34:	fffff097          	auipc	ra,0xfffff
    80006b38:	7c8080e7          	jalr	1992(ra) # 800062fc <_Z8printIntiii>
    80006b3c:	00003517          	auipc	a0,0x3
    80006b40:	62c50513          	addi	a0,a0,1580 # 8000a168 <CONSOLE_STATUS+0x158>
    80006b44:	fffff097          	auipc	ra,0xfffff
    80006b48:	608080e7          	jalr	1544(ra) # 8000614c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006b4c:	0014849b          	addiw	s1,s1,1
    80006b50:	0ff4f493          	andi	s1,s1,255
    80006b54:	00500793          	li	a5,5
    80006b58:	fc97f0e3          	bgeu	a5,s1,80006b18 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006b5c:	00003517          	auipc	a0,0x3
    80006b60:	65450513          	addi	a0,a0,1620 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80006b64:	fffff097          	auipc	ra,0xfffff
    80006b68:	5e8080e7          	jalr	1512(ra) # 8000614c <_Z11printStringPKc>
    finishedC = true;
    80006b6c:	00100793          	li	a5,1
    80006b70:	00006717          	auipc	a4,0x6
    80006b74:	76f708a3          	sb	a5,1905(a4) # 8000d2e1 <_ZL9finishedC>
    thread_dispatch();
    80006b78:	ffffb097          	auipc	ra,0xffffb
    80006b7c:	ad4080e7          	jalr	-1324(ra) # 8000164c <thread_dispatch>
}
    80006b80:	01813083          	ld	ra,24(sp)
    80006b84:	01013403          	ld	s0,16(sp)
    80006b88:	00813483          	ld	s1,8(sp)
    80006b8c:	00013903          	ld	s2,0(sp)
    80006b90:	02010113          	addi	sp,sp,32
    80006b94:	00008067          	ret

0000000080006b98 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006b98:	fe010113          	addi	sp,sp,-32
    80006b9c:	00113c23          	sd	ra,24(sp)
    80006ba0:	00813823          	sd	s0,16(sp)
    80006ba4:	00913423          	sd	s1,8(sp)
    80006ba8:	01213023          	sd	s2,0(sp)
    80006bac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006bb0:	00000913          	li	s2,0
    80006bb4:	0400006f          	j	80006bf4 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006bb8:	ffffb097          	auipc	ra,0xffffb
    80006bbc:	a94080e7          	jalr	-1388(ra) # 8000164c <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    80006bc0:	00148493          	addi	s1,s1,1
    80006bc4:	000027b7          	lui	a5,0x2
    80006bc8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006bcc:	0097ee63          	bltu	a5,s1,80006be8 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006bd0:	00000713          	li	a4,0
    80006bd4:	000077b7          	lui	a5,0x7
    80006bd8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006bdc:	fce7eee3          	bltu	a5,a4,80006bb8 <_ZL11workerBodyBPv+0x20>
    80006be0:	00170713          	addi	a4,a4,1
    80006be4:	ff1ff06f          	j	80006bd4 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006be8:	00a00793          	li	a5,10
    80006bec:	04f90663          	beq	s2,a5,80006c38 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006bf0:	00190913          	addi	s2,s2,1
    80006bf4:	00f00793          	li	a5,15
    80006bf8:	0527e463          	bltu	a5,s2,80006c40 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006bfc:	00003517          	auipc	a0,0x3
    80006c00:	5c450513          	addi	a0,a0,1476 # 8000a1c0 <CONSOLE_STATUS+0x1b0>
    80006c04:	fffff097          	auipc	ra,0xfffff
    80006c08:	548080e7          	jalr	1352(ra) # 8000614c <_Z11printStringPKc>
    80006c0c:	00000613          	li	a2,0
    80006c10:	00a00593          	li	a1,10
    80006c14:	0009051b          	sext.w	a0,s2
    80006c18:	fffff097          	auipc	ra,0xfffff
    80006c1c:	6e4080e7          	jalr	1764(ra) # 800062fc <_Z8printIntiii>
    80006c20:	00003517          	auipc	a0,0x3
    80006c24:	54850513          	addi	a0,a0,1352 # 8000a168 <CONSOLE_STATUS+0x158>
    80006c28:	fffff097          	auipc	ra,0xfffff
    80006c2c:	524080e7          	jalr	1316(ra) # 8000614c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006c30:	00000493          	li	s1,0
    80006c34:	f91ff06f          	j	80006bc4 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006c38:	14102ff3          	csrr	t6,sepc
    80006c3c:	fb5ff06f          	j	80006bf0 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006c40:	00003517          	auipc	a0,0x3
    80006c44:	58850513          	addi	a0,a0,1416 # 8000a1c8 <CONSOLE_STATUS+0x1b8>
    80006c48:	fffff097          	auipc	ra,0xfffff
    80006c4c:	504080e7          	jalr	1284(ra) # 8000614c <_Z11printStringPKc>
    finishedB = true;
    80006c50:	00100793          	li	a5,1
    80006c54:	00006717          	auipc	a4,0x6
    80006c58:	68f70723          	sb	a5,1678(a4) # 8000d2e2 <_ZL9finishedB>
    thread_dispatch();
    80006c5c:	ffffb097          	auipc	ra,0xffffb
    80006c60:	9f0080e7          	jalr	-1552(ra) # 8000164c <thread_dispatch>
}
    80006c64:	01813083          	ld	ra,24(sp)
    80006c68:	01013403          	ld	s0,16(sp)
    80006c6c:	00813483          	ld	s1,8(sp)
    80006c70:	00013903          	ld	s2,0(sp)
    80006c74:	02010113          	addi	sp,sp,32
    80006c78:	00008067          	ret

0000000080006c7c <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006c7c:	fe010113          	addi	sp,sp,-32
    80006c80:	00113c23          	sd	ra,24(sp)
    80006c84:	00813823          	sd	s0,16(sp)
    80006c88:	00913423          	sd	s1,8(sp)
    80006c8c:	01213023          	sd	s2,0(sp)
    80006c90:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006c94:	00000913          	li	s2,0
    80006c98:	0380006f          	j	80006cd0 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006c9c:	ffffb097          	auipc	ra,0xffffb
    80006ca0:	9b0080e7          	jalr	-1616(ra) # 8000164c <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    80006ca4:	00148493          	addi	s1,s1,1
    80006ca8:	000027b7          	lui	a5,0x2
    80006cac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006cb0:	0097ee63          	bltu	a5,s1,80006ccc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006cb4:	00000713          	li	a4,0
    80006cb8:	000077b7          	lui	a5,0x7
    80006cbc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006cc0:	fce7eee3          	bltu	a5,a4,80006c9c <_ZL11workerBodyAPv+0x20>
    80006cc4:	00170713          	addi	a4,a4,1
    80006cc8:	ff1ff06f          	j	80006cb8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80006ccc:	00190913          	addi	s2,s2,1
    80006cd0:	00900793          	li	a5,9
    80006cd4:	0527e063          	bltu	a5,s2,80006d14 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006cd8:	00003517          	auipc	a0,0x3
    80006cdc:	4d050513          	addi	a0,a0,1232 # 8000a1a8 <CONSOLE_STATUS+0x198>
    80006ce0:	fffff097          	auipc	ra,0xfffff
    80006ce4:	46c080e7          	jalr	1132(ra) # 8000614c <_Z11printStringPKc>
    80006ce8:	00000613          	li	a2,0
    80006cec:	00a00593          	li	a1,10
    80006cf0:	0009051b          	sext.w	a0,s2
    80006cf4:	fffff097          	auipc	ra,0xfffff
    80006cf8:	608080e7          	jalr	1544(ra) # 800062fc <_Z8printIntiii>
    80006cfc:	00003517          	auipc	a0,0x3
    80006d00:	46c50513          	addi	a0,a0,1132 # 8000a168 <CONSOLE_STATUS+0x158>
    80006d04:	fffff097          	auipc	ra,0xfffff
    80006d08:	448080e7          	jalr	1096(ra) # 8000614c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006d0c:	00000493          	li	s1,0
    80006d10:	f99ff06f          	j	80006ca8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006d14:	00003517          	auipc	a0,0x3
    80006d18:	49c50513          	addi	a0,a0,1180 # 8000a1b0 <CONSOLE_STATUS+0x1a0>
    80006d1c:	fffff097          	auipc	ra,0xfffff
    80006d20:	430080e7          	jalr	1072(ra) # 8000614c <_Z11printStringPKc>
    finishedA = true;
    80006d24:	00100793          	li	a5,1
    80006d28:	00006717          	auipc	a4,0x6
    80006d2c:	5af70da3          	sb	a5,1467(a4) # 8000d2e3 <_ZL9finishedA>
}
    80006d30:	01813083          	ld	ra,24(sp)
    80006d34:	01013403          	ld	s0,16(sp)
    80006d38:	00813483          	ld	s1,8(sp)
    80006d3c:	00013903          	ld	s2,0(sp)
    80006d40:	02010113          	addi	sp,sp,32
    80006d44:	00008067          	ret

0000000080006d48 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006d48:	fe010113          	addi	sp,sp,-32
    80006d4c:	00113c23          	sd	ra,24(sp)
    80006d50:	00813823          	sd	s0,16(sp)
    80006d54:	02010413          	addi	s0,sp,32
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006d58:	00000613          	li	a2,0
    80006d5c:	00000597          	auipc	a1,0x0
    80006d60:	f2058593          	addi	a1,a1,-224 # 80006c7c <_ZL11workerBodyAPv>
    80006d64:	fe040513          	addi	a0,s0,-32
    80006d68:	ffffb097          	auipc	ra,0xffffb
    80006d6c:	82c080e7          	jalr	-2004(ra) # 80001594 <thread_create>
    printString("ThreadA created\n");
    80006d70:	00003517          	auipc	a0,0x3
    80006d74:	4d050513          	addi	a0,a0,1232 # 8000a240 <CONSOLE_STATUS+0x230>
    80006d78:	fffff097          	auipc	ra,0xfffff
    80006d7c:	3d4080e7          	jalr	980(ra) # 8000614c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006d80:	00000613          	li	a2,0
    80006d84:	00000597          	auipc	a1,0x0
    80006d88:	e1458593          	addi	a1,a1,-492 # 80006b98 <_ZL11workerBodyBPv>
    80006d8c:	fe440513          	addi	a0,s0,-28
    80006d90:	ffffb097          	auipc	ra,0xffffb
    80006d94:	804080e7          	jalr	-2044(ra) # 80001594 <thread_create>
    printString("ThreadB created\n");
    80006d98:	00003517          	auipc	a0,0x3
    80006d9c:	4c050513          	addi	a0,a0,1216 # 8000a258 <CONSOLE_STATUS+0x248>
    80006da0:	fffff097          	auipc	ra,0xfffff
    80006da4:	3ac080e7          	jalr	940(ra) # 8000614c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006da8:	00000613          	li	a2,0
    80006dac:	00000597          	auipc	a1,0x0
    80006db0:	c6c58593          	addi	a1,a1,-916 # 80006a18 <_ZL11workerBodyCPv>
    80006db4:	fe840513          	addi	a0,s0,-24
    80006db8:	ffffa097          	auipc	ra,0xffffa
    80006dbc:	7dc080e7          	jalr	2012(ra) # 80001594 <thread_create>
    printString("ThreadC created\n");
    80006dc0:	00003517          	auipc	a0,0x3
    80006dc4:	4b050513          	addi	a0,a0,1200 # 8000a270 <CONSOLE_STATUS+0x260>
    80006dc8:	fffff097          	auipc	ra,0xfffff
    80006dcc:	384080e7          	jalr	900(ra) # 8000614c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006dd0:	00000613          	li	a2,0
    80006dd4:	00000597          	auipc	a1,0x0
    80006dd8:	afc58593          	addi	a1,a1,-1284 # 800068d0 <_ZL11workerBodyDPv>
    80006ddc:	fec40513          	addi	a0,s0,-20
    80006de0:	ffffa097          	auipc	ra,0xffffa
    80006de4:	7b4080e7          	jalr	1972(ra) # 80001594 <thread_create>
    printString("ThreadD created\n");
    80006de8:	00003517          	auipc	a0,0x3
    80006dec:	4a050513          	addi	a0,a0,1184 # 8000a288 <CONSOLE_STATUS+0x278>
    80006df0:	fffff097          	auipc	ra,0xfffff
    80006df4:	35c080e7          	jalr	860(ra) # 8000614c <_Z11printStringPKc>
    80006df8:	00c0006f          	j	80006e04 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006dfc:	ffffb097          	auipc	ra,0xffffb
    80006e00:	850080e7          	jalr	-1968(ra) # 8000164c <thread_dispatch>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006e04:	00006797          	auipc	a5,0x6
    80006e08:	4df7c783          	lbu	a5,1247(a5) # 8000d2e3 <_ZL9finishedA>
    80006e0c:	fe0788e3          	beqz	a5,80006dfc <_Z16System_Mode_testv+0xb4>
    80006e10:	00006797          	auipc	a5,0x6
    80006e14:	4d27c783          	lbu	a5,1234(a5) # 8000d2e2 <_ZL9finishedB>
    80006e18:	fe0782e3          	beqz	a5,80006dfc <_Z16System_Mode_testv+0xb4>
    80006e1c:	00006797          	auipc	a5,0x6
    80006e20:	4c57c783          	lbu	a5,1221(a5) # 8000d2e1 <_ZL9finishedC>
    80006e24:	fc078ce3          	beqz	a5,80006dfc <_Z16System_Mode_testv+0xb4>
    80006e28:	00006797          	auipc	a5,0x6
    80006e2c:	4b87c783          	lbu	a5,1208(a5) # 8000d2e0 <_ZL9finishedD>
    80006e30:	fc0786e3          	beqz	a5,80006dfc <_Z16System_Mode_testv+0xb4>
    }

}
    80006e34:	01813083          	ld	ra,24(sp)
    80006e38:	01013403          	ld	s0,16(sp)
    80006e3c:	02010113          	addi	sp,sp,32
    80006e40:	00008067          	ret

0000000080006e44 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006e44:	fe010113          	addi	sp,sp,-32
    80006e48:	00113c23          	sd	ra,24(sp)
    80006e4c:	00813823          	sd	s0,16(sp)
    80006e50:	00913423          	sd	s1,8(sp)
    80006e54:	01213023          	sd	s2,0(sp)
    80006e58:	02010413          	addi	s0,sp,32
    80006e5c:	00050493          	mv	s1,a0
    80006e60:	00058913          	mv	s2,a1
    80006e64:	0015879b          	addiw	a5,a1,1
    80006e68:	0007851b          	sext.w	a0,a5
    80006e6c:	00f4a023          	sw	a5,0(s1)
    80006e70:	0004a823          	sw	zero,16(s1)
    80006e74:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006e78:	00251513          	slli	a0,a0,0x2
    80006e7c:	ffffa097          	auipc	ra,0xffffa
    80006e80:	684080e7          	jalr	1668(ra) # 80001500 <mem_alloc>
    80006e84:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006e88:	00000593          	li	a1,0
    80006e8c:	01c48513          	addi	a0,s1,28
    80006e90:	ffffb097          	auipc	ra,0xffffb
    80006e94:	83c080e7          	jalr	-1988(ra) # 800016cc <sem_open>
    sem_open(&spaceAvailable, _cap);
    80006e98:	00090593          	mv	a1,s2
    80006e9c:	01848513          	addi	a0,s1,24
    80006ea0:	ffffb097          	auipc	ra,0xffffb
    80006ea4:	82c080e7          	jalr	-2004(ra) # 800016cc <sem_open>
    sem_open(&mutexHead, 1);
    80006ea8:	00100593          	li	a1,1
    80006eac:	02048513          	addi	a0,s1,32
    80006eb0:	ffffb097          	auipc	ra,0xffffb
    80006eb4:	81c080e7          	jalr	-2020(ra) # 800016cc <sem_open>
    sem_open(&mutexTail, 1);
    80006eb8:	00100593          	li	a1,1
    80006ebc:	02448513          	addi	a0,s1,36
    80006ec0:	ffffb097          	auipc	ra,0xffffb
    80006ec4:	80c080e7          	jalr	-2036(ra) # 800016cc <sem_open>
}
    80006ec8:	01813083          	ld	ra,24(sp)
    80006ecc:	01013403          	ld	s0,16(sp)
    80006ed0:	00813483          	ld	s1,8(sp)
    80006ed4:	00013903          	ld	s2,0(sp)
    80006ed8:	02010113          	addi	sp,sp,32
    80006edc:	00008067          	ret

0000000080006ee0 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006ee0:	fe010113          	addi	sp,sp,-32
    80006ee4:	00113c23          	sd	ra,24(sp)
    80006ee8:	00813823          	sd	s0,16(sp)
    80006eec:	00913423          	sd	s1,8(sp)
    80006ef0:	01213023          	sd	s2,0(sp)
    80006ef4:	02010413          	addi	s0,sp,32
    80006ef8:	00050493          	mv	s1,a0
    80006efc:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006f00:	01852503          	lw	a0,24(a0)
    80006f04:	ffffb097          	auipc	ra,0xffffb
    80006f08:	818080e7          	jalr	-2024(ra) # 8000171c <sem_wait>

    sem_wait(mutexTail);
    80006f0c:	0244a503          	lw	a0,36(s1)
    80006f10:	ffffb097          	auipc	ra,0xffffb
    80006f14:	80c080e7          	jalr	-2036(ra) # 8000171c <sem_wait>
    buffer[tail] = val;
    80006f18:	0084b783          	ld	a5,8(s1)
    80006f1c:	0144a703          	lw	a4,20(s1)
    80006f20:	00271713          	slli	a4,a4,0x2
    80006f24:	00e787b3          	add	a5,a5,a4
    80006f28:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006f2c:	0144a783          	lw	a5,20(s1)
    80006f30:	0017879b          	addiw	a5,a5,1
    80006f34:	0004a703          	lw	a4,0(s1)
    80006f38:	02e7e7bb          	remw	a5,a5,a4
    80006f3c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006f40:	0244a503          	lw	a0,36(s1)
    80006f44:	ffffb097          	auipc	ra,0xffffb
    80006f48:	820080e7          	jalr	-2016(ra) # 80001764 <sem_signal>

    sem_signal(itemAvailable);
    80006f4c:	01c4a503          	lw	a0,28(s1)
    80006f50:	ffffb097          	auipc	ra,0xffffb
    80006f54:	814080e7          	jalr	-2028(ra) # 80001764 <sem_signal>

}
    80006f58:	01813083          	ld	ra,24(sp)
    80006f5c:	01013403          	ld	s0,16(sp)
    80006f60:	00813483          	ld	s1,8(sp)
    80006f64:	00013903          	ld	s2,0(sp)
    80006f68:	02010113          	addi	sp,sp,32
    80006f6c:	00008067          	ret

0000000080006f70 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006f70:	fe010113          	addi	sp,sp,-32
    80006f74:	00113c23          	sd	ra,24(sp)
    80006f78:	00813823          	sd	s0,16(sp)
    80006f7c:	00913423          	sd	s1,8(sp)
    80006f80:	01213023          	sd	s2,0(sp)
    80006f84:	02010413          	addi	s0,sp,32
    80006f88:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006f8c:	01c52503          	lw	a0,28(a0)
    80006f90:	ffffa097          	auipc	ra,0xffffa
    80006f94:	78c080e7          	jalr	1932(ra) # 8000171c <sem_wait>

    sem_wait(mutexHead);
    80006f98:	0204a503          	lw	a0,32(s1)
    80006f9c:	ffffa097          	auipc	ra,0xffffa
    80006fa0:	780080e7          	jalr	1920(ra) # 8000171c <sem_wait>

    int ret = buffer[head];
    80006fa4:	0084b703          	ld	a4,8(s1)
    80006fa8:	0104a783          	lw	a5,16(s1)
    80006fac:	00279693          	slli	a3,a5,0x2
    80006fb0:	00d70733          	add	a4,a4,a3
    80006fb4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006fb8:	0017879b          	addiw	a5,a5,1
    80006fbc:	0004a703          	lw	a4,0(s1)
    80006fc0:	02e7e7bb          	remw	a5,a5,a4
    80006fc4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006fc8:	0204a503          	lw	a0,32(s1)
    80006fcc:	ffffa097          	auipc	ra,0xffffa
    80006fd0:	798080e7          	jalr	1944(ra) # 80001764 <sem_signal>

    sem_signal(spaceAvailable);
    80006fd4:	0184a503          	lw	a0,24(s1)
    80006fd8:	ffffa097          	auipc	ra,0xffffa
    80006fdc:	78c080e7          	jalr	1932(ra) # 80001764 <sem_signal>

    return ret;
}
    80006fe0:	00090513          	mv	a0,s2
    80006fe4:	01813083          	ld	ra,24(sp)
    80006fe8:	01013403          	ld	s0,16(sp)
    80006fec:	00813483          	ld	s1,8(sp)
    80006ff0:	00013903          	ld	s2,0(sp)
    80006ff4:	02010113          	addi	sp,sp,32
    80006ff8:	00008067          	ret

0000000080006ffc <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006ffc:	fe010113          	addi	sp,sp,-32
    80007000:	00113c23          	sd	ra,24(sp)
    80007004:	00813823          	sd	s0,16(sp)
    80007008:	00913423          	sd	s1,8(sp)
    8000700c:	01213023          	sd	s2,0(sp)
    80007010:	02010413          	addi	s0,sp,32
    80007014:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80007018:	02052503          	lw	a0,32(a0)
    8000701c:	ffffa097          	auipc	ra,0xffffa
    80007020:	700080e7          	jalr	1792(ra) # 8000171c <sem_wait>
    sem_wait(mutexTail);
    80007024:	0244a503          	lw	a0,36(s1)
    80007028:	ffffa097          	auipc	ra,0xffffa
    8000702c:	6f4080e7          	jalr	1780(ra) # 8000171c <sem_wait>

    if (tail >= head) {
    80007030:	0144a783          	lw	a5,20(s1)
    80007034:	0104a903          	lw	s2,16(s1)
    80007038:	0327ce63          	blt	a5,s2,80007074 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000703c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80007040:	0244a503          	lw	a0,36(s1)
    80007044:	ffffa097          	auipc	ra,0xffffa
    80007048:	720080e7          	jalr	1824(ra) # 80001764 <sem_signal>
    sem_signal(mutexHead);
    8000704c:	0204a503          	lw	a0,32(s1)
    80007050:	ffffa097          	auipc	ra,0xffffa
    80007054:	714080e7          	jalr	1812(ra) # 80001764 <sem_signal>

    return ret;
}
    80007058:	00090513          	mv	a0,s2
    8000705c:	01813083          	ld	ra,24(sp)
    80007060:	01013403          	ld	s0,16(sp)
    80007064:	00813483          	ld	s1,8(sp)
    80007068:	00013903          	ld	s2,0(sp)
    8000706c:	02010113          	addi	sp,sp,32
    80007070:	00008067          	ret
        ret = cap - head + tail;
    80007074:	0004a703          	lw	a4,0(s1)
    80007078:	4127093b          	subw	s2,a4,s2
    8000707c:	00f9093b          	addw	s2,s2,a5
    80007080:	fc1ff06f          	j	80007040 <_ZN6Buffer6getCntEv+0x44>

0000000080007084 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80007084:	fe010113          	addi	sp,sp,-32
    80007088:	00113c23          	sd	ra,24(sp)
    8000708c:	00813823          	sd	s0,16(sp)
    80007090:	00913423          	sd	s1,8(sp)
    80007094:	02010413          	addi	s0,sp,32
    80007098:	00050493          	mv	s1,a0
    putc('\n');
    8000709c:	00a00513          	li	a0,10
    800070a0:	ffffa097          	auipc	ra,0xffffa
    800070a4:	774080e7          	jalr	1908(ra) # 80001814 <putc>
    printString("Buffer deleted!\n");
    800070a8:	00003517          	auipc	a0,0x3
    800070ac:	26850513          	addi	a0,a0,616 # 8000a310 <CONSOLE_STATUS+0x300>
    800070b0:	fffff097          	auipc	ra,0xfffff
    800070b4:	09c080e7          	jalr	156(ra) # 8000614c <_Z11printStringPKc>
    while (getCnt() > 0) {
    800070b8:	00048513          	mv	a0,s1
    800070bc:	00000097          	auipc	ra,0x0
    800070c0:	f40080e7          	jalr	-192(ra) # 80006ffc <_ZN6Buffer6getCntEv>
    800070c4:	02a05c63          	blez	a0,800070fc <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800070c8:	0084b783          	ld	a5,8(s1)
    800070cc:	0104a703          	lw	a4,16(s1)
    800070d0:	00271713          	slli	a4,a4,0x2
    800070d4:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800070d8:	0007c503          	lbu	a0,0(a5)
    800070dc:	ffffa097          	auipc	ra,0xffffa
    800070e0:	738080e7          	jalr	1848(ra) # 80001814 <putc>
        head = (head + 1) % cap;
    800070e4:	0104a783          	lw	a5,16(s1)
    800070e8:	0017879b          	addiw	a5,a5,1
    800070ec:	0004a703          	lw	a4,0(s1)
    800070f0:	02e7e7bb          	remw	a5,a5,a4
    800070f4:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800070f8:	fc1ff06f          	j	800070b8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800070fc:	02100513          	li	a0,33
    80007100:	ffffa097          	auipc	ra,0xffffa
    80007104:	714080e7          	jalr	1812(ra) # 80001814 <putc>
    putc('\n');
    80007108:	00a00513          	li	a0,10
    8000710c:	ffffa097          	auipc	ra,0xffffa
    80007110:	708080e7          	jalr	1800(ra) # 80001814 <putc>
    mem_free(buffer);
    80007114:	0084b503          	ld	a0,8(s1)
    80007118:	ffffa097          	auipc	ra,0xffffa
    8000711c:	430080e7          	jalr	1072(ra) # 80001548 <mem_free>
    sem_close(itemAvailable);
    80007120:	01c4a503          	lw	a0,28(s1)
    80007124:	ffffa097          	auipc	ra,0xffffa
    80007128:	680080e7          	jalr	1664(ra) # 800017a4 <sem_close>
    sem_close(spaceAvailable);
    8000712c:	0184a503          	lw	a0,24(s1)
    80007130:	ffffa097          	auipc	ra,0xffffa
    80007134:	674080e7          	jalr	1652(ra) # 800017a4 <sem_close>
    sem_close(mutexTail);
    80007138:	0244a503          	lw	a0,36(s1)
    8000713c:	ffffa097          	auipc	ra,0xffffa
    80007140:	668080e7          	jalr	1640(ra) # 800017a4 <sem_close>
    sem_close(mutexHead);
    80007144:	0204a503          	lw	a0,32(s1)
    80007148:	ffffa097          	auipc	ra,0xffffa
    8000714c:	65c080e7          	jalr	1628(ra) # 800017a4 <sem_close>
}
    80007150:	01813083          	ld	ra,24(sp)
    80007154:	01013403          	ld	s0,16(sp)
    80007158:	00813483          	ld	s1,8(sp)
    8000715c:	02010113          	addi	sp,sp,32
    80007160:	00008067          	ret

0000000080007164 <start>:
    80007164:	ff010113          	addi	sp,sp,-16
    80007168:	00813423          	sd	s0,8(sp)
    8000716c:	01010413          	addi	s0,sp,16
    80007170:	300027f3          	csrr	a5,mstatus
    80007174:	ffffe737          	lui	a4,0xffffe
    80007178:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff02af>
    8000717c:	00e7f7b3          	and	a5,a5,a4
    80007180:	00001737          	lui	a4,0x1
    80007184:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80007188:	00e7e7b3          	or	a5,a5,a4
    8000718c:	30079073          	csrw	mstatus,a5
    80007190:	00000797          	auipc	a5,0x0
    80007194:	16078793          	addi	a5,a5,352 # 800072f0 <system_main>
    80007198:	34179073          	csrw	mepc,a5
    8000719c:	00000793          	li	a5,0
    800071a0:	18079073          	csrw	satp,a5
    800071a4:	000107b7          	lui	a5,0x10
    800071a8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800071ac:	30279073          	csrw	medeleg,a5
    800071b0:	30379073          	csrw	mideleg,a5
    800071b4:	104027f3          	csrr	a5,sie
    800071b8:	2227e793          	ori	a5,a5,546
    800071bc:	10479073          	csrw	sie,a5
    800071c0:	fff00793          	li	a5,-1
    800071c4:	00a7d793          	srli	a5,a5,0xa
    800071c8:	3b079073          	csrw	pmpaddr0,a5
    800071cc:	00f00793          	li	a5,15
    800071d0:	3a079073          	csrw	pmpcfg0,a5
    800071d4:	f14027f3          	csrr	a5,mhartid
    800071d8:	0200c737          	lui	a4,0x200c
    800071dc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800071e0:	0007869b          	sext.w	a3,a5
    800071e4:	00269713          	slli	a4,a3,0x2
    800071e8:	000f4637          	lui	a2,0xf4
    800071ec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800071f0:	00d70733          	add	a4,a4,a3
    800071f4:	0037979b          	slliw	a5,a5,0x3
    800071f8:	020046b7          	lui	a3,0x2004
    800071fc:	00d787b3          	add	a5,a5,a3
    80007200:	00c585b3          	add	a1,a1,a2
    80007204:	00371693          	slli	a3,a4,0x3
    80007208:	00006717          	auipc	a4,0x6
    8000720c:	0e870713          	addi	a4,a4,232 # 8000d2f0 <timer_scratch>
    80007210:	00b7b023          	sd	a1,0(a5)
    80007214:	00d70733          	add	a4,a4,a3
    80007218:	00f73c23          	sd	a5,24(a4)
    8000721c:	02c73023          	sd	a2,32(a4)
    80007220:	34071073          	csrw	mscratch,a4
    80007224:	00000797          	auipc	a5,0x0
    80007228:	6ec78793          	addi	a5,a5,1772 # 80007910 <timervec>
    8000722c:	30579073          	csrw	mtvec,a5
    80007230:	300027f3          	csrr	a5,mstatus
    80007234:	0087e793          	ori	a5,a5,8
    80007238:	30079073          	csrw	mstatus,a5
    8000723c:	304027f3          	csrr	a5,mie
    80007240:	0807e793          	ori	a5,a5,128
    80007244:	30479073          	csrw	mie,a5
    80007248:	f14027f3          	csrr	a5,mhartid
    8000724c:	0007879b          	sext.w	a5,a5
    80007250:	00078213          	mv	tp,a5
    80007254:	30200073          	mret
    80007258:	00813403          	ld	s0,8(sp)
    8000725c:	01010113          	addi	sp,sp,16
    80007260:	00008067          	ret

0000000080007264 <timerinit>:
    80007264:	ff010113          	addi	sp,sp,-16
    80007268:	00813423          	sd	s0,8(sp)
    8000726c:	01010413          	addi	s0,sp,16
    80007270:	f14027f3          	csrr	a5,mhartid
    80007274:	0200c737          	lui	a4,0x200c
    80007278:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000727c:	0007869b          	sext.w	a3,a5
    80007280:	00269713          	slli	a4,a3,0x2
    80007284:	000f4637          	lui	a2,0xf4
    80007288:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000728c:	00d70733          	add	a4,a4,a3
    80007290:	0037979b          	slliw	a5,a5,0x3
    80007294:	020046b7          	lui	a3,0x2004
    80007298:	00d787b3          	add	a5,a5,a3
    8000729c:	00c585b3          	add	a1,a1,a2
    800072a0:	00371693          	slli	a3,a4,0x3
    800072a4:	00006717          	auipc	a4,0x6
    800072a8:	04c70713          	addi	a4,a4,76 # 8000d2f0 <timer_scratch>
    800072ac:	00b7b023          	sd	a1,0(a5)
    800072b0:	00d70733          	add	a4,a4,a3
    800072b4:	00f73c23          	sd	a5,24(a4)
    800072b8:	02c73023          	sd	a2,32(a4)
    800072bc:	34071073          	csrw	mscratch,a4
    800072c0:	00000797          	auipc	a5,0x0
    800072c4:	65078793          	addi	a5,a5,1616 # 80007910 <timervec>
    800072c8:	30579073          	csrw	mtvec,a5
    800072cc:	300027f3          	csrr	a5,mstatus
    800072d0:	0087e793          	ori	a5,a5,8
    800072d4:	30079073          	csrw	mstatus,a5
    800072d8:	304027f3          	csrr	a5,mie
    800072dc:	0807e793          	ori	a5,a5,128
    800072e0:	30479073          	csrw	mie,a5
    800072e4:	00813403          	ld	s0,8(sp)
    800072e8:	01010113          	addi	sp,sp,16
    800072ec:	00008067          	ret

00000000800072f0 <system_main>:
    800072f0:	fe010113          	addi	sp,sp,-32
    800072f4:	00813823          	sd	s0,16(sp)
    800072f8:	00913423          	sd	s1,8(sp)
    800072fc:	00113c23          	sd	ra,24(sp)
    80007300:	02010413          	addi	s0,sp,32
    80007304:	00000097          	auipc	ra,0x0
    80007308:	0c4080e7          	jalr	196(ra) # 800073c8 <cpuid>
    8000730c:	00006497          	auipc	s1,0x6
    80007310:	a6448493          	addi	s1,s1,-1436 # 8000cd70 <started>
    80007314:	02050263          	beqz	a0,80007338 <system_main+0x48>
    80007318:	0004a783          	lw	a5,0(s1)
    8000731c:	0007879b          	sext.w	a5,a5
    80007320:	fe078ce3          	beqz	a5,80007318 <system_main+0x28>
    80007324:	0ff0000f          	fence
    80007328:	00003517          	auipc	a0,0x3
    8000732c:	0a050513          	addi	a0,a0,160 # 8000a3c8 <CONSOLE_STATUS+0x3b8>
    80007330:	00001097          	auipc	ra,0x1
    80007334:	a7c080e7          	jalr	-1412(ra) # 80007dac <panic>
    80007338:	00001097          	auipc	ra,0x1
    8000733c:	9d0080e7          	jalr	-1584(ra) # 80007d08 <consoleinit>
    80007340:	00001097          	auipc	ra,0x1
    80007344:	15c080e7          	jalr	348(ra) # 8000849c <printfinit>
    80007348:	00003517          	auipc	a0,0x3
    8000734c:	e2050513          	addi	a0,a0,-480 # 8000a168 <CONSOLE_STATUS+0x158>
    80007350:	00001097          	auipc	ra,0x1
    80007354:	ab8080e7          	jalr	-1352(ra) # 80007e08 <__printf>
    80007358:	00003517          	auipc	a0,0x3
    8000735c:	04050513          	addi	a0,a0,64 # 8000a398 <CONSOLE_STATUS+0x388>
    80007360:	00001097          	auipc	ra,0x1
    80007364:	aa8080e7          	jalr	-1368(ra) # 80007e08 <__printf>
    80007368:	00003517          	auipc	a0,0x3
    8000736c:	e0050513          	addi	a0,a0,-512 # 8000a168 <CONSOLE_STATUS+0x158>
    80007370:	00001097          	auipc	ra,0x1
    80007374:	a98080e7          	jalr	-1384(ra) # 80007e08 <__printf>
    80007378:	00001097          	auipc	ra,0x1
    8000737c:	4b0080e7          	jalr	1200(ra) # 80008828 <kinit>
    80007380:	00000097          	auipc	ra,0x0
    80007384:	148080e7          	jalr	328(ra) # 800074c8 <trapinit>
    80007388:	00000097          	auipc	ra,0x0
    8000738c:	16c080e7          	jalr	364(ra) # 800074f4 <trapinithart>
    80007390:	00000097          	auipc	ra,0x0
    80007394:	5c0080e7          	jalr	1472(ra) # 80007950 <plicinit>
    80007398:	00000097          	auipc	ra,0x0
    8000739c:	5e0080e7          	jalr	1504(ra) # 80007978 <plicinithart>
    800073a0:	00000097          	auipc	ra,0x0
    800073a4:	078080e7          	jalr	120(ra) # 80007418 <userinit>
    800073a8:	0ff0000f          	fence
    800073ac:	00100793          	li	a5,1
    800073b0:	00003517          	auipc	a0,0x3
    800073b4:	00050513          	mv	a0,a0
    800073b8:	00f4a023          	sw	a5,0(s1)
    800073bc:	00001097          	auipc	ra,0x1
    800073c0:	a4c080e7          	jalr	-1460(ra) # 80007e08 <__printf>
    800073c4:	0000006f          	j	800073c4 <system_main+0xd4>

00000000800073c8 <cpuid>:
    800073c8:	ff010113          	addi	sp,sp,-16
    800073cc:	00813423          	sd	s0,8(sp)
    800073d0:	01010413          	addi	s0,sp,16
    800073d4:	00020513          	mv	a0,tp
    800073d8:	00813403          	ld	s0,8(sp)
    800073dc:	0005051b          	sext.w	a0,a0
    800073e0:	01010113          	addi	sp,sp,16
    800073e4:	00008067          	ret

00000000800073e8 <mycpu>:
    800073e8:	ff010113          	addi	sp,sp,-16
    800073ec:	00813423          	sd	s0,8(sp)
    800073f0:	01010413          	addi	s0,sp,16
    800073f4:	00020793          	mv	a5,tp
    800073f8:	00813403          	ld	s0,8(sp)
    800073fc:	0007879b          	sext.w	a5,a5
    80007400:	00779793          	slli	a5,a5,0x7
    80007404:	00007517          	auipc	a0,0x7
    80007408:	f1c50513          	addi	a0,a0,-228 # 8000e320 <cpus>
    8000740c:	00f50533          	add	a0,a0,a5
    80007410:	01010113          	addi	sp,sp,16
    80007414:	00008067          	ret

0000000080007418 <userinit>:
    80007418:	ff010113          	addi	sp,sp,-16
    8000741c:	00813423          	sd	s0,8(sp)
    80007420:	01010413          	addi	s0,sp,16
    80007424:	00813403          	ld	s0,8(sp)
    80007428:	01010113          	addi	sp,sp,16
    8000742c:	ffffc317          	auipc	t1,0xffffc
    80007430:	bcc30067          	jr	-1076(t1) # 80002ff8 <main>

0000000080007434 <either_copyout>:
    80007434:	ff010113          	addi	sp,sp,-16
    80007438:	00813023          	sd	s0,0(sp)
    8000743c:	00113423          	sd	ra,8(sp)
    80007440:	01010413          	addi	s0,sp,16
    80007444:	02051663          	bnez	a0,80007470 <either_copyout+0x3c>
    80007448:	00058513          	mv	a0,a1
    8000744c:	00060593          	mv	a1,a2
    80007450:	0006861b          	sext.w	a2,a3
    80007454:	00002097          	auipc	ra,0x2
    80007458:	c60080e7          	jalr	-928(ra) # 800090b4 <__memmove>
    8000745c:	00813083          	ld	ra,8(sp)
    80007460:	00013403          	ld	s0,0(sp)
    80007464:	00000513          	li	a0,0
    80007468:	01010113          	addi	sp,sp,16
    8000746c:	00008067          	ret
    80007470:	00003517          	auipc	a0,0x3
    80007474:	f8050513          	addi	a0,a0,-128 # 8000a3f0 <CONSOLE_STATUS+0x3e0>
    80007478:	00001097          	auipc	ra,0x1
    8000747c:	934080e7          	jalr	-1740(ra) # 80007dac <panic>

0000000080007480 <either_copyin>:
    80007480:	ff010113          	addi	sp,sp,-16
    80007484:	00813023          	sd	s0,0(sp)
    80007488:	00113423          	sd	ra,8(sp)
    8000748c:	01010413          	addi	s0,sp,16
    80007490:	02059463          	bnez	a1,800074b8 <either_copyin+0x38>
    80007494:	00060593          	mv	a1,a2
    80007498:	0006861b          	sext.w	a2,a3
    8000749c:	00002097          	auipc	ra,0x2
    800074a0:	c18080e7          	jalr	-1000(ra) # 800090b4 <__memmove>
    800074a4:	00813083          	ld	ra,8(sp)
    800074a8:	00013403          	ld	s0,0(sp)
    800074ac:	00000513          	li	a0,0
    800074b0:	01010113          	addi	sp,sp,16
    800074b4:	00008067          	ret
    800074b8:	00003517          	auipc	a0,0x3
    800074bc:	f6050513          	addi	a0,a0,-160 # 8000a418 <CONSOLE_STATUS+0x408>
    800074c0:	00001097          	auipc	ra,0x1
    800074c4:	8ec080e7          	jalr	-1812(ra) # 80007dac <panic>

00000000800074c8 <trapinit>:
    800074c8:	ff010113          	addi	sp,sp,-16
    800074cc:	00813423          	sd	s0,8(sp)
    800074d0:	01010413          	addi	s0,sp,16
    800074d4:	00813403          	ld	s0,8(sp)
    800074d8:	00003597          	auipc	a1,0x3
    800074dc:	f6858593          	addi	a1,a1,-152 # 8000a440 <CONSOLE_STATUS+0x430>
    800074e0:	00007517          	auipc	a0,0x7
    800074e4:	ec050513          	addi	a0,a0,-320 # 8000e3a0 <tickslock>
    800074e8:	01010113          	addi	sp,sp,16
    800074ec:	00001317          	auipc	t1,0x1
    800074f0:	5cc30067          	jr	1484(t1) # 80008ab8 <initlock>

00000000800074f4 <trapinithart>:
    800074f4:	ff010113          	addi	sp,sp,-16
    800074f8:	00813423          	sd	s0,8(sp)
    800074fc:	01010413          	addi	s0,sp,16
    80007500:	00000797          	auipc	a5,0x0
    80007504:	30078793          	addi	a5,a5,768 # 80007800 <kernelvec>
    80007508:	10579073          	csrw	stvec,a5
    8000750c:	00813403          	ld	s0,8(sp)
    80007510:	01010113          	addi	sp,sp,16
    80007514:	00008067          	ret

0000000080007518 <usertrap>:
    80007518:	ff010113          	addi	sp,sp,-16
    8000751c:	00813423          	sd	s0,8(sp)
    80007520:	01010413          	addi	s0,sp,16
    80007524:	00813403          	ld	s0,8(sp)
    80007528:	01010113          	addi	sp,sp,16
    8000752c:	00008067          	ret

0000000080007530 <usertrapret>:
    80007530:	ff010113          	addi	sp,sp,-16
    80007534:	00813423          	sd	s0,8(sp)
    80007538:	01010413          	addi	s0,sp,16
    8000753c:	00813403          	ld	s0,8(sp)
    80007540:	01010113          	addi	sp,sp,16
    80007544:	00008067          	ret

0000000080007548 <kerneltrap>:
    80007548:	fe010113          	addi	sp,sp,-32
    8000754c:	00813823          	sd	s0,16(sp)
    80007550:	00113c23          	sd	ra,24(sp)
    80007554:	00913423          	sd	s1,8(sp)
    80007558:	02010413          	addi	s0,sp,32
    8000755c:	142025f3          	csrr	a1,scause
    80007560:	100027f3          	csrr	a5,sstatus
    80007564:	0027f793          	andi	a5,a5,2
    80007568:	10079c63          	bnez	a5,80007680 <kerneltrap+0x138>
    8000756c:	142027f3          	csrr	a5,scause
    80007570:	0207ce63          	bltz	a5,800075ac <kerneltrap+0x64>
    80007574:	00003517          	auipc	a0,0x3
    80007578:	f1450513          	addi	a0,a0,-236 # 8000a488 <CONSOLE_STATUS+0x478>
    8000757c:	00001097          	auipc	ra,0x1
    80007580:	88c080e7          	jalr	-1908(ra) # 80007e08 <__printf>
    80007584:	141025f3          	csrr	a1,sepc
    80007588:	14302673          	csrr	a2,stval
    8000758c:	00003517          	auipc	a0,0x3
    80007590:	f0c50513          	addi	a0,a0,-244 # 8000a498 <CONSOLE_STATUS+0x488>
    80007594:	00001097          	auipc	ra,0x1
    80007598:	874080e7          	jalr	-1932(ra) # 80007e08 <__printf>
    8000759c:	00003517          	auipc	a0,0x3
    800075a0:	f1450513          	addi	a0,a0,-236 # 8000a4b0 <CONSOLE_STATUS+0x4a0>
    800075a4:	00001097          	auipc	ra,0x1
    800075a8:	808080e7          	jalr	-2040(ra) # 80007dac <panic>
    800075ac:	0ff7f713          	andi	a4,a5,255
    800075b0:	00900693          	li	a3,9
    800075b4:	04d70063          	beq	a4,a3,800075f4 <kerneltrap+0xac>
    800075b8:	fff00713          	li	a4,-1
    800075bc:	03f71713          	slli	a4,a4,0x3f
    800075c0:	00170713          	addi	a4,a4,1
    800075c4:	fae798e3          	bne	a5,a4,80007574 <kerneltrap+0x2c>
    800075c8:	00000097          	auipc	ra,0x0
    800075cc:	e00080e7          	jalr	-512(ra) # 800073c8 <cpuid>
    800075d0:	06050663          	beqz	a0,8000763c <kerneltrap+0xf4>
    800075d4:	144027f3          	csrr	a5,sip
    800075d8:	ffd7f793          	andi	a5,a5,-3
    800075dc:	14479073          	csrw	sip,a5
    800075e0:	01813083          	ld	ra,24(sp)
    800075e4:	01013403          	ld	s0,16(sp)
    800075e8:	00813483          	ld	s1,8(sp)
    800075ec:	02010113          	addi	sp,sp,32
    800075f0:	00008067          	ret
    800075f4:	00000097          	auipc	ra,0x0
    800075f8:	3d0080e7          	jalr	976(ra) # 800079c4 <plic_claim>
    800075fc:	00a00793          	li	a5,10
    80007600:	00050493          	mv	s1,a0
    80007604:	06f50863          	beq	a0,a5,80007674 <kerneltrap+0x12c>
    80007608:	fc050ce3          	beqz	a0,800075e0 <kerneltrap+0x98>
    8000760c:	00050593          	mv	a1,a0
    80007610:	00003517          	auipc	a0,0x3
    80007614:	e5850513          	addi	a0,a0,-424 # 8000a468 <CONSOLE_STATUS+0x458>
    80007618:	00000097          	auipc	ra,0x0
    8000761c:	7f0080e7          	jalr	2032(ra) # 80007e08 <__printf>
    80007620:	01013403          	ld	s0,16(sp)
    80007624:	01813083          	ld	ra,24(sp)
    80007628:	00048513          	mv	a0,s1
    8000762c:	00813483          	ld	s1,8(sp)
    80007630:	02010113          	addi	sp,sp,32
    80007634:	00000317          	auipc	t1,0x0
    80007638:	3c830067          	jr	968(t1) # 800079fc <plic_complete>
    8000763c:	00007517          	auipc	a0,0x7
    80007640:	d6450513          	addi	a0,a0,-668 # 8000e3a0 <tickslock>
    80007644:	00001097          	auipc	ra,0x1
    80007648:	498080e7          	jalr	1176(ra) # 80008adc <acquire>
    8000764c:	00005717          	auipc	a4,0x5
    80007650:	72870713          	addi	a4,a4,1832 # 8000cd74 <ticks>
    80007654:	00072783          	lw	a5,0(a4)
    80007658:	00007517          	auipc	a0,0x7
    8000765c:	d4850513          	addi	a0,a0,-696 # 8000e3a0 <tickslock>
    80007660:	0017879b          	addiw	a5,a5,1
    80007664:	00f72023          	sw	a5,0(a4)
    80007668:	00001097          	auipc	ra,0x1
    8000766c:	540080e7          	jalr	1344(ra) # 80008ba8 <release>
    80007670:	f65ff06f          	j	800075d4 <kerneltrap+0x8c>
    80007674:	00001097          	auipc	ra,0x1
    80007678:	09c080e7          	jalr	156(ra) # 80008710 <uartintr>
    8000767c:	fa5ff06f          	j	80007620 <kerneltrap+0xd8>
    80007680:	00003517          	auipc	a0,0x3
    80007684:	dc850513          	addi	a0,a0,-568 # 8000a448 <CONSOLE_STATUS+0x438>
    80007688:	00000097          	auipc	ra,0x0
    8000768c:	724080e7          	jalr	1828(ra) # 80007dac <panic>

0000000080007690 <clockintr>:
    80007690:	fe010113          	addi	sp,sp,-32
    80007694:	00813823          	sd	s0,16(sp)
    80007698:	00913423          	sd	s1,8(sp)
    8000769c:	00113c23          	sd	ra,24(sp)
    800076a0:	02010413          	addi	s0,sp,32
    800076a4:	00007497          	auipc	s1,0x7
    800076a8:	cfc48493          	addi	s1,s1,-772 # 8000e3a0 <tickslock>
    800076ac:	00048513          	mv	a0,s1
    800076b0:	00001097          	auipc	ra,0x1
    800076b4:	42c080e7          	jalr	1068(ra) # 80008adc <acquire>
    800076b8:	00005717          	auipc	a4,0x5
    800076bc:	6bc70713          	addi	a4,a4,1724 # 8000cd74 <ticks>
    800076c0:	00072783          	lw	a5,0(a4)
    800076c4:	01013403          	ld	s0,16(sp)
    800076c8:	01813083          	ld	ra,24(sp)
    800076cc:	00048513          	mv	a0,s1
    800076d0:	0017879b          	addiw	a5,a5,1
    800076d4:	00813483          	ld	s1,8(sp)
    800076d8:	00f72023          	sw	a5,0(a4)
    800076dc:	02010113          	addi	sp,sp,32
    800076e0:	00001317          	auipc	t1,0x1
    800076e4:	4c830067          	jr	1224(t1) # 80008ba8 <release>

00000000800076e8 <devintr>:
    800076e8:	142027f3          	csrr	a5,scause
    800076ec:	00000513          	li	a0,0
    800076f0:	0007c463          	bltz	a5,800076f8 <devintr+0x10>
    800076f4:	00008067          	ret
    800076f8:	fe010113          	addi	sp,sp,-32
    800076fc:	00813823          	sd	s0,16(sp)
    80007700:	00113c23          	sd	ra,24(sp)
    80007704:	00913423          	sd	s1,8(sp)
    80007708:	02010413          	addi	s0,sp,32
    8000770c:	0ff7f713          	andi	a4,a5,255
    80007710:	00900693          	li	a3,9
    80007714:	04d70c63          	beq	a4,a3,8000776c <devintr+0x84>
    80007718:	fff00713          	li	a4,-1
    8000771c:	03f71713          	slli	a4,a4,0x3f
    80007720:	00170713          	addi	a4,a4,1
    80007724:	00e78c63          	beq	a5,a4,8000773c <devintr+0x54>
    80007728:	01813083          	ld	ra,24(sp)
    8000772c:	01013403          	ld	s0,16(sp)
    80007730:	00813483          	ld	s1,8(sp)
    80007734:	02010113          	addi	sp,sp,32
    80007738:	00008067          	ret
    8000773c:	00000097          	auipc	ra,0x0
    80007740:	c8c080e7          	jalr	-884(ra) # 800073c8 <cpuid>
    80007744:	06050663          	beqz	a0,800077b0 <devintr+0xc8>
    80007748:	144027f3          	csrr	a5,sip
    8000774c:	ffd7f793          	andi	a5,a5,-3
    80007750:	14479073          	csrw	sip,a5
    80007754:	01813083          	ld	ra,24(sp)
    80007758:	01013403          	ld	s0,16(sp)
    8000775c:	00813483          	ld	s1,8(sp)
    80007760:	00200513          	li	a0,2
    80007764:	02010113          	addi	sp,sp,32
    80007768:	00008067          	ret
    8000776c:	00000097          	auipc	ra,0x0
    80007770:	258080e7          	jalr	600(ra) # 800079c4 <plic_claim>
    80007774:	00a00793          	li	a5,10
    80007778:	00050493          	mv	s1,a0
    8000777c:	06f50663          	beq	a0,a5,800077e8 <devintr+0x100>
    80007780:	00100513          	li	a0,1
    80007784:	fa0482e3          	beqz	s1,80007728 <devintr+0x40>
    80007788:	00048593          	mv	a1,s1
    8000778c:	00003517          	auipc	a0,0x3
    80007790:	cdc50513          	addi	a0,a0,-804 # 8000a468 <CONSOLE_STATUS+0x458>
    80007794:	00000097          	auipc	ra,0x0
    80007798:	674080e7          	jalr	1652(ra) # 80007e08 <__printf>
    8000779c:	00048513          	mv	a0,s1
    800077a0:	00000097          	auipc	ra,0x0
    800077a4:	25c080e7          	jalr	604(ra) # 800079fc <plic_complete>
    800077a8:	00100513          	li	a0,1
    800077ac:	f7dff06f          	j	80007728 <devintr+0x40>
    800077b0:	00007517          	auipc	a0,0x7
    800077b4:	bf050513          	addi	a0,a0,-1040 # 8000e3a0 <tickslock>
    800077b8:	00001097          	auipc	ra,0x1
    800077bc:	324080e7          	jalr	804(ra) # 80008adc <acquire>
    800077c0:	00005717          	auipc	a4,0x5
    800077c4:	5b470713          	addi	a4,a4,1460 # 8000cd74 <ticks>
    800077c8:	00072783          	lw	a5,0(a4)
    800077cc:	00007517          	auipc	a0,0x7
    800077d0:	bd450513          	addi	a0,a0,-1068 # 8000e3a0 <tickslock>
    800077d4:	0017879b          	addiw	a5,a5,1
    800077d8:	00f72023          	sw	a5,0(a4)
    800077dc:	00001097          	auipc	ra,0x1
    800077e0:	3cc080e7          	jalr	972(ra) # 80008ba8 <release>
    800077e4:	f65ff06f          	j	80007748 <devintr+0x60>
    800077e8:	00001097          	auipc	ra,0x1
    800077ec:	f28080e7          	jalr	-216(ra) # 80008710 <uartintr>
    800077f0:	fadff06f          	j	8000779c <devintr+0xb4>
	...

0000000080007800 <kernelvec>:
    80007800:	f0010113          	addi	sp,sp,-256
    80007804:	00113023          	sd	ra,0(sp)
    80007808:	00213423          	sd	sp,8(sp)
    8000780c:	00313823          	sd	gp,16(sp)
    80007810:	00413c23          	sd	tp,24(sp)
    80007814:	02513023          	sd	t0,32(sp)
    80007818:	02613423          	sd	t1,40(sp)
    8000781c:	02713823          	sd	t2,48(sp)
    80007820:	02813c23          	sd	s0,56(sp)
    80007824:	04913023          	sd	s1,64(sp)
    80007828:	04a13423          	sd	a0,72(sp)
    8000782c:	04b13823          	sd	a1,80(sp)
    80007830:	04c13c23          	sd	a2,88(sp)
    80007834:	06d13023          	sd	a3,96(sp)
    80007838:	06e13423          	sd	a4,104(sp)
    8000783c:	06f13823          	sd	a5,112(sp)
    80007840:	07013c23          	sd	a6,120(sp)
    80007844:	09113023          	sd	a7,128(sp)
    80007848:	09213423          	sd	s2,136(sp)
    8000784c:	09313823          	sd	s3,144(sp)
    80007850:	09413c23          	sd	s4,152(sp)
    80007854:	0b513023          	sd	s5,160(sp)
    80007858:	0b613423          	sd	s6,168(sp)
    8000785c:	0b713823          	sd	s7,176(sp)
    80007860:	0b813c23          	sd	s8,184(sp)
    80007864:	0d913023          	sd	s9,192(sp)
    80007868:	0da13423          	sd	s10,200(sp)
    8000786c:	0db13823          	sd	s11,208(sp)
    80007870:	0dc13c23          	sd	t3,216(sp)
    80007874:	0fd13023          	sd	t4,224(sp)
    80007878:	0fe13423          	sd	t5,232(sp)
    8000787c:	0ff13823          	sd	t6,240(sp)
    80007880:	cc9ff0ef          	jal	ra,80007548 <kerneltrap>
    80007884:	00013083          	ld	ra,0(sp)
    80007888:	00813103          	ld	sp,8(sp)
    8000788c:	01013183          	ld	gp,16(sp)
    80007890:	02013283          	ld	t0,32(sp)
    80007894:	02813303          	ld	t1,40(sp)
    80007898:	03013383          	ld	t2,48(sp)
    8000789c:	03813403          	ld	s0,56(sp)
    800078a0:	04013483          	ld	s1,64(sp)
    800078a4:	04813503          	ld	a0,72(sp)
    800078a8:	05013583          	ld	a1,80(sp)
    800078ac:	05813603          	ld	a2,88(sp)
    800078b0:	06013683          	ld	a3,96(sp)
    800078b4:	06813703          	ld	a4,104(sp)
    800078b8:	07013783          	ld	a5,112(sp)
    800078bc:	07813803          	ld	a6,120(sp)
    800078c0:	08013883          	ld	a7,128(sp)
    800078c4:	08813903          	ld	s2,136(sp)
    800078c8:	09013983          	ld	s3,144(sp)
    800078cc:	09813a03          	ld	s4,152(sp)
    800078d0:	0a013a83          	ld	s5,160(sp)
    800078d4:	0a813b03          	ld	s6,168(sp)
    800078d8:	0b013b83          	ld	s7,176(sp)
    800078dc:	0b813c03          	ld	s8,184(sp)
    800078e0:	0c013c83          	ld	s9,192(sp)
    800078e4:	0c813d03          	ld	s10,200(sp)
    800078e8:	0d013d83          	ld	s11,208(sp)
    800078ec:	0d813e03          	ld	t3,216(sp)
    800078f0:	0e013e83          	ld	t4,224(sp)
    800078f4:	0e813f03          	ld	t5,232(sp)
    800078f8:	0f013f83          	ld	t6,240(sp)
    800078fc:	10010113          	addi	sp,sp,256
    80007900:	10200073          	sret
    80007904:	00000013          	nop
    80007908:	00000013          	nop
    8000790c:	00000013          	nop

0000000080007910 <timervec>:
    80007910:	34051573          	csrrw	a0,mscratch,a0
    80007914:	00b53023          	sd	a1,0(a0)
    80007918:	00c53423          	sd	a2,8(a0)
    8000791c:	00d53823          	sd	a3,16(a0)
    80007920:	01853583          	ld	a1,24(a0)
    80007924:	02053603          	ld	a2,32(a0)
    80007928:	0005b683          	ld	a3,0(a1)
    8000792c:	00c686b3          	add	a3,a3,a2
    80007930:	00d5b023          	sd	a3,0(a1)
    80007934:	00200593          	li	a1,2
    80007938:	14459073          	csrw	sip,a1
    8000793c:	01053683          	ld	a3,16(a0)
    80007940:	00853603          	ld	a2,8(a0)
    80007944:	00053583          	ld	a1,0(a0)
    80007948:	34051573          	csrrw	a0,mscratch,a0
    8000794c:	30200073          	mret

0000000080007950 <plicinit>:
    80007950:	ff010113          	addi	sp,sp,-16
    80007954:	00813423          	sd	s0,8(sp)
    80007958:	01010413          	addi	s0,sp,16
    8000795c:	00813403          	ld	s0,8(sp)
    80007960:	0c0007b7          	lui	a5,0xc000
    80007964:	00100713          	li	a4,1
    80007968:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000796c:	00e7a223          	sw	a4,4(a5)
    80007970:	01010113          	addi	sp,sp,16
    80007974:	00008067          	ret

0000000080007978 <plicinithart>:
    80007978:	ff010113          	addi	sp,sp,-16
    8000797c:	00813023          	sd	s0,0(sp)
    80007980:	00113423          	sd	ra,8(sp)
    80007984:	01010413          	addi	s0,sp,16
    80007988:	00000097          	auipc	ra,0x0
    8000798c:	a40080e7          	jalr	-1472(ra) # 800073c8 <cpuid>
    80007990:	0085171b          	slliw	a4,a0,0x8
    80007994:	0c0027b7          	lui	a5,0xc002
    80007998:	00e787b3          	add	a5,a5,a4
    8000799c:	40200713          	li	a4,1026
    800079a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800079a4:	00813083          	ld	ra,8(sp)
    800079a8:	00013403          	ld	s0,0(sp)
    800079ac:	00d5151b          	slliw	a0,a0,0xd
    800079b0:	0c2017b7          	lui	a5,0xc201
    800079b4:	00a78533          	add	a0,a5,a0
    800079b8:	00052023          	sw	zero,0(a0)
    800079bc:	01010113          	addi	sp,sp,16
    800079c0:	00008067          	ret

00000000800079c4 <plic_claim>:
    800079c4:	ff010113          	addi	sp,sp,-16
    800079c8:	00813023          	sd	s0,0(sp)
    800079cc:	00113423          	sd	ra,8(sp)
    800079d0:	01010413          	addi	s0,sp,16
    800079d4:	00000097          	auipc	ra,0x0
    800079d8:	9f4080e7          	jalr	-1548(ra) # 800073c8 <cpuid>
    800079dc:	00813083          	ld	ra,8(sp)
    800079e0:	00013403          	ld	s0,0(sp)
    800079e4:	00d5151b          	slliw	a0,a0,0xd
    800079e8:	0c2017b7          	lui	a5,0xc201
    800079ec:	00a78533          	add	a0,a5,a0
    800079f0:	00452503          	lw	a0,4(a0)
    800079f4:	01010113          	addi	sp,sp,16
    800079f8:	00008067          	ret

00000000800079fc <plic_complete>:
    800079fc:	fe010113          	addi	sp,sp,-32
    80007a00:	00813823          	sd	s0,16(sp)
    80007a04:	00913423          	sd	s1,8(sp)
    80007a08:	00113c23          	sd	ra,24(sp)
    80007a0c:	02010413          	addi	s0,sp,32
    80007a10:	00050493          	mv	s1,a0
    80007a14:	00000097          	auipc	ra,0x0
    80007a18:	9b4080e7          	jalr	-1612(ra) # 800073c8 <cpuid>
    80007a1c:	01813083          	ld	ra,24(sp)
    80007a20:	01013403          	ld	s0,16(sp)
    80007a24:	00d5179b          	slliw	a5,a0,0xd
    80007a28:	0c201737          	lui	a4,0xc201
    80007a2c:	00f707b3          	add	a5,a4,a5
    80007a30:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007a34:	00813483          	ld	s1,8(sp)
    80007a38:	02010113          	addi	sp,sp,32
    80007a3c:	00008067          	ret

0000000080007a40 <consolewrite>:
    80007a40:	fb010113          	addi	sp,sp,-80
    80007a44:	04813023          	sd	s0,64(sp)
    80007a48:	04113423          	sd	ra,72(sp)
    80007a4c:	02913c23          	sd	s1,56(sp)
    80007a50:	03213823          	sd	s2,48(sp)
    80007a54:	03313423          	sd	s3,40(sp)
    80007a58:	03413023          	sd	s4,32(sp)
    80007a5c:	01513c23          	sd	s5,24(sp)
    80007a60:	05010413          	addi	s0,sp,80
    80007a64:	06c05c63          	blez	a2,80007adc <consolewrite+0x9c>
    80007a68:	00060993          	mv	s3,a2
    80007a6c:	00050a13          	mv	s4,a0
    80007a70:	00058493          	mv	s1,a1
    80007a74:	00000913          	li	s2,0
    80007a78:	fff00a93          	li	s5,-1
    80007a7c:	01c0006f          	j	80007a98 <consolewrite+0x58>
    80007a80:	fbf44503          	lbu	a0,-65(s0)
    80007a84:	0019091b          	addiw	s2,s2,1
    80007a88:	00148493          	addi	s1,s1,1
    80007a8c:	00001097          	auipc	ra,0x1
    80007a90:	a9c080e7          	jalr	-1380(ra) # 80008528 <uartputc>
    80007a94:	03298063          	beq	s3,s2,80007ab4 <consolewrite+0x74>
    80007a98:	00048613          	mv	a2,s1
    80007a9c:	00100693          	li	a3,1
    80007aa0:	000a0593          	mv	a1,s4
    80007aa4:	fbf40513          	addi	a0,s0,-65
    80007aa8:	00000097          	auipc	ra,0x0
    80007aac:	9d8080e7          	jalr	-1576(ra) # 80007480 <either_copyin>
    80007ab0:	fd5518e3          	bne	a0,s5,80007a80 <consolewrite+0x40>
    80007ab4:	04813083          	ld	ra,72(sp)
    80007ab8:	04013403          	ld	s0,64(sp)
    80007abc:	03813483          	ld	s1,56(sp)
    80007ac0:	02813983          	ld	s3,40(sp)
    80007ac4:	02013a03          	ld	s4,32(sp)
    80007ac8:	01813a83          	ld	s5,24(sp)
    80007acc:	00090513          	mv	a0,s2
    80007ad0:	03013903          	ld	s2,48(sp)
    80007ad4:	05010113          	addi	sp,sp,80
    80007ad8:	00008067          	ret
    80007adc:	00000913          	li	s2,0
    80007ae0:	fd5ff06f          	j	80007ab4 <consolewrite+0x74>

0000000080007ae4 <consoleread>:
    80007ae4:	f9010113          	addi	sp,sp,-112
    80007ae8:	06813023          	sd	s0,96(sp)
    80007aec:	04913c23          	sd	s1,88(sp)
    80007af0:	05213823          	sd	s2,80(sp)
    80007af4:	05313423          	sd	s3,72(sp)
    80007af8:	05413023          	sd	s4,64(sp)
    80007afc:	03513c23          	sd	s5,56(sp)
    80007b00:	03613823          	sd	s6,48(sp)
    80007b04:	03713423          	sd	s7,40(sp)
    80007b08:	03813023          	sd	s8,32(sp)
    80007b0c:	06113423          	sd	ra,104(sp)
    80007b10:	01913c23          	sd	s9,24(sp)
    80007b14:	07010413          	addi	s0,sp,112
    80007b18:	00060b93          	mv	s7,a2
    80007b1c:	00050913          	mv	s2,a0
    80007b20:	00058c13          	mv	s8,a1
    80007b24:	00060b1b          	sext.w	s6,a2
    80007b28:	00007497          	auipc	s1,0x7
    80007b2c:	8a048493          	addi	s1,s1,-1888 # 8000e3c8 <cons>
    80007b30:	00400993          	li	s3,4
    80007b34:	fff00a13          	li	s4,-1
    80007b38:	00a00a93          	li	s5,10
    80007b3c:	05705e63          	blez	s7,80007b98 <consoleread+0xb4>
    80007b40:	09c4a703          	lw	a4,156(s1)
    80007b44:	0984a783          	lw	a5,152(s1)
    80007b48:	0007071b          	sext.w	a4,a4
    80007b4c:	08e78463          	beq	a5,a4,80007bd4 <consoleread+0xf0>
    80007b50:	07f7f713          	andi	a4,a5,127
    80007b54:	00e48733          	add	a4,s1,a4
    80007b58:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80007b5c:	0017869b          	addiw	a3,a5,1
    80007b60:	08d4ac23          	sw	a3,152(s1)
    80007b64:	00070c9b          	sext.w	s9,a4
    80007b68:	0b370663          	beq	a4,s3,80007c14 <consoleread+0x130>
    80007b6c:	00100693          	li	a3,1
    80007b70:	f9f40613          	addi	a2,s0,-97
    80007b74:	000c0593          	mv	a1,s8
    80007b78:	00090513          	mv	a0,s2
    80007b7c:	f8e40fa3          	sb	a4,-97(s0)
    80007b80:	00000097          	auipc	ra,0x0
    80007b84:	8b4080e7          	jalr	-1868(ra) # 80007434 <either_copyout>
    80007b88:	01450863          	beq	a0,s4,80007b98 <consoleread+0xb4>
    80007b8c:	001c0c13          	addi	s8,s8,1
    80007b90:	fffb8b9b          	addiw	s7,s7,-1
    80007b94:	fb5c94e3          	bne	s9,s5,80007b3c <consoleread+0x58>
    80007b98:	000b851b          	sext.w	a0,s7
    80007b9c:	06813083          	ld	ra,104(sp)
    80007ba0:	06013403          	ld	s0,96(sp)
    80007ba4:	05813483          	ld	s1,88(sp)
    80007ba8:	05013903          	ld	s2,80(sp)
    80007bac:	04813983          	ld	s3,72(sp)
    80007bb0:	04013a03          	ld	s4,64(sp)
    80007bb4:	03813a83          	ld	s5,56(sp)
    80007bb8:	02813b83          	ld	s7,40(sp)
    80007bbc:	02013c03          	ld	s8,32(sp)
    80007bc0:	01813c83          	ld	s9,24(sp)
    80007bc4:	40ab053b          	subw	a0,s6,a0
    80007bc8:	03013b03          	ld	s6,48(sp)
    80007bcc:	07010113          	addi	sp,sp,112
    80007bd0:	00008067          	ret
    80007bd4:	00001097          	auipc	ra,0x1
    80007bd8:	1d8080e7          	jalr	472(ra) # 80008dac <push_on>
    80007bdc:	0984a703          	lw	a4,152(s1)
    80007be0:	09c4a783          	lw	a5,156(s1)
    80007be4:	0007879b          	sext.w	a5,a5
    80007be8:	fef70ce3          	beq	a4,a5,80007be0 <consoleread+0xfc>
    80007bec:	00001097          	auipc	ra,0x1
    80007bf0:	234080e7          	jalr	564(ra) # 80008e20 <pop_on>
    80007bf4:	0984a783          	lw	a5,152(s1)
    80007bf8:	07f7f713          	andi	a4,a5,127
    80007bfc:	00e48733          	add	a4,s1,a4
    80007c00:	01874703          	lbu	a4,24(a4)
    80007c04:	0017869b          	addiw	a3,a5,1
    80007c08:	08d4ac23          	sw	a3,152(s1)
    80007c0c:	00070c9b          	sext.w	s9,a4
    80007c10:	f5371ee3          	bne	a4,s3,80007b6c <consoleread+0x88>
    80007c14:	000b851b          	sext.w	a0,s7
    80007c18:	f96bf2e3          	bgeu	s7,s6,80007b9c <consoleread+0xb8>
    80007c1c:	08f4ac23          	sw	a5,152(s1)
    80007c20:	f7dff06f          	j	80007b9c <consoleread+0xb8>

0000000080007c24 <consputc>:
    80007c24:	10000793          	li	a5,256
    80007c28:	00f50663          	beq	a0,a5,80007c34 <consputc+0x10>
    80007c2c:	00001317          	auipc	t1,0x1
    80007c30:	9f430067          	jr	-1548(t1) # 80008620 <uartputc_sync>
    80007c34:	ff010113          	addi	sp,sp,-16
    80007c38:	00113423          	sd	ra,8(sp)
    80007c3c:	00813023          	sd	s0,0(sp)
    80007c40:	01010413          	addi	s0,sp,16
    80007c44:	00800513          	li	a0,8
    80007c48:	00001097          	auipc	ra,0x1
    80007c4c:	9d8080e7          	jalr	-1576(ra) # 80008620 <uartputc_sync>
    80007c50:	02000513          	li	a0,32
    80007c54:	00001097          	auipc	ra,0x1
    80007c58:	9cc080e7          	jalr	-1588(ra) # 80008620 <uartputc_sync>
    80007c5c:	00013403          	ld	s0,0(sp)
    80007c60:	00813083          	ld	ra,8(sp)
    80007c64:	00800513          	li	a0,8
    80007c68:	01010113          	addi	sp,sp,16
    80007c6c:	00001317          	auipc	t1,0x1
    80007c70:	9b430067          	jr	-1612(t1) # 80008620 <uartputc_sync>

0000000080007c74 <consoleintr>:
    80007c74:	fe010113          	addi	sp,sp,-32
    80007c78:	00813823          	sd	s0,16(sp)
    80007c7c:	00913423          	sd	s1,8(sp)
    80007c80:	01213023          	sd	s2,0(sp)
    80007c84:	00113c23          	sd	ra,24(sp)
    80007c88:	02010413          	addi	s0,sp,32
    80007c8c:	00006917          	auipc	s2,0x6
    80007c90:	73c90913          	addi	s2,s2,1852 # 8000e3c8 <cons>
    80007c94:	00050493          	mv	s1,a0
    80007c98:	00090513          	mv	a0,s2
    80007c9c:	00001097          	auipc	ra,0x1
    80007ca0:	e40080e7          	jalr	-448(ra) # 80008adc <acquire>
    80007ca4:	02048c63          	beqz	s1,80007cdc <consoleintr+0x68>
    80007ca8:	0a092783          	lw	a5,160(s2)
    80007cac:	09892703          	lw	a4,152(s2)
    80007cb0:	07f00693          	li	a3,127
    80007cb4:	40e7873b          	subw	a4,a5,a4
    80007cb8:	02e6e263          	bltu	a3,a4,80007cdc <consoleintr+0x68>
    80007cbc:	00d00713          	li	a4,13
    80007cc0:	04e48063          	beq	s1,a4,80007d00 <consoleintr+0x8c>
    80007cc4:	07f7f713          	andi	a4,a5,127
    80007cc8:	00e90733          	add	a4,s2,a4
    80007ccc:	0017879b          	addiw	a5,a5,1
    80007cd0:	0af92023          	sw	a5,160(s2)
    80007cd4:	00970c23          	sb	s1,24(a4)
    80007cd8:	08f92e23          	sw	a5,156(s2)
    80007cdc:	01013403          	ld	s0,16(sp)
    80007ce0:	01813083          	ld	ra,24(sp)
    80007ce4:	00813483          	ld	s1,8(sp)
    80007ce8:	00013903          	ld	s2,0(sp)
    80007cec:	00006517          	auipc	a0,0x6
    80007cf0:	6dc50513          	addi	a0,a0,1756 # 8000e3c8 <cons>
    80007cf4:	02010113          	addi	sp,sp,32
    80007cf8:	00001317          	auipc	t1,0x1
    80007cfc:	eb030067          	jr	-336(t1) # 80008ba8 <release>
    80007d00:	00a00493          	li	s1,10
    80007d04:	fc1ff06f          	j	80007cc4 <consoleintr+0x50>

0000000080007d08 <consoleinit>:
    80007d08:	fe010113          	addi	sp,sp,-32
    80007d0c:	00113c23          	sd	ra,24(sp)
    80007d10:	00813823          	sd	s0,16(sp)
    80007d14:	00913423          	sd	s1,8(sp)
    80007d18:	02010413          	addi	s0,sp,32
    80007d1c:	00006497          	auipc	s1,0x6
    80007d20:	6ac48493          	addi	s1,s1,1708 # 8000e3c8 <cons>
    80007d24:	00048513          	mv	a0,s1
    80007d28:	00002597          	auipc	a1,0x2
    80007d2c:	79858593          	addi	a1,a1,1944 # 8000a4c0 <CONSOLE_STATUS+0x4b0>
    80007d30:	00001097          	auipc	ra,0x1
    80007d34:	d88080e7          	jalr	-632(ra) # 80008ab8 <initlock>
    80007d38:	00000097          	auipc	ra,0x0
    80007d3c:	7ac080e7          	jalr	1964(ra) # 800084e4 <uartinit>
    80007d40:	01813083          	ld	ra,24(sp)
    80007d44:	01013403          	ld	s0,16(sp)
    80007d48:	00000797          	auipc	a5,0x0
    80007d4c:	d9c78793          	addi	a5,a5,-612 # 80007ae4 <consoleread>
    80007d50:	0af4bc23          	sd	a5,184(s1)
    80007d54:	00000797          	auipc	a5,0x0
    80007d58:	cec78793          	addi	a5,a5,-788 # 80007a40 <consolewrite>
    80007d5c:	0cf4b023          	sd	a5,192(s1)
    80007d60:	00813483          	ld	s1,8(sp)
    80007d64:	02010113          	addi	sp,sp,32
    80007d68:	00008067          	ret

0000000080007d6c <console_read>:
    80007d6c:	ff010113          	addi	sp,sp,-16
    80007d70:	00813423          	sd	s0,8(sp)
    80007d74:	01010413          	addi	s0,sp,16
    80007d78:	00813403          	ld	s0,8(sp)
    80007d7c:	00006317          	auipc	t1,0x6
    80007d80:	70433303          	ld	t1,1796(t1) # 8000e480 <devsw+0x10>
    80007d84:	01010113          	addi	sp,sp,16
    80007d88:	00030067          	jr	t1

0000000080007d8c <console_write>:
    80007d8c:	ff010113          	addi	sp,sp,-16
    80007d90:	00813423          	sd	s0,8(sp)
    80007d94:	01010413          	addi	s0,sp,16
    80007d98:	00813403          	ld	s0,8(sp)
    80007d9c:	00006317          	auipc	t1,0x6
    80007da0:	6ec33303          	ld	t1,1772(t1) # 8000e488 <devsw+0x18>
    80007da4:	01010113          	addi	sp,sp,16
    80007da8:	00030067          	jr	t1

0000000080007dac <panic>:
    80007dac:	fe010113          	addi	sp,sp,-32
    80007db0:	00113c23          	sd	ra,24(sp)
    80007db4:	00813823          	sd	s0,16(sp)
    80007db8:	00913423          	sd	s1,8(sp)
    80007dbc:	02010413          	addi	s0,sp,32
    80007dc0:	00050493          	mv	s1,a0
    80007dc4:	00002517          	auipc	a0,0x2
    80007dc8:	70450513          	addi	a0,a0,1796 # 8000a4c8 <CONSOLE_STATUS+0x4b8>
    80007dcc:	00006797          	auipc	a5,0x6
    80007dd0:	7407ae23          	sw	zero,1884(a5) # 8000e528 <pr+0x18>
    80007dd4:	00000097          	auipc	ra,0x0
    80007dd8:	034080e7          	jalr	52(ra) # 80007e08 <__printf>
    80007ddc:	00048513          	mv	a0,s1
    80007de0:	00000097          	auipc	ra,0x0
    80007de4:	028080e7          	jalr	40(ra) # 80007e08 <__printf>
    80007de8:	00002517          	auipc	a0,0x2
    80007dec:	38050513          	addi	a0,a0,896 # 8000a168 <CONSOLE_STATUS+0x158>
    80007df0:	00000097          	auipc	ra,0x0
    80007df4:	018080e7          	jalr	24(ra) # 80007e08 <__printf>
    80007df8:	00100793          	li	a5,1
    80007dfc:	00005717          	auipc	a4,0x5
    80007e00:	f6f72e23          	sw	a5,-132(a4) # 8000cd78 <panicked>
    80007e04:	0000006f          	j	80007e04 <panic+0x58>

0000000080007e08 <__printf>:
    80007e08:	f3010113          	addi	sp,sp,-208
    80007e0c:	08813023          	sd	s0,128(sp)
    80007e10:	07313423          	sd	s3,104(sp)
    80007e14:	09010413          	addi	s0,sp,144
    80007e18:	05813023          	sd	s8,64(sp)
    80007e1c:	08113423          	sd	ra,136(sp)
    80007e20:	06913c23          	sd	s1,120(sp)
    80007e24:	07213823          	sd	s2,112(sp)
    80007e28:	07413023          	sd	s4,96(sp)
    80007e2c:	05513c23          	sd	s5,88(sp)
    80007e30:	05613823          	sd	s6,80(sp)
    80007e34:	05713423          	sd	s7,72(sp)
    80007e38:	03913c23          	sd	s9,56(sp)
    80007e3c:	03a13823          	sd	s10,48(sp)
    80007e40:	03b13423          	sd	s11,40(sp)
    80007e44:	00006317          	auipc	t1,0x6
    80007e48:	6cc30313          	addi	t1,t1,1740 # 8000e510 <pr>
    80007e4c:	01832c03          	lw	s8,24(t1)
    80007e50:	00b43423          	sd	a1,8(s0)
    80007e54:	00c43823          	sd	a2,16(s0)
    80007e58:	00d43c23          	sd	a3,24(s0)
    80007e5c:	02e43023          	sd	a4,32(s0)
    80007e60:	02f43423          	sd	a5,40(s0)
    80007e64:	03043823          	sd	a6,48(s0)
    80007e68:	03143c23          	sd	a7,56(s0)
    80007e6c:	00050993          	mv	s3,a0
    80007e70:	4a0c1663          	bnez	s8,8000831c <__printf+0x514>
    80007e74:	60098c63          	beqz	s3,8000848c <__printf+0x684>
    80007e78:	0009c503          	lbu	a0,0(s3)
    80007e7c:	00840793          	addi	a5,s0,8
    80007e80:	f6f43c23          	sd	a5,-136(s0)
    80007e84:	00000493          	li	s1,0
    80007e88:	22050063          	beqz	a0,800080a8 <__printf+0x2a0>
    80007e8c:	00002a37          	lui	s4,0x2
    80007e90:	00018ab7          	lui	s5,0x18
    80007e94:	000f4b37          	lui	s6,0xf4
    80007e98:	00989bb7          	lui	s7,0x989
    80007e9c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007ea0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007ea4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007ea8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007eac:	00148c9b          	addiw	s9,s1,1
    80007eb0:	02500793          	li	a5,37
    80007eb4:	01998933          	add	s2,s3,s9
    80007eb8:	38f51263          	bne	a0,a5,8000823c <__printf+0x434>
    80007ebc:	00094783          	lbu	a5,0(s2)
    80007ec0:	00078c9b          	sext.w	s9,a5
    80007ec4:	1e078263          	beqz	a5,800080a8 <__printf+0x2a0>
    80007ec8:	0024849b          	addiw	s1,s1,2
    80007ecc:	07000713          	li	a4,112
    80007ed0:	00998933          	add	s2,s3,s1
    80007ed4:	38e78a63          	beq	a5,a4,80008268 <__printf+0x460>
    80007ed8:	20f76863          	bltu	a4,a5,800080e8 <__printf+0x2e0>
    80007edc:	42a78863          	beq	a5,a0,8000830c <__printf+0x504>
    80007ee0:	06400713          	li	a4,100
    80007ee4:	40e79663          	bne	a5,a4,800082f0 <__printf+0x4e8>
    80007ee8:	f7843783          	ld	a5,-136(s0)
    80007eec:	0007a603          	lw	a2,0(a5)
    80007ef0:	00878793          	addi	a5,a5,8
    80007ef4:	f6f43c23          	sd	a5,-136(s0)
    80007ef8:	42064a63          	bltz	a2,8000832c <__printf+0x524>
    80007efc:	00a00713          	li	a4,10
    80007f00:	02e677bb          	remuw	a5,a2,a4
    80007f04:	00002d97          	auipc	s11,0x2
    80007f08:	5ecd8d93          	addi	s11,s11,1516 # 8000a4f0 <digits>
    80007f0c:	00900593          	li	a1,9
    80007f10:	0006051b          	sext.w	a0,a2
    80007f14:	00000c93          	li	s9,0
    80007f18:	02079793          	slli	a5,a5,0x20
    80007f1c:	0207d793          	srli	a5,a5,0x20
    80007f20:	00fd87b3          	add	a5,s11,a5
    80007f24:	0007c783          	lbu	a5,0(a5)
    80007f28:	02e656bb          	divuw	a3,a2,a4
    80007f2c:	f8f40023          	sb	a5,-128(s0)
    80007f30:	14c5d863          	bge	a1,a2,80008080 <__printf+0x278>
    80007f34:	06300593          	li	a1,99
    80007f38:	00100c93          	li	s9,1
    80007f3c:	02e6f7bb          	remuw	a5,a3,a4
    80007f40:	02079793          	slli	a5,a5,0x20
    80007f44:	0207d793          	srli	a5,a5,0x20
    80007f48:	00fd87b3          	add	a5,s11,a5
    80007f4c:	0007c783          	lbu	a5,0(a5)
    80007f50:	02e6d73b          	divuw	a4,a3,a4
    80007f54:	f8f400a3          	sb	a5,-127(s0)
    80007f58:	12a5f463          	bgeu	a1,a0,80008080 <__printf+0x278>
    80007f5c:	00a00693          	li	a3,10
    80007f60:	00900593          	li	a1,9
    80007f64:	02d777bb          	remuw	a5,a4,a3
    80007f68:	02079793          	slli	a5,a5,0x20
    80007f6c:	0207d793          	srli	a5,a5,0x20
    80007f70:	00fd87b3          	add	a5,s11,a5
    80007f74:	0007c503          	lbu	a0,0(a5)
    80007f78:	02d757bb          	divuw	a5,a4,a3
    80007f7c:	f8a40123          	sb	a0,-126(s0)
    80007f80:	48e5f263          	bgeu	a1,a4,80008404 <__printf+0x5fc>
    80007f84:	06300513          	li	a0,99
    80007f88:	02d7f5bb          	remuw	a1,a5,a3
    80007f8c:	02059593          	slli	a1,a1,0x20
    80007f90:	0205d593          	srli	a1,a1,0x20
    80007f94:	00bd85b3          	add	a1,s11,a1
    80007f98:	0005c583          	lbu	a1,0(a1)
    80007f9c:	02d7d7bb          	divuw	a5,a5,a3
    80007fa0:	f8b401a3          	sb	a1,-125(s0)
    80007fa4:	48e57263          	bgeu	a0,a4,80008428 <__printf+0x620>
    80007fa8:	3e700513          	li	a0,999
    80007fac:	02d7f5bb          	remuw	a1,a5,a3
    80007fb0:	02059593          	slli	a1,a1,0x20
    80007fb4:	0205d593          	srli	a1,a1,0x20
    80007fb8:	00bd85b3          	add	a1,s11,a1
    80007fbc:	0005c583          	lbu	a1,0(a1)
    80007fc0:	02d7d7bb          	divuw	a5,a5,a3
    80007fc4:	f8b40223          	sb	a1,-124(s0)
    80007fc8:	46e57663          	bgeu	a0,a4,80008434 <__printf+0x62c>
    80007fcc:	02d7f5bb          	remuw	a1,a5,a3
    80007fd0:	02059593          	slli	a1,a1,0x20
    80007fd4:	0205d593          	srli	a1,a1,0x20
    80007fd8:	00bd85b3          	add	a1,s11,a1
    80007fdc:	0005c583          	lbu	a1,0(a1)
    80007fe0:	02d7d7bb          	divuw	a5,a5,a3
    80007fe4:	f8b402a3          	sb	a1,-123(s0)
    80007fe8:	46ea7863          	bgeu	s4,a4,80008458 <__printf+0x650>
    80007fec:	02d7f5bb          	remuw	a1,a5,a3
    80007ff0:	02059593          	slli	a1,a1,0x20
    80007ff4:	0205d593          	srli	a1,a1,0x20
    80007ff8:	00bd85b3          	add	a1,s11,a1
    80007ffc:	0005c583          	lbu	a1,0(a1)
    80008000:	02d7d7bb          	divuw	a5,a5,a3
    80008004:	f8b40323          	sb	a1,-122(s0)
    80008008:	3eeaf863          	bgeu	s5,a4,800083f8 <__printf+0x5f0>
    8000800c:	02d7f5bb          	remuw	a1,a5,a3
    80008010:	02059593          	slli	a1,a1,0x20
    80008014:	0205d593          	srli	a1,a1,0x20
    80008018:	00bd85b3          	add	a1,s11,a1
    8000801c:	0005c583          	lbu	a1,0(a1)
    80008020:	02d7d7bb          	divuw	a5,a5,a3
    80008024:	f8b403a3          	sb	a1,-121(s0)
    80008028:	42eb7e63          	bgeu	s6,a4,80008464 <__printf+0x65c>
    8000802c:	02d7f5bb          	remuw	a1,a5,a3
    80008030:	02059593          	slli	a1,a1,0x20
    80008034:	0205d593          	srli	a1,a1,0x20
    80008038:	00bd85b3          	add	a1,s11,a1
    8000803c:	0005c583          	lbu	a1,0(a1)
    80008040:	02d7d7bb          	divuw	a5,a5,a3
    80008044:	f8b40423          	sb	a1,-120(s0)
    80008048:	42ebfc63          	bgeu	s7,a4,80008480 <__printf+0x678>
    8000804c:	02079793          	slli	a5,a5,0x20
    80008050:	0207d793          	srli	a5,a5,0x20
    80008054:	00fd8db3          	add	s11,s11,a5
    80008058:	000dc703          	lbu	a4,0(s11)
    8000805c:	00a00793          	li	a5,10
    80008060:	00900c93          	li	s9,9
    80008064:	f8e404a3          	sb	a4,-119(s0)
    80008068:	00065c63          	bgez	a2,80008080 <__printf+0x278>
    8000806c:	f9040713          	addi	a4,s0,-112
    80008070:	00f70733          	add	a4,a4,a5
    80008074:	02d00693          	li	a3,45
    80008078:	fed70823          	sb	a3,-16(a4)
    8000807c:	00078c93          	mv	s9,a5
    80008080:	f8040793          	addi	a5,s0,-128
    80008084:	01978cb3          	add	s9,a5,s9
    80008088:	f7f40d13          	addi	s10,s0,-129
    8000808c:	000cc503          	lbu	a0,0(s9)
    80008090:	fffc8c93          	addi	s9,s9,-1
    80008094:	00000097          	auipc	ra,0x0
    80008098:	b90080e7          	jalr	-1136(ra) # 80007c24 <consputc>
    8000809c:	ffac98e3          	bne	s9,s10,8000808c <__printf+0x284>
    800080a0:	00094503          	lbu	a0,0(s2)
    800080a4:	e00514e3          	bnez	a0,80007eac <__printf+0xa4>
    800080a8:	1a0c1663          	bnez	s8,80008254 <__printf+0x44c>
    800080ac:	08813083          	ld	ra,136(sp)
    800080b0:	08013403          	ld	s0,128(sp)
    800080b4:	07813483          	ld	s1,120(sp)
    800080b8:	07013903          	ld	s2,112(sp)
    800080bc:	06813983          	ld	s3,104(sp)
    800080c0:	06013a03          	ld	s4,96(sp)
    800080c4:	05813a83          	ld	s5,88(sp)
    800080c8:	05013b03          	ld	s6,80(sp)
    800080cc:	04813b83          	ld	s7,72(sp)
    800080d0:	04013c03          	ld	s8,64(sp)
    800080d4:	03813c83          	ld	s9,56(sp)
    800080d8:	03013d03          	ld	s10,48(sp)
    800080dc:	02813d83          	ld	s11,40(sp)
    800080e0:	0d010113          	addi	sp,sp,208
    800080e4:	00008067          	ret
    800080e8:	07300713          	li	a4,115
    800080ec:	1ce78a63          	beq	a5,a4,800082c0 <__printf+0x4b8>
    800080f0:	07800713          	li	a4,120
    800080f4:	1ee79e63          	bne	a5,a4,800082f0 <__printf+0x4e8>
    800080f8:	f7843783          	ld	a5,-136(s0)
    800080fc:	0007a703          	lw	a4,0(a5)
    80008100:	00878793          	addi	a5,a5,8
    80008104:	f6f43c23          	sd	a5,-136(s0)
    80008108:	28074263          	bltz	a4,8000838c <__printf+0x584>
    8000810c:	00002d97          	auipc	s11,0x2
    80008110:	3e4d8d93          	addi	s11,s11,996 # 8000a4f0 <digits>
    80008114:	00f77793          	andi	a5,a4,15
    80008118:	00fd87b3          	add	a5,s11,a5
    8000811c:	0007c683          	lbu	a3,0(a5)
    80008120:	00f00613          	li	a2,15
    80008124:	0007079b          	sext.w	a5,a4
    80008128:	f8d40023          	sb	a3,-128(s0)
    8000812c:	0047559b          	srliw	a1,a4,0x4
    80008130:	0047569b          	srliw	a3,a4,0x4
    80008134:	00000c93          	li	s9,0
    80008138:	0ee65063          	bge	a2,a4,80008218 <__printf+0x410>
    8000813c:	00f6f693          	andi	a3,a3,15
    80008140:	00dd86b3          	add	a3,s11,a3
    80008144:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80008148:	0087d79b          	srliw	a5,a5,0x8
    8000814c:	00100c93          	li	s9,1
    80008150:	f8d400a3          	sb	a3,-127(s0)
    80008154:	0cb67263          	bgeu	a2,a1,80008218 <__printf+0x410>
    80008158:	00f7f693          	andi	a3,a5,15
    8000815c:	00dd86b3          	add	a3,s11,a3
    80008160:	0006c583          	lbu	a1,0(a3)
    80008164:	00f00613          	li	a2,15
    80008168:	0047d69b          	srliw	a3,a5,0x4
    8000816c:	f8b40123          	sb	a1,-126(s0)
    80008170:	0047d593          	srli	a1,a5,0x4
    80008174:	28f67e63          	bgeu	a2,a5,80008410 <__printf+0x608>
    80008178:	00f6f693          	andi	a3,a3,15
    8000817c:	00dd86b3          	add	a3,s11,a3
    80008180:	0006c503          	lbu	a0,0(a3)
    80008184:	0087d813          	srli	a6,a5,0x8
    80008188:	0087d69b          	srliw	a3,a5,0x8
    8000818c:	f8a401a3          	sb	a0,-125(s0)
    80008190:	28b67663          	bgeu	a2,a1,8000841c <__printf+0x614>
    80008194:	00f6f693          	andi	a3,a3,15
    80008198:	00dd86b3          	add	a3,s11,a3
    8000819c:	0006c583          	lbu	a1,0(a3)
    800081a0:	00c7d513          	srli	a0,a5,0xc
    800081a4:	00c7d69b          	srliw	a3,a5,0xc
    800081a8:	f8b40223          	sb	a1,-124(s0)
    800081ac:	29067a63          	bgeu	a2,a6,80008440 <__printf+0x638>
    800081b0:	00f6f693          	andi	a3,a3,15
    800081b4:	00dd86b3          	add	a3,s11,a3
    800081b8:	0006c583          	lbu	a1,0(a3)
    800081bc:	0107d813          	srli	a6,a5,0x10
    800081c0:	0107d69b          	srliw	a3,a5,0x10
    800081c4:	f8b402a3          	sb	a1,-123(s0)
    800081c8:	28a67263          	bgeu	a2,a0,8000844c <__printf+0x644>
    800081cc:	00f6f693          	andi	a3,a3,15
    800081d0:	00dd86b3          	add	a3,s11,a3
    800081d4:	0006c683          	lbu	a3,0(a3)
    800081d8:	0147d79b          	srliw	a5,a5,0x14
    800081dc:	f8d40323          	sb	a3,-122(s0)
    800081e0:	21067663          	bgeu	a2,a6,800083ec <__printf+0x5e4>
    800081e4:	02079793          	slli	a5,a5,0x20
    800081e8:	0207d793          	srli	a5,a5,0x20
    800081ec:	00fd8db3          	add	s11,s11,a5
    800081f0:	000dc683          	lbu	a3,0(s11)
    800081f4:	00800793          	li	a5,8
    800081f8:	00700c93          	li	s9,7
    800081fc:	f8d403a3          	sb	a3,-121(s0)
    80008200:	00075c63          	bgez	a4,80008218 <__printf+0x410>
    80008204:	f9040713          	addi	a4,s0,-112
    80008208:	00f70733          	add	a4,a4,a5
    8000820c:	02d00693          	li	a3,45
    80008210:	fed70823          	sb	a3,-16(a4)
    80008214:	00078c93          	mv	s9,a5
    80008218:	f8040793          	addi	a5,s0,-128
    8000821c:	01978cb3          	add	s9,a5,s9
    80008220:	f7f40d13          	addi	s10,s0,-129
    80008224:	000cc503          	lbu	a0,0(s9)
    80008228:	fffc8c93          	addi	s9,s9,-1
    8000822c:	00000097          	auipc	ra,0x0
    80008230:	9f8080e7          	jalr	-1544(ra) # 80007c24 <consputc>
    80008234:	ff9d18e3          	bne	s10,s9,80008224 <__printf+0x41c>
    80008238:	0100006f          	j	80008248 <__printf+0x440>
    8000823c:	00000097          	auipc	ra,0x0
    80008240:	9e8080e7          	jalr	-1560(ra) # 80007c24 <consputc>
    80008244:	000c8493          	mv	s1,s9
    80008248:	00094503          	lbu	a0,0(s2)
    8000824c:	c60510e3          	bnez	a0,80007eac <__printf+0xa4>
    80008250:	e40c0ee3          	beqz	s8,800080ac <__printf+0x2a4>
    80008254:	00006517          	auipc	a0,0x6
    80008258:	2bc50513          	addi	a0,a0,700 # 8000e510 <pr>
    8000825c:	00001097          	auipc	ra,0x1
    80008260:	94c080e7          	jalr	-1716(ra) # 80008ba8 <release>
    80008264:	e49ff06f          	j	800080ac <__printf+0x2a4>
    80008268:	f7843783          	ld	a5,-136(s0)
    8000826c:	03000513          	li	a0,48
    80008270:	01000d13          	li	s10,16
    80008274:	00878713          	addi	a4,a5,8
    80008278:	0007bc83          	ld	s9,0(a5)
    8000827c:	f6e43c23          	sd	a4,-136(s0)
    80008280:	00000097          	auipc	ra,0x0
    80008284:	9a4080e7          	jalr	-1628(ra) # 80007c24 <consputc>
    80008288:	07800513          	li	a0,120
    8000828c:	00000097          	auipc	ra,0x0
    80008290:	998080e7          	jalr	-1640(ra) # 80007c24 <consputc>
    80008294:	00002d97          	auipc	s11,0x2
    80008298:	25cd8d93          	addi	s11,s11,604 # 8000a4f0 <digits>
    8000829c:	03ccd793          	srli	a5,s9,0x3c
    800082a0:	00fd87b3          	add	a5,s11,a5
    800082a4:	0007c503          	lbu	a0,0(a5)
    800082a8:	fffd0d1b          	addiw	s10,s10,-1
    800082ac:	004c9c93          	slli	s9,s9,0x4
    800082b0:	00000097          	auipc	ra,0x0
    800082b4:	974080e7          	jalr	-1676(ra) # 80007c24 <consputc>
    800082b8:	fe0d12e3          	bnez	s10,8000829c <__printf+0x494>
    800082bc:	f8dff06f          	j	80008248 <__printf+0x440>
    800082c0:	f7843783          	ld	a5,-136(s0)
    800082c4:	0007bc83          	ld	s9,0(a5)
    800082c8:	00878793          	addi	a5,a5,8
    800082cc:	f6f43c23          	sd	a5,-136(s0)
    800082d0:	000c9a63          	bnez	s9,800082e4 <__printf+0x4dc>
    800082d4:	1080006f          	j	800083dc <__printf+0x5d4>
    800082d8:	001c8c93          	addi	s9,s9,1
    800082dc:	00000097          	auipc	ra,0x0
    800082e0:	948080e7          	jalr	-1720(ra) # 80007c24 <consputc>
    800082e4:	000cc503          	lbu	a0,0(s9)
    800082e8:	fe0518e3          	bnez	a0,800082d8 <__printf+0x4d0>
    800082ec:	f5dff06f          	j	80008248 <__printf+0x440>
    800082f0:	02500513          	li	a0,37
    800082f4:	00000097          	auipc	ra,0x0
    800082f8:	930080e7          	jalr	-1744(ra) # 80007c24 <consputc>
    800082fc:	000c8513          	mv	a0,s9
    80008300:	00000097          	auipc	ra,0x0
    80008304:	924080e7          	jalr	-1756(ra) # 80007c24 <consputc>
    80008308:	f41ff06f          	j	80008248 <__printf+0x440>
    8000830c:	02500513          	li	a0,37
    80008310:	00000097          	auipc	ra,0x0
    80008314:	914080e7          	jalr	-1772(ra) # 80007c24 <consputc>
    80008318:	f31ff06f          	j	80008248 <__printf+0x440>
    8000831c:	00030513          	mv	a0,t1
    80008320:	00000097          	auipc	ra,0x0
    80008324:	7bc080e7          	jalr	1980(ra) # 80008adc <acquire>
    80008328:	b4dff06f          	j	80007e74 <__printf+0x6c>
    8000832c:	40c0053b          	negw	a0,a2
    80008330:	00a00713          	li	a4,10
    80008334:	02e576bb          	remuw	a3,a0,a4
    80008338:	00002d97          	auipc	s11,0x2
    8000833c:	1b8d8d93          	addi	s11,s11,440 # 8000a4f0 <digits>
    80008340:	ff700593          	li	a1,-9
    80008344:	02069693          	slli	a3,a3,0x20
    80008348:	0206d693          	srli	a3,a3,0x20
    8000834c:	00dd86b3          	add	a3,s11,a3
    80008350:	0006c683          	lbu	a3,0(a3)
    80008354:	02e557bb          	divuw	a5,a0,a4
    80008358:	f8d40023          	sb	a3,-128(s0)
    8000835c:	10b65e63          	bge	a2,a1,80008478 <__printf+0x670>
    80008360:	06300593          	li	a1,99
    80008364:	02e7f6bb          	remuw	a3,a5,a4
    80008368:	02069693          	slli	a3,a3,0x20
    8000836c:	0206d693          	srli	a3,a3,0x20
    80008370:	00dd86b3          	add	a3,s11,a3
    80008374:	0006c683          	lbu	a3,0(a3)
    80008378:	02e7d73b          	divuw	a4,a5,a4
    8000837c:	00200793          	li	a5,2
    80008380:	f8d400a3          	sb	a3,-127(s0)
    80008384:	bca5ece3          	bltu	a1,a0,80007f5c <__printf+0x154>
    80008388:	ce5ff06f          	j	8000806c <__printf+0x264>
    8000838c:	40e007bb          	negw	a5,a4
    80008390:	00002d97          	auipc	s11,0x2
    80008394:	160d8d93          	addi	s11,s11,352 # 8000a4f0 <digits>
    80008398:	00f7f693          	andi	a3,a5,15
    8000839c:	00dd86b3          	add	a3,s11,a3
    800083a0:	0006c583          	lbu	a1,0(a3)
    800083a4:	ff100613          	li	a2,-15
    800083a8:	0047d69b          	srliw	a3,a5,0x4
    800083ac:	f8b40023          	sb	a1,-128(s0)
    800083b0:	0047d59b          	srliw	a1,a5,0x4
    800083b4:	0ac75e63          	bge	a4,a2,80008470 <__printf+0x668>
    800083b8:	00f6f693          	andi	a3,a3,15
    800083bc:	00dd86b3          	add	a3,s11,a3
    800083c0:	0006c603          	lbu	a2,0(a3)
    800083c4:	00f00693          	li	a3,15
    800083c8:	0087d79b          	srliw	a5,a5,0x8
    800083cc:	f8c400a3          	sb	a2,-127(s0)
    800083d0:	d8b6e4e3          	bltu	a3,a1,80008158 <__printf+0x350>
    800083d4:	00200793          	li	a5,2
    800083d8:	e2dff06f          	j	80008204 <__printf+0x3fc>
    800083dc:	00002c97          	auipc	s9,0x2
    800083e0:	0f4c8c93          	addi	s9,s9,244 # 8000a4d0 <CONSOLE_STATUS+0x4c0>
    800083e4:	02800513          	li	a0,40
    800083e8:	ef1ff06f          	j	800082d8 <__printf+0x4d0>
    800083ec:	00700793          	li	a5,7
    800083f0:	00600c93          	li	s9,6
    800083f4:	e0dff06f          	j	80008200 <__printf+0x3f8>
    800083f8:	00700793          	li	a5,7
    800083fc:	00600c93          	li	s9,6
    80008400:	c69ff06f          	j	80008068 <__printf+0x260>
    80008404:	00300793          	li	a5,3
    80008408:	00200c93          	li	s9,2
    8000840c:	c5dff06f          	j	80008068 <__printf+0x260>
    80008410:	00300793          	li	a5,3
    80008414:	00200c93          	li	s9,2
    80008418:	de9ff06f          	j	80008200 <__printf+0x3f8>
    8000841c:	00400793          	li	a5,4
    80008420:	00300c93          	li	s9,3
    80008424:	dddff06f          	j	80008200 <__printf+0x3f8>
    80008428:	00400793          	li	a5,4
    8000842c:	00300c93          	li	s9,3
    80008430:	c39ff06f          	j	80008068 <__printf+0x260>
    80008434:	00500793          	li	a5,5
    80008438:	00400c93          	li	s9,4
    8000843c:	c2dff06f          	j	80008068 <__printf+0x260>
    80008440:	00500793          	li	a5,5
    80008444:	00400c93          	li	s9,4
    80008448:	db9ff06f          	j	80008200 <__printf+0x3f8>
    8000844c:	00600793          	li	a5,6
    80008450:	00500c93          	li	s9,5
    80008454:	dadff06f          	j	80008200 <__printf+0x3f8>
    80008458:	00600793          	li	a5,6
    8000845c:	00500c93          	li	s9,5
    80008460:	c09ff06f          	j	80008068 <__printf+0x260>
    80008464:	00800793          	li	a5,8
    80008468:	00700c93          	li	s9,7
    8000846c:	bfdff06f          	j	80008068 <__printf+0x260>
    80008470:	00100793          	li	a5,1
    80008474:	d91ff06f          	j	80008204 <__printf+0x3fc>
    80008478:	00100793          	li	a5,1
    8000847c:	bf1ff06f          	j	8000806c <__printf+0x264>
    80008480:	00900793          	li	a5,9
    80008484:	00800c93          	li	s9,8
    80008488:	be1ff06f          	j	80008068 <__printf+0x260>
    8000848c:	00002517          	auipc	a0,0x2
    80008490:	04c50513          	addi	a0,a0,76 # 8000a4d8 <CONSOLE_STATUS+0x4c8>
    80008494:	00000097          	auipc	ra,0x0
    80008498:	918080e7          	jalr	-1768(ra) # 80007dac <panic>

000000008000849c <printfinit>:
    8000849c:	fe010113          	addi	sp,sp,-32
    800084a0:	00813823          	sd	s0,16(sp)
    800084a4:	00913423          	sd	s1,8(sp)
    800084a8:	00113c23          	sd	ra,24(sp)
    800084ac:	02010413          	addi	s0,sp,32
    800084b0:	00006497          	auipc	s1,0x6
    800084b4:	06048493          	addi	s1,s1,96 # 8000e510 <pr>
    800084b8:	00048513          	mv	a0,s1
    800084bc:	00002597          	auipc	a1,0x2
    800084c0:	02c58593          	addi	a1,a1,44 # 8000a4e8 <CONSOLE_STATUS+0x4d8>
    800084c4:	00000097          	auipc	ra,0x0
    800084c8:	5f4080e7          	jalr	1524(ra) # 80008ab8 <initlock>
    800084cc:	01813083          	ld	ra,24(sp)
    800084d0:	01013403          	ld	s0,16(sp)
    800084d4:	0004ac23          	sw	zero,24(s1)
    800084d8:	00813483          	ld	s1,8(sp)
    800084dc:	02010113          	addi	sp,sp,32
    800084e0:	00008067          	ret

00000000800084e4 <uartinit>:
    800084e4:	ff010113          	addi	sp,sp,-16
    800084e8:	00813423          	sd	s0,8(sp)
    800084ec:	01010413          	addi	s0,sp,16
    800084f0:	100007b7          	lui	a5,0x10000
    800084f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800084f8:	f8000713          	li	a4,-128
    800084fc:	00e781a3          	sb	a4,3(a5)
    80008500:	00300713          	li	a4,3
    80008504:	00e78023          	sb	a4,0(a5)
    80008508:	000780a3          	sb	zero,1(a5)
    8000850c:	00e781a3          	sb	a4,3(a5)
    80008510:	00700693          	li	a3,7
    80008514:	00d78123          	sb	a3,2(a5)
    80008518:	00e780a3          	sb	a4,1(a5)
    8000851c:	00813403          	ld	s0,8(sp)
    80008520:	01010113          	addi	sp,sp,16
    80008524:	00008067          	ret

0000000080008528 <uartputc>:
    80008528:	00005797          	auipc	a5,0x5
    8000852c:	8507a783          	lw	a5,-1968(a5) # 8000cd78 <panicked>
    80008530:	00078463          	beqz	a5,80008538 <uartputc+0x10>
    80008534:	0000006f          	j	80008534 <uartputc+0xc>
    80008538:	fd010113          	addi	sp,sp,-48
    8000853c:	02813023          	sd	s0,32(sp)
    80008540:	00913c23          	sd	s1,24(sp)
    80008544:	01213823          	sd	s2,16(sp)
    80008548:	01313423          	sd	s3,8(sp)
    8000854c:	02113423          	sd	ra,40(sp)
    80008550:	03010413          	addi	s0,sp,48
    80008554:	00005917          	auipc	s2,0x5
    80008558:	82c90913          	addi	s2,s2,-2004 # 8000cd80 <uart_tx_r>
    8000855c:	00093783          	ld	a5,0(s2)
    80008560:	00005497          	auipc	s1,0x5
    80008564:	82848493          	addi	s1,s1,-2008 # 8000cd88 <uart_tx_w>
    80008568:	0004b703          	ld	a4,0(s1)
    8000856c:	02078693          	addi	a3,a5,32
    80008570:	00050993          	mv	s3,a0
    80008574:	02e69c63          	bne	a3,a4,800085ac <uartputc+0x84>
    80008578:	00001097          	auipc	ra,0x1
    8000857c:	834080e7          	jalr	-1996(ra) # 80008dac <push_on>
    80008580:	00093783          	ld	a5,0(s2)
    80008584:	0004b703          	ld	a4,0(s1)
    80008588:	02078793          	addi	a5,a5,32
    8000858c:	00e79463          	bne	a5,a4,80008594 <uartputc+0x6c>
    80008590:	0000006f          	j	80008590 <uartputc+0x68>
    80008594:	00001097          	auipc	ra,0x1
    80008598:	88c080e7          	jalr	-1908(ra) # 80008e20 <pop_on>
    8000859c:	00093783          	ld	a5,0(s2)
    800085a0:	0004b703          	ld	a4,0(s1)
    800085a4:	02078693          	addi	a3,a5,32
    800085a8:	fce688e3          	beq	a3,a4,80008578 <uartputc+0x50>
    800085ac:	01f77693          	andi	a3,a4,31
    800085b0:	00006597          	auipc	a1,0x6
    800085b4:	f8058593          	addi	a1,a1,-128 # 8000e530 <uart_tx_buf>
    800085b8:	00d586b3          	add	a3,a1,a3
    800085bc:	00170713          	addi	a4,a4,1
    800085c0:	01368023          	sb	s3,0(a3)
    800085c4:	00e4b023          	sd	a4,0(s1)
    800085c8:	10000637          	lui	a2,0x10000
    800085cc:	02f71063          	bne	a4,a5,800085ec <uartputc+0xc4>
    800085d0:	0340006f          	j	80008604 <uartputc+0xdc>
    800085d4:	00074703          	lbu	a4,0(a4)
    800085d8:	00f93023          	sd	a5,0(s2)
    800085dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800085e0:	00093783          	ld	a5,0(s2)
    800085e4:	0004b703          	ld	a4,0(s1)
    800085e8:	00f70e63          	beq	a4,a5,80008604 <uartputc+0xdc>
    800085ec:	00564683          	lbu	a3,5(a2)
    800085f0:	01f7f713          	andi	a4,a5,31
    800085f4:	00e58733          	add	a4,a1,a4
    800085f8:	0206f693          	andi	a3,a3,32
    800085fc:	00178793          	addi	a5,a5,1
    80008600:	fc069ae3          	bnez	a3,800085d4 <uartputc+0xac>
    80008604:	02813083          	ld	ra,40(sp)
    80008608:	02013403          	ld	s0,32(sp)
    8000860c:	01813483          	ld	s1,24(sp)
    80008610:	01013903          	ld	s2,16(sp)
    80008614:	00813983          	ld	s3,8(sp)
    80008618:	03010113          	addi	sp,sp,48
    8000861c:	00008067          	ret

0000000080008620 <uartputc_sync>:
    80008620:	ff010113          	addi	sp,sp,-16
    80008624:	00813423          	sd	s0,8(sp)
    80008628:	01010413          	addi	s0,sp,16
    8000862c:	00004717          	auipc	a4,0x4
    80008630:	74c72703          	lw	a4,1868(a4) # 8000cd78 <panicked>
    80008634:	02071663          	bnez	a4,80008660 <uartputc_sync+0x40>
    80008638:	00050793          	mv	a5,a0
    8000863c:	100006b7          	lui	a3,0x10000
    80008640:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008644:	02077713          	andi	a4,a4,32
    80008648:	fe070ce3          	beqz	a4,80008640 <uartputc_sync+0x20>
    8000864c:	0ff7f793          	andi	a5,a5,255
    80008650:	00f68023          	sb	a5,0(a3)
    80008654:	00813403          	ld	s0,8(sp)
    80008658:	01010113          	addi	sp,sp,16
    8000865c:	00008067          	ret
    80008660:	0000006f          	j	80008660 <uartputc_sync+0x40>

0000000080008664 <uartstart>:
    80008664:	ff010113          	addi	sp,sp,-16
    80008668:	00813423          	sd	s0,8(sp)
    8000866c:	01010413          	addi	s0,sp,16
    80008670:	00004617          	auipc	a2,0x4
    80008674:	71060613          	addi	a2,a2,1808 # 8000cd80 <uart_tx_r>
    80008678:	00004517          	auipc	a0,0x4
    8000867c:	71050513          	addi	a0,a0,1808 # 8000cd88 <uart_tx_w>
    80008680:	00063783          	ld	a5,0(a2)
    80008684:	00053703          	ld	a4,0(a0)
    80008688:	04f70263          	beq	a4,a5,800086cc <uartstart+0x68>
    8000868c:	100005b7          	lui	a1,0x10000
    80008690:	00006817          	auipc	a6,0x6
    80008694:	ea080813          	addi	a6,a6,-352 # 8000e530 <uart_tx_buf>
    80008698:	01c0006f          	j	800086b4 <uartstart+0x50>
    8000869c:	0006c703          	lbu	a4,0(a3)
    800086a0:	00f63023          	sd	a5,0(a2)
    800086a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800086a8:	00063783          	ld	a5,0(a2)
    800086ac:	00053703          	ld	a4,0(a0)
    800086b0:	00f70e63          	beq	a4,a5,800086cc <uartstart+0x68>
    800086b4:	01f7f713          	andi	a4,a5,31
    800086b8:	00e806b3          	add	a3,a6,a4
    800086bc:	0055c703          	lbu	a4,5(a1)
    800086c0:	00178793          	addi	a5,a5,1
    800086c4:	02077713          	andi	a4,a4,32
    800086c8:	fc071ae3          	bnez	a4,8000869c <uartstart+0x38>
    800086cc:	00813403          	ld	s0,8(sp)
    800086d0:	01010113          	addi	sp,sp,16
    800086d4:	00008067          	ret

00000000800086d8 <uartgetc>:
    800086d8:	ff010113          	addi	sp,sp,-16
    800086dc:	00813423          	sd	s0,8(sp)
    800086e0:	01010413          	addi	s0,sp,16
    800086e4:	10000737          	lui	a4,0x10000
    800086e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800086ec:	0017f793          	andi	a5,a5,1
    800086f0:	00078c63          	beqz	a5,80008708 <uartgetc+0x30>
    800086f4:	00074503          	lbu	a0,0(a4)
    800086f8:	0ff57513          	andi	a0,a0,255
    800086fc:	00813403          	ld	s0,8(sp)
    80008700:	01010113          	addi	sp,sp,16
    80008704:	00008067          	ret
    80008708:	fff00513          	li	a0,-1
    8000870c:	ff1ff06f          	j	800086fc <uartgetc+0x24>

0000000080008710 <uartintr>:
    80008710:	100007b7          	lui	a5,0x10000
    80008714:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008718:	0017f793          	andi	a5,a5,1
    8000871c:	0a078463          	beqz	a5,800087c4 <uartintr+0xb4>
    80008720:	fe010113          	addi	sp,sp,-32
    80008724:	00813823          	sd	s0,16(sp)
    80008728:	00913423          	sd	s1,8(sp)
    8000872c:	00113c23          	sd	ra,24(sp)
    80008730:	02010413          	addi	s0,sp,32
    80008734:	100004b7          	lui	s1,0x10000
    80008738:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000873c:	0ff57513          	andi	a0,a0,255
    80008740:	fffff097          	auipc	ra,0xfffff
    80008744:	534080e7          	jalr	1332(ra) # 80007c74 <consoleintr>
    80008748:	0054c783          	lbu	a5,5(s1)
    8000874c:	0017f793          	andi	a5,a5,1
    80008750:	fe0794e3          	bnez	a5,80008738 <uartintr+0x28>
    80008754:	00004617          	auipc	a2,0x4
    80008758:	62c60613          	addi	a2,a2,1580 # 8000cd80 <uart_tx_r>
    8000875c:	00004517          	auipc	a0,0x4
    80008760:	62c50513          	addi	a0,a0,1580 # 8000cd88 <uart_tx_w>
    80008764:	00063783          	ld	a5,0(a2)
    80008768:	00053703          	ld	a4,0(a0)
    8000876c:	04f70263          	beq	a4,a5,800087b0 <uartintr+0xa0>
    80008770:	100005b7          	lui	a1,0x10000
    80008774:	00006817          	auipc	a6,0x6
    80008778:	dbc80813          	addi	a6,a6,-580 # 8000e530 <uart_tx_buf>
    8000877c:	01c0006f          	j	80008798 <uartintr+0x88>
    80008780:	0006c703          	lbu	a4,0(a3)
    80008784:	00f63023          	sd	a5,0(a2)
    80008788:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000878c:	00063783          	ld	a5,0(a2)
    80008790:	00053703          	ld	a4,0(a0)
    80008794:	00f70e63          	beq	a4,a5,800087b0 <uartintr+0xa0>
    80008798:	01f7f713          	andi	a4,a5,31
    8000879c:	00e806b3          	add	a3,a6,a4
    800087a0:	0055c703          	lbu	a4,5(a1)
    800087a4:	00178793          	addi	a5,a5,1
    800087a8:	02077713          	andi	a4,a4,32
    800087ac:	fc071ae3          	bnez	a4,80008780 <uartintr+0x70>
    800087b0:	01813083          	ld	ra,24(sp)
    800087b4:	01013403          	ld	s0,16(sp)
    800087b8:	00813483          	ld	s1,8(sp)
    800087bc:	02010113          	addi	sp,sp,32
    800087c0:	00008067          	ret
    800087c4:	00004617          	auipc	a2,0x4
    800087c8:	5bc60613          	addi	a2,a2,1468 # 8000cd80 <uart_tx_r>
    800087cc:	00004517          	auipc	a0,0x4
    800087d0:	5bc50513          	addi	a0,a0,1468 # 8000cd88 <uart_tx_w>
    800087d4:	00063783          	ld	a5,0(a2)
    800087d8:	00053703          	ld	a4,0(a0)
    800087dc:	04f70263          	beq	a4,a5,80008820 <uartintr+0x110>
    800087e0:	100005b7          	lui	a1,0x10000
    800087e4:	00006817          	auipc	a6,0x6
    800087e8:	d4c80813          	addi	a6,a6,-692 # 8000e530 <uart_tx_buf>
    800087ec:	01c0006f          	j	80008808 <uartintr+0xf8>
    800087f0:	0006c703          	lbu	a4,0(a3)
    800087f4:	00f63023          	sd	a5,0(a2)
    800087f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800087fc:	00063783          	ld	a5,0(a2)
    80008800:	00053703          	ld	a4,0(a0)
    80008804:	02f70063          	beq	a4,a5,80008824 <uartintr+0x114>
    80008808:	01f7f713          	andi	a4,a5,31
    8000880c:	00e806b3          	add	a3,a6,a4
    80008810:	0055c703          	lbu	a4,5(a1)
    80008814:	00178793          	addi	a5,a5,1
    80008818:	02077713          	andi	a4,a4,32
    8000881c:	fc071ae3          	bnez	a4,800087f0 <uartintr+0xe0>
    80008820:	00008067          	ret
    80008824:	00008067          	ret

0000000080008828 <kinit>:
    80008828:	fc010113          	addi	sp,sp,-64
    8000882c:	02913423          	sd	s1,40(sp)
    80008830:	fffff7b7          	lui	a5,0xfffff
    80008834:	00007497          	auipc	s1,0x7
    80008838:	d1b48493          	addi	s1,s1,-741 # 8000f54f <end+0xfff>
    8000883c:	02813823          	sd	s0,48(sp)
    80008840:	01313c23          	sd	s3,24(sp)
    80008844:	00f4f4b3          	and	s1,s1,a5
    80008848:	02113c23          	sd	ra,56(sp)
    8000884c:	03213023          	sd	s2,32(sp)
    80008850:	01413823          	sd	s4,16(sp)
    80008854:	01513423          	sd	s5,8(sp)
    80008858:	04010413          	addi	s0,sp,64
    8000885c:	000017b7          	lui	a5,0x1
    80008860:	01100993          	li	s3,17
    80008864:	00f487b3          	add	a5,s1,a5
    80008868:	01b99993          	slli	s3,s3,0x1b
    8000886c:	06f9e063          	bltu	s3,a5,800088cc <kinit+0xa4>
    80008870:	00006a97          	auipc	s5,0x6
    80008874:	ce0a8a93          	addi	s5,s5,-800 # 8000e550 <end>
    80008878:	0754ec63          	bltu	s1,s5,800088f0 <kinit+0xc8>
    8000887c:	0734fa63          	bgeu	s1,s3,800088f0 <kinit+0xc8>
    80008880:	00088a37          	lui	s4,0x88
    80008884:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008888:	00004917          	auipc	s2,0x4
    8000888c:	50890913          	addi	s2,s2,1288 # 8000cd90 <kmem>
    80008890:	00ca1a13          	slli	s4,s4,0xc
    80008894:	0140006f          	j	800088a8 <kinit+0x80>
    80008898:	000017b7          	lui	a5,0x1
    8000889c:	00f484b3          	add	s1,s1,a5
    800088a0:	0554e863          	bltu	s1,s5,800088f0 <kinit+0xc8>
    800088a4:	0534f663          	bgeu	s1,s3,800088f0 <kinit+0xc8>
    800088a8:	00001637          	lui	a2,0x1
    800088ac:	00100593          	li	a1,1
    800088b0:	00048513          	mv	a0,s1
    800088b4:	00000097          	auipc	ra,0x0
    800088b8:	5e4080e7          	jalr	1508(ra) # 80008e98 <__memset>
    800088bc:	00093783          	ld	a5,0(s2)
    800088c0:	00f4b023          	sd	a5,0(s1)
    800088c4:	00993023          	sd	s1,0(s2)
    800088c8:	fd4498e3          	bne	s1,s4,80008898 <kinit+0x70>
    800088cc:	03813083          	ld	ra,56(sp)
    800088d0:	03013403          	ld	s0,48(sp)
    800088d4:	02813483          	ld	s1,40(sp)
    800088d8:	02013903          	ld	s2,32(sp)
    800088dc:	01813983          	ld	s3,24(sp)
    800088e0:	01013a03          	ld	s4,16(sp)
    800088e4:	00813a83          	ld	s5,8(sp)
    800088e8:	04010113          	addi	sp,sp,64
    800088ec:	00008067          	ret
    800088f0:	00002517          	auipc	a0,0x2
    800088f4:	c1850513          	addi	a0,a0,-1000 # 8000a508 <digits+0x18>
    800088f8:	fffff097          	auipc	ra,0xfffff
    800088fc:	4b4080e7          	jalr	1204(ra) # 80007dac <panic>

0000000080008900 <freerange>:
    80008900:	fc010113          	addi	sp,sp,-64
    80008904:	000017b7          	lui	a5,0x1
    80008908:	02913423          	sd	s1,40(sp)
    8000890c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008910:	009504b3          	add	s1,a0,s1
    80008914:	fffff537          	lui	a0,0xfffff
    80008918:	02813823          	sd	s0,48(sp)
    8000891c:	02113c23          	sd	ra,56(sp)
    80008920:	03213023          	sd	s2,32(sp)
    80008924:	01313c23          	sd	s3,24(sp)
    80008928:	01413823          	sd	s4,16(sp)
    8000892c:	01513423          	sd	s5,8(sp)
    80008930:	01613023          	sd	s6,0(sp)
    80008934:	04010413          	addi	s0,sp,64
    80008938:	00a4f4b3          	and	s1,s1,a0
    8000893c:	00f487b3          	add	a5,s1,a5
    80008940:	06f5e463          	bltu	a1,a5,800089a8 <freerange+0xa8>
    80008944:	00006a97          	auipc	s5,0x6
    80008948:	c0ca8a93          	addi	s5,s5,-1012 # 8000e550 <end>
    8000894c:	0954e263          	bltu	s1,s5,800089d0 <freerange+0xd0>
    80008950:	01100993          	li	s3,17
    80008954:	01b99993          	slli	s3,s3,0x1b
    80008958:	0734fc63          	bgeu	s1,s3,800089d0 <freerange+0xd0>
    8000895c:	00058a13          	mv	s4,a1
    80008960:	00004917          	auipc	s2,0x4
    80008964:	43090913          	addi	s2,s2,1072 # 8000cd90 <kmem>
    80008968:	00002b37          	lui	s6,0x2
    8000896c:	0140006f          	j	80008980 <freerange+0x80>
    80008970:	000017b7          	lui	a5,0x1
    80008974:	00f484b3          	add	s1,s1,a5
    80008978:	0554ec63          	bltu	s1,s5,800089d0 <freerange+0xd0>
    8000897c:	0534fa63          	bgeu	s1,s3,800089d0 <freerange+0xd0>
    80008980:	00001637          	lui	a2,0x1
    80008984:	00100593          	li	a1,1
    80008988:	00048513          	mv	a0,s1
    8000898c:	00000097          	auipc	ra,0x0
    80008990:	50c080e7          	jalr	1292(ra) # 80008e98 <__memset>
    80008994:	00093703          	ld	a4,0(s2)
    80008998:	016487b3          	add	a5,s1,s6
    8000899c:	00e4b023          	sd	a4,0(s1)
    800089a0:	00993023          	sd	s1,0(s2)
    800089a4:	fcfa76e3          	bgeu	s4,a5,80008970 <freerange+0x70>
    800089a8:	03813083          	ld	ra,56(sp)
    800089ac:	03013403          	ld	s0,48(sp)
    800089b0:	02813483          	ld	s1,40(sp)
    800089b4:	02013903          	ld	s2,32(sp)
    800089b8:	01813983          	ld	s3,24(sp)
    800089bc:	01013a03          	ld	s4,16(sp)
    800089c0:	00813a83          	ld	s5,8(sp)
    800089c4:	00013b03          	ld	s6,0(sp)
    800089c8:	04010113          	addi	sp,sp,64
    800089cc:	00008067          	ret
    800089d0:	00002517          	auipc	a0,0x2
    800089d4:	b3850513          	addi	a0,a0,-1224 # 8000a508 <digits+0x18>
    800089d8:	fffff097          	auipc	ra,0xfffff
    800089dc:	3d4080e7          	jalr	980(ra) # 80007dac <panic>

00000000800089e0 <kfree>:
    800089e0:	fe010113          	addi	sp,sp,-32
    800089e4:	00813823          	sd	s0,16(sp)
    800089e8:	00113c23          	sd	ra,24(sp)
    800089ec:	00913423          	sd	s1,8(sp)
    800089f0:	02010413          	addi	s0,sp,32
    800089f4:	03451793          	slli	a5,a0,0x34
    800089f8:	04079c63          	bnez	a5,80008a50 <kfree+0x70>
    800089fc:	00006797          	auipc	a5,0x6
    80008a00:	b5478793          	addi	a5,a5,-1196 # 8000e550 <end>
    80008a04:	00050493          	mv	s1,a0
    80008a08:	04f56463          	bltu	a0,a5,80008a50 <kfree+0x70>
    80008a0c:	01100793          	li	a5,17
    80008a10:	01b79793          	slli	a5,a5,0x1b
    80008a14:	02f57e63          	bgeu	a0,a5,80008a50 <kfree+0x70>
    80008a18:	00001637          	lui	a2,0x1
    80008a1c:	00100593          	li	a1,1
    80008a20:	00000097          	auipc	ra,0x0
    80008a24:	478080e7          	jalr	1144(ra) # 80008e98 <__memset>
    80008a28:	00004797          	auipc	a5,0x4
    80008a2c:	36878793          	addi	a5,a5,872 # 8000cd90 <kmem>
    80008a30:	0007b703          	ld	a4,0(a5)
    80008a34:	01813083          	ld	ra,24(sp)
    80008a38:	01013403          	ld	s0,16(sp)
    80008a3c:	00e4b023          	sd	a4,0(s1)
    80008a40:	0097b023          	sd	s1,0(a5)
    80008a44:	00813483          	ld	s1,8(sp)
    80008a48:	02010113          	addi	sp,sp,32
    80008a4c:	00008067          	ret
    80008a50:	00002517          	auipc	a0,0x2
    80008a54:	ab850513          	addi	a0,a0,-1352 # 8000a508 <digits+0x18>
    80008a58:	fffff097          	auipc	ra,0xfffff
    80008a5c:	354080e7          	jalr	852(ra) # 80007dac <panic>

0000000080008a60 <kalloc>:
    80008a60:	fe010113          	addi	sp,sp,-32
    80008a64:	00813823          	sd	s0,16(sp)
    80008a68:	00913423          	sd	s1,8(sp)
    80008a6c:	00113c23          	sd	ra,24(sp)
    80008a70:	02010413          	addi	s0,sp,32
    80008a74:	00004797          	auipc	a5,0x4
    80008a78:	31c78793          	addi	a5,a5,796 # 8000cd90 <kmem>
    80008a7c:	0007b483          	ld	s1,0(a5)
    80008a80:	02048063          	beqz	s1,80008aa0 <kalloc+0x40>
    80008a84:	0004b703          	ld	a4,0(s1)
    80008a88:	00001637          	lui	a2,0x1
    80008a8c:	00500593          	li	a1,5
    80008a90:	00048513          	mv	a0,s1
    80008a94:	00e7b023          	sd	a4,0(a5)
    80008a98:	00000097          	auipc	ra,0x0
    80008a9c:	400080e7          	jalr	1024(ra) # 80008e98 <__memset>
    80008aa0:	01813083          	ld	ra,24(sp)
    80008aa4:	01013403          	ld	s0,16(sp)
    80008aa8:	00048513          	mv	a0,s1
    80008aac:	00813483          	ld	s1,8(sp)
    80008ab0:	02010113          	addi	sp,sp,32
    80008ab4:	00008067          	ret

0000000080008ab8 <initlock>:
    80008ab8:	ff010113          	addi	sp,sp,-16
    80008abc:	00813423          	sd	s0,8(sp)
    80008ac0:	01010413          	addi	s0,sp,16
    80008ac4:	00813403          	ld	s0,8(sp)
    80008ac8:	00b53423          	sd	a1,8(a0)
    80008acc:	00052023          	sw	zero,0(a0)
    80008ad0:	00053823          	sd	zero,16(a0)
    80008ad4:	01010113          	addi	sp,sp,16
    80008ad8:	00008067          	ret

0000000080008adc <acquire>:
    80008adc:	fe010113          	addi	sp,sp,-32
    80008ae0:	00813823          	sd	s0,16(sp)
    80008ae4:	00913423          	sd	s1,8(sp)
    80008ae8:	00113c23          	sd	ra,24(sp)
    80008aec:	01213023          	sd	s2,0(sp)
    80008af0:	02010413          	addi	s0,sp,32
    80008af4:	00050493          	mv	s1,a0
    80008af8:	10002973          	csrr	s2,sstatus
    80008afc:	100027f3          	csrr	a5,sstatus
    80008b00:	ffd7f793          	andi	a5,a5,-3
    80008b04:	10079073          	csrw	sstatus,a5
    80008b08:	fffff097          	auipc	ra,0xfffff
    80008b0c:	8e0080e7          	jalr	-1824(ra) # 800073e8 <mycpu>
    80008b10:	07852783          	lw	a5,120(a0)
    80008b14:	06078e63          	beqz	a5,80008b90 <acquire+0xb4>
    80008b18:	fffff097          	auipc	ra,0xfffff
    80008b1c:	8d0080e7          	jalr	-1840(ra) # 800073e8 <mycpu>
    80008b20:	07852783          	lw	a5,120(a0)
    80008b24:	0004a703          	lw	a4,0(s1)
    80008b28:	0017879b          	addiw	a5,a5,1
    80008b2c:	06f52c23          	sw	a5,120(a0)
    80008b30:	04071063          	bnez	a4,80008b70 <acquire+0x94>
    80008b34:	00100713          	li	a4,1
    80008b38:	00070793          	mv	a5,a4
    80008b3c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008b40:	0007879b          	sext.w	a5,a5
    80008b44:	fe079ae3          	bnez	a5,80008b38 <acquire+0x5c>
    80008b48:	0ff0000f          	fence
    80008b4c:	fffff097          	auipc	ra,0xfffff
    80008b50:	89c080e7          	jalr	-1892(ra) # 800073e8 <mycpu>
    80008b54:	01813083          	ld	ra,24(sp)
    80008b58:	01013403          	ld	s0,16(sp)
    80008b5c:	00a4b823          	sd	a0,16(s1)
    80008b60:	00013903          	ld	s2,0(sp)
    80008b64:	00813483          	ld	s1,8(sp)
    80008b68:	02010113          	addi	sp,sp,32
    80008b6c:	00008067          	ret
    80008b70:	0104b903          	ld	s2,16(s1)
    80008b74:	fffff097          	auipc	ra,0xfffff
    80008b78:	874080e7          	jalr	-1932(ra) # 800073e8 <mycpu>
    80008b7c:	faa91ce3          	bne	s2,a0,80008b34 <acquire+0x58>
    80008b80:	00002517          	auipc	a0,0x2
    80008b84:	99050513          	addi	a0,a0,-1648 # 8000a510 <digits+0x20>
    80008b88:	fffff097          	auipc	ra,0xfffff
    80008b8c:	224080e7          	jalr	548(ra) # 80007dac <panic>
    80008b90:	00195913          	srli	s2,s2,0x1
    80008b94:	fffff097          	auipc	ra,0xfffff
    80008b98:	854080e7          	jalr	-1964(ra) # 800073e8 <mycpu>
    80008b9c:	00197913          	andi	s2,s2,1
    80008ba0:	07252e23          	sw	s2,124(a0)
    80008ba4:	f75ff06f          	j	80008b18 <acquire+0x3c>

0000000080008ba8 <release>:
    80008ba8:	fe010113          	addi	sp,sp,-32
    80008bac:	00813823          	sd	s0,16(sp)
    80008bb0:	00113c23          	sd	ra,24(sp)
    80008bb4:	00913423          	sd	s1,8(sp)
    80008bb8:	01213023          	sd	s2,0(sp)
    80008bbc:	02010413          	addi	s0,sp,32
    80008bc0:	00052783          	lw	a5,0(a0)
    80008bc4:	00079a63          	bnez	a5,80008bd8 <release+0x30>
    80008bc8:	00002517          	auipc	a0,0x2
    80008bcc:	95050513          	addi	a0,a0,-1712 # 8000a518 <digits+0x28>
    80008bd0:	fffff097          	auipc	ra,0xfffff
    80008bd4:	1dc080e7          	jalr	476(ra) # 80007dac <panic>
    80008bd8:	01053903          	ld	s2,16(a0)
    80008bdc:	00050493          	mv	s1,a0
    80008be0:	fffff097          	auipc	ra,0xfffff
    80008be4:	808080e7          	jalr	-2040(ra) # 800073e8 <mycpu>
    80008be8:	fea910e3          	bne	s2,a0,80008bc8 <release+0x20>
    80008bec:	0004b823          	sd	zero,16(s1)
    80008bf0:	0ff0000f          	fence
    80008bf4:	0f50000f          	fence	iorw,ow
    80008bf8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80008bfc:	ffffe097          	auipc	ra,0xffffe
    80008c00:	7ec080e7          	jalr	2028(ra) # 800073e8 <mycpu>
    80008c04:	100027f3          	csrr	a5,sstatus
    80008c08:	0027f793          	andi	a5,a5,2
    80008c0c:	04079a63          	bnez	a5,80008c60 <release+0xb8>
    80008c10:	07852783          	lw	a5,120(a0)
    80008c14:	02f05e63          	blez	a5,80008c50 <release+0xa8>
    80008c18:	fff7871b          	addiw	a4,a5,-1
    80008c1c:	06e52c23          	sw	a4,120(a0)
    80008c20:	00071c63          	bnez	a4,80008c38 <release+0x90>
    80008c24:	07c52783          	lw	a5,124(a0)
    80008c28:	00078863          	beqz	a5,80008c38 <release+0x90>
    80008c2c:	100027f3          	csrr	a5,sstatus
    80008c30:	0027e793          	ori	a5,a5,2
    80008c34:	10079073          	csrw	sstatus,a5
    80008c38:	01813083          	ld	ra,24(sp)
    80008c3c:	01013403          	ld	s0,16(sp)
    80008c40:	00813483          	ld	s1,8(sp)
    80008c44:	00013903          	ld	s2,0(sp)
    80008c48:	02010113          	addi	sp,sp,32
    80008c4c:	00008067          	ret
    80008c50:	00002517          	auipc	a0,0x2
    80008c54:	8e850513          	addi	a0,a0,-1816 # 8000a538 <digits+0x48>
    80008c58:	fffff097          	auipc	ra,0xfffff
    80008c5c:	154080e7          	jalr	340(ra) # 80007dac <panic>
    80008c60:	00002517          	auipc	a0,0x2
    80008c64:	8c050513          	addi	a0,a0,-1856 # 8000a520 <digits+0x30>
    80008c68:	fffff097          	auipc	ra,0xfffff
    80008c6c:	144080e7          	jalr	324(ra) # 80007dac <panic>

0000000080008c70 <holding>:
    80008c70:	00052783          	lw	a5,0(a0)
    80008c74:	00079663          	bnez	a5,80008c80 <holding+0x10>
    80008c78:	00000513          	li	a0,0
    80008c7c:	00008067          	ret
    80008c80:	fe010113          	addi	sp,sp,-32
    80008c84:	00813823          	sd	s0,16(sp)
    80008c88:	00913423          	sd	s1,8(sp)
    80008c8c:	00113c23          	sd	ra,24(sp)
    80008c90:	02010413          	addi	s0,sp,32
    80008c94:	01053483          	ld	s1,16(a0)
    80008c98:	ffffe097          	auipc	ra,0xffffe
    80008c9c:	750080e7          	jalr	1872(ra) # 800073e8 <mycpu>
    80008ca0:	01813083          	ld	ra,24(sp)
    80008ca4:	01013403          	ld	s0,16(sp)
    80008ca8:	40a48533          	sub	a0,s1,a0
    80008cac:	00153513          	seqz	a0,a0
    80008cb0:	00813483          	ld	s1,8(sp)
    80008cb4:	02010113          	addi	sp,sp,32
    80008cb8:	00008067          	ret

0000000080008cbc <push_off>:
    80008cbc:	fe010113          	addi	sp,sp,-32
    80008cc0:	00813823          	sd	s0,16(sp)
    80008cc4:	00113c23          	sd	ra,24(sp)
    80008cc8:	00913423          	sd	s1,8(sp)
    80008ccc:	02010413          	addi	s0,sp,32
    80008cd0:	100024f3          	csrr	s1,sstatus
    80008cd4:	100027f3          	csrr	a5,sstatus
    80008cd8:	ffd7f793          	andi	a5,a5,-3
    80008cdc:	10079073          	csrw	sstatus,a5
    80008ce0:	ffffe097          	auipc	ra,0xffffe
    80008ce4:	708080e7          	jalr	1800(ra) # 800073e8 <mycpu>
    80008ce8:	07852783          	lw	a5,120(a0)
    80008cec:	02078663          	beqz	a5,80008d18 <push_off+0x5c>
    80008cf0:	ffffe097          	auipc	ra,0xffffe
    80008cf4:	6f8080e7          	jalr	1784(ra) # 800073e8 <mycpu>
    80008cf8:	07852783          	lw	a5,120(a0)
    80008cfc:	01813083          	ld	ra,24(sp)
    80008d00:	01013403          	ld	s0,16(sp)
    80008d04:	0017879b          	addiw	a5,a5,1
    80008d08:	06f52c23          	sw	a5,120(a0)
    80008d0c:	00813483          	ld	s1,8(sp)
    80008d10:	02010113          	addi	sp,sp,32
    80008d14:	00008067          	ret
    80008d18:	0014d493          	srli	s1,s1,0x1
    80008d1c:	ffffe097          	auipc	ra,0xffffe
    80008d20:	6cc080e7          	jalr	1740(ra) # 800073e8 <mycpu>
    80008d24:	0014f493          	andi	s1,s1,1
    80008d28:	06952e23          	sw	s1,124(a0)
    80008d2c:	fc5ff06f          	j	80008cf0 <push_off+0x34>

0000000080008d30 <pop_off>:
    80008d30:	ff010113          	addi	sp,sp,-16
    80008d34:	00813023          	sd	s0,0(sp)
    80008d38:	00113423          	sd	ra,8(sp)
    80008d3c:	01010413          	addi	s0,sp,16
    80008d40:	ffffe097          	auipc	ra,0xffffe
    80008d44:	6a8080e7          	jalr	1704(ra) # 800073e8 <mycpu>
    80008d48:	100027f3          	csrr	a5,sstatus
    80008d4c:	0027f793          	andi	a5,a5,2
    80008d50:	04079663          	bnez	a5,80008d9c <pop_off+0x6c>
    80008d54:	07852783          	lw	a5,120(a0)
    80008d58:	02f05a63          	blez	a5,80008d8c <pop_off+0x5c>
    80008d5c:	fff7871b          	addiw	a4,a5,-1
    80008d60:	06e52c23          	sw	a4,120(a0)
    80008d64:	00071c63          	bnez	a4,80008d7c <pop_off+0x4c>
    80008d68:	07c52783          	lw	a5,124(a0)
    80008d6c:	00078863          	beqz	a5,80008d7c <pop_off+0x4c>
    80008d70:	100027f3          	csrr	a5,sstatus
    80008d74:	0027e793          	ori	a5,a5,2
    80008d78:	10079073          	csrw	sstatus,a5
    80008d7c:	00813083          	ld	ra,8(sp)
    80008d80:	00013403          	ld	s0,0(sp)
    80008d84:	01010113          	addi	sp,sp,16
    80008d88:	00008067          	ret
    80008d8c:	00001517          	auipc	a0,0x1
    80008d90:	7ac50513          	addi	a0,a0,1964 # 8000a538 <digits+0x48>
    80008d94:	fffff097          	auipc	ra,0xfffff
    80008d98:	018080e7          	jalr	24(ra) # 80007dac <panic>
    80008d9c:	00001517          	auipc	a0,0x1
    80008da0:	78450513          	addi	a0,a0,1924 # 8000a520 <digits+0x30>
    80008da4:	fffff097          	auipc	ra,0xfffff
    80008da8:	008080e7          	jalr	8(ra) # 80007dac <panic>

0000000080008dac <push_on>:
    80008dac:	fe010113          	addi	sp,sp,-32
    80008db0:	00813823          	sd	s0,16(sp)
    80008db4:	00113c23          	sd	ra,24(sp)
    80008db8:	00913423          	sd	s1,8(sp)
    80008dbc:	02010413          	addi	s0,sp,32
    80008dc0:	100024f3          	csrr	s1,sstatus
    80008dc4:	100027f3          	csrr	a5,sstatus
    80008dc8:	0027e793          	ori	a5,a5,2
    80008dcc:	10079073          	csrw	sstatus,a5
    80008dd0:	ffffe097          	auipc	ra,0xffffe
    80008dd4:	618080e7          	jalr	1560(ra) # 800073e8 <mycpu>
    80008dd8:	07852783          	lw	a5,120(a0)
    80008ddc:	02078663          	beqz	a5,80008e08 <push_on+0x5c>
    80008de0:	ffffe097          	auipc	ra,0xffffe
    80008de4:	608080e7          	jalr	1544(ra) # 800073e8 <mycpu>
    80008de8:	07852783          	lw	a5,120(a0)
    80008dec:	01813083          	ld	ra,24(sp)
    80008df0:	01013403          	ld	s0,16(sp)
    80008df4:	0017879b          	addiw	a5,a5,1
    80008df8:	06f52c23          	sw	a5,120(a0)
    80008dfc:	00813483          	ld	s1,8(sp)
    80008e00:	02010113          	addi	sp,sp,32
    80008e04:	00008067          	ret
    80008e08:	0014d493          	srli	s1,s1,0x1
    80008e0c:	ffffe097          	auipc	ra,0xffffe
    80008e10:	5dc080e7          	jalr	1500(ra) # 800073e8 <mycpu>
    80008e14:	0014f493          	andi	s1,s1,1
    80008e18:	06952e23          	sw	s1,124(a0)
    80008e1c:	fc5ff06f          	j	80008de0 <push_on+0x34>

0000000080008e20 <pop_on>:
    80008e20:	ff010113          	addi	sp,sp,-16
    80008e24:	00813023          	sd	s0,0(sp)
    80008e28:	00113423          	sd	ra,8(sp)
    80008e2c:	01010413          	addi	s0,sp,16
    80008e30:	ffffe097          	auipc	ra,0xffffe
    80008e34:	5b8080e7          	jalr	1464(ra) # 800073e8 <mycpu>
    80008e38:	100027f3          	csrr	a5,sstatus
    80008e3c:	0027f793          	andi	a5,a5,2
    80008e40:	04078463          	beqz	a5,80008e88 <pop_on+0x68>
    80008e44:	07852783          	lw	a5,120(a0)
    80008e48:	02f05863          	blez	a5,80008e78 <pop_on+0x58>
    80008e4c:	fff7879b          	addiw	a5,a5,-1
    80008e50:	06f52c23          	sw	a5,120(a0)
    80008e54:	07853783          	ld	a5,120(a0)
    80008e58:	00079863          	bnez	a5,80008e68 <pop_on+0x48>
    80008e5c:	100027f3          	csrr	a5,sstatus
    80008e60:	ffd7f793          	andi	a5,a5,-3
    80008e64:	10079073          	csrw	sstatus,a5
    80008e68:	00813083          	ld	ra,8(sp)
    80008e6c:	00013403          	ld	s0,0(sp)
    80008e70:	01010113          	addi	sp,sp,16
    80008e74:	00008067          	ret
    80008e78:	00001517          	auipc	a0,0x1
    80008e7c:	6e850513          	addi	a0,a0,1768 # 8000a560 <digits+0x70>
    80008e80:	fffff097          	auipc	ra,0xfffff
    80008e84:	f2c080e7          	jalr	-212(ra) # 80007dac <panic>
    80008e88:	00001517          	auipc	a0,0x1
    80008e8c:	6b850513          	addi	a0,a0,1720 # 8000a540 <digits+0x50>
    80008e90:	fffff097          	auipc	ra,0xfffff
    80008e94:	f1c080e7          	jalr	-228(ra) # 80007dac <panic>

0000000080008e98 <__memset>:
    80008e98:	ff010113          	addi	sp,sp,-16
    80008e9c:	00813423          	sd	s0,8(sp)
    80008ea0:	01010413          	addi	s0,sp,16
    80008ea4:	1a060e63          	beqz	a2,80009060 <__memset+0x1c8>
    80008ea8:	40a007b3          	neg	a5,a0
    80008eac:	0077f793          	andi	a5,a5,7
    80008eb0:	00778693          	addi	a3,a5,7
    80008eb4:	00b00813          	li	a6,11
    80008eb8:	0ff5f593          	andi	a1,a1,255
    80008ebc:	fff6071b          	addiw	a4,a2,-1
    80008ec0:	1b06e663          	bltu	a3,a6,8000906c <__memset+0x1d4>
    80008ec4:	1cd76463          	bltu	a4,a3,8000908c <__memset+0x1f4>
    80008ec8:	1a078e63          	beqz	a5,80009084 <__memset+0x1ec>
    80008ecc:	00b50023          	sb	a1,0(a0)
    80008ed0:	00100713          	li	a4,1
    80008ed4:	1ae78463          	beq	a5,a4,8000907c <__memset+0x1e4>
    80008ed8:	00b500a3          	sb	a1,1(a0)
    80008edc:	00200713          	li	a4,2
    80008ee0:	1ae78a63          	beq	a5,a4,80009094 <__memset+0x1fc>
    80008ee4:	00b50123          	sb	a1,2(a0)
    80008ee8:	00300713          	li	a4,3
    80008eec:	18e78463          	beq	a5,a4,80009074 <__memset+0x1dc>
    80008ef0:	00b501a3          	sb	a1,3(a0)
    80008ef4:	00400713          	li	a4,4
    80008ef8:	1ae78263          	beq	a5,a4,8000909c <__memset+0x204>
    80008efc:	00b50223          	sb	a1,4(a0)
    80008f00:	00500713          	li	a4,5
    80008f04:	1ae78063          	beq	a5,a4,800090a4 <__memset+0x20c>
    80008f08:	00b502a3          	sb	a1,5(a0)
    80008f0c:	00700713          	li	a4,7
    80008f10:	18e79e63          	bne	a5,a4,800090ac <__memset+0x214>
    80008f14:	00b50323          	sb	a1,6(a0)
    80008f18:	00700e93          	li	t4,7
    80008f1c:	00859713          	slli	a4,a1,0x8
    80008f20:	00e5e733          	or	a4,a1,a4
    80008f24:	01059e13          	slli	t3,a1,0x10
    80008f28:	01c76e33          	or	t3,a4,t3
    80008f2c:	01859313          	slli	t1,a1,0x18
    80008f30:	006e6333          	or	t1,t3,t1
    80008f34:	02059893          	slli	a7,a1,0x20
    80008f38:	40f60e3b          	subw	t3,a2,a5
    80008f3c:	011368b3          	or	a7,t1,a7
    80008f40:	02859813          	slli	a6,a1,0x28
    80008f44:	0108e833          	or	a6,a7,a6
    80008f48:	03059693          	slli	a3,a1,0x30
    80008f4c:	003e589b          	srliw	a7,t3,0x3
    80008f50:	00d866b3          	or	a3,a6,a3
    80008f54:	03859713          	slli	a4,a1,0x38
    80008f58:	00389813          	slli	a6,a7,0x3
    80008f5c:	00f507b3          	add	a5,a0,a5
    80008f60:	00e6e733          	or	a4,a3,a4
    80008f64:	000e089b          	sext.w	a7,t3
    80008f68:	00f806b3          	add	a3,a6,a5
    80008f6c:	00e7b023          	sd	a4,0(a5)
    80008f70:	00878793          	addi	a5,a5,8
    80008f74:	fed79ce3          	bne	a5,a3,80008f6c <__memset+0xd4>
    80008f78:	ff8e7793          	andi	a5,t3,-8
    80008f7c:	0007871b          	sext.w	a4,a5
    80008f80:	01d787bb          	addw	a5,a5,t4
    80008f84:	0ce88e63          	beq	a7,a4,80009060 <__memset+0x1c8>
    80008f88:	00f50733          	add	a4,a0,a5
    80008f8c:	00b70023          	sb	a1,0(a4)
    80008f90:	0017871b          	addiw	a4,a5,1
    80008f94:	0cc77663          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008f98:	00e50733          	add	a4,a0,a4
    80008f9c:	00b70023          	sb	a1,0(a4)
    80008fa0:	0027871b          	addiw	a4,a5,2
    80008fa4:	0ac77e63          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008fa8:	00e50733          	add	a4,a0,a4
    80008fac:	00b70023          	sb	a1,0(a4)
    80008fb0:	0037871b          	addiw	a4,a5,3
    80008fb4:	0ac77663          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008fb8:	00e50733          	add	a4,a0,a4
    80008fbc:	00b70023          	sb	a1,0(a4)
    80008fc0:	0047871b          	addiw	a4,a5,4
    80008fc4:	08c77e63          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008fc8:	00e50733          	add	a4,a0,a4
    80008fcc:	00b70023          	sb	a1,0(a4)
    80008fd0:	0057871b          	addiw	a4,a5,5
    80008fd4:	08c77663          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008fd8:	00e50733          	add	a4,a0,a4
    80008fdc:	00b70023          	sb	a1,0(a4)
    80008fe0:	0067871b          	addiw	a4,a5,6
    80008fe4:	06c77e63          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008fe8:	00e50733          	add	a4,a0,a4
    80008fec:	00b70023          	sb	a1,0(a4)
    80008ff0:	0077871b          	addiw	a4,a5,7
    80008ff4:	06c77663          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80008ff8:	00e50733          	add	a4,a0,a4
    80008ffc:	00b70023          	sb	a1,0(a4)
    80009000:	0087871b          	addiw	a4,a5,8
    80009004:	04c77e63          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80009008:	00e50733          	add	a4,a0,a4
    8000900c:	00b70023          	sb	a1,0(a4)
    80009010:	0097871b          	addiw	a4,a5,9
    80009014:	04c77663          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80009018:	00e50733          	add	a4,a0,a4
    8000901c:	00b70023          	sb	a1,0(a4)
    80009020:	00a7871b          	addiw	a4,a5,10
    80009024:	02c77e63          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80009028:	00e50733          	add	a4,a0,a4
    8000902c:	00b70023          	sb	a1,0(a4)
    80009030:	00b7871b          	addiw	a4,a5,11
    80009034:	02c77663          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80009038:	00e50733          	add	a4,a0,a4
    8000903c:	00b70023          	sb	a1,0(a4)
    80009040:	00c7871b          	addiw	a4,a5,12
    80009044:	00c77e63          	bgeu	a4,a2,80009060 <__memset+0x1c8>
    80009048:	00e50733          	add	a4,a0,a4
    8000904c:	00b70023          	sb	a1,0(a4)
    80009050:	00d7879b          	addiw	a5,a5,13
    80009054:	00c7f663          	bgeu	a5,a2,80009060 <__memset+0x1c8>
    80009058:	00f507b3          	add	a5,a0,a5
    8000905c:	00b78023          	sb	a1,0(a5)
    80009060:	00813403          	ld	s0,8(sp)
    80009064:	01010113          	addi	sp,sp,16
    80009068:	00008067          	ret
    8000906c:	00b00693          	li	a3,11
    80009070:	e55ff06f          	j	80008ec4 <__memset+0x2c>
    80009074:	00300e93          	li	t4,3
    80009078:	ea5ff06f          	j	80008f1c <__memset+0x84>
    8000907c:	00100e93          	li	t4,1
    80009080:	e9dff06f          	j	80008f1c <__memset+0x84>
    80009084:	00000e93          	li	t4,0
    80009088:	e95ff06f          	j	80008f1c <__memset+0x84>
    8000908c:	00000793          	li	a5,0
    80009090:	ef9ff06f          	j	80008f88 <__memset+0xf0>
    80009094:	00200e93          	li	t4,2
    80009098:	e85ff06f          	j	80008f1c <__memset+0x84>
    8000909c:	00400e93          	li	t4,4
    800090a0:	e7dff06f          	j	80008f1c <__memset+0x84>
    800090a4:	00500e93          	li	t4,5
    800090a8:	e75ff06f          	j	80008f1c <__memset+0x84>
    800090ac:	00600e93          	li	t4,6
    800090b0:	e6dff06f          	j	80008f1c <__memset+0x84>

00000000800090b4 <__memmove>:
    800090b4:	ff010113          	addi	sp,sp,-16
    800090b8:	00813423          	sd	s0,8(sp)
    800090bc:	01010413          	addi	s0,sp,16
    800090c0:	0e060863          	beqz	a2,800091b0 <__memmove+0xfc>
    800090c4:	fff6069b          	addiw	a3,a2,-1
    800090c8:	0006881b          	sext.w	a6,a3
    800090cc:	0ea5e863          	bltu	a1,a0,800091bc <__memmove+0x108>
    800090d0:	00758713          	addi	a4,a1,7
    800090d4:	00a5e7b3          	or	a5,a1,a0
    800090d8:	40a70733          	sub	a4,a4,a0
    800090dc:	0077f793          	andi	a5,a5,7
    800090e0:	00f73713          	sltiu	a4,a4,15
    800090e4:	00174713          	xori	a4,a4,1
    800090e8:	0017b793          	seqz	a5,a5
    800090ec:	00e7f7b3          	and	a5,a5,a4
    800090f0:	10078863          	beqz	a5,80009200 <__memmove+0x14c>
    800090f4:	00900793          	li	a5,9
    800090f8:	1107f463          	bgeu	a5,a6,80009200 <__memmove+0x14c>
    800090fc:	0036581b          	srliw	a6,a2,0x3
    80009100:	fff8081b          	addiw	a6,a6,-1
    80009104:	02081813          	slli	a6,a6,0x20
    80009108:	01d85893          	srli	a7,a6,0x1d
    8000910c:	00858813          	addi	a6,a1,8
    80009110:	00058793          	mv	a5,a1
    80009114:	00050713          	mv	a4,a0
    80009118:	01088833          	add	a6,a7,a6
    8000911c:	0007b883          	ld	a7,0(a5)
    80009120:	00878793          	addi	a5,a5,8
    80009124:	00870713          	addi	a4,a4,8
    80009128:	ff173c23          	sd	a7,-8(a4)
    8000912c:	ff0798e3          	bne	a5,a6,8000911c <__memmove+0x68>
    80009130:	ff867713          	andi	a4,a2,-8
    80009134:	02071793          	slli	a5,a4,0x20
    80009138:	0207d793          	srli	a5,a5,0x20
    8000913c:	00f585b3          	add	a1,a1,a5
    80009140:	40e686bb          	subw	a3,a3,a4
    80009144:	00f507b3          	add	a5,a0,a5
    80009148:	06e60463          	beq	a2,a4,800091b0 <__memmove+0xfc>
    8000914c:	0005c703          	lbu	a4,0(a1)
    80009150:	00e78023          	sb	a4,0(a5)
    80009154:	04068e63          	beqz	a3,800091b0 <__memmove+0xfc>
    80009158:	0015c603          	lbu	a2,1(a1)
    8000915c:	00100713          	li	a4,1
    80009160:	00c780a3          	sb	a2,1(a5)
    80009164:	04e68663          	beq	a3,a4,800091b0 <__memmove+0xfc>
    80009168:	0025c603          	lbu	a2,2(a1)
    8000916c:	00200713          	li	a4,2
    80009170:	00c78123          	sb	a2,2(a5)
    80009174:	02e68e63          	beq	a3,a4,800091b0 <__memmove+0xfc>
    80009178:	0035c603          	lbu	a2,3(a1)
    8000917c:	00300713          	li	a4,3
    80009180:	00c781a3          	sb	a2,3(a5)
    80009184:	02e68663          	beq	a3,a4,800091b0 <__memmove+0xfc>
    80009188:	0045c603          	lbu	a2,4(a1)
    8000918c:	00400713          	li	a4,4
    80009190:	00c78223          	sb	a2,4(a5)
    80009194:	00e68e63          	beq	a3,a4,800091b0 <__memmove+0xfc>
    80009198:	0055c603          	lbu	a2,5(a1)
    8000919c:	00500713          	li	a4,5
    800091a0:	00c782a3          	sb	a2,5(a5)
    800091a4:	00e68663          	beq	a3,a4,800091b0 <__memmove+0xfc>
    800091a8:	0065c703          	lbu	a4,6(a1)
    800091ac:	00e78323          	sb	a4,6(a5)
    800091b0:	00813403          	ld	s0,8(sp)
    800091b4:	01010113          	addi	sp,sp,16
    800091b8:	00008067          	ret
    800091bc:	02061713          	slli	a4,a2,0x20
    800091c0:	02075713          	srli	a4,a4,0x20
    800091c4:	00e587b3          	add	a5,a1,a4
    800091c8:	f0f574e3          	bgeu	a0,a5,800090d0 <__memmove+0x1c>
    800091cc:	02069613          	slli	a2,a3,0x20
    800091d0:	02065613          	srli	a2,a2,0x20
    800091d4:	fff64613          	not	a2,a2
    800091d8:	00e50733          	add	a4,a0,a4
    800091dc:	00c78633          	add	a2,a5,a2
    800091e0:	fff7c683          	lbu	a3,-1(a5)
    800091e4:	fff78793          	addi	a5,a5,-1
    800091e8:	fff70713          	addi	a4,a4,-1
    800091ec:	00d70023          	sb	a3,0(a4)
    800091f0:	fec798e3          	bne	a5,a2,800091e0 <__memmove+0x12c>
    800091f4:	00813403          	ld	s0,8(sp)
    800091f8:	01010113          	addi	sp,sp,16
    800091fc:	00008067          	ret
    80009200:	02069713          	slli	a4,a3,0x20
    80009204:	02075713          	srli	a4,a4,0x20
    80009208:	00170713          	addi	a4,a4,1
    8000920c:	00e50733          	add	a4,a0,a4
    80009210:	00050793          	mv	a5,a0
    80009214:	0005c683          	lbu	a3,0(a1)
    80009218:	00178793          	addi	a5,a5,1
    8000921c:	00158593          	addi	a1,a1,1
    80009220:	fed78fa3          	sb	a3,-1(a5)
    80009224:	fee798e3          	bne	a5,a4,80009214 <__memmove+0x160>
    80009228:	f89ff06f          	j	800091b0 <__memmove+0xfc>

000000008000922c <__putc>:
    8000922c:	fe010113          	addi	sp,sp,-32
    80009230:	00813823          	sd	s0,16(sp)
    80009234:	00113c23          	sd	ra,24(sp)
    80009238:	02010413          	addi	s0,sp,32
    8000923c:	00050793          	mv	a5,a0
    80009240:	fef40593          	addi	a1,s0,-17
    80009244:	00100613          	li	a2,1
    80009248:	00000513          	li	a0,0
    8000924c:	fef407a3          	sb	a5,-17(s0)
    80009250:	fffff097          	auipc	ra,0xfffff
    80009254:	b3c080e7          	jalr	-1220(ra) # 80007d8c <console_write>
    80009258:	01813083          	ld	ra,24(sp)
    8000925c:	01013403          	ld	s0,16(sp)
    80009260:	02010113          	addi	sp,sp,32
    80009264:	00008067          	ret

0000000080009268 <__getc>:
    80009268:	fe010113          	addi	sp,sp,-32
    8000926c:	00813823          	sd	s0,16(sp)
    80009270:	00113c23          	sd	ra,24(sp)
    80009274:	02010413          	addi	s0,sp,32
    80009278:	fe840593          	addi	a1,s0,-24
    8000927c:	00100613          	li	a2,1
    80009280:	00000513          	li	a0,0
    80009284:	fffff097          	auipc	ra,0xfffff
    80009288:	ae8080e7          	jalr	-1304(ra) # 80007d6c <console_read>
    8000928c:	fe844503          	lbu	a0,-24(s0)
    80009290:	01813083          	ld	ra,24(sp)
    80009294:	01013403          	ld	s0,16(sp)
    80009298:	02010113          	addi	sp,sp,32
    8000929c:	00008067          	ret

00000000800092a0 <console_handler>:
    800092a0:	fe010113          	addi	sp,sp,-32
    800092a4:	00813823          	sd	s0,16(sp)
    800092a8:	00113c23          	sd	ra,24(sp)
    800092ac:	00913423          	sd	s1,8(sp)
    800092b0:	02010413          	addi	s0,sp,32
    800092b4:	14202773          	csrr	a4,scause
    800092b8:	100027f3          	csrr	a5,sstatus
    800092bc:	0027f793          	andi	a5,a5,2
    800092c0:	06079e63          	bnez	a5,8000933c <console_handler+0x9c>
    800092c4:	00074c63          	bltz	a4,800092dc <console_handler+0x3c>
    800092c8:	01813083          	ld	ra,24(sp)
    800092cc:	01013403          	ld	s0,16(sp)
    800092d0:	00813483          	ld	s1,8(sp)
    800092d4:	02010113          	addi	sp,sp,32
    800092d8:	00008067          	ret
    800092dc:	0ff77713          	andi	a4,a4,255
    800092e0:	00900793          	li	a5,9
    800092e4:	fef712e3          	bne	a4,a5,800092c8 <console_handler+0x28>
    800092e8:	ffffe097          	auipc	ra,0xffffe
    800092ec:	6dc080e7          	jalr	1756(ra) # 800079c4 <plic_claim>
    800092f0:	00a00793          	li	a5,10
    800092f4:	00050493          	mv	s1,a0
    800092f8:	02f50c63          	beq	a0,a5,80009330 <console_handler+0x90>
    800092fc:	fc0506e3          	beqz	a0,800092c8 <console_handler+0x28>
    80009300:	00050593          	mv	a1,a0
    80009304:	00001517          	auipc	a0,0x1
    80009308:	16450513          	addi	a0,a0,356 # 8000a468 <CONSOLE_STATUS+0x458>
    8000930c:	fffff097          	auipc	ra,0xfffff
    80009310:	afc080e7          	jalr	-1284(ra) # 80007e08 <__printf>
    80009314:	01013403          	ld	s0,16(sp)
    80009318:	01813083          	ld	ra,24(sp)
    8000931c:	00048513          	mv	a0,s1
    80009320:	00813483          	ld	s1,8(sp)
    80009324:	02010113          	addi	sp,sp,32
    80009328:	ffffe317          	auipc	t1,0xffffe
    8000932c:	6d430067          	jr	1748(t1) # 800079fc <plic_complete>
    80009330:	fffff097          	auipc	ra,0xfffff
    80009334:	3e0080e7          	jalr	992(ra) # 80008710 <uartintr>
    80009338:	fddff06f          	j	80009314 <console_handler+0x74>
    8000933c:	00001517          	auipc	a0,0x1
    80009340:	22c50513          	addi	a0,a0,556 # 8000a568 <digits+0x78>
    80009344:	fffff097          	auipc	ra,0xfffff
    80009348:	a68080e7          	jalr	-1432(ra) # 80007dac <panic>
	...
