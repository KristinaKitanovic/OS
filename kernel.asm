
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	66813103          	ld	sp,1640(sp) # 8000b668 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	171060ef          	jal	ra,8000698c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <handle_interrupt>:
.global sem_close_trap
.global thread_wrapper

handle_interrupt:

            beqz a1, no_context
    80001000:	12058663          	beqz	a1,8000112c <no_context>

    	    addi sp, sp, -240
    80001004:	f1010113          	addi	sp,sp,-240
            sd ra, 0(sp)
    80001008:	00113023          	sd	ra,0(sp)
        	sd s0, 8(sp)
    8000100c:	00813423          	sd	s0,8(sp)
        	sd s1, 16(sp)
    80001010:	00913823          	sd	s1,16(sp)

        	sd s2, 24(sp)
    80001014:	01213c23          	sd	s2,24(sp)
        	sd s3, 32(sp)
    80001018:	03313023          	sd	s3,32(sp)
        	sd s4, 40(sp)
    8000101c:	03413423          	sd	s4,40(sp)
        	sd s5, 48(sp)
    80001020:	03513823          	sd	s5,48(sp)
        	sd s6, 56(sp)
    80001024:	03613c23          	sd	s6,56(sp)
        	sd s7, 64(sp)
    80001028:	05713023          	sd	s7,64(sp)
        	sd s8, 72(sp)
    8000102c:	05813423          	sd	s8,72(sp)
        	sd s9, 80(sp)
    80001030:	05913823          	sd	s9,80(sp)
        	sd s10, 88(sp)
    80001034:	05a13c23          	sd	s10,88(sp)
        	sd s11, 96(sp)
    80001038:	07b13023          	sd	s11,96(sp)
        	sd a1, 104(sp)
    8000103c:	06b13423          	sd	a1,104(sp)
        	sd a2, 112(sp)
    80001040:	06c13823          	sd	a2,112(sp)
        	sd a3, 120(sp)
    80001044:	06d13c23          	sd	a3,120(sp)
        	sd a4, 128(sp)
    80001048:	08e13023          	sd	a4,128(sp)
        	sd a5, 136(sp)
    8000104c:	08f13423          	sd	a5,136(sp)

        	sd a6, 144(sp)
    80001050:	09013823          	sd	a6,144(sp)
        	sd a7, 152(sp)
    80001054:	09113c23          	sd	a7,152(sp)
        	sd t0, 160(sp)
    80001058:	0a513023          	sd	t0,160(sp)
        	sd t1, 168(sp)
    8000105c:	0a613423          	sd	t1,168(sp)
        	sd t2, 176(sp)
    80001060:	0a713823          	sd	t2,176(sp)
        	sd t3, 184(sp)
    80001064:	0bc13c23          	sd	t3,184(sp)
        	sd t4, 192(sp)
    80001068:	0dd13023          	sd	t4,192(sp)
        	sd t5, 200(sp)
    8000106c:	0de13423          	sd	t5,200(sp)
        	sd t6, 208(sp)
    80001070:	0df13823          	sd	t6,208(sp)
        	sd gp, 216(sp)
    80001074:	0c313c23          	sd	gp,216(sp)

        	sd tp, 224(sp)
    80001078:	0e413023          	sd	tp,224(sp)
        	//save user sp
        	sd sp, 24(a1)
    8000107c:	0025bc23          	sd	sp,24(a1)
        	//upisi za vrednost pc-a ono sto se nalazi u sepc
        	csrr t0, sepc
    80001080:	141022f3          	csrr	t0,sepc
        	addi t0, t0, 4
    80001084:	00428293          	addi	t0,t0,4
        	sd t0, 0(a1)
    80001088:	0055b023          	sd	t0,0(a1)

        	csrr t0, sstatus
    8000108c:	100022f3          	csrr	t0,sstatus

        	 sd t0, 40(a1)
    80001090:	0255b423          	sd	t0,40(a1)

        	//switch to kernel stack ssp
        	ld sp, 32(a1)
    80001094:	0205b103          	ld	sp,32(a1)

            csrw sscratch, a1
    80001098:	14059073          	csrw	sscratch,a1
        	call interrupt
    8000109c:	069010ef          	jal	ra,80002904 <interrupt>
        	csrr a1, sscratch
    800010a0:	140025f3          	csrr	a1,sscratch

            //return to user stack
            ld sp, 24(a1)
    800010a4:	0185b103          	ld	sp,24(a1)

        	ld ra, 0(sp)
    800010a8:	00013083          	ld	ra,0(sp)
            ld s0, 8(sp)
    800010ac:	00813403          	ld	s0,8(sp)
            ld s1, 16(sp)
    800010b0:	01013483          	ld	s1,16(sp)
            ld s2, 24(sp)
    800010b4:	01813903          	ld	s2,24(sp)
            ld s3, 32(sp)
    800010b8:	02013983          	ld	s3,32(sp)
            ld s4, 40(sp)
    800010bc:	02813a03          	ld	s4,40(sp)
            ld s5, 48(sp)
    800010c0:	03013a83          	ld	s5,48(sp)
            ld s6, 56(sp)
    800010c4:	03813b03          	ld	s6,56(sp)
            ld s7, 64(sp)
    800010c8:	04013b83          	ld	s7,64(sp)
            ld s8, 72(sp)
    800010cc:	04813c03          	ld	s8,72(sp)
            ld s9, 80(sp)
    800010d0:	05013c83          	ld	s9,80(sp)
            ld s10, 88(sp)
    800010d4:	05813d03          	ld	s10,88(sp)
            ld s11, 96(sp)
    800010d8:	06013d83          	ld	s11,96(sp)

            ld a2, 112(sp)
    800010dc:	07013603          	ld	a2,112(sp)
            ld a3, 120(sp)
    800010e0:	07813683          	ld	a3,120(sp)
            ld a4, 128(sp)
    800010e4:	08013703          	ld	a4,128(sp)
            ld a5, 136(sp)
    800010e8:	08813783          	ld	a5,136(sp)
            ld a6, 144(sp)
    800010ec:	09013803          	ld	a6,144(sp)
            ld a7, 152(sp)
    800010f0:	09813883          	ld	a7,152(sp)
            ld t0, 160(sp)
    800010f4:	0a013283          	ld	t0,160(sp)
            ld t1, 168(sp)
    800010f8:	0a813303          	ld	t1,168(sp)
            ld t2, 176(sp)
    800010fc:	0b013383          	ld	t2,176(sp)
            ld t3, 184(sp)
    80001100:	0b813e03          	ld	t3,184(sp)
            ld t4, 192(sp)
    80001104:	0c013e83          	ld	t4,192(sp)
            ld t5, 200(sp)
    80001108:	0c813f03          	ld	t5,200(sp)
            ld t6, 208(sp)
    8000110c:	0d013f83          	ld	t6,208(sp)
            ld gp, 216(sp)
    80001110:	0d813183          	ld	gp,216(sp)
            ld tp, 224(sp)
    80001114:	0e013203          	ld	tp,224(sp)

            //take out pc from context and store it in sepc
            ld t0, 0(a1)
    80001118:	0005b283          	ld	t0,0(a1)
            csrw sepc, t0
    8000111c:	14129073          	csrw	sepc,t0



            ld a1, 104(sp)
    80001120:	06813583          	ld	a1,104(sp)

        	addi sp, sp, 240
    80001124:	0f010113          	addi	sp,sp,240
        	sret
    80001128:	10200073          	sret

000000008000112c <no_context>:
    no_context:
     addi sp, sp, -256
    8000112c:	f0010113          	addi	sp,sp,-256


            	sd ra, 8(sp)
    80001130:	00113423          	sd	ra,8(sp)
            	sd gp, 16(sp)
    80001134:	00313823          	sd	gp,16(sp)
            	sd tp, 24(sp)
    80001138:	00413c23          	sd	tp,24(sp)
            	sd s0, 32(sp)
    8000113c:	02813023          	sd	s0,32(sp)
            	sd s1, 40(sp)
    80001140:	02913423          	sd	s1,40(sp)
            	sd s2, 48(sp)
    80001144:	03213823          	sd	s2,48(sp)
            	sd s3, 56(sp)
    80001148:	03313c23          	sd	s3,56(sp)
            	sd s4, 64(sp)
    8000114c:	05413023          	sd	s4,64(sp)
            	sd s5, 72(sp)
    80001150:	05513423          	sd	s5,72(sp)
            	sd s6, 80(sp)
    80001154:	05613823          	sd	s6,80(sp)
            	sd s7, 88(sp)
    80001158:	05713c23          	sd	s7,88(sp)
            	sd s8, 96(sp)
    8000115c:	07813023          	sd	s8,96(sp)
            	sd s9, 104(sp)
    80001160:	07913423          	sd	s9,104(sp)
            	sd s10, 112(sp)
    80001164:	07a13823          	sd	s10,112(sp)
            	sd s11, 120(sp)
    80001168:	07b13c23          	sd	s11,120(sp)
            	sd a1, 136(sp)
    8000116c:	08b13423          	sd	a1,136(sp)
            	sd a2, 144(sp)
    80001170:	08c13823          	sd	a2,144(sp)
            	sd a3, 152(sp)
    80001174:	08d13c23          	sd	a3,152(sp)
            	sd a4, 160(sp)
    80001178:	0ae13023          	sd	a4,160(sp)
            	sd a5, 168(sp)
    8000117c:	0af13423          	sd	a5,168(sp)
            	sd a6, 176(sp)
    80001180:	0b013823          	sd	a6,176(sp)
            	sd a7, 184(sp)
    80001184:	0b113c23          	sd	a7,184(sp)
            	sd t0, 192(sp)
    80001188:	0c513023          	sd	t0,192(sp)
            	sd t1, 200(sp)
    8000118c:	0c613423          	sd	t1,200(sp)
            	sd t2, 208(sp)
    80001190:	0c713823          	sd	t2,208(sp)
            	sd t3, 216(sp)
    80001194:	0dc13c23          	sd	t3,216(sp)
            	sd t4, 224(sp)
    80001198:	0fd13023          	sd	t4,224(sp)
            	sd t5, 232(sp)
    8000119c:	0fe13423          	sd	t5,232(sp)
            	sd t6, 240(sp)
    800011a0:	0ff13823          	sd	t6,240(sp)

                csrw sscratch, sp
    800011a4:	14011073          	csrw	sscratch,sp
                call interrupt
    800011a8:	75c010ef          	jal	ra,80002904 <interrupt>
                csrr sp, sscratch
    800011ac:	14002173          	csrr	sp,sscratch


                ld ra, 8(sp)
    800011b0:	00813083          	ld	ra,8(sp)
                ld gp, 16(sp)
    800011b4:	01013183          	ld	gp,16(sp)
                ld tp, 24(sp)
    800011b8:	01813203          	ld	tp,24(sp)
                ld s0, 32(sp)
    800011bc:	02013403          	ld	s0,32(sp)
                ld s1, 40(sp)
    800011c0:	02813483          	ld	s1,40(sp)
                ld s2, 48(sp)
    800011c4:	03013903          	ld	s2,48(sp)
                ld s3, 56(sp)
    800011c8:	03813983          	ld	s3,56(sp)
                ld s4, 64(sp)
    800011cc:	04013a03          	ld	s4,64(sp)
                ld s5, 72(sp)
    800011d0:	04813a83          	ld	s5,72(sp)
                ld s6, 80(sp)
    800011d4:	05013b03          	ld	s6,80(sp)
                ld s7, 88(sp)
    800011d8:	05813b83          	ld	s7,88(sp)
                ld s8, 96(sp)
    800011dc:	06013c03          	ld	s8,96(sp)
                ld s9, 104(sp)
    800011e0:	06813c83          	ld	s9,104(sp)
                ld s10, 112(sp)
    800011e4:	07013d03          	ld	s10,112(sp)
                ld s11, 120(sp)
    800011e8:	07813d83          	ld	s11,120(sp)
                ld a1, 136(sp)
    800011ec:	08813583          	ld	a1,136(sp)
                ld a2, 144(sp)
    800011f0:	09013603          	ld	a2,144(sp)
                ld a3, 152(sp)
    800011f4:	09813683          	ld	a3,152(sp)
                ld a4, 160(sp)
    800011f8:	0a013703          	ld	a4,160(sp)
                ld a5, 168(sp)
    800011fc:	0a813783          	ld	a5,168(sp)
                ld a6, 176(sp)
    80001200:	0b013803          	ld	a6,176(sp)
                ld a7, 184(sp)
    80001204:	0b813883          	ld	a7,184(sp)
                ld t0, 192(sp)
    80001208:	0c013283          	ld	t0,192(sp)
                ld t1, 200(sp)
    8000120c:	0c813303          	ld	t1,200(sp)
                ld t2, 208(sp)
    80001210:	0d013383          	ld	t2,208(sp)
                ld t3, 216(sp)
    80001214:	0d813e03          	ld	t3,216(sp)
                ld t4, 224(sp)
    80001218:	0e013e83          	ld	t4,224(sp)
                ld t5, 232(sp)
    8000121c:	0e813f03          	ld	t5,232(sp)
                ld t6, 240(sp)
    80001220:	0f013f83          	ld	t6,240(sp)


                addi sp, sp, 256
    80001224:	10010113          	addi	sp,sp,256
                sret
    80001228:	10200073          	sret

000000008000122c <restore_context_kernel_mode>:


restore_context_kernel_mode:


        csrw sscratch, a0
    8000122c:	14051073          	csrw	sscratch,a0
        ret
    80001230:	00008067          	ret

0000000080001234 <mem_alloc_trap>:

mem_alloc_trap:
    mv a2, a1
    80001234:	00058613          	mv	a2,a1
    mv a1, a0
    80001238:	00050593          	mv	a1,a0
    li a0, 0x01
    8000123c:	00100513          	li	a0,1

    ecall
    80001240:	00000073          	ecall


    ret
    80001244:	00008067          	ret

0000000080001248 <mem_free_trap>:
mem_free_trap:
    mv a2, a1
    80001248:	00058613          	mv	a2,a1
    mv a1, a0
    8000124c:	00050593          	mv	a1,a0
    li a0, 0x02
    80001250:	00200513          	li	a0,2
    ecall
    80001254:	00000073          	ecall
    ret
    80001258:	00008067          	ret

000000008000125c <thread_exit_trap>:
thread_exit_trap:
    mv a1, a0
    8000125c:	00050593          	mv	a1,a0
    li a0, 0x12
    80001260:	01200513          	li	a0,18
     ecall
    80001264:	00000073          	ecall
    ret
    80001268:	00008067          	ret

000000008000126c <thread_create_trap>:
thread_create_trap:
   mv a5, a4
    8000126c:	00070793          	mv	a5,a4
   mv a4, a3
    80001270:	00068713          	mv	a4,a3
   mv a3, a2
    80001274:	00060693          	mv	a3,a2
   mv a2, a1
    80001278:	00058613          	mv	a2,a1
   mv a1, a0
    8000127c:	00050593          	mv	a1,a0
   li a0, 0x11
    80001280:	01100513          	li	a0,17
    ecall
    80001284:	00000073          	ecall
   ret
    80001288:	00008067          	ret

000000008000128c <thread_dispatch_trap>:
thread_dispatch_trap:
    mv a1, a0
    8000128c:	00050593          	mv	a1,a0
    li a0, 0x13
    80001290:	01300513          	li	a0,19
     ecall
    80001294:	00000073          	ecall
    ret
    80001298:	00008067          	ret

000000008000129c <start_thread_for_the_first_time_dispatch>:
start_thread_for_the_first_time_dispatch:
    //ld sp, 24(a0)
    ld sp, 32(a0)
    8000129c:	02053103          	ld	sp,32(a0) # 1020 <_entry-0x7fffefe0>
    ld t0, 40(a0)
    800012a0:	02853283          	ld	t0,40(a0)
    csrw sstatus, t0
    800012a4:	10029073          	csrw	sstatus,t0
    ld t0, 0(a0)
    800012a8:	00053283          	ld	t0,0(a0)
    csrw sepc, t0
    800012ac:	14129073          	csrw	sepc,t0
    sret
    800012b0:	10200073          	sret

00000000800012b4 <mem_get_free_space_trap>:


mem_get_free_space_trap:
    li a0, 0x03
    800012b4:	00300513          	li	a0,3
     ecall
    800012b8:	00000073          	ecall
    ret
    800012bc:	00008067          	ret

00000000800012c0 <mem_get_largest_free_block_trap>:

mem_get_largest_free_block_trap:
    li a0, 0x04
    800012c0:	00400513          	li	a0,4
    ecall
    800012c4:	00000073          	ecall
    ret
    800012c8:	00008067          	ret

00000000800012cc <sem_open_trap>:
sem_open_trap:
    mv a3, a2
    800012cc:	00060693          	mv	a3,a2
    mv a2, a1
    800012d0:	00058613          	mv	a2,a1
    mv a1, a0
    800012d4:	00050593          	mv	a1,a0
    li a0, 0x21
    800012d8:	02100513          	li	a0,33
    ecall
    800012dc:	00000073          	ecall
    ret
    800012e0:	00008067          	ret

00000000800012e4 <sem_wait_trap>:

sem_wait_trap:
    mv a2, a1
    800012e4:	00058613          	mv	a2,a1
    mv a1, a0
    800012e8:	00050593          	mv	a1,a0
    li a0, 0x23
    800012ec:	02300513          	li	a0,35
    ecall
    800012f0:	00000073          	ecall
    ret
    800012f4:	00008067          	ret

00000000800012f8 <thread_wrapper>:
thread_wrapper:
    ld sp, 24(a0)
    800012f8:	01853103          	ld	sp,24(a0)
   ld t0, 40(a0)
    800012fc:	02853283          	ld	t0,40(a0)
   csrw sstatus, t0
    80001300:	10029073          	csrw	sstatus,t0
   ld t0, 0(a1)
    80001304:	0005b283          	ld	t0,0(a1)
   csrw sscratch, a0
    80001308:	14051073          	csrw	sscratch,a0
   ld a0, 8(a1)
    8000130c:	0085b503          	ld	a0,8(a1)
   jalr ra, t0, 0
    80001310:	000280e7          	jalr	t0
   csrr a0, sscratch
    80001314:	14002573          	csrr	a0,sscratch
   j thread_exit_trap
    80001318:	f45ff06f          	j	8000125c <thread_exit_trap>
   ret
    8000131c:	00008067          	ret

0000000080001320 <sem_signal_trap>:


sem_signal_trap:
    mv a2,a1
    80001320:	00058613          	mv	a2,a1
    mv a1, a0
    80001324:	00050593          	mv	a1,a0
    li a0, 0x24
    80001328:	02400513          	li	a0,36
    ecall
    8000132c:	00000073          	ecall
    ret
    80001330:	00008067          	ret

0000000080001334 <sem_close_trap>:
sem_close_trap:
    mv a2, a1
    80001334:	00058613          	mv	a2,a1
    mv a1, a0
    80001338:	00050593          	mv	a1,a0
    li a0, 0x22
    8000133c:	02200513          	li	a0,34
    ecall
    80001340:	00000073          	ecall
    ret
    80001344:	00008067          	ret
    80001348:	0000                	unimp
	...

000000008000134c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000134c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001350:	00b29a63          	bne	t0,a1,80001364 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001354:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001358:	fe029ae3          	bnez	t0,8000134c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000135c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001360:	00008067          	ret

0000000080001364 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001364:	00100513          	li	a0,1
    80001368:	00008067          	ret

000000008000136c <abi_mem_alloc>:
int sem_open_trap(ThreadContext *t, sem_t* handle, int init);
int sem_wait_trap(ThreadContext* t, sem_t id);
int sem_signal_trap(ThreadContext* t, sem_t id);
int sem_close_trap(ThreadContext* t, sem_t id);

void* abi_mem_alloc(ThreadContext* c, size_t blocks) {
    8000136c:	ff010113          	addi	sp,sp,-16
    80001370:	00113423          	sd	ra,8(sp)
    80001374:	00813023          	sd	s0,0(sp)
    80001378:	01010413          	addi	s0,sp,16

    uint64 result = mem_alloc_trap(c, blocks);
    8000137c:	00000097          	auipc	ra,0x0
    80001380:	eb8080e7          	jalr	-328(ra) # 80001234 <mem_alloc_trap>
    return (void*)result;
}
    80001384:	00813083          	ld	ra,8(sp)
    80001388:	00013403          	ld	s0,0(sp)
    8000138c:	01010113          	addi	sp,sp,16
    80001390:	00008067          	ret

0000000080001394 <abi_mem_free>:

int abi_mem_free(ThreadContext* c, void* ptr){
    80001394:	ff010113          	addi	sp,sp,-16
    80001398:	00113423          	sd	ra,8(sp)
    8000139c:	00813023          	sd	s0,0(sp)
    800013a0:	01010413          	addi	s0,sp,16
    return mem_free_trap(c, ptr);
    800013a4:	00000097          	auipc	ra,0x0
    800013a8:	ea4080e7          	jalr	-348(ra) # 80001248 <mem_free_trap>
}
    800013ac:	00813083          	ld	ra,8(sp)
    800013b0:	00013403          	ld	s0,0(sp)
    800013b4:	01010113          	addi	sp,sp,16
    800013b8:	00008067          	ret

00000000800013bc <abi_thread_create>:

int abi_thread_create(ThreadContext* c, thread_t* handle, void(*startRoutine)(void*), void* args, void* stack_space){
    800013bc:	ff010113          	addi	sp,sp,-16
    800013c0:	00113423          	sd	ra,8(sp)
    800013c4:	00813023          	sd	s0,0(sp)
    800013c8:	01010413          	addi	s0,sp,16
    return thread_create_trap(c, handle, startRoutine, args, stack_space);
    800013cc:	00000097          	auipc	ra,0x0
    800013d0:	ea0080e7          	jalr	-352(ra) # 8000126c <thread_create_trap>
}
    800013d4:	00813083          	ld	ra,8(sp)
    800013d8:	00013403          	ld	s0,0(sp)
    800013dc:	01010113          	addi	sp,sp,16
    800013e0:	00008067          	ret

00000000800013e4 <abi_thread_exit>:
int abi_thread_exit(ThreadContext* c){
    800013e4:	ff010113          	addi	sp,sp,-16
    800013e8:	00113423          	sd	ra,8(sp)
    800013ec:	00813023          	sd	s0,0(sp)
    800013f0:	01010413          	addi	s0,sp,16
    return thread_exit_trap(c);
    800013f4:	00000097          	auipc	ra,0x0
    800013f8:	e68080e7          	jalr	-408(ra) # 8000125c <thread_exit_trap>
}
    800013fc:	00813083          	ld	ra,8(sp)
    80001400:	00013403          	ld	s0,0(sp)
    80001404:	01010113          	addi	sp,sp,16
    80001408:	00008067          	ret

000000008000140c <abi_thread_dispatch>:

void abi_thread_dispatch(ThreadContext* c){
    8000140c:	ff010113          	addi	sp,sp,-16
    80001410:	00113423          	sd	ra,8(sp)
    80001414:	00813023          	sd	s0,0(sp)
    80001418:	01010413          	addi	s0,sp,16
   return thread_dispatch_trap(c);
    8000141c:	00000097          	auipc	ra,0x0
    80001420:	e70080e7          	jalr	-400(ra) # 8000128c <thread_dispatch_trap>
}
    80001424:	00813083          	ld	ra,8(sp)
    80001428:	00013403          	ld	s0,0(sp)
    8000142c:	01010113          	addi	sp,sp,16
    80001430:	00008067          	ret

0000000080001434 <abi_mem_get_free_space>:

size_t abi_mem_get_free_space(){
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00113423          	sd	ra,8(sp)
    8000143c:	00813023          	sd	s0,0(sp)
    80001440:	01010413          	addi	s0,sp,16
    return mem_get_free_space_trap();
    80001444:	00000097          	auipc	ra,0x0
    80001448:	e70080e7          	jalr	-400(ra) # 800012b4 <mem_get_free_space_trap>
}
    8000144c:	00813083          	ld	ra,8(sp)
    80001450:	00013403          	ld	s0,0(sp)
    80001454:	01010113          	addi	sp,sp,16
    80001458:	00008067          	ret

000000008000145c <abi_mem_get_largest_free_block>:
size_t abi_mem_get_largest_free_block(){
    8000145c:	ff010113          	addi	sp,sp,-16
    80001460:	00113423          	sd	ra,8(sp)
    80001464:	00813023          	sd	s0,0(sp)
    80001468:	01010413          	addi	s0,sp,16
    return mem_get_largest_free_block_trap();
    8000146c:	00000097          	auipc	ra,0x0
    80001470:	e54080e7          	jalr	-428(ra) # 800012c0 <mem_get_largest_free_block_trap>
}
    80001474:	00813083          	ld	ra,8(sp)
    80001478:	00013403          	ld	s0,0(sp)
    8000147c:	01010113          	addi	sp,sp,16
    80001480:	00008067          	ret

0000000080001484 <abi_sem_open>:
int abi_sem_open(ThreadContext* t, sem_t* handle, int init){
    80001484:	ff010113          	addi	sp,sp,-16
    80001488:	00113423          	sd	ra,8(sp)
    8000148c:	00813023          	sd	s0,0(sp)
    80001490:	01010413          	addi	s0,sp,16
    return sem_open_trap(t, handle, init);
    80001494:	00000097          	auipc	ra,0x0
    80001498:	e38080e7          	jalr	-456(ra) # 800012cc <sem_open_trap>
}
    8000149c:	00813083          	ld	ra,8(sp)
    800014a0:	00013403          	ld	s0,0(sp)
    800014a4:	01010113          	addi	sp,sp,16
    800014a8:	00008067          	ret

00000000800014ac <abi_sem_wait>:
int abi_sem_wait(ThreadContext* t, sem_t id){
    800014ac:	ff010113          	addi	sp,sp,-16
    800014b0:	00113423          	sd	ra,8(sp)
    800014b4:	00813023          	sd	s0,0(sp)
    800014b8:	01010413          	addi	s0,sp,16
    return sem_wait_trap(t, id);
    800014bc:	00000097          	auipc	ra,0x0
    800014c0:	e28080e7          	jalr	-472(ra) # 800012e4 <sem_wait_trap>
}
    800014c4:	00813083          	ld	ra,8(sp)
    800014c8:	00013403          	ld	s0,0(sp)
    800014cc:	01010113          	addi	sp,sp,16
    800014d0:	00008067          	ret

00000000800014d4 <abi_sem_signal>:
int abi_sem_signal(ThreadContext* t, sem_t id){
    800014d4:	ff010113          	addi	sp,sp,-16
    800014d8:	00113423          	sd	ra,8(sp)
    800014dc:	00813023          	sd	s0,0(sp)
    800014e0:	01010413          	addi	s0,sp,16
    return sem_signal_trap(t, id);
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	e3c080e7          	jalr	-452(ra) # 80001320 <sem_signal_trap>
}
    800014ec:	00813083          	ld	ra,8(sp)
    800014f0:	00013403          	ld	s0,0(sp)
    800014f4:	01010113          	addi	sp,sp,16
    800014f8:	00008067          	ret

00000000800014fc <abi_sem_close>:
int abi_sem_close(ThreadContext* t, sem_t id){
    800014fc:	ff010113          	addi	sp,sp,-16
    80001500:	00113423          	sd	ra,8(sp)
    80001504:	00813023          	sd	s0,0(sp)
    80001508:	01010413          	addi	s0,sp,16
    return sem_close_trap(t, id);
    8000150c:	00000097          	auipc	ra,0x0
    80001510:	e28080e7          	jalr	-472(ra) # 80001334 <sem_close_trap>
    80001514:	00813083          	ld	ra,8(sp)
    80001518:	00013403          	ld	s0,0(sp)
    8000151c:	01010113          	addi	sp,sp,16
    80001520:	00008067          	ret

0000000080001524 <mem_alloc>:


extern ThreadContext * getRunningThreadContext();
extern int getWaitStatusForRunning();

void* mem_alloc(size_t size) {
    80001524:	fe010113          	addi	sp,sp,-32
    80001528:	00113c23          	sd	ra,24(sp)
    8000152c:	00813823          	sd	s0,16(sp)
    80001530:	00913423          	sd	s1,8(sp)
    80001534:	02010413          	addi	s0,sp,32
    size_t numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE ;
    80001538:	04750493          	addi	s1,a0,71
    8000153c:	0064d493          	srli	s1,s1,0x6
    ThreadContext *t = getRunningThreadContext();
    80001540:	00001097          	auipc	ra,0x1
    80001544:	180080e7          	jalr	384(ra) # 800026c0 <getRunningThreadContext>
    return (char*)abi_mem_alloc(t, numOfBlocks) + sizeof(Header);
    80001548:	00048593          	mv	a1,s1
    8000154c:	00000097          	auipc	ra,0x0
    80001550:	e20080e7          	jalr	-480(ra) # 8000136c <abi_mem_alloc>
}
    80001554:	00850513          	addi	a0,a0,8
    80001558:	01813083          	ld	ra,24(sp)
    8000155c:	01013403          	ld	s0,16(sp)
    80001560:	00813483          	ld	s1,8(sp)
    80001564:	02010113          	addi	sp,sp,32
    80001568:	00008067          	ret

000000008000156c <mem_free>:
int mem_free(void* ptr){
    if(!ptr) return 0;
    8000156c:	04050263          	beqz	a0,800015b0 <mem_free+0x44>
int mem_free(void* ptr){
    80001570:	fe010113          	addi	sp,sp,-32
    80001574:	00113c23          	sd	ra,24(sp)
    80001578:	00813823          	sd	s0,16(sp)
    8000157c:	00913423          	sd	s1,8(sp)
    80001580:	02010413          	addi	s0,sp,32
    Header* header = (Header*)((char*)ptr - sizeof(Header));
    80001584:	ff850493          	addi	s1,a0,-8
    ThreadContext *t = getRunningThreadContext();
    80001588:	00001097          	auipc	ra,0x1
    8000158c:	138080e7          	jalr	312(ra) # 800026c0 <getRunningThreadContext>
    return abi_mem_free(t, header);
    80001590:	00048593          	mv	a1,s1
    80001594:	00000097          	auipc	ra,0x0
    80001598:	e00080e7          	jalr	-512(ra) # 80001394 <abi_mem_free>
}
    8000159c:	01813083          	ld	ra,24(sp)
    800015a0:	01013403          	ld	s0,16(sp)
    800015a4:	00813483          	ld	s1,8(sp)
    800015a8:	02010113          	addi	sp,sp,32
    800015ac:	00008067          	ret
    if(!ptr) return 0;
    800015b0:	00000513          	li	a0,0
}
    800015b4:	00008067          	ret

00000000800015b8 <thread_create>:

int thread_create(thread_t* handle, void(*startRoutine)(void*), void* args)
{
    800015b8:	fd010113          	addi	sp,sp,-48
    800015bc:	02113423          	sd	ra,40(sp)
    800015c0:	02813023          	sd	s0,32(sp)
    800015c4:	00913c23          	sd	s1,24(sp)
    800015c8:	01213823          	sd	s2,16(sp)
    800015cc:	01313423          	sd	s3,8(sp)
    800015d0:	01413023          	sd	s4,0(sp)
    800015d4:	03010413          	addi	s0,sp,48
    800015d8:	00050913          	mv	s2,a0
    800015dc:	00058993          	mv	s3,a1
    800015e0:	00060a13          	mv	s4,a2
    size_t numOfBlocks = (2 * DEFAULT_STACK_SIZE + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    ThreadContext *t = getRunningThreadContext();
    800015e4:	00001097          	auipc	ra,0x1
    800015e8:	0dc080e7          	jalr	220(ra) # 800026c0 <getRunningThreadContext>
    800015ec:	00050493          	mv	s1,a0
    void* result = abi_mem_alloc(t, numOfBlocks);
    800015f0:	08100593          	li	a1,129
    800015f4:	00000097          	auipc	ra,0x0
    800015f8:	d78080e7          	jalr	-648(ra) # 8000136c <abi_mem_alloc>
    void* stack = (char*)result + sizeof(Header);
    void* stack_top = (char*)stack + 2*DEFAULT_STACK_SIZE;
    return abi_thread_create(t, handle, startRoutine, args, stack_top);
    800015fc:	000027b7          	lui	a5,0x2
    80001600:	00878793          	addi	a5,a5,8 # 2008 <_entry-0x7fffdff8>
    80001604:	00f50733          	add	a4,a0,a5
    80001608:	000a0693          	mv	a3,s4
    8000160c:	00098613          	mv	a2,s3
    80001610:	00090593          	mv	a1,s2
    80001614:	00048513          	mv	a0,s1
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	da4080e7          	jalr	-604(ra) # 800013bc <abi_thread_create>
}
    80001620:	02813083          	ld	ra,40(sp)
    80001624:	02013403          	ld	s0,32(sp)
    80001628:	01813483          	ld	s1,24(sp)
    8000162c:	01013903          	ld	s2,16(sp)
    80001630:	00813983          	ld	s3,8(sp)
    80001634:	00013a03          	ld	s4,0(sp)
    80001638:	03010113          	addi	sp,sp,48
    8000163c:	00008067          	ret

0000000080001640 <thread_exit>:

int thread_exit(){
    80001640:	ff010113          	addi	sp,sp,-16
    80001644:	00113423          	sd	ra,8(sp)
    80001648:	00813023          	sd	s0,0(sp)
    8000164c:	01010413          	addi	s0,sp,16
    ThreadContext *t = getRunningThreadContext();
    80001650:	00001097          	auipc	ra,0x1
    80001654:	070080e7          	jalr	112(ra) # 800026c0 <getRunningThreadContext>
    return abi_thread_exit(t);
    80001658:	00000097          	auipc	ra,0x0
    8000165c:	d8c080e7          	jalr	-628(ra) # 800013e4 <abi_thread_exit>
}
    80001660:	00813083          	ld	ra,8(sp)
    80001664:	00013403          	ld	s0,0(sp)
    80001668:	01010113          	addi	sp,sp,16
    8000166c:	00008067          	ret

0000000080001670 <thread_dispatch>:
void thread_dispatch(){
    80001670:	ff010113          	addi	sp,sp,-16
    80001674:	00113423          	sd	ra,8(sp)
    80001678:	00813023          	sd	s0,0(sp)
    8000167c:	01010413          	addi	s0,sp,16
    ThreadContext *t = getRunningThreadContext();
    80001680:	00001097          	auipc	ra,0x1
    80001684:	040080e7          	jalr	64(ra) # 800026c0 <getRunningThreadContext>
    abi_thread_dispatch(t);
    80001688:	00000097          	auipc	ra,0x0
    8000168c:	d84080e7          	jalr	-636(ra) # 8000140c <abi_thread_dispatch>
}
    80001690:	00813083          	ld	ra,8(sp)
    80001694:	00013403          	ld	s0,0(sp)
    80001698:	01010113          	addi	sp,sp,16
    8000169c:	00008067          	ret

00000000800016a0 <mem_get_free_space>:
size_t mem_get_free_space(){
    800016a0:	ff010113          	addi	sp,sp,-16
    800016a4:	00113423          	sd	ra,8(sp)
    800016a8:	00813023          	sd	s0,0(sp)
    800016ac:	01010413          	addi	s0,sp,16
    return abi_mem_get_free_space();
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	d84080e7          	jalr	-636(ra) # 80001434 <abi_mem_get_free_space>
}
    800016b8:	00813083          	ld	ra,8(sp)
    800016bc:	00013403          	ld	s0,0(sp)
    800016c0:	01010113          	addi	sp,sp,16
    800016c4:	00008067          	ret

00000000800016c8 <mem_get_largest_free_block>:
size_t mem_get_largest_free_block(){
    800016c8:	ff010113          	addi	sp,sp,-16
    800016cc:	00113423          	sd	ra,8(sp)
    800016d0:	00813023          	sd	s0,0(sp)
    800016d4:	01010413          	addi	s0,sp,16
    return abi_mem_get_largest_free_block();
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	d84080e7          	jalr	-636(ra) # 8000145c <abi_mem_get_largest_free_block>
}
    800016e0:	00813083          	ld	ra,8(sp)
    800016e4:	00013403          	ld	s0,0(sp)
    800016e8:	01010113          	addi	sp,sp,16
    800016ec:	00008067          	ret

00000000800016f0 <sem_open>:

int sem_open(sem_t* handle, unsigned init){
    800016f0:	fe010113          	addi	sp,sp,-32
    800016f4:	00113c23          	sd	ra,24(sp)
    800016f8:	00813823          	sd	s0,16(sp)
    800016fc:	00913423          	sd	s1,8(sp)
    80001700:	01213023          	sd	s2,0(sp)
    80001704:	02010413          	addi	s0,sp,32
    80001708:	00050493          	mv	s1,a0
    8000170c:	00058913          	mv	s2,a1
    ThreadContext *t = getRunningThreadContext();
    80001710:	00001097          	auipc	ra,0x1
    80001714:	fb0080e7          	jalr	-80(ra) # 800026c0 <getRunningThreadContext>
    return abi_sem_open(t, handle, init);
    80001718:	00090613          	mv	a2,s2
    8000171c:	00048593          	mv	a1,s1
    80001720:	00000097          	auipc	ra,0x0
    80001724:	d64080e7          	jalr	-668(ra) # 80001484 <abi_sem_open>
}
    80001728:	01813083          	ld	ra,24(sp)
    8000172c:	01013403          	ld	s0,16(sp)
    80001730:	00813483          	ld	s1,8(sp)
    80001734:	00013903          	ld	s2,0(sp)
    80001738:	02010113          	addi	sp,sp,32
    8000173c:	00008067          	ret

0000000080001740 <sem_wait>:

int sem_wait(sem_t id){
    80001740:	fe010113          	addi	sp,sp,-32
    80001744:	00113c23          	sd	ra,24(sp)
    80001748:	00813823          	sd	s0,16(sp)
    8000174c:	00913423          	sd	s1,8(sp)
    80001750:	02010413          	addi	s0,sp,32
    80001754:	00050493          	mv	s1,a0
    ThreadContext *t = getRunningThreadContext();
    80001758:	00001097          	auipc	ra,0x1
    8000175c:	f68080e7          	jalr	-152(ra) # 800026c0 <getRunningThreadContext>
    abi_sem_wait(t, id);
    80001760:	00048593          	mv	a1,s1
    80001764:	00000097          	auipc	ra,0x0
    80001768:	d48080e7          	jalr	-696(ra) # 800014ac <abi_sem_wait>
    int status = getWaitStatusForRunning();
    8000176c:	00001097          	auipc	ra,0x1
    80001770:	f8c080e7          	jalr	-116(ra) # 800026f8 <getWaitStatusForRunning>
    return status;
}
    80001774:	01813083          	ld	ra,24(sp)
    80001778:	01013403          	ld	s0,16(sp)
    8000177c:	00813483          	ld	s1,8(sp)
    80001780:	02010113          	addi	sp,sp,32
    80001784:	00008067          	ret

0000000080001788 <sem_signal>:

int sem_signal(sem_t id){
    80001788:	fe010113          	addi	sp,sp,-32
    8000178c:	00113c23          	sd	ra,24(sp)
    80001790:	00813823          	sd	s0,16(sp)
    80001794:	00913423          	sd	s1,8(sp)
    80001798:	02010413          	addi	s0,sp,32
    8000179c:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	f20080e7          	jalr	-224(ra) # 800026c0 <getRunningThreadContext>
    return abi_sem_signal(t, id);
    800017a8:	00048593          	mv	a1,s1
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	d28080e7          	jalr	-728(ra) # 800014d4 <abi_sem_signal>
}
    800017b4:	01813083          	ld	ra,24(sp)
    800017b8:	01013403          	ld	s0,16(sp)
    800017bc:	00813483          	ld	s1,8(sp)
    800017c0:	02010113          	addi	sp,sp,32
    800017c4:	00008067          	ret

00000000800017c8 <sem_close>:

int sem_close(sem_t id){
    800017c8:	fe010113          	addi	sp,sp,-32
    800017cc:	00113c23          	sd	ra,24(sp)
    800017d0:	00813823          	sd	s0,16(sp)
    800017d4:	00913423          	sd	s1,8(sp)
    800017d8:	02010413          	addi	s0,sp,32
    800017dc:	00050493          	mv	s1,a0
    ThreadContext* t = getRunningThreadContext();
    800017e0:	00001097          	auipc	ra,0x1
    800017e4:	ee0080e7          	jalr	-288(ra) # 800026c0 <getRunningThreadContext>
    return abi_sem_close(t, id);
    800017e8:	00048593          	mv	a1,s1
    800017ec:	00000097          	auipc	ra,0x0
    800017f0:	d10080e7          	jalr	-752(ra) # 800014fc <abi_sem_close>
}
    800017f4:	01813083          	ld	ra,24(sp)
    800017f8:	01013403          	ld	s0,16(sp)
    800017fc:	00813483          	ld	s1,8(sp)
    80001800:	02010113          	addi	sp,sp,32
    80001804:	00008067          	ret

0000000080001808 <putc>:

void putc(char x) {
    80001808:	fe010113          	addi	sp,sp,-32
    8000180c:	00113c23          	sd	ra,24(sp)
    80001810:	00813823          	sd	s0,16(sp)
    80001814:	00913423          	sd	s1,8(sp)
    80001818:	02010413          	addi	s0,sp,32
    unsigned long sstatus_old, sstatus_new;

    // Učitaj trenutni sstatus
    asm volatile("csrr %0, sstatus" : "=r"(sstatus_old));
    8000181c:	100024f3          	csrr	s1,sstatus

    // Maskiraj spoljne prekide (SIE = 0)
    sstatus_new = sstatus_old & ~(1UL << 1);
    80001820:	ffd4f793          	andi	a5,s1,-3
    asm volatile("csrw sstatus, %0" :: "r"(sstatus_new));
    80001824:	10079073          	csrw	sstatus,a5

    // Poziv niskonivojske funkcije
    __putc(x);
    80001828:	00007097          	auipc	ra,0x7
    8000182c:	224080e7          	jalr	548(ra) # 80008a4c <__putc>

    // Vrati sstatus na staru vrednost
    asm volatile("csrw sstatus, %0" :: "r"(sstatus_old));
    80001830:	10049073          	csrw	sstatus,s1
}
    80001834:	01813083          	ld	ra,24(sp)
    80001838:	01013403          	ld	s0,16(sp)
    8000183c:	00813483          	ld	s1,8(sp)
    80001840:	02010113          	addi	sp,sp,32
    80001844:	00008067          	ret

0000000080001848 <getc>:

char getc() {
    80001848:	ff010113          	addi	sp,sp,-16
    8000184c:	00113423          	sd	ra,8(sp)
    80001850:	00813023          	sd	s0,0(sp)
    80001854:	01010413          	addi	s0,sp,16
    return __getc();
    80001858:	00007097          	auipc	ra,0x7
    8000185c:	230080e7          	jalr	560(ra) # 80008a88 <__getc>
}
    80001860:	00813083          	ld	ra,8(sp)
    80001864:	00013403          	ld	s0,0(sp)
    80001868:	01010113          	addi	sp,sp,16
    8000186c:	00008067          	ret

0000000080001870 <_ZN10ThreadPoolC1Ev>:
#include "../h/ThreadPool.hpp"

ThreadPool::ThreadPool() : pool(nullptr), used(nullptr) {}
    80001870:	ff010113          	addi	sp,sp,-16
    80001874:	00813423          	sd	s0,8(sp)
    80001878:	01010413          	addi	s0,sp,16
    8000187c:	00053023          	sd	zero,0(a0)
    80001880:	00053423          	sd	zero,8(a0)
    80001884:	00813403          	ld	s0,8(sp)
    80001888:	01010113          	addi	sp,sp,16
    8000188c:	00008067          	ret

0000000080001890 <_ZN10ThreadPool4initEPvS0_>:

void ThreadPool::init(void* poolStartAddress, void* usedStartAddress) {
    80001890:	ff010113          	addi	sp,sp,-16
    80001894:	00813423          	sd	s0,8(sp)
    80001898:	01010413          	addi	s0,sp,16
    pool = (Thread*)poolStartAddress;
    8000189c:	00b53023          	sd	a1,0(a0)
    used = (bool*)usedStartAddress;
    800018a0:	00c53423          	sd	a2,8(a0)
    for (int i = 0; i < MAX_THREADS; i++) used[i] = false;
    800018a4:	00000793          	li	a5,0
    800018a8:	00900713          	li	a4,9
    800018ac:	00f74c63          	blt	a4,a5,800018c4 <_ZN10ThreadPool4initEPvS0_+0x34>
    800018b0:	00853703          	ld	a4,8(a0)
    800018b4:	00f70733          	add	a4,a4,a5
    800018b8:	00070023          	sb	zero,0(a4)
    800018bc:	0017879b          	addiw	a5,a5,1
    800018c0:	fe9ff06f          	j	800018a8 <_ZN10ThreadPool4initEPvS0_+0x18>
}
    800018c4:	00813403          	ld	s0,8(sp)
    800018c8:	01010113          	addi	sp,sp,16
    800018cc:	00008067          	ret

00000000800018d0 <_ZN10ThreadPool16getSemaphoreByIdEj>:

Thread* ThreadPool::getSemaphoreById(thread_t id){
    800018d0:	ff010113          	addi	sp,sp,-16
    800018d4:	00813423          	sd	s0,8(sp)
    800018d8:	01010413          	addi	s0,sp,16
    800018dc:	00050693          	mv	a3,a0
    for(int i = 0; i < MAX_THREADS; i++){
    800018e0:	00000793          	li	a5,0
    800018e4:	0080006f          	j	800018ec <_ZN10ThreadPool16getSemaphoreByIdEj+0x1c>
    800018e8:	0017879b          	addiw	a5,a5,1
    800018ec:	00900713          	li	a4,9
    800018f0:	02f74a63          	blt	a4,a5,80001924 <_ZN10ThreadPool16getSemaphoreByIdEj+0x54>
        if(used[i] == true && pool[i].threadId == id){
    800018f4:	0086b703          	ld	a4,8(a3)
    800018f8:	00f70733          	add	a4,a4,a5
    800018fc:	00074703          	lbu	a4,0(a4)
    80001900:	fe0704e3          	beqz	a4,800018e8 <_ZN10ThreadPool16getSemaphoreByIdEj+0x18>
    80001904:	0006b503          	ld	a0,0(a3)
    80001908:	00479713          	slli	a4,a5,0x4
    8000190c:	00f70733          	add	a4,a4,a5
    80001910:	00371713          	slli	a4,a4,0x3
    80001914:	00e50533          	add	a0,a0,a4
    80001918:	01452703          	lw	a4,20(a0)
    8000191c:	fcb716e3          	bne	a4,a1,800018e8 <_ZN10ThreadPool16getSemaphoreByIdEj+0x18>
    80001920:	0080006f          	j	80001928 <_ZN10ThreadPool16getSemaphoreByIdEj+0x58>
            return &pool[i];
        }
    }
    return nullptr;
    80001924:	00000513          	li	a0,0
}
    80001928:	00813403          	ld	s0,8(sp)
    8000192c:	01010113          	addi	sp,sp,16
    80001930:	00008067          	ret

0000000080001934 <_ZN10ThreadPool8allocateEv>:
Thread* ThreadPool::allocate() {
    80001934:	ff010113          	addi	sp,sp,-16
    80001938:	00813423          	sd	s0,8(sp)
    8000193c:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_THREADS; i++) {
    80001940:	00000793          	li	a5,0
    80001944:	00900713          	li	a4,9
    80001948:	04f74063          	blt	a4,a5,80001988 <_ZN10ThreadPool8allocateEv+0x54>
        if (!used[i]) {
    8000194c:	00853703          	ld	a4,8(a0)
    80001950:	00078613          	mv	a2,a5
    80001954:	00f70733          	add	a4,a4,a5
    80001958:	00074683          	lbu	a3,0(a4)
    8000195c:	00068663          	beqz	a3,80001968 <_ZN10ThreadPool8allocateEv+0x34>
    for (int i = 0; i < MAX_THREADS; i++) {
    80001960:	0017879b          	addiw	a5,a5,1
    80001964:	fe1ff06f          	j	80001944 <_ZN10ThreadPool8allocateEv+0x10>
            used[i] = true;
    80001968:	00100793          	li	a5,1
    8000196c:	00f70023          	sb	a5,0(a4)
            return &pool[i];
    80001970:	00053503          	ld	a0,0(a0)
    80001974:	00461793          	slli	a5,a2,0x4
    80001978:	00c78633          	add	a2,a5,a2
    8000197c:	00361613          	slli	a2,a2,0x3
    80001980:	00c50533          	add	a0,a0,a2
    80001984:	0080006f          	j	8000198c <_ZN10ThreadPool8allocateEv+0x58>
        }
    }
    return nullptr;
    80001988:	00000513          	li	a0,0
}
    8000198c:	00813403          	ld	s0,8(sp)
    80001990:	01010113          	addi	sp,sp,16
    80001994:	00008067          	ret

0000000080001998 <_ZN10ThreadPool10deallocateEP6Thread>:

void ThreadPool::deallocate(Thread* obj) {
    80001998:	ff010113          	addi	sp,sp,-16
    8000199c:	00813423          	sd	s0,8(sp)
    800019a0:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_THREADS; i++) {
    800019a4:	00000793          	li	a5,0
    800019a8:	00900713          	li	a4,9
    800019ac:	02f74a63          	blt	a4,a5,800019e0 <_ZN10ThreadPool10deallocateEP6Thread+0x48>
        if (&pool[i] == obj) {
    800019b0:	00053683          	ld	a3,0(a0)
    800019b4:	00078613          	mv	a2,a5
    800019b8:	00479713          	slli	a4,a5,0x4
    800019bc:	00f70733          	add	a4,a4,a5
    800019c0:	00371713          	slli	a4,a4,0x3
    800019c4:	00e68733          	add	a4,a3,a4
    800019c8:	00b70663          	beq	a4,a1,800019d4 <_ZN10ThreadPool10deallocateEP6Thread+0x3c>
    for (int i = 0; i < MAX_THREADS; i++) {
    800019cc:	0017879b          	addiw	a5,a5,1
    800019d0:	fd9ff06f          	j	800019a8 <_ZN10ThreadPool10deallocateEP6Thread+0x10>
            used[i] = false;
    800019d4:	00853783          	ld	a5,8(a0)
    800019d8:	00c78633          	add	a2,a5,a2
    800019dc:	00060023          	sb	zero,0(a2)
            return;
        }
    }
}
    800019e0:	00813403          	ld	s0,8(sp)
    800019e4:	01010113          	addi	sp,sp,16
    800019e8:	00008067          	ret

00000000800019ec <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned init){
    val = init;
    myHandle = cnt++;
}
Semaphore::~Semaphore() {}
    800019ec:	ff010113          	addi	sp,sp,-16
    800019f0:	00113423          	sd	ra,8(sp)
    800019f4:	00813023          	sd	s0,0(sp)
    800019f8:	01010413          	addi	s0,sp,16
    800019fc:	0000a797          	auipc	a5,0xa
    80001a00:	a6c78793          	addi	a5,a5,-1428 # 8000b468 <_ZTV9Semaphore+0x10>
    80001a04:	00f53023          	sd	a5,0(a0)
    80001a08:	01050513          	addi	a0,a0,16
    80001a0c:	00002097          	auipc	ra,0x2
    80001a10:	864080e7          	jalr	-1948(ra) # 80003270 <_ZN4ListI6ThreadED1Ev>
    80001a14:	00813083          	ld	ra,8(sp)
    80001a18:	00013403          	ld	s0,0(sp)
    80001a1c:	01010113          	addi	sp,sp,16
    80001a20:	00008067          	ret

0000000080001a24 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init){
    80001a24:	fe010113          	addi	sp,sp,-32
    80001a28:	00113c23          	sd	ra,24(sp)
    80001a2c:	00813823          	sd	s0,16(sp)
    80001a30:	00913423          	sd	s1,8(sp)
    80001a34:	01213023          	sd	s2,0(sp)
    80001a38:	02010413          	addi	s0,sp,32
    80001a3c:	00050493          	mv	s1,a0
    80001a40:	00058913          	mv	s2,a1
    80001a44:	0000a797          	auipc	a5,0xa
    80001a48:	a2478793          	addi	a5,a5,-1500 # 8000b468 <_ZTV9Semaphore+0x10>
    80001a4c:	00f53023          	sd	a5,0(a0)
    80001a50:	01050513          	addi	a0,a0,16
    80001a54:	00001097          	auipc	ra,0x1
    80001a58:	7fc080e7          	jalr	2044(ra) # 80003250 <_ZN4ListI6ThreadEC1Ev>
    val = init;
    80001a5c:	0124a623          	sw	s2,12(s1)
    myHandle = cnt++;
    80001a60:	0000a717          	auipc	a4,0xa
    80001a64:	9f070713          	addi	a4,a4,-1552 # 8000b450 <_ZN9Semaphore3cntE>
    80001a68:	00072783          	lw	a5,0(a4)
    80001a6c:	0017869b          	addiw	a3,a5,1
    80001a70:	00d72023          	sw	a3,0(a4)
    80001a74:	00f4a423          	sw	a5,8(s1)
}
    80001a78:	01813083          	ld	ra,24(sp)
    80001a7c:	01013403          	ld	s0,16(sp)
    80001a80:	00813483          	ld	s1,8(sp)
    80001a84:	00013903          	ld	s2,0(sp)
    80001a88:	02010113          	addi	sp,sp,32
    80001a8c:	00008067          	ret

0000000080001a90 <_ZN9SemaphorenwEm>:
int Semaphore::signal(){
    sem_signal(this->myHandle);
    return 0;
}

void* Semaphore::operator new(size_t size) {
    80001a90:	ff010113          	addi	sp,sp,-16
    80001a94:	00113423          	sd	ra,8(sp)
    80001a98:	00813023          	sd	s0,0(sp)
    80001a9c:	01010413          	addi	s0,sp,16
    return MemoryAllocator::Instance()->getSemaphorePool().allocate();
    80001aa0:	00001097          	auipc	ra,0x1
    80001aa4:	3d0080e7          	jalr	976(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80001aa8:	00001097          	auipc	ra,0x1
    80001aac:	084080e7          	jalr	132(ra) # 80002b2c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001ab0:	00002097          	auipc	ra,0x2
    80001ab4:	9e4080e7          	jalr	-1564(ra) # 80003494 <_ZN13SemaphorePool8allocateEv>
}
    80001ab8:	00813083          	ld	ra,8(sp)
    80001abc:	00013403          	ld	s0,0(sp)
    80001ac0:	01010113          	addi	sp,sp,16
    80001ac4:	00008067          	ret

0000000080001ac8 <_ZN9SemaphoredlEPv>:

void Semaphore::operator delete(void *obj) noexcept {
    80001ac8:	fe010113          	addi	sp,sp,-32
    80001acc:	00113c23          	sd	ra,24(sp)
    80001ad0:	00813823          	sd	s0,16(sp)
    80001ad4:	00913423          	sd	s1,8(sp)
    80001ad8:	02010413          	addi	s0,sp,32
    80001adc:	00050493          	mv	s1,a0
    MemoryAllocator::Instance()->getSemaphorePool().deallocate((Semaphore*)obj);
    80001ae0:	00001097          	auipc	ra,0x1
    80001ae4:	390080e7          	jalr	912(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80001ae8:	00001097          	auipc	ra,0x1
    80001aec:	044080e7          	jalr	68(ra) # 80002b2c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001af0:	00048593          	mv	a1,s1
    80001af4:	00002097          	auipc	ra,0x2
    80001af8:	9fc080e7          	jalr	-1540(ra) # 800034f0 <_ZN13SemaphorePool10deallocateEP9Semaphore>
}
    80001afc:	01813083          	ld	ra,24(sp)
    80001b00:	01013403          	ld	s0,16(sp)
    80001b04:	00813483          	ld	s1,8(sp)
    80001b08:	02010113          	addi	sp,sp,32
    80001b0c:	00008067          	ret

0000000080001b10 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {}
    80001b10:	fe010113          	addi	sp,sp,-32
    80001b14:	00113c23          	sd	ra,24(sp)
    80001b18:	00813823          	sd	s0,16(sp)
    80001b1c:	00913423          	sd	s1,8(sp)
    80001b20:	02010413          	addi	s0,sp,32
    80001b24:	00050493          	mv	s1,a0
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	ec4080e7          	jalr	-316(ra) # 800019ec <_ZN9SemaphoreD1Ev>
    80001b30:	00048513          	mv	a0,s1
    80001b34:	00000097          	auipc	ra,0x0
    80001b38:	f94080e7          	jalr	-108(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80001b3c:	01813083          	ld	ra,24(sp)
    80001b40:	01013403          	ld	s0,16(sp)
    80001b44:	00813483          	ld	s1,8(sp)
    80001b48:	02010113          	addi	sp,sp,32
    80001b4c:	00008067          	ret

0000000080001b50 <_ZN9Semaphore8sem_openEPjj>:
int Semaphore::sem_open(sem_t *handle, unsigned init) {
    80001b50:	fd010113          	addi	sp,sp,-48
    80001b54:	02113423          	sd	ra,40(sp)
    80001b58:	02813023          	sd	s0,32(sp)
    80001b5c:	00913c23          	sd	s1,24(sp)
    80001b60:	01213823          	sd	s2,16(sp)
    80001b64:	01313423          	sd	s3,8(sp)
    80001b68:	03010413          	addi	s0,sp,48
    80001b6c:	00050993          	mv	s3,a0
    80001b70:	00058913          	mv	s2,a1
    Semaphore* semaphore = new Semaphore(init);
    80001b74:	02000513          	li	a0,32
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	f18080e7          	jalr	-232(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80001b80:	00050493          	mv	s1,a0
    80001b84:	00090593          	mv	a1,s2
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	e9c080e7          	jalr	-356(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    if(!semaphore) return -1;
    80001b90:	02048663          	beqz	s1,80001bbc <_ZN9Semaphore8sem_openEPjj+0x6c>
    *handle = semaphore->myHandle;
    80001b94:	0084a783          	lw	a5,8(s1)
    80001b98:	00f9a023          	sw	a5,0(s3)
    return 0;
    80001b9c:	00000513          	li	a0,0
}
    80001ba0:	02813083          	ld	ra,40(sp)
    80001ba4:	02013403          	ld	s0,32(sp)
    80001ba8:	01813483          	ld	s1,24(sp)
    80001bac:	01013903          	ld	s2,16(sp)
    80001bb0:	00813983          	ld	s3,8(sp)
    80001bb4:	03010113          	addi	sp,sp,48
    80001bb8:	00008067          	ret
    if(!semaphore) return -1;
    80001bbc:	fff00513          	li	a0,-1
    80001bc0:	fe1ff06f          	j	80001ba0 <_ZN9Semaphore8sem_openEPjj+0x50>
    80001bc4:	00050913          	mv	s2,a0
    Semaphore* semaphore = new Semaphore(init);
    80001bc8:	00048513          	mv	a0,s1
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	efc080e7          	jalr	-260(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80001bd4:	00090513          	mv	a0,s2
    80001bd8:	0000b097          	auipc	ra,0xb
    80001bdc:	c80080e7          	jalr	-896(ra) # 8000c858 <_Unwind_Resume>

0000000080001be0 <_ZN9Semaphore9sem_closeEj>:

int Semaphore::sem_close(sem_t id){
    80001be0:	fe010113          	addi	sp,sp,-32
    80001be4:	00113c23          	sd	ra,24(sp)
    80001be8:	00813823          	sd	s0,16(sp)
    80001bec:	00913423          	sd	s1,8(sp)
    80001bf0:	01213023          	sd	s2,0(sp)
    80001bf4:	02010413          	addi	s0,sp,32
    80001bf8:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001bfc:	00001097          	auipc	ra,0x1
    80001c00:	274080e7          	jalr	628(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	f28080e7          	jalr	-216(ra) # 80002b2c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001c0c:	00048593          	mv	a1,s1
    80001c10:	00002097          	auipc	ra,0x2
    80001c14:	828080e7          	jalr	-2008(ra) # 80003438 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    80001c18:	00050913          	mv	s2,a0
    if(semaphore == nullptr) return -1;
    80001c1c:	06050863          	beqz	a0,80001c8c <_ZN9Semaphore9sem_closeEj+0xac>

    //take out all threads that were waiting on this semaphore and put them in Scheduler as ready
    while(!semaphore->waiting.empty()){
    80001c20:	01090493          	addi	s1,s2,16
    80001c24:	00048513          	mv	a0,s1
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	790080e7          	jalr	1936(ra) # 800033b8 <_ZN4ListI6ThreadE5emptyEv>
    80001c30:	02051863          	bnez	a0,80001c60 <_ZN9Semaphore9sem_closeEj+0x80>
        Thread* thread = semaphore->waiting.remove_beginning();
    80001c34:	00048513          	mv	a0,s1
    80001c38:	00001097          	auipc	ra,0x1
    80001c3c:	71c080e7          	jalr	1820(ra) # 80003354 <_ZN4ListI6ThreadE16remove_beginningEv>
    80001c40:	00050593          	mv	a1,a0
        thread->semWaitStatus = -2;
    80001c44:	ffe00793          	li	a5,-2
    80001c48:	00f52823          	sw	a5,16(a0)
        scheduler.put(thread);
    80001c4c:	0000a517          	auipc	a0,0xa
    80001c50:	a2c53503          	ld	a0,-1492(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001c54:	00001097          	auipc	ra,0x1
    80001c58:	b48080e7          	jalr	-1208(ra) # 8000279c <_ZN9Scheduler3putEP6Thread>
    while(!semaphore->waiting.empty()){
    80001c5c:	fc5ff06f          	j	80001c20 <_ZN9Semaphore9sem_closeEj+0x40>

    }
    delete semaphore;
    80001c60:	00093783          	ld	a5,0(s2)
    80001c64:	0087b783          	ld	a5,8(a5)
    80001c68:	00090513          	mv	a0,s2
    80001c6c:	000780e7          	jalr	a5
    return 0;
    80001c70:	00000513          	li	a0,0
}
    80001c74:	01813083          	ld	ra,24(sp)
    80001c78:	01013403          	ld	s0,16(sp)
    80001c7c:	00813483          	ld	s1,8(sp)
    80001c80:	00013903          	ld	s2,0(sp)
    80001c84:	02010113          	addi	sp,sp,32
    80001c88:	00008067          	ret
    if(semaphore == nullptr) return -1;
    80001c8c:	fff00513          	li	a0,-1
    80001c90:	fe5ff06f          	j	80001c74 <_ZN9Semaphore9sem_closeEj+0x94>

0000000080001c94 <_ZN9Semaphore8sem_waitEj>:

int Semaphore::sem_wait(sem_t id) {
    80001c94:	fe010113          	addi	sp,sp,-32
    80001c98:	00113c23          	sd	ra,24(sp)
    80001c9c:	00813823          	sd	s0,16(sp)
    80001ca0:	00913423          	sd	s1,8(sp)
    80001ca4:	01213023          	sd	s2,0(sp)
    80001ca8:	02010413          	addi	s0,sp,32
    80001cac:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001cb0:	00001097          	auipc	ra,0x1
    80001cb4:	1c0080e7          	jalr	448(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80001cb8:	00001097          	auipc	ra,0x1
    80001cbc:	e74080e7          	jalr	-396(ra) # 80002b2c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001cc0:	00048593          	mv	a1,s1
    80001cc4:	00001097          	auipc	ra,0x1
    80001cc8:	774080e7          	jalr	1908(ra) # 80003438 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    if(semaphore == nullptr) return -1;
    80001ccc:	0e050c63          	beqz	a0,80001dc4 <_ZN9Semaphore8sem_waitEj+0x130>
    Thread::running->semWaitStatus = 0;
    80001cd0:	0000a797          	auipc	a5,0xa
    80001cd4:	9a07b783          	ld	a5,-1632(a5) # 8000b670 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001cd8:	0007b583          	ld	a1,0(a5)
    80001cdc:	0005a823          	sw	zero,16(a1)
    semaphore->val--;
    80001ce0:	00c52783          	lw	a5,12(a0)
    80001ce4:	fff7879b          	addiw	a5,a5,-1
    80001ce8:	00f52623          	sw	a5,12(a0)
    if(semaphore->val < 0){
    80001cec:	02079713          	slli	a4,a5,0x20
    80001cf0:	02074063          	bltz	a4,80001d10 <_ZN9Semaphore8sem_waitEj+0x7c>
            ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
            //start_thread_for_the_first_time_dispatch(&Thread::running->context);
            thread_wrapper(tc, wa);
        }
    }
    return 0;
    80001cf4:	00000513          	li	a0,0
}
    80001cf8:	01813083          	ld	ra,24(sp)
    80001cfc:	01013403          	ld	s0,16(sp)
    80001d00:	00813483          	ld	s1,8(sp)
    80001d04:	00013903          	ld	s2,0(sp)
    80001d08:	02010113          	addi	sp,sp,32
    80001d0c:	00008067          	ret
        semaphore->waiting.add_end(Thread::running);
    80001d10:	01050513          	addi	a0,a0,16
    80001d14:	00001097          	auipc	ra,0x1
    80001d18:	5a4080e7          	jalr	1444(ra) # 800032b8 <_ZN4ListI6ThreadE7add_endEPS0_>
        Thread::running = scheduler.get();
    80001d1c:	0000a517          	auipc	a0,0xa
    80001d20:	95c53503          	ld	a0,-1700(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d24:	00001097          	auipc	ra,0x1
    80001d28:	ab0080e7          	jalr	-1360(ra) # 800027d4 <_ZN9Scheduler3getEv>
    80001d2c:	0000a797          	auipc	a5,0xa
    80001d30:	9447b783          	ld	a5,-1724(a5) # 8000b670 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d34:	00a7b023          	sd	a0,0(a5)
        if(Thread::running == nullptr) return -1;
    80001d38:	08050a63          	beqz	a0,80001dcc <_ZN9Semaphore8sem_waitEj+0x138>
        if(Thread::running->getContext()->wasActive == 1){
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	594080e7          	jalr	1428(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80001d44:	03853703          	ld	a4,56(a0)
    80001d48:	00100793          	li	a5,1
    80001d4c:	04f70a63          	beq	a4,a5,80001da0 <_ZN9Semaphore8sem_waitEj+0x10c>
            Thread::running->getContext()->wasActive = 1;
    80001d50:	0000a917          	auipc	s2,0xa
    80001d54:	92093903          	ld	s2,-1760(s2) # 8000b670 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001d58:	00093503          	ld	a0,0(s2)
    80001d5c:	00000097          	auipc	ra,0x0
    80001d60:	574080e7          	jalr	1396(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80001d64:	00100793          	li	a5,1
    80001d68:	02f53c23          	sd	a5,56(a0)
            ThreadContext* tc = Thread::running->getContext();
    80001d6c:	00093503          	ld	a0,0(s2)
    80001d70:	00000097          	auipc	ra,0x0
    80001d74:	560080e7          	jalr	1376(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80001d78:	00050493          	mv	s1,a0
            ThreadWrapperArgs* wa = Thread::running->getWrapperArgs();
    80001d7c:	00093503          	ld	a0,0(s2)
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	6cc080e7          	jalr	1740(ra) # 8000244c <_ZN6Thread14getWrapperArgsEv>
    80001d88:	00050593          	mv	a1,a0
            thread_wrapper(tc, wa);
    80001d8c:	00048513          	mv	a0,s1
    80001d90:	fffff097          	auipc	ra,0xfffff
    80001d94:	568080e7          	jalr	1384(ra) # 800012f8 <thread_wrapper>
    return 0;
    80001d98:	00000513          	li	a0,0
    80001d9c:	f5dff06f          	j	80001cf8 <_ZN9Semaphore8sem_waitEj+0x64>
            restore_context_kernel_mode(Thread::running->getContext());
    80001da0:	0000a797          	auipc	a5,0xa
    80001da4:	8d07b783          	ld	a5,-1840(a5) # 8000b670 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001da8:	0007b503          	ld	a0,0(a5)
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	524080e7          	jalr	1316(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80001db4:	fffff097          	auipc	ra,0xfffff
    80001db8:	478080e7          	jalr	1144(ra) # 8000122c <restore_context_kernel_mode>
    return 0;
    80001dbc:	00000513          	li	a0,0
    80001dc0:	f39ff06f          	j	80001cf8 <_ZN9Semaphore8sem_waitEj+0x64>
    if(semaphore == nullptr) return -1;
    80001dc4:	fff00513          	li	a0,-1
    80001dc8:	f31ff06f          	j	80001cf8 <_ZN9Semaphore8sem_waitEj+0x64>
        if(Thread::running == nullptr) return -1;
    80001dcc:	fff00513          	li	a0,-1
    80001dd0:	f29ff06f          	j	80001cf8 <_ZN9Semaphore8sem_waitEj+0x64>

0000000080001dd4 <_ZN9Semaphore4waitEv>:
int  Semaphore::wait(){
    80001dd4:	ff010113          	addi	sp,sp,-16
    80001dd8:	00113423          	sd	ra,8(sp)
    80001ddc:	00813023          	sd	s0,0(sp)
    80001de0:	01010413          	addi	s0,sp,16
    sem_wait(this->myHandle);
    80001de4:	00852503          	lw	a0,8(a0)
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	eac080e7          	jalr	-340(ra) # 80001c94 <_ZN9Semaphore8sem_waitEj>
}
    80001df0:	00000513          	li	a0,0
    80001df4:	00813083          	ld	ra,8(sp)
    80001df8:	00013403          	ld	s0,0(sp)
    80001dfc:	01010113          	addi	sp,sp,16
    80001e00:	00008067          	ret

0000000080001e04 <_ZN9Semaphore10sem_signalEj>:

int Semaphore::sem_signal(sem_t id) {
    80001e04:	fe010113          	addi	sp,sp,-32
    80001e08:	00113c23          	sd	ra,24(sp)
    80001e0c:	00813823          	sd	s0,16(sp)
    80001e10:	00913423          	sd	s1,8(sp)
    80001e14:	02010413          	addi	s0,sp,32
    80001e18:	00050493          	mv	s1,a0
    Semaphore* semaphore = MemoryAllocator::Instance()->getSemaphorePool().getSemaphoreById(id);
    80001e1c:	00001097          	auipc	ra,0x1
    80001e20:	054080e7          	jalr	84(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80001e24:	00001097          	auipc	ra,0x1
    80001e28:	d08080e7          	jalr	-760(ra) # 80002b2c <_ZN15MemoryAllocator16getSemaphorePoolEv>
    80001e2c:	00048593          	mv	a1,s1
    80001e30:	00001097          	auipc	ra,0x1
    80001e34:	608080e7          	jalr	1544(ra) # 80003438 <_ZN13SemaphorePool16getSemaphoreByIdEj>
    if(semaphore == nullptr) return -1;
    80001e38:	06050e63          	beqz	a0,80001eb4 <_ZN9Semaphore10sem_signalEj+0xb0>
    semaphore->val++;
    80001e3c:	00c52783          	lw	a5,12(a0)
    80001e40:	0017879b          	addiw	a5,a5,1
    80001e44:	00f52623          	sw	a5,12(a0)
    if(semaphore->val >= 0 && !semaphore->waiting.empty()){
    80001e48:	02079713          	slli	a4,a5,0x20
    80001e4c:	00075e63          	bgez	a4,80001e68 <_ZN9Semaphore10sem_signalEj+0x64>
        //Unblock one thread and put it in Scheduler as ready
        Thread* thread = semaphore->waiting.remove_beginning();
        scheduler.put(thread);
        thread->semWaitStatus = 0;
    }
    return 0;
    80001e50:	00000513          	li	a0,0
}
    80001e54:	01813083          	ld	ra,24(sp)
    80001e58:	01013403          	ld	s0,16(sp)
    80001e5c:	00813483          	ld	s1,8(sp)
    80001e60:	02010113          	addi	sp,sp,32
    80001e64:	00008067          	ret
    if(semaphore->val >= 0 && !semaphore->waiting.empty()){
    80001e68:	01050493          	addi	s1,a0,16
    80001e6c:	00048513          	mv	a0,s1
    80001e70:	00001097          	auipc	ra,0x1
    80001e74:	548080e7          	jalr	1352(ra) # 800033b8 <_ZN4ListI6ThreadE5emptyEv>
    80001e78:	00050663          	beqz	a0,80001e84 <_ZN9Semaphore10sem_signalEj+0x80>
    return 0;
    80001e7c:	00000513          	li	a0,0
    80001e80:	fd5ff06f          	j	80001e54 <_ZN9Semaphore10sem_signalEj+0x50>
        Thread* thread = semaphore->waiting.remove_beginning();
    80001e84:	00048513          	mv	a0,s1
    80001e88:	00001097          	auipc	ra,0x1
    80001e8c:	4cc080e7          	jalr	1228(ra) # 80003354 <_ZN4ListI6ThreadE16remove_beginningEv>
    80001e90:	00050493          	mv	s1,a0
        scheduler.put(thread);
    80001e94:	00050593          	mv	a1,a0
    80001e98:	00009517          	auipc	a0,0x9
    80001e9c:	7e053503          	ld	a0,2016(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ea0:	00001097          	auipc	ra,0x1
    80001ea4:	8fc080e7          	jalr	-1796(ra) # 8000279c <_ZN9Scheduler3putEP6Thread>
        thread->semWaitStatus = 0;
    80001ea8:	0004a823          	sw	zero,16(s1)
    return 0;
    80001eac:	00000513          	li	a0,0
    80001eb0:	fa5ff06f          	j	80001e54 <_ZN9Semaphore10sem_signalEj+0x50>
    if(semaphore == nullptr) return -1;
    80001eb4:	fff00513          	li	a0,-1
    80001eb8:	f9dff06f          	j	80001e54 <_ZN9Semaphore10sem_signalEj+0x50>

0000000080001ebc <_ZN9Semaphore6signalEv>:
int Semaphore::signal(){
    80001ebc:	ff010113          	addi	sp,sp,-16
    80001ec0:	00113423          	sd	ra,8(sp)
    80001ec4:	00813023          	sd	s0,0(sp)
    80001ec8:	01010413          	addi	s0,sp,16
    sem_signal(this->myHandle);
    80001ecc:	00852503          	lw	a0,8(a0)
    80001ed0:	00000097          	auipc	ra,0x0
    80001ed4:	f34080e7          	jalr	-204(ra) # 80001e04 <_ZN9Semaphore10sem_signalEj>
}
    80001ed8:	00000513          	li	a0,0
    80001edc:	00813083          	ld	ra,8(sp)
    80001ee0:	00013403          	ld	s0,0(sp)
    80001ee4:	01010113          	addi	sp,sp,16
    80001ee8:	00008067          	ret

0000000080001eec <_ZN5RiscV23initialSstatusForThreadEv>:
#include "../h/RiscV.hpp"

// --- Initial SSTATUS za novu nit ---
uint64 RiscV::initialSstatusForThread() {
    80001eec:	ff010113          	addi	sp,sp,-16
    80001ef0:	00813423          	sd	s0,8(sp)
    80001ef4:	01010413          	addi	s0,sp,16

    // SIE = 0 → trenutno maskirani svi prekidi u kernel modu
    sstatus &= ~(1UL << 1);

    return sstatus;
}
    80001ef8:	02000513          	li	a0,32
    80001efc:	00813403          	ld	s0,8(sp)
    80001f00:	01010113          	addi	sp,sp,16
    80001f04:	00008067          	ret

0000000080001f08 <_ZN5RiscV6ms_sipEm>:

// --- SIP manipulacija ---
void RiscV::ms_sip(uint64 mask) {
    80001f08:	ff010113          	addi	sp,sp,-16
    80001f0c:	00813423          	sd	s0,8(sp)
    80001f10:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sip, %[mask]" :: [mask] "r"(mask));
    80001f14:	14452073          	csrs	sip,a0
}
    80001f18:	00813403          	ld	s0,8(sp)
    80001f1c:	01010113          	addi	sp,sp,16
    80001f20:	00008067          	ret

0000000080001f24 <_ZN5RiscV6mc_sipEm>:

void RiscV::mc_sip(uint64 mask) {
    80001f24:	ff010113          	addi	sp,sp,-16
    80001f28:	00813423          	sd	s0,8(sp)
    80001f2c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sip, %[mask]" :: [mask] "r"(mask));
    80001f30:	14453073          	csrc	sip,a0
}
    80001f34:	00813403          	ld	s0,8(sp)
    80001f38:	01010113          	addi	sp,sp,16
    80001f3c:	00008067          	ret

0000000080001f40 <_ZN5RiscV5r_sipEv>:

uint64 RiscV::r_sip() {
    80001f40:	ff010113          	addi	sp,sp,-16
    80001f44:	00813423          	sd	s0,8(sp)
    80001f48:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], sip" : [val] "=r"(val));
    80001f4c:	14402573          	csrr	a0,sip
    return val;
}
    80001f50:	00813403          	ld	s0,8(sp)
    80001f54:	01010113          	addi	sp,sp,16
    80001f58:	00008067          	ret

0000000080001f5c <_ZN5RiscV7r_stvecEv>:

// --- STVEC manipulacija ---
uint64 RiscV::r_stvec() {
    80001f5c:	ff010113          	addi	sp,sp,-16
    80001f60:	00813423          	sd	s0,8(sp)
    80001f64:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], stvec" : [val] "=r"(val));
    80001f68:	10502573          	csrr	a0,stvec
    return val;
}
    80001f6c:	00813403          	ld	s0,8(sp)
    80001f70:	01010113          	addi	sp,sp,16
    80001f74:	00008067          	ret

0000000080001f78 <_ZN5RiscV7w_stvecEm>:

void RiscV::w_stvec(uint64 val) {
    80001f78:	ff010113          	addi	sp,sp,-16
    80001f7c:	00813423          	sd	s0,8(sp)
    80001f80:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[val]" :: [val] "r"(val));
    80001f84:	10551073          	csrw	stvec,a0
}
    80001f88:	00813403          	ld	s0,8(sp)
    80001f8c:	01010113          	addi	sp,sp,16
    80001f90:	00008067          	ret

0000000080001f94 <_ZN5RiscV6r_sepcEv>:

// --- SEPC manipulacija ---
uint64 RiscV::r_sepc() {
    80001f94:	ff010113          	addi	sp,sp,-16
    80001f98:	00813423          	sd	s0,8(sp)
    80001f9c:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], sepc" : [val] "=r"(val));
    80001fa0:	14102573          	csrr	a0,sepc
    return val;
}
    80001fa4:	00813403          	ld	s0,8(sp)
    80001fa8:	01010113          	addi	sp,sp,16
    80001fac:	00008067          	ret

0000000080001fb0 <_ZN5RiscV6w_sepcEm>:

void RiscV::w_sepc(uint64 val) {
    80001fb0:	ff010113          	addi	sp,sp,-16
    80001fb4:	00813423          	sd	s0,8(sp)
    80001fb8:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw sepc, %[val]" :: [val] "r"(val));
    80001fbc:	14151073          	csrw	sepc,a0
}
    80001fc0:	00813403          	ld	s0,8(sp)
    80001fc4:	01010113          	addi	sp,sp,16
    80001fc8:	00008067          	ret

0000000080001fcc <_ZN5RiscV10ms_sstatusEm>:

// --- SSTATUS manipulacija ---
void RiscV::ms_sstatus(uint64 mask) {
    80001fcc:	ff010113          	addi	sp,sp,-16
    80001fd0:	00813423          	sd	s0,8(sp)
    80001fd4:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrs sstatus, %[mask]" :: [mask] "r"(mask));
    80001fd8:	10052073          	csrs	sstatus,a0
}
    80001fdc:	00813403          	ld	s0,8(sp)
    80001fe0:	01010113          	addi	sp,sp,16
    80001fe4:	00008067          	ret

0000000080001fe8 <_ZN5RiscV10mc_sstatusEm>:

void RiscV::mc_sstatus(uint64 mask) {
    80001fe8:	ff010113          	addi	sp,sp,-16
    80001fec:	00813423          	sd	s0,8(sp)
    80001ff0:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrc sstatus, %[mask]" :: [mask] "r"(mask));
    80001ff4:	10053073          	csrc	sstatus,a0
}
    80001ff8:	00813403          	ld	s0,8(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret

0000000080002004 <_ZN5RiscV9r_sstatusEv>:

uint64 RiscV::r_sstatus() {
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
    uint64 val;
    __asm__ volatile("csrr %[val], sstatus" : [val] "=r"(val));
    80002010:	10002573          	csrr	a0,sstatus
    return val;
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

0000000080002074 <_ZN5RiscV16switchToUserModeEv>:



void RiscV::switchToUserMode(){
    80002074:	ff010113          	addi	sp,sp,-16
    80002078:	00113423          	sd	ra,8(sp)
    8000207c:	00813023          	sd	s0,0(sp)
    80002080:	01010413          	addi	s0,sp,16
    uint64 sstatus = r_sstatus();
    80002084:	00000097          	auipc	ra,0x0
    80002088:	f80080e7          	jalr	-128(ra) # 80002004 <_ZN5RiscV9r_sstatusEv>
    sstatus = sstatus & (~SSTATUS_SPP);
    8000208c:	eff57513          	andi	a0,a0,-257
    sstatus = sstatus | SSTATUS_SPIE;
    w_sstatus(sstatus);
    80002090:	02056513          	ori	a0,a0,32
    80002094:	00000097          	auipc	ra,0x0
    80002098:	f8c080e7          	jalr	-116(ra) # 80002020 <_ZN5RiscV9w_sstatusEm>

    return;
    8000209c:	00813083          	ld	ra,8(sp)
    800020a0:	00013403          	ld	s0,0(sp)
    800020a4:	01010113          	addi	sp,sp,16
    800020a8:	00008067          	ret

00000000800020ac <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>:
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    context.startedOnce = 0;
    context.wasActive = 0;
    context.timeSlice = DEFAULT_TIME_SLICE;
    wrapperArgs.userArgs = this;
    wrapperArgs.userFunc = this->body = [](void* obj){
    800020ac:	ff010113          	addi	sp,sp,-16
    800020b0:	00113423          	sd	ra,8(sp)
    800020b4:	00813023          	sd	s0,0(sp)
    800020b8:	01010413          	addi	s0,sp,16
        static_cast<Thread*>(obj)->run();
    800020bc:	00053783          	ld	a5,0(a0)
    800020c0:	0107b783          	ld	a5,16(a5)
    800020c4:	000780e7          	jalr	a5
    };
    800020c8:	00813083          	ld	ra,8(sp)
    800020cc:	00013403          	ld	s0,0(sp)
    800020d0:	01010113          	addi	sp,sp,16
    800020d4:	00008067          	ret

00000000800020d8 <_ZN6ThreadD1Ev>:
    }


}

Thread::~Thread(){}
    800020d8:	ff010113          	addi	sp,sp,-16
    800020dc:	00813423          	sd	s0,8(sp)
    800020e0:	01010413          	addi	s0,sp,16
    800020e4:	00813403          	ld	s0,8(sp)
    800020e8:	01010113          	addi	sp,sp,16
    800020ec:	00008067          	ret

00000000800020f0 <_ZN6ThreadC1EPFvPvES0_S0_>:
Thread::Thread(void (*body)(void*), void* arg, void* stack_top) {
    800020f0:	ff010113          	addi	sp,sp,-16
    800020f4:	00813423          	sd	s0,8(sp)
    800020f8:	01010413          	addi	s0,sp,16
    800020fc:	00009797          	auipc	a5,0x9
    80002100:	39478793          	addi	a5,a5,916 # 8000b490 <_ZTV6Thread+0x10>
    80002104:	00f53023          	sd	a5,0(a0)
    this->next = nullptr;
    80002108:	00053423          	sd	zero,8(a0)
    this->body = body;
    8000210c:	06b53c23          	sd	a1,120(a0)
    this->arg = arg;
    80002110:	08c53023          	sd	a2,128(a0)
    threadId = cnt++;
    80002114:	00009717          	auipc	a4,0x9
    80002118:	5cc70713          	addi	a4,a4,1484 # 8000b6e0 <_ZN6Thread3cntE>
    8000211c:	00072783          	lw	a5,0(a4)
    80002120:	0017881b          	addiw	a6,a5,1
    80002124:	01072023          	sw	a6,0(a4)
    80002128:	00f52a23          	sw	a5,20(a0)
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    8000212c:	fffff7b7          	lui	a5,0xfffff
    80002130:	00f687b3          	add	a5,a3,a5
    80002134:	02f53023          	sd	a5,32(a0)
    context.sp = (uint64)stack_top;
    80002138:	02d53823          	sd	a3,48(a0)
    context.pc = (uint64)&thread_wrapper;
    8000213c:	00009717          	auipc	a4,0x9
    80002140:	54473703          	ld	a4,1348(a4) # 8000b680 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002144:	00e53c23          	sd	a4,24(a0)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    80002148:	ffffe737          	lui	a4,0xffffe
    8000214c:	00e686b3          	add	a3,a3,a4
    80002150:	02d53423          	sd	a3,40(a0)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    80002154:	02f53c23          	sd	a5,56(a0)
    context.startedOnce = (uint64)0;
    80002158:	04053423          	sd	zero,72(a0)
    context.wasActive = (uint64)0;
    8000215c:	04053823          	sd	zero,80(a0)
    this->wrapperArgs.userArgs = arg;
    80002160:	06c53423          	sd	a2,104(a0)
    this->wrapperArgs.userFunc = body;
    80002164:	06b53023          	sd	a1,96(a0)
    context.timeSlice = DEFAULT_TIME_SLICE;
    80002168:	00200793          	li	a5,2
    8000216c:	04f53c23          	sd	a5,88(a0)
}
    80002170:	00813403          	ld	s0,8(sp)
    80002174:	01010113          	addi	sp,sp,16
    80002178:	00008067          	ret

000000008000217c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    8000217c:	fe010113          	addi	sp,sp,-32
    80002180:	00113c23          	sd	ra,24(sp)
    80002184:	00813823          	sd	s0,16(sp)
    80002188:	00913423          	sd	s1,8(sp)
    8000218c:	02010413          	addi	s0,sp,32
    80002190:	00050493          	mv	s1,a0
    80002194:	00009797          	auipc	a5,0x9
    80002198:	2fc78793          	addi	a5,a5,764 # 8000b490 <_ZTV6Thread+0x10>
    8000219c:	00f53023          	sd	a5,0(a0)
    void* result = MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    800021a0:	00001097          	auipc	ra,0x1
    800021a4:	cd0080e7          	jalr	-816(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    800021a8:	08100593          	li	a1,129
    800021ac:	00001097          	auipc	ra,0x1
    800021b0:	a3c080e7          	jalr	-1476(ra) # 80002be8 <_ZN15MemoryAllocator9mem_allocEm>
    void* stack = (char*)result + sizeof(Header);
    800021b4:	00850713          	addi	a4,a0,8
    void* stack_top = (char*)stack + 2 * DEFAULT_STACK_SIZE;
    800021b8:	000027b7          	lui	a5,0x2
    800021bc:	00878793          	addi	a5,a5,8 # 2008 <_entry-0x7fffdff8>
    800021c0:	00f507b3          	add	a5,a0,a5
    this->next = nullptr;
    800021c4:	0004b423          	sd	zero,8(s1)
    this->arg = nullptr;
    800021c8:	0804b023          	sd	zero,128(s1)
    threadId = cnt++;
    800021cc:	00009617          	auipc	a2,0x9
    800021d0:	51460613          	addi	a2,a2,1300 # 8000b6e0 <_ZN6Thread3cntE>
    800021d4:	00062683          	lw	a3,0(a2)
    800021d8:	0016859b          	addiw	a1,a3,1
    800021dc:	00b62023          	sw	a1,0(a2)
    800021e0:	00d4aa23          	sw	a3,20(s1)
    context.userStack = (uint64*)((char*)stack_top - DEFAULT_STACK_SIZE);
    800021e4:	000016b7          	lui	a3,0x1
    800021e8:	00868613          	addi	a2,a3,8 # 1008 <_entry-0x7fffeff8>
    800021ec:	00c50533          	add	a0,a0,a2
    800021f0:	02a4b023          	sd	a0,32(s1)
    context.sp = (uint64)stack_top;
    800021f4:	02f4b823          	sd	a5,48(s1)
    context.pc = (uint64)&thread_wrapper;
    800021f8:	00009797          	auipc	a5,0x9
    800021fc:	4887b783          	ld	a5,1160(a5) # 8000b680 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002200:	00f4bc23          	sd	a5,24(s1)
    context.kernelStack = (uint64*)((char*)stack_top - 2 * DEFAULT_STACK_SIZE);
    80002204:	02e4b423          	sd	a4,40(s1)
    context.ssp = (uint64)((char*)context.kernelStack + DEFAULT_STACK_SIZE);
    80002208:	00d70733          	add	a4,a4,a3
    8000220c:	02e4bc23          	sd	a4,56(s1)
    context.startedOnce = 0;
    80002210:	0404b423          	sd	zero,72(s1)
    context.wasActive = 0;
    80002214:	0404b823          	sd	zero,80(s1)
    context.timeSlice = DEFAULT_TIME_SLICE;
    80002218:	00200793          	li	a5,2
    8000221c:	04f4bc23          	sd	a5,88(s1)
    wrapperArgs.userArgs = this;
    80002220:	0694b423          	sd	s1,104(s1)
    wrapperArgs.userFunc = this->body = [](void* obj){
    80002224:	00000797          	auipc	a5,0x0
    80002228:	e8878793          	addi	a5,a5,-376 # 800020ac <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>
    8000222c:	06f4bc23          	sd	a5,120(s1)
    80002230:	06f4b023          	sd	a5,96(s1)
}
    80002234:	01813083          	ld	ra,24(sp)
    80002238:	01013403          	ld	s0,16(sp)
    8000223c:	00813483          	ld	s1,8(sp)
    80002240:	02010113          	addi	sp,sp,32
    80002244:	00008067          	ret

0000000080002248 <_ZN6Thread21clearTimeSliceCounterEv>:
void Thread::clearTimeSliceCounter() {
    80002248:	ff010113          	addi	sp,sp,-16
    8000224c:	00813423          	sd	s0,8(sp)
    80002250:	01010413          	addi	s0,sp,16
    Thread::timeSliceCounter = 0;
    80002254:	00009797          	auipc	a5,0x9
    80002258:	4807ba23          	sd	zero,1172(a5) # 8000b6e8 <_ZN6Thread16timeSliceCounterE>
}
    8000225c:	00813403          	ld	s0,8(sp)
    80002260:	01010113          	addi	sp,sp,16
    80002264:	00008067          	ret

0000000080002268 <_ZN6Thread19getTimeSliceCounterEv>:
uint64 Thread::getTimeSliceCounter() {
    80002268:	ff010113          	addi	sp,sp,-16
    8000226c:	00813423          	sd	s0,8(sp)
    80002270:	01010413          	addi	s0,sp,16
}
    80002274:	00009517          	auipc	a0,0x9
    80002278:	47453503          	ld	a0,1140(a0) # 8000b6e8 <_ZN6Thread16timeSliceCounterE>
    8000227c:	00813403          	ld	s0,8(sp)
    80002280:	01010113          	addi	sp,sp,16
    80002284:	00008067          	ret

0000000080002288 <_ZN6Thread25incrementtimeSliceCounterEv>:
void Thread::incrementtimeSliceCounter() {
    80002288:	ff010113          	addi	sp,sp,-16
    8000228c:	00813423          	sd	s0,8(sp)
    80002290:	01010413          	addi	s0,sp,16
    Thread::timeSliceCounter++;
    80002294:	00009717          	auipc	a4,0x9
    80002298:	44c70713          	addi	a4,a4,1100 # 8000b6e0 <_ZN6Thread3cntE>
    8000229c:	00873783          	ld	a5,8(a4)
    800022a0:	00178793          	addi	a5,a5,1
    800022a4:	00f73423          	sd	a5,8(a4)
}
    800022a8:	00813403          	ld	s0,8(sp)
    800022ac:	01010113          	addi	sp,sp,16
    800022b0:	00008067          	ret

00000000800022b4 <_ZN6Thread12getTimeSliceEv>:
uint64 Thread::getTimeSlice() {
    800022b4:	ff010113          	addi	sp,sp,-16
    800022b8:	00813423          	sd	s0,8(sp)
    800022bc:	01010413          	addi	s0,sp,16
}
    800022c0:	05853503          	ld	a0,88(a0)
    800022c4:	00813403          	ld	s0,8(sp)
    800022c8:	01010113          	addi	sp,sp,16
    800022cc:	00008067          	ret

00000000800022d0 <_ZN6Thread10getContextEv>:

ThreadContext* Thread::getContext() {
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00813423          	sd	s0,8(sp)
    800022d8:	01010413          	addi	s0,sp,16
    return &this->context;
}
    800022dc:	01850513          	addi	a0,a0,24
    800022e0:	00813403          	ld	s0,8(sp)
    800022e4:	01010113          	addi	sp,sp,16
    800022e8:	00008067          	ret

00000000800022ec <_ZN6Thread18thread_exit_kernelEv>:
int Thread::thread_exit_kernel(){
    800022ec:	fe010113          	addi	sp,sp,-32
    800022f0:	00113c23          	sd	ra,24(sp)
    800022f4:	00813823          	sd	s0,16(sp)
    800022f8:	00913423          	sd	s1,8(sp)
    800022fc:	02010413          	addi	s0,sp,32
    Thread* oldRunning = Thread::running;
    80002300:	00009517          	auipc	a0,0x9
    80002304:	3f053503          	ld	a0,1008(a0) # 8000b6f0 <_ZN6Thread7runningE>
    delete oldRunning;
    80002308:	00050863          	beqz	a0,80002318 <_ZN6Thread18thread_exit_kernelEv+0x2c>
    8000230c:	00053783          	ld	a5,0(a0)
    80002310:	0087b783          	ld	a5,8(a5)
    80002314:	000780e7          	jalr	a5
    Thread::running = scheduler.get();
    80002318:	00009517          	auipc	a0,0x9
    8000231c:	36053503          	ld	a0,864(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002320:	00000097          	auipc	ra,0x0
    80002324:	4b4080e7          	jalr	1204(ra) # 800027d4 <_ZN9Scheduler3getEv>
    80002328:	00050493          	mv	s1,a0
    8000232c:	00009797          	auipc	a5,0x9
    80002330:	3ca7b223          	sd	a0,964(a5) # 8000b6f0 <_ZN6Thread7runningE>
    if(Thread::running){
    80002334:	02050a63          	beqz	a0,80002368 <_ZN6Thread18thread_exit_kernelEv+0x7c>
        if(Thread::running->getContext()->wasActive == 1){
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	f98080e7          	jalr	-104(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80002340:	03853703          	ld	a4,56(a0)
    80002344:	00100793          	li	a5,1
    80002348:	02f70c63          	beq	a4,a5,80002380 <_ZN6Thread18thread_exit_kernelEv+0x94>
            Thread::running->getContext()->wasActive = 1;
    8000234c:	00100793          	li	a5,1
    80002350:	02f53c23          	sd	a5,56(a0)
            ThreadWrapperArgs* wa = &Thread::running->wrapperArgs;
    80002354:	06048593          	addi	a1,s1,96
            if (Thread::running->body != nullptr) {
    80002358:	0784b783          	ld	a5,120(s1)
    8000235c:	00078663          	beqz	a5,80002368 <_ZN6Thread18thread_exit_kernelEv+0x7c>
                thread_wrapper(tc, wa);
    80002360:	fffff097          	auipc	ra,0xfffff
    80002364:	f98080e7          	jalr	-104(ra) # 800012f8 <thread_wrapper>
}
    80002368:	00000513          	li	a0,0
    8000236c:	01813083          	ld	ra,24(sp)
    80002370:	01013403          	ld	s0,16(sp)
    80002374:	00813483          	ld	s1,8(sp)
    80002378:	02010113          	addi	sp,sp,32
    8000237c:	00008067          	ret
            restore_context_kernel_mode(&Thread::running->context);
    80002380:	01848513          	addi	a0,s1,24
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	ea8080e7          	jalr	-344(ra) # 8000122c <restore_context_kernel_mode>
    8000238c:	fddff06f          	j	80002368 <_ZN6Thread18thread_exit_kernelEv+0x7c>

0000000080002390 <_ZN6Thread22thread_dispatch_kernelEv>:
void Thread::thread_dispatch_kernel() {
    80002390:	fe010113          	addi	sp,sp,-32
    80002394:	00113c23          	sd	ra,24(sp)
    80002398:	00813823          	sd	s0,16(sp)
    8000239c:	00913423          	sd	s1,8(sp)
    800023a0:	02010413          	addi	s0,sp,32
    Thread* oldRunning = Thread::running;
    800023a4:	00009597          	auipc	a1,0x9
    800023a8:	34c5b583          	ld	a1,844(a1) # 8000b6f0 <_ZN6Thread7runningE>
    if(oldRunning)
    800023ac:	00058a63          	beqz	a1,800023c0 <_ZN6Thread22thread_dispatch_kernelEv+0x30>
        scheduler.put(oldRunning);
    800023b0:	00009517          	auipc	a0,0x9
    800023b4:	2c853503          	ld	a0,712(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    800023b8:	00000097          	auipc	ra,0x0
    800023bc:	3e4080e7          	jalr	996(ra) # 8000279c <_ZN9Scheduler3putEP6Thread>
    Thread::running = scheduler.get();
    800023c0:	00009517          	auipc	a0,0x9
    800023c4:	2b853503          	ld	a0,696(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	40c080e7          	jalr	1036(ra) # 800027d4 <_ZN9Scheduler3getEv>
    800023d0:	00050493          	mv	s1,a0
    800023d4:	00009797          	auipc	a5,0x9
    800023d8:	30a7be23          	sd	a0,796(a5) # 8000b6f0 <_ZN6Thread7runningE>
    if(Thread::running->getContext()->wasActive == 1){
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	ef4080e7          	jalr	-268(ra) # 800022d0 <_ZN6Thread10getContextEv>
    800023e4:	03853703          	ld	a4,56(a0)
    800023e8:	00100793          	li	a5,1
    800023ec:	02f70a63          	beq	a4,a5,80002420 <_ZN6Thread22thread_dispatch_kernelEv+0x90>
        Thread::running->getContext()->wasActive = 1;
    800023f0:	00100793          	li	a5,1
    800023f4:	02f53c23          	sd	a5,56(a0)
        ThreadWrapperArgs *wa = &Thread::running->wrapperArgs;
    800023f8:	06048593          	addi	a1,s1,96
        if (Thread::running->body) {
    800023fc:	0784b783          	ld	a5,120(s1)
    80002400:	02078863          	beqz	a5,80002430 <_ZN6Thread22thread_dispatch_kernelEv+0xa0>
            thread_wrapper(tc, wa);
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	ef4080e7          	jalr	-268(ra) # 800012f8 <thread_wrapper>
}
    8000240c:	01813083          	ld	ra,24(sp)
    80002410:	01013403          	ld	s0,16(sp)
    80002414:	00813483          	ld	s1,8(sp)
    80002418:	02010113          	addi	sp,sp,32
    8000241c:	00008067          	ret
        restore_context_kernel_mode(&Thread::running->context);
    80002420:	01848513          	addi	a0,s1,24
    80002424:	fffff097          	auipc	ra,0xfffff
    80002428:	e08080e7          	jalr	-504(ra) # 8000122c <restore_context_kernel_mode>
    8000242c:	fe1ff06f          	j	8000240c <_ZN6Thread22thread_dispatch_kernelEv+0x7c>
            Thread::running->run();
    80002430:	0004b783          	ld	a5,0(s1)
    80002434:	0107b783          	ld	a5,16(a5)
    80002438:	00048513          	mv	a0,s1
    8000243c:	000780e7          	jalr	a5
            Thread::thread_exit_kernel(); // posle run() nit treba da se završi
    80002440:	00000097          	auipc	ra,0x0
    80002444:	eac080e7          	jalr	-340(ra) # 800022ec <_ZN6Thread18thread_exit_kernelEv>
}
    80002448:	fc5ff06f          	j	8000240c <_ZN6Thread22thread_dispatch_kernelEv+0x7c>

000000008000244c <_ZN6Thread14getWrapperArgsEv>:

ThreadWrapperArgs* Thread::getWrapperArgs() {
    8000244c:	ff010113          	addi	sp,sp,-16
    80002450:	00813423          	sd	s0,8(sp)
    80002454:	01010413          	addi	s0,sp,16
    return &this->wrapperArgs;
}
    80002458:	06050513          	addi	a0,a0,96
    8000245c:	00813403          	ld	s0,8(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN6ThreadnwEm>:
void* Thread::operator new(size_t size){
    80002468:	ff010113          	addi	sp,sp,-16
    8000246c:	00113423          	sd	ra,8(sp)
    80002470:	00813023          	sd	s0,0(sp)
    80002474:	01010413          	addi	s0,sp,16

    void* mem = (void*)MemoryAllocator::Instance()->getThreadPool().allocate();
    80002478:	00001097          	auipc	ra,0x1
    8000247c:	9f8080e7          	jalr	-1544(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80002480:	00000097          	auipc	ra,0x0
    80002484:	690080e7          	jalr	1680(ra) # 80002b10 <_ZN15MemoryAllocator13getThreadPoolEv>
    80002488:	fffff097          	auipc	ra,0xfffff
    8000248c:	4ac080e7          	jalr	1196(ra) # 80001934 <_ZN10ThreadPool8allocateEv>
    return mem;
}
    80002490:	00813083          	ld	ra,8(sp)
    80002494:	00013403          	ld	s0,0(sp)
    80002498:	01010113          	addi	sp,sp,16
    8000249c:	00008067          	ret

00000000800024a0 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>:
    if(!handle || !routine || !stack_top)return -1;
    800024a0:	0e050c63          	beqz	a0,80002598 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xf8>
int Thread::create_thread_kernel(thread_t* handle, void(*routine)(void*) , void* args, void* stack_top){
    800024a4:	fc010113          	addi	sp,sp,-64
    800024a8:	02113c23          	sd	ra,56(sp)
    800024ac:	02813823          	sd	s0,48(sp)
    800024b0:	02913423          	sd	s1,40(sp)
    800024b4:	03213023          	sd	s2,32(sp)
    800024b8:	01313c23          	sd	s3,24(sp)
    800024bc:	01413823          	sd	s4,16(sp)
    800024c0:	01513423          	sd	s5,8(sp)
    800024c4:	04010413          	addi	s0,sp,64
    800024c8:	00050913          	mv	s2,a0
    800024cc:	00058993          	mv	s3,a1
    800024d0:	00060a93          	mv	s5,a2
    800024d4:	00068a13          	mv	s4,a3
    if(!handle || !routine || !stack_top)return -1;
    800024d8:	0c058463          	beqz	a1,800025a0 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x100>
    800024dc:	0c068663          	beqz	a3,800025a8 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x108>
    Thread* thread = new Thread(routine, args, stack_top);
    800024e0:	08800513          	li	a0,136
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	f84080e7          	jalr	-124(ra) # 80002468 <_ZN6ThreadnwEm>
    800024ec:	00050493          	mv	s1,a0
    800024f0:	000a0693          	mv	a3,s4
    800024f4:	000a8613          	mv	a2,s5
    800024f8:	00098593          	mv	a1,s3
    800024fc:	00000097          	auipc	ra,0x0
    80002500:	bf4080e7          	jalr	-1036(ra) # 800020f0 <_ZN6ThreadC1EPFvPvES0_S0_>
    if(!thread) return -2;
    80002504:	0a048663          	beqz	s1,800025b0 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x110>
    *handle =  thread->threadId;
    80002508:	0144a783          	lw	a5,20(s1)
    8000250c:	00f92023          	sw	a5,0(s2)
    scheduler.put(thread);
    80002510:	00048593          	mv	a1,s1
    80002514:	00009517          	auipc	a0,0x9
    80002518:	16453503          	ld	a0,356(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	280080e7          	jalr	640(ra) # 8000279c <_ZN9Scheduler3putEP6Thread>
    if(Thread::running == nullptr)
    80002524:	00009797          	auipc	a5,0x9
    80002528:	1cc7b783          	ld	a5,460(a5) # 8000b6f0 <_ZN6Thread7runningE>
    8000252c:	02078663          	beqz	a5,80002558 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0xb8>
    return 0;
    80002530:	00000513          	li	a0,0
}
    80002534:	03813083          	ld	ra,56(sp)
    80002538:	03013403          	ld	s0,48(sp)
    8000253c:	02813483          	ld	s1,40(sp)
    80002540:	02013903          	ld	s2,32(sp)
    80002544:	01813983          	ld	s3,24(sp)
    80002548:	01013a03          	ld	s4,16(sp)
    8000254c:	00813a83          	ld	s5,8(sp)
    80002550:	04010113          	addi	sp,sp,64
    80002554:	00008067          	ret
        Thread::running = scheduler.get();
    80002558:	00009517          	auipc	a0,0x9
    8000255c:	12053503          	ld	a0,288(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002560:	00000097          	auipc	ra,0x0
    80002564:	274080e7          	jalr	628(ra) # 800027d4 <_ZN9Scheduler3getEv>
    80002568:	00050493          	mv	s1,a0
    8000256c:	00009797          	auipc	a5,0x9
    80002570:	18a7b223          	sd	a0,388(a5) # 8000b6f0 <_ZN6Thread7runningE>
        ThreadContext* tc = Thread::running->getContext();
    80002574:	00000097          	auipc	ra,0x0
    80002578:	d5c080e7          	jalr	-676(ra) # 800022d0 <_ZN6Thread10getContextEv>
        Thread::running->getContext()->wasActive = 1;
    8000257c:	00100793          	li	a5,1
    80002580:	02f53c23          	sd	a5,56(a0)
        thread_wrapper(tc, wa);
    80002584:	06048593          	addi	a1,s1,96
    80002588:	fffff097          	auipc	ra,0xfffff
    8000258c:	d70080e7          	jalr	-656(ra) # 800012f8 <thread_wrapper>
    return 0;
    80002590:	00000513          	li	a0,0
    80002594:	fa1ff06f          	j	80002534 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    if(!handle || !routine || !stack_top)return -1;
    80002598:	fff00513          	li	a0,-1
}
    8000259c:	00008067          	ret
    if(!handle || !routine || !stack_top)return -1;
    800025a0:	fff00513          	li	a0,-1
    800025a4:	f91ff06f          	j	80002534 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    800025a8:	fff00513          	li	a0,-1
    800025ac:	f89ff06f          	j	80002534 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>
    if(!thread) return -2;
    800025b0:	ffe00513          	li	a0,-2
    800025b4:	f81ff06f          	j	80002534 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_+0x94>

00000000800025b8 <_ZN6ThreaddlEPv>:
void Thread::operator delete(void* mem )noexcept{
    800025b8:	fe010113          	addi	sp,sp,-32
    800025bc:	00113c23          	sd	ra,24(sp)
    800025c0:	00813823          	sd	s0,16(sp)
    800025c4:	00913423          	sd	s1,8(sp)
    800025c8:	02010413          	addi	s0,sp,32
    800025cc:	00050493          	mv	s1,a0
MemoryAllocator::Instance()->getThreadPool().deallocate((Thread*) mem);
    800025d0:	00001097          	auipc	ra,0x1
    800025d4:	8a0080e7          	jalr	-1888(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    800025d8:	00000097          	auipc	ra,0x0
    800025dc:	538080e7          	jalr	1336(ra) # 80002b10 <_ZN15MemoryAllocator13getThreadPoolEv>
    800025e0:	00048593          	mv	a1,s1
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	3b4080e7          	jalr	948(ra) # 80001998 <_ZN10ThreadPool10deallocateEP6Thread>
}
    800025ec:	01813083          	ld	ra,24(sp)
    800025f0:	01013403          	ld	s0,16(sp)
    800025f4:	00813483          	ld	s1,8(sp)
    800025f8:	02010113          	addi	sp,sp,32
    800025fc:	00008067          	ret

0000000080002600 <_ZN6ThreadD0Ev>:
Thread::~Thread(){}
    80002600:	ff010113          	addi	sp,sp,-16
    80002604:	00113423          	sd	ra,8(sp)
    80002608:	00813023          	sd	s0,0(sp)
    8000260c:	01010413          	addi	s0,sp,16
    80002610:	00000097          	auipc	ra,0x0
    80002614:	fa8080e7          	jalr	-88(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80002618:	00813083          	ld	ra,8(sp)
    8000261c:	00013403          	ld	s0,0(sp)
    80002620:	01010113          	addi	sp,sp,16
    80002624:	00008067          	ret

0000000080002628 <_ZN6Thread8dispatchEv>:

void Thread::dispatch(){
    80002628:	ff010113          	addi	sp,sp,-16
    8000262c:	00113423          	sd	ra,8(sp)
    80002630:	00813023          	sd	s0,0(sp)
    80002634:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002638:	fffff097          	auipc	ra,0xfffff
    8000263c:	038080e7          	jalr	56(ra) # 80001670 <thread_dispatch>
}
    80002640:	00813083          	ld	ra,8(sp)
    80002644:	00013403          	ld	s0,0(sp)
    80002648:	01010113          	addi	sp,sp,16
    8000264c:	00008067          	ret

0000000080002650 <_ZN6Thread5startEv>:

int Thread::start() {
    80002650:	ff010113          	addi	sp,sp,-16
    80002654:	00113423          	sd	ra,8(sp)
    80002658:	00813023          	sd	s0,0(sp)
    8000265c:	01010413          	addi	s0,sp,16
    80002660:	00050593          	mv	a1,a0
    scheduler.put(this);
    80002664:	00009517          	auipc	a0,0x9
    80002668:	01453503          	ld	a0,20(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000266c:	00000097          	auipc	ra,0x0
    80002670:	130080e7          	jalr	304(ra) # 8000279c <_ZN9Scheduler3putEP6Thread>

    // Ako nema running niti, samo uzmi nit iz schedulera i postavi running
    if(Thread::running == nullptr) {
    80002674:	00009797          	auipc	a5,0x9
    80002678:	07c7b783          	ld	a5,124(a5) # 8000b6f0 <_ZN6Thread7runningE>
    8000267c:	00078c63          	beqz	a5,80002694 <_ZN6Thread5startEv+0x44>
        if(Thread::running == nullptr) return -1;

        // Ne pokreći odmah thread_wrapper!
        // Pričekaj da dispatcher pozove dispatch ili scheduler
    }
    return 0;
    80002680:	00000513          	li	a0,0
}
    80002684:	00813083          	ld	ra,8(sp)
    80002688:	00013403          	ld	s0,0(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret
        Thread::running = scheduler.get();
    80002694:	00009517          	auipc	a0,0x9
    80002698:	fe453503          	ld	a0,-28(a0) # 8000b678 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000269c:	00000097          	auipc	ra,0x0
    800026a0:	138080e7          	jalr	312(ra) # 800027d4 <_ZN9Scheduler3getEv>
    800026a4:	00009797          	auipc	a5,0x9
    800026a8:	04a7b623          	sd	a0,76(a5) # 8000b6f0 <_ZN6Thread7runningE>
        if(Thread::running == nullptr) return -1;
    800026ac:	00050663          	beqz	a0,800026b8 <_ZN6Thread5startEv+0x68>
    return 0;
    800026b0:	00000513          	li	a0,0
    800026b4:	fd1ff06f          	j	80002684 <_ZN6Thread5startEv+0x34>
        if(Thread::running == nullptr) return -1;
    800026b8:	fff00513          	li	a0,-1
    800026bc:	fc9ff06f          	j	80002684 <_ZN6Thread5startEv+0x34>

00000000800026c0 <getRunningThreadContext>:



extern "C" ThreadContext* getRunningThreadContext(){
    if(Thread::running == nullptr){
    800026c0:	00009517          	auipc	a0,0x9
    800026c4:	03053503          	ld	a0,48(a0) # 8000b6f0 <_ZN6Thread7runningE>
    800026c8:	02050663          	beqz	a0,800026f4 <getRunningThreadContext+0x34>
extern "C" ThreadContext* getRunningThreadContext(){
    800026cc:	ff010113          	addi	sp,sp,-16
    800026d0:	00113423          	sd	ra,8(sp)
    800026d4:	00813023          	sd	s0,0(sp)
    800026d8:	01010413          	addi	s0,sp,16
        return nullptr;
    }
    return Thread::running->getContext();
    800026dc:	00000097          	auipc	ra,0x0
    800026e0:	bf4080e7          	jalr	-1036(ra) # 800022d0 <_ZN6Thread10getContextEv>
};
    800026e4:	00813083          	ld	ra,8(sp)
    800026e8:	00013403          	ld	s0,0(sp)
    800026ec:	01010113          	addi	sp,sp,16
    800026f0:	00008067          	ret
    800026f4:	00008067          	ret

00000000800026f8 <getWaitStatusForRunning>:

extern "C" int getWaitStatusForRunning(){
    800026f8:	ff010113          	addi	sp,sp,-16
    800026fc:	00813423          	sd	s0,8(sp)
    80002700:	01010413          	addi	s0,sp,16
    return Thread::running->semWaitStatus;
}
    80002704:	00009797          	auipc	a5,0x9
    80002708:	fec7b783          	ld	a5,-20(a5) # 8000b6f0 <_ZN6Thread7runningE>
    8000270c:	0107a503          	lw	a0,16(a5)
    80002710:	00813403          	ld	s0,8(sp)
    80002714:	01010113          	addi	sp,sp,16
    80002718:	00008067          	ret

000000008000271c <_ZN6Thread3runEv>:
    ThreadContext* getContext();
    ThreadWrapperArgs* getWrapperArgs();
    Thread* next;
    int semWaitStatus;

    virtual void run (){};
    8000271c:	ff010113          	addi	sp,sp,-16
    80002720:	00813423          	sd	s0,8(sp)
    80002724:	01010413          	addi	s0,sp,16
    80002728:	00813403          	ld	s0,8(sp)
    8000272c:	01010113          	addi	sp,sp,16
    80002730:	00008067          	ret

0000000080002734 <_ZN9SchedulerC1Ev>:
#include "../h/Scheduler.hpp"

Scheduler scheduler;

Scheduler::Scheduler() {
    80002734:	ff010113          	addi	sp,sp,-16
    80002738:	00813423          	sd	s0,8(sp)
    8000273c:	01010413          	addi	s0,sp,16
    head = nullptr;
    80002740:	00053023          	sd	zero,0(a0)
    tail = nullptr;
    80002744:	00053423          	sd	zero,8(a0)
}
    80002748:	00813403          	ld	s0,8(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret

0000000080002754 <_Z41__static_initialization_and_destruction_0ii>:
    }
    head = head->next;
    thread->next = nullptr;
    if(!head) tail = nullptr;
    return thread;
    80002754:	00100793          	li	a5,1
    80002758:	00f50463          	beq	a0,a5,80002760 <_Z41__static_initialization_and_destruction_0ii+0xc>
    8000275c:	00008067          	ret
    80002760:	000107b7          	lui	a5,0x10
    80002764:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002768:	fef59ae3          	bne	a1,a5,8000275c <_Z41__static_initialization_and_destruction_0ii+0x8>
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00113423          	sd	ra,8(sp)
    80002774:	00813023          	sd	s0,0(sp)
    80002778:	01010413          	addi	s0,sp,16
Scheduler scheduler;
    8000277c:	00009517          	auipc	a0,0x9
    80002780:	f7c50513          	addi	a0,a0,-132 # 8000b6f8 <scheduler>
    80002784:	00000097          	auipc	ra,0x0
    80002788:	fb0080e7          	jalr	-80(ra) # 80002734 <_ZN9SchedulerC1Ev>
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_ZN9Scheduler3putEP6Thread>:
void Scheduler::put(Thread* t){
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00813423          	sd	s0,8(sp)
    800027a4:	01010413          	addi	s0,sp,16
    t->next = nullptr;
    800027a8:	0005b423          	sd	zero,8(a1)
    if(!head){
    800027ac:	00053783          	ld	a5,0(a0)
    800027b0:	00078e63          	beqz	a5,800027cc <_ZN9Scheduler3putEP6Thread+0x30>
        tail->next = t;
    800027b4:	00853783          	ld	a5,8(a0)
    800027b8:	00b7b423          	sd	a1,8(a5)
    tail = t;
    800027bc:	00b53423          	sd	a1,8(a0)
}
    800027c0:	00813403          	ld	s0,8(sp)
    800027c4:	01010113          	addi	sp,sp,16
    800027c8:	00008067          	ret
        head = t;
    800027cc:	00b53023          	sd	a1,0(a0)
    800027d0:	fedff06f          	j	800027bc <_ZN9Scheduler3putEP6Thread+0x20>

00000000800027d4 <_ZN9Scheduler3getEv>:
Thread* Scheduler::get(){
    800027d4:	fe010113          	addi	sp,sp,-32
    800027d8:	00113c23          	sd	ra,24(sp)
    800027dc:	00813823          	sd	s0,16(sp)
    800027e0:	00913423          	sd	s1,8(sp)
    800027e4:	01213023          	sd	s2,0(sp)
    800027e8:	02010413          	addi	s0,sp,32
    if(head == nullptr) return nullptr;
    800027ec:	00053903          	ld	s2,0(a0)
    800027f0:	04090463          	beqz	s2,80002838 <_ZN9Scheduler3getEv+0x64>
    800027f4:	00050493          	mv	s1,a0
    if(thread->getContext()->startedOnce)
    800027f8:	00090513          	mv	a0,s2
    800027fc:	00000097          	auipc	ra,0x0
    80002800:	ad4080e7          	jalr	-1324(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80002804:	03053783          	ld	a5,48(a0)
    80002808:	04079663          	bnez	a5,80002854 <_ZN9Scheduler3getEv+0x80>
    if(thread->getContext()->startedOnce == 0)
    8000280c:	00090513          	mv	a0,s2
    80002810:	00000097          	auipc	ra,0x0
    80002814:	ac0080e7          	jalr	-1344(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80002818:	03053783          	ld	a5,48(a0)
    8000281c:	04078863          	beqz	a5,8000286c <_ZN9Scheduler3getEv+0x98>
    head = head->next;
    80002820:	0004b783          	ld	a5,0(s1)
    80002824:	0087b783          	ld	a5,8(a5)
    80002828:	00f4b023          	sd	a5,0(s1)
    thread->next = nullptr;
    8000282c:	00093423          	sd	zero,8(s2)
    if(!head) tail = nullptr;
    80002830:	0004b783          	ld	a5,0(s1)
    80002834:	04078863          	beqz	a5,80002884 <_ZN9Scheduler3getEv+0xb0>
    80002838:	00090513          	mv	a0,s2
    8000283c:	01813083          	ld	ra,24(sp)
    80002840:	01013403          	ld	s0,16(sp)
    80002844:	00813483          	ld	s1,8(sp)
    80002848:	00013903          	ld	s2,0(sp)
    8000284c:	02010113          	addi	sp,sp,32
    80002850:	00008067          	ret
        thread->getContext()->wasActive = 1;
    80002854:	00090513          	mv	a0,s2
    80002858:	00000097          	auipc	ra,0x0
    8000285c:	a78080e7          	jalr	-1416(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80002860:	00100793          	li	a5,1
    80002864:	02f53c23          	sd	a5,56(a0)
    80002868:	fa5ff06f          	j	8000280c <_ZN9Scheduler3getEv+0x38>
        thread->getContext()->startedOnce = 1;
    8000286c:	00090513          	mv	a0,s2
    80002870:	00000097          	auipc	ra,0x0
    80002874:	a60080e7          	jalr	-1440(ra) # 800022d0 <_ZN6Thread10getContextEv>
    80002878:	00100793          	li	a5,1
    8000287c:	02f53823          	sd	a5,48(a0)
    80002880:	fa1ff06f          	j	80002820 <_ZN9Scheduler3getEv+0x4c>
    if(!head) tail = nullptr;
    80002884:	0004b423          	sd	zero,8(s1)
    80002888:	fb1ff06f          	j	80002838 <_ZN9Scheduler3getEv+0x64>

000000008000288c <_GLOBAL__sub_I_scheduler>:
    8000288c:	ff010113          	addi	sp,sp,-16
    80002890:	00113423          	sd	ra,8(sp)
    80002894:	00813023          	sd	s0,0(sp)
    80002898:	01010413          	addi	s0,sp,16
    8000289c:	000105b7          	lui	a1,0x10
    800028a0:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800028a4:	00100513          	li	a0,1
    800028a8:	00000097          	auipc	ra,0x0
    800028ac:	eac080e7          	jalr	-340(ra) # 80002754 <_Z41__static_initialization_and_destruction_0ii>
    800028b0:	00813083          	ld	ra,8(sp)
    800028b4:	00013403          	ld	s0,0(sp)
    800028b8:	01010113          	addi	sp,sp,16
    800028bc:	00008067          	ret

00000000800028c0 <_Z15userMainWrapperPv>:

    return;
}


void userMainWrapper(void* args){
    800028c0:	ff010113          	addi	sp,sp,-16
    800028c4:	00113423          	sd	ra,8(sp)
    800028c8:	00813023          	sd	s0,0(sp)
    800028cc:	01010413          	addi	s0,sp,16

    //RiscV::switchToUserMode();
    userMain();
    800028d0:	00003097          	auipc	ra,0x3
    800028d4:	76c080e7          	jalr	1900(ra) # 8000603c <userMain>
}
    800028d8:	00813083          	ld	ra,8(sp)
    800028dc:	00013403          	ld	s0,0(sp)
    800028e0:	01010113          	addi	sp,sp,16
    800028e4:	00008067          	ret

00000000800028e8 <__cxa_atexit>:
int __cxa_atexit(void (*func)(void *), void *arg, void *d) {
    800028e8:	ff010113          	addi	sp,sp,-16
    800028ec:	00813423          	sd	s0,8(sp)
    800028f0:	01010413          	addi	s0,sp,16
}
    800028f4:	00000513          	li	a0,0
    800028f8:	00813403          	ld	s0,8(sp)
    800028fc:	01010113          	addi	sp,sp,16
    80002900:	00008067          	ret

0000000080002904 <interrupt>:
extern "C" void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5){
    80002904:	00068593          	mv	a1,a3
    __asm__ volatile("csrr %[cause], scause" : [cause] "=r" (cause));
    80002908:	14202873          	csrr	a6,scause
    __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    8000290c:	141028f3          	csrr	a7,sepc
    sepc += 4;
    80002910:	00488893          	addi	a7,a7,4
    __asm__ volatile("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002914:	14189073          	csrw	sepc,a7
    if(cause == SYS_ECALL || cause == USER_ECALL){
    80002918:	ff880813          	addi	a6,a6,-8
    8000291c:	00100693          	li	a3,1
    80002920:	0106f463          	bgeu	a3,a6,80002928 <interrupt+0x24>
    80002924:	00008067          	ret
extern "C" void interrupt(uint64 a0, uint64 a1, uint64 a2, uint64 a3, uint64 a4, uint64 a5){
    80002928:	fe010113          	addi	sp,sp,-32
    8000292c:	00113c23          	sd	ra,24(sp)
    80002930:	00813823          	sd	s0,16(sp)
    80002934:	00913423          	sd	s1,8(sp)
    80002938:	02010413          	addi	s0,sp,32
    8000293c:	00060493          	mv	s1,a2
        switch(a0){
    80002940:	02400693          	li	a3,36
    80002944:	02a6ea63          	bltu	a3,a0,80002978 <interrupt+0x74>
    80002948:	00251513          	slli	a0,a0,0x2
    8000294c:	00006697          	auipc	a3,0x6
    80002950:	6d468693          	addi	a3,a3,1748 # 80009020 <CONSOLE_STATUS+0x10>
    80002954:	00d50533          	add	a0,a0,a3
    80002958:	00052503          	lw	a0,0(a0)
    8000295c:	00d50533          	add	a0,a0,a3
    80002960:	00050067          	jr	a0
                a0 = (uint64)MemoryAllocator::Instance()->mem_alloc(a2);
    80002964:	00000097          	auipc	ra,0x0
    80002968:	50c080e7          	jalr	1292(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    8000296c:	00048593          	mv	a1,s1
    80002970:	00000097          	auipc	ra,0x0
    80002974:	278080e7          	jalr	632(ra) # 80002be8 <_ZN15MemoryAllocator9mem_allocEm>
}
    80002978:	01813083          	ld	ra,24(sp)
    8000297c:	01013403          	ld	s0,16(sp)
    80002980:	00813483          	ld	s1,8(sp)
    80002984:	02010113          	addi	sp,sp,32
    80002988:	00008067          	ret
                a0 = (uint64)MemoryAllocator::Instance()->mem_free((void*)a2);
    8000298c:	00000097          	auipc	ra,0x0
    80002990:	4e4080e7          	jalr	1252(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80002994:	00048593          	mv	a1,s1
    80002998:	00000097          	auipc	ra,0x0
    8000299c:	588080e7          	jalr	1416(ra) # 80002f20 <_ZN15MemoryAllocator8mem_freeEPv>
                break;
    800029a0:	fd9ff06f          	j	80002978 <interrupt+0x74>
                a0 = Thread::create_thread_kernel((thread_t*) a2, (void(*)(void*)) a3, (void*) a4, (void*) a5);
    800029a4:	00078693          	mv	a3,a5
    800029a8:	00070613          	mv	a2,a4
    800029ac:	00048513          	mv	a0,s1
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	af0080e7          	jalr	-1296(ra) # 800024a0 <_ZN6Thread20create_thread_kernelEPjPFvPvES1_S1_>
                break;
    800029b8:	fc1ff06f          	j	80002978 <interrupt+0x74>
                a0 = Thread::thread_exit_kernel();
    800029bc:	00000097          	auipc	ra,0x0
    800029c0:	930080e7          	jalr	-1744(ra) # 800022ec <_ZN6Thread18thread_exit_kernelEv>
                break;
    800029c4:	fb5ff06f          	j	80002978 <interrupt+0x74>
                Thread::thread_dispatch_kernel();
    800029c8:	00000097          	auipc	ra,0x0
    800029cc:	9c8080e7          	jalr	-1592(ra) # 80002390 <_ZN6Thread22thread_dispatch_kernelEv>
                break;
    800029d0:	fa9ff06f          	j	80002978 <interrupt+0x74>
                a0 = MemoryAllocator::Instance()->free_memory_remaining();
    800029d4:	00000097          	auipc	ra,0x0
    800029d8:	49c080e7          	jalr	1180(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    800029dc:	00000097          	auipc	ra,0x0
    800029e0:	75c080e7          	jalr	1884(ra) # 80003138 <_ZN15MemoryAllocator21free_memory_remainingEv>
                break;
    800029e4:	f95ff06f          	j	80002978 <interrupt+0x74>
                a0 = MemoryAllocator::Instance()->get_largest_mem_block();
    800029e8:	00000097          	auipc	ra,0x0
    800029ec:	488080e7          	jalr	1160(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    800029f0:	00000097          	auipc	ra,0x0
    800029f4:	76c080e7          	jalr	1900(ra) # 8000315c <_ZN15MemoryAllocator21get_largest_mem_blockEv>
                break;
    800029f8:	f81ff06f          	j	80002978 <interrupt+0x74>
                a0 = Semaphore::sem_open((sem_t*)a2, (unsigned)a3);
    800029fc:	0005859b          	sext.w	a1,a1
    80002a00:	00060513          	mv	a0,a2
    80002a04:	fffff097          	auipc	ra,0xfffff
    80002a08:	14c080e7          	jalr	332(ra) # 80001b50 <_ZN9Semaphore8sem_openEPjj>
                break;
    80002a0c:	f6dff06f          	j	80002978 <interrupt+0x74>
                a0 = Semaphore::sem_wait((sem_t)a2);
    80002a10:	0006051b          	sext.w	a0,a2
    80002a14:	fffff097          	auipc	ra,0xfffff
    80002a18:	280080e7          	jalr	640(ra) # 80001c94 <_ZN9Semaphore8sem_waitEj>
                break;
    80002a1c:	f5dff06f          	j	80002978 <interrupt+0x74>
                a0 = Semaphore::sem_signal((sem_t)a2);
    80002a20:	0006051b          	sext.w	a0,a2
    80002a24:	fffff097          	auipc	ra,0xfffff
    80002a28:	3e0080e7          	jalr	992(ra) # 80001e04 <_ZN9Semaphore10sem_signalEj>
                break;
    80002a2c:	f4dff06f          	j	80002978 <interrupt+0x74>
                a0 = Semaphore::sem_close((sem_t)a2);
    80002a30:	0006051b          	sext.w	a0,a2
    80002a34:	fffff097          	auipc	ra,0xfffff
    80002a38:	1ac080e7          	jalr	428(ra) # 80001be0 <_ZN9Semaphore9sem_closeEj>
    return;
    80002a3c:	f3dff06f          	j	80002978 <interrupt+0x74>

0000000080002a40 <main>:





void main() {
    80002a40:	fe010113          	addi	sp,sp,-32
    80002a44:	00113c23          	sd	ra,24(sp)
    80002a48:	00813823          	sd	s0,16(sp)
    80002a4c:	02010413          	addi	s0,sp,32


    MemoryAllocator::Instance();
    80002a50:	00000097          	auipc	ra,0x0
    80002a54:	420080e7          	jalr	1056(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>

    __asm__ volatile("csrw stvec, %[val]" : : [val] "r" (&handle_interrupt));
    80002a58:	00009797          	auipc	a5,0x9
    80002a5c:	c087b783          	ld	a5,-1016(a5) # 8000b660 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002a60:	10579073          	csrw	stvec,a5

    uint64 stack_start;
    if((uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE == 0){
    80002a64:	00009797          	auipc	a5,0x9
    80002a68:	bf47b783          	ld	a5,-1036(a5) # 8000b658 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002a6c:	0007b783          	ld	a5,0(a5)
    80002a70:	03f7f713          	andi	a4,a5,63
    80002a74:	00070663          	beqz	a4,80002a80 <main+0x40>
        stack_start = (uint64)HEAP_START_ADDR;
    }
    else {
        stack_start = (uint64)HEAP_START_ADDR + (MEM_BLOCK_SIZE - (uint64)HEAP_START_ADDR % MEM_BLOCK_SIZE);
    80002a78:	fc07f793          	andi	a5,a5,-64
    80002a7c:	04078793          	addi	a5,a5,64
    }
    uint64 sp = stack_start + (uint64)DEFAULT_STACK_SIZE;
    80002a80:	00001737          	lui	a4,0x1
    80002a84:	00e787b3          	add	a5,a5,a4
    __asm__ volatile("mv sp, %[sp]" : : [sp] "r" (sp));
    80002a88:	00078113          	mv	sp,a5
    __asm__ volatile("mv s0, %[sp]" : : [sp] "r" (sp));
    80002a8c:	00078413          	mv	s0,a5
    thread_t pid;
    thread_create(&pid, userMainWrapper, nullptr);
    80002a90:	00000613          	li	a2,0
    80002a94:	00000597          	auipc	a1,0x0
    80002a98:	e2c58593          	addi	a1,a1,-468 # 800028c0 <_Z15userMainWrapperPv>
    80002a9c:	fec40513          	addi	a0,s0,-20
    80002aa0:	fffff097          	auipc	ra,0xfffff
    80002aa4:	b18080e7          	jalr	-1256(ra) # 800015b8 <thread_create>


}
    80002aa8:	01813083          	ld	ra,24(sp)
    80002aac:	01013403          	ld	s0,16(sp)
    80002ab0:	02010113          	addi	sp,sp,32
    80002ab4:	00008067          	ret

0000000080002ab8 <_Z23getWaitStatusForRunningv>:
#include "../h/syscall_c.h"
#include "../lib/hw.h"
#include "../h/Thread.hpp"

// Povratak statusa čekanja za tekuću nit
int getWaitStatusForRunning() {
    80002ab8:	ff010113          	addi	sp,sp,-16
    80002abc:	00813423          	sd	s0,8(sp)
    80002ac0:	01010413          	addi	s0,sp,16
    return Thread::running->semWaitStatus;
    80002ac4:	00009797          	auipc	a5,0x9
    80002ac8:	bac7b783          	ld	a5,-1108(a5) # 8000b670 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002acc:	0007b783          	ld	a5,0(a5)
}
    80002ad0:	0107a503          	lw	a0,16(a5)
    80002ad4:	00813403          	ld	s0,8(sp)
    80002ad8:	01010113          	addi	sp,sp,16
    80002adc:	00008067          	ret

0000000080002ae0 <_ZN15MemoryAllocator5alignEm>:
    static MemoryAllocator instance;
    return &instance;
}

// Poravnanje adrese
uint64 MemoryAllocator::align(uint64 addr) {
    80002ae0:	ff010113          	addi	sp,sp,-16
    80002ae4:	00813423          	sd	s0,8(sp)
    80002ae8:	01010413          	addi	s0,sp,16
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    80002aec:	03f5f793          	andi	a5,a1,63
    80002af0:	00078c63          	beqz	a5,80002b08 <_ZN15MemoryAllocator5alignEm+0x28>
    return addr + (MEM_BLOCK_SIZE - addr % MEM_BLOCK_SIZE);
    80002af4:	fc05f593          	andi	a1,a1,-64
    80002af8:	04058513          	addi	a0,a1,64
}
    80002afc:	00813403          	ld	s0,8(sp)
    80002b00:	01010113          	addi	sp,sp,16
    80002b04:	00008067          	ret
    if (addr % MEM_BLOCK_SIZE == 0) return addr;
    80002b08:	00058513          	mv	a0,a1
    80002b0c:	ff1ff06f          	j	80002afc <_ZN15MemoryAllocator5alignEm+0x1c>

0000000080002b10 <_ZN15MemoryAllocator13getThreadPoolEv>:
    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
}

ThreadPool& MemoryAllocator::getThreadPool() {
    80002b10:	ff010113          	addi	sp,sp,-16
    80002b14:	00813423          	sd	s0,8(sp)
    80002b18:	01010413          	addi	s0,sp,16
    return threadPool;
}
    80002b1c:	00850513          	addi	a0,a0,8
    80002b20:	00813403          	ld	s0,8(sp)
    80002b24:	01010113          	addi	sp,sp,16
    80002b28:	00008067          	ret

0000000080002b2c <_ZN15MemoryAllocator16getSemaphorePoolEv>:

SemaphorePool& MemoryAllocator::getSemaphorePool() {
    80002b2c:	ff010113          	addi	sp,sp,-16
    80002b30:	00813423          	sd	s0,8(sp)
    80002b34:	01010413          	addi	s0,sp,16
    return semaphorePool;
}
    80002b38:	01850513          	addi	a0,a0,24
    80002b3c:	00813403          	ld	s0,8(sp)
    80002b40:	01010113          	addi	sp,sp,16
    80002b44:	00008067          	ret

0000000080002b48 <_Znwm>:

// Definicije C++ operatora new/delete
void* operator new(size_t size) {
    80002b48:	ff010113          	addi	sp,sp,-16
    80002b4c:	00113423          	sd	ra,8(sp)
    80002b50:	00813023          	sd	s0,0(sp)
    80002b54:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002b58:	fffff097          	auipc	ra,0xfffff
    80002b5c:	9cc080e7          	jalr	-1588(ra) # 80001524 <mem_alloc>
}
    80002b60:	00813083          	ld	ra,8(sp)
    80002b64:	00013403          	ld	s0,0(sp)
    80002b68:	01010113          	addi	sp,sp,16
    80002b6c:	00008067          	ret

0000000080002b70 <_Znam>:

void* operator new[](size_t size) {
    80002b70:	ff010113          	addi	sp,sp,-16
    80002b74:	00113423          	sd	ra,8(sp)
    80002b78:	00813023          	sd	s0,0(sp)
    80002b7c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	9a4080e7          	jalr	-1628(ra) # 80001524 <mem_alloc>
}
    80002b88:	00813083          	ld	ra,8(sp)
    80002b8c:	00013403          	ld	s0,0(sp)
    80002b90:	01010113          	addi	sp,sp,16
    80002b94:	00008067          	ret

0000000080002b98 <_ZdlPv>:

void operator delete(void* ptr) noexcept {
    80002b98:	ff010113          	addi	sp,sp,-16
    80002b9c:	00113423          	sd	ra,8(sp)
    80002ba0:	00813023          	sd	s0,0(sp)
    80002ba4:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002ba8:	fffff097          	auipc	ra,0xfffff
    80002bac:	9c4080e7          	jalr	-1596(ra) # 8000156c <mem_free>
}
    80002bb0:	00813083          	ld	ra,8(sp)
    80002bb4:	00013403          	ld	s0,0(sp)
    80002bb8:	01010113          	addi	sp,sp,16
    80002bbc:	00008067          	ret

0000000080002bc0 <_ZdaPv>:

void operator delete[](void* ptr) noexcept {
    80002bc0:	ff010113          	addi	sp,sp,-16
    80002bc4:	00113423          	sd	ra,8(sp)
    80002bc8:	00813023          	sd	s0,0(sp)
    80002bcc:	01010413          	addi	s0,sp,16
mem_free(ptr);
    80002bd0:	fffff097          	auipc	ra,0xfffff
    80002bd4:	99c080e7          	jalr	-1636(ra) # 8000156c <mem_free>
}
    80002bd8:	00813083          	ld	ra,8(sp)
    80002bdc:	00013403          	ld	s0,0(sp)
    80002be0:	01010113          	addi	sp,sp,16
    80002be4:	00008067          	ret

0000000080002be8 <_ZN15MemoryAllocator9mem_allocEm>:

int sem_close(sem_t id){
    return ::sem_close(id);
}
*/
void* MemoryAllocator::mem_alloc(uint64 numOfBlocks) {
    80002be8:	ff010113          	addi	sp,sp,-16
    80002bec:	00813423          	sd	s0,8(sp)
    80002bf0:	01010413          	addi	s0,sp,16
    80002bf4:	00050713          	mv	a4,a0
    FreeMem* temp = fmem_head;
    80002bf8:	00053503          	ld	a0,0(a0)

    while(temp)
    80002bfc:	04050863          	beqz	a0,80002c4c <_ZN15MemoryAllocator9mem_allocEm+0x64>
    {
        if(temp->size >= numOfBlocks)
    80002c00:	01053783          	ld	a5,16(a0)
    80002c04:	00b7f663          	bgeu	a5,a1,80002c10 <_ZN15MemoryAllocator9mem_allocEm+0x28>
            header->numOfBlocks = numOfBlocks;

            return addr;
        }

        temp = temp->next;
    80002c08:	00053503          	ld	a0,0(a0)
    while(temp)
    80002c0c:	ff1ff06f          	j	80002bfc <_ZN15MemoryAllocator9mem_allocEm+0x14>
            if(temp->size == numOfBlocks){
    80002c10:	04b78463          	beq	a5,a1,80002c58 <_ZN15MemoryAllocator9mem_allocEm+0x70>
                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);
    80002c14:	00659693          	slli	a3,a1,0x6
    80002c18:	00d506b3          	add	a3,a0,a3
                newnode->size = temp->size - numOfBlocks;
    80002c1c:	40b787b3          	sub	a5,a5,a1
    80002c20:	00f6b823          	sd	a5,16(a3)
                newnode->next = temp->next;
    80002c24:	00053783          	ld	a5,0(a0)
    80002c28:	00f6b023          	sd	a5,0(a3)
                newnode->prev = temp->prev;
    80002c2c:	00853783          	ld	a5,8(a0)
    80002c30:	00f6b423          	sd	a5,8(a3)
                if(newnode->prev)
    80002c34:	04078a63          	beqz	a5,80002c88 <_ZN15MemoryAllocator9mem_allocEm+0xa0>
                    newnode->prev->next = newnode;
    80002c38:	00d7b023          	sd	a3,0(a5)
                if(newnode->next)
    80002c3c:	0006b783          	ld	a5,0(a3)
    80002c40:	00078463          	beqz	a5,80002c48 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    newnode->next->prev = newnode;
    80002c44:	00d7b423          	sd	a3,8(a5)
            header->numOfBlocks = numOfBlocks;
    80002c48:	00b53023          	sd	a1,0(a0)
    }

    return nullptr;
}
    80002c4c:	00813403          	ld	s0,8(sp)
    80002c50:	01010113          	addi	sp,sp,16
    80002c54:	00008067          	ret
                if(temp->prev)
    80002c58:	00853783          	ld	a5,8(a0)
    80002c5c:	02078063          	beqz	a5,80002c7c <_ZN15MemoryAllocator9mem_allocEm+0x94>
                    temp->prev->next = temp->next;
    80002c60:	00053703          	ld	a4,0(a0)
    80002c64:	00e7b023          	sd	a4,0(a5)
                if(temp->next)
    80002c68:	00053783          	ld	a5,0(a0)
    80002c6c:	fc078ee3          	beqz	a5,80002c48 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    temp->next->prev = temp->prev;
    80002c70:	00853703          	ld	a4,8(a0)
    80002c74:	00e7b423          	sd	a4,8(a5)
    80002c78:	fd1ff06f          	j	80002c48 <_ZN15MemoryAllocator9mem_allocEm+0x60>
                    fmem_head = temp->next;
    80002c7c:	00053783          	ld	a5,0(a0)
    80002c80:	00f73023          	sd	a5,0(a4) # 1000 <_entry-0x7ffff000>
    80002c84:	fe5ff06f          	j	80002c68 <_ZN15MemoryAllocator9mem_allocEm+0x80>
                    fmem_head = newnode;
    80002c88:	00d73023          	sd	a3,0(a4)
    80002c8c:	fb1ff06f          	j	80002c3c <_ZN15MemoryAllocator9mem_allocEm+0x54>

0000000080002c90 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>:
void* MemoryAllocator::mem_alloc_for_managers(size_t N, size_t sizeOfElem){
    80002c90:	ff010113          	addi	sp,sp,-16
    80002c94:	00813423          	sd	s0,8(sp)
    80002c98:	01010413          	addi	s0,sp,16
    80002c9c:	00050693          	mv	a3,a0
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80002ca0:	02c58633          	mul	a2,a1,a2
    80002ca4:	03f60613          	addi	a2,a2,63
    80002ca8:	00665713          	srli	a4,a2,0x6
    FreeMem* temp = fmem_head;
    80002cac:	00053503          	ld	a0,0(a0)

    while(temp)
    80002cb0:	04050663          	beqz	a0,80002cfc <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
    {
        if(temp->size >= numOfBlocks)
    80002cb4:	01053783          	ld	a5,16(a0)
    80002cb8:	00e7f663          	bgeu	a5,a4,80002cc4 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x34>


            return addr;
        }

        temp = temp->next;
    80002cbc:	00053503          	ld	a0,0(a0)
    while(temp)
    80002cc0:	ff1ff06f          	j	80002cb0 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x20>
            if(temp->size == numOfBlocks){
    80002cc4:	04e78263          	beq	a5,a4,80002d08 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x78>
                FreeMem* newnode = (FreeMem*)((char*)temp + numOfBlocks * MEM_BLOCK_SIZE);
    80002cc8:	fc067613          	andi	a2,a2,-64
    80002ccc:	00c50633          	add	a2,a0,a2
                newnode->size = temp->size - numOfBlocks;
    80002cd0:	40e787b3          	sub	a5,a5,a4
    80002cd4:	00f63823          	sd	a5,16(a2)
                newnode->next = temp->next;
    80002cd8:	00053783          	ld	a5,0(a0)
    80002cdc:	00f63023          	sd	a5,0(a2)
                newnode->prev = temp->prev;
    80002ce0:	00853783          	ld	a5,8(a0)
    80002ce4:	00f63423          	sd	a5,8(a2)
                if(newnode->prev)
    80002ce8:	04078863          	beqz	a5,80002d38 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0xa8>
                    newnode->prev->next = newnode;
    80002cec:	00c7b023          	sd	a2,0(a5)
                if(newnode->next)
    80002cf0:	00063783          	ld	a5,0(a2)
    80002cf4:	00078463          	beqz	a5,80002cfc <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    newnode->next->prev = newnode;
    80002cf8:	00c7b423          	sd	a2,8(a5)
    }

    return nullptr;
}
    80002cfc:	00813403          	ld	s0,8(sp)
    80002d00:	01010113          	addi	sp,sp,16
    80002d04:	00008067          	ret
                if(temp->prev)
    80002d08:	00853783          	ld	a5,8(a0)
    80002d0c:	02078063          	beqz	a5,80002d2c <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x9c>
                    temp->prev->next = temp->next;
    80002d10:	00053703          	ld	a4,0(a0)
    80002d14:	00e7b023          	sd	a4,0(a5)
                if(temp->next)
    80002d18:	00053783          	ld	a5,0(a0)
    80002d1c:	fe0780e3          	beqz	a5,80002cfc <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    temp->next->prev = temp->prev;
    80002d20:	00853703          	ld	a4,8(a0)
    80002d24:	00e7b423          	sd	a4,8(a5)
    80002d28:	fd5ff06f          	j	80002cfc <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x6c>
                    fmem_head = temp->next;
    80002d2c:	00053783          	ld	a5,0(a0)
    80002d30:	00f6b023          	sd	a5,0(a3)
    80002d34:	fe5ff06f          	j	80002d18 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x88>
                    fmem_head = newnode;
    80002d38:	00c6b023          	sd	a2,0(a3)
    80002d3c:	fb5ff06f          	j	80002cf0 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm+0x60>

0000000080002d40 <_ZN15MemoryAllocatorC1Ev>:
MemoryAllocator::MemoryAllocator() {
    80002d40:	fd010113          	addi	sp,sp,-48
    80002d44:	02113423          	sd	ra,40(sp)
    80002d48:	02813023          	sd	s0,32(sp)
    80002d4c:	00913c23          	sd	s1,24(sp)
    80002d50:	01213823          	sd	s2,16(sp)
    80002d54:	01313423          	sd	s3,8(sp)
    80002d58:	01413023          	sd	s4,0(sp)
    80002d5c:	03010413          	addi	s0,sp,48
    80002d60:	00050493          	mv	s1,a0
    80002d64:	00850a13          	addi	s4,a0,8
    80002d68:	000a0513          	mv	a0,s4
    80002d6c:	fffff097          	auipc	ra,0xfffff
    80002d70:	b04080e7          	jalr	-1276(ra) # 80001870 <_ZN10ThreadPoolC1Ev>
    80002d74:	01848993          	addi	s3,s1,24
    80002d78:	00098513          	mv	a0,s3
    80002d7c:	00000097          	auipc	ra,0x0
    80002d80:	65c080e7          	jalr	1628(ra) # 800033d8 <_ZN13SemaphorePoolC1Ev>
    fmem_head = (FreeMem*)(align((uint64)HEAP_START_ADDR) + (uint64)DEFAULT_STACK_SIZE);
    80002d84:	00009797          	auipc	a5,0x9
    80002d88:	8d47b783          	ld	a5,-1836(a5) # 8000b658 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002d8c:	0007b583          	ld	a1,0(a5)
    80002d90:	00048513          	mv	a0,s1
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	d4c080e7          	jalr	-692(ra) # 80002ae0 <_ZN15MemoryAllocator5alignEm>
    80002d9c:	000017b7          	lui	a5,0x1
    80002da0:	00f50533          	add	a0,a0,a5
    80002da4:	00a4b023          	sd	a0,0(s1)
    fmem_head->next = nullptr;
    80002da8:	00053023          	sd	zero,0(a0)
    fmem_head->prev = nullptr;
    80002dac:	0004b783          	ld	a5,0(s1)
    80002db0:	0007b423          	sd	zero,8(a5) # 1008 <_entry-0x7fffeff8>
                          (((uint64)HEAP_END_ADDR - (uint64)fmem_head) % MEM_BLOCK_SIZE)) / MEM_BLOCK_SIZE;
    80002db4:	0004b703          	ld	a4,0(s1)
    80002db8:	00009797          	auipc	a5,0x9
    80002dbc:	8d07b783          	ld	a5,-1840(a5) # 8000b688 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002dc0:	0007b783          	ld	a5,0(a5)
    80002dc4:	40e787b3          	sub	a5,a5,a4
    uint64 totalBlocks = (((uint64)HEAP_END_ADDR - (uint64)fmem_head) -
    80002dc8:	0067d793          	srli	a5,a5,0x6
    fmem_head->size = totalBlocks;
    80002dcc:	00f73823          	sd	a5,16(a4)
    void* threadManagerPoolAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(Thread));
    80002dd0:	08800613          	li	a2,136
    80002dd4:	00a00593          	li	a1,10
    80002dd8:	00048513          	mv	a0,s1
    80002ddc:	00000097          	auipc	ra,0x0
    80002de0:	eb4080e7          	jalr	-332(ra) # 80002c90 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    80002de4:	00050913          	mv	s2,a0
    void* threadManagerUsedArrayAddress = mem_alloc_for_managers(MAX_THREADS, sizeof(bool));
    80002de8:	00100613          	li	a2,1
    80002dec:	00a00593          	li	a1,10
    80002df0:	00048513          	mv	a0,s1
    80002df4:	00000097          	auipc	ra,0x0
    80002df8:	e9c080e7          	jalr	-356(ra) # 80002c90 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    80002dfc:	00050613          	mv	a2,a0
    threadPool.init(threadManagerPoolAddress, threadManagerUsedArrayAddress);
    80002e00:	00090593          	mv	a1,s2
    80002e04:	000a0513          	mv	a0,s4
    80002e08:	fffff097          	auipc	ra,0xfffff
    80002e0c:	a88080e7          	jalr	-1400(ra) # 80001890 <_ZN10ThreadPool4initEPvS0_>
    void* semaphoreManagerPoolAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(Semaphore));
    80002e10:	02000613          	li	a2,32
    80002e14:	00a00593          	li	a1,10
    80002e18:	00048513          	mv	a0,s1
    80002e1c:	00000097          	auipc	ra,0x0
    80002e20:	e74080e7          	jalr	-396(ra) # 80002c90 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    80002e24:	00050913          	mv	s2,a0
    void* semaphoreManagerUsedArrayAddress = mem_alloc_for_managers(MAX_SEMAPHORES, sizeof(bool));
    80002e28:	00100613          	li	a2,1
    80002e2c:	00a00593          	li	a1,10
    80002e30:	00048513          	mv	a0,s1
    80002e34:	00000097          	auipc	ra,0x0
    80002e38:	e5c080e7          	jalr	-420(ra) # 80002c90 <_ZN15MemoryAllocator22mem_alloc_for_managersEmm>
    80002e3c:	00050613          	mv	a2,a0
    semaphorePool.init(semaphoreManagerPoolAddress, semaphoreManagerUsedArrayAddress);
    80002e40:	00090593          	mv	a1,s2
    80002e44:	00098513          	mv	a0,s3
    80002e48:	00000097          	auipc	ra,0x0
    80002e4c:	5b0080e7          	jalr	1456(ra) # 800033f8 <_ZN13SemaphorePool4initEPvS0_>
}
    80002e50:	02813083          	ld	ra,40(sp)
    80002e54:	02013403          	ld	s0,32(sp)
    80002e58:	01813483          	ld	s1,24(sp)
    80002e5c:	01013903          	ld	s2,16(sp)
    80002e60:	00813983          	ld	s3,8(sp)
    80002e64:	00013a03          	ld	s4,0(sp)
    80002e68:	03010113          	addi	sp,sp,48
    80002e6c:	00008067          	ret

0000000080002e70 <_ZN15MemoryAllocator8InstanceEv>:
    static MemoryAllocator instance;
    80002e70:	00009797          	auipc	a5,0x9
    80002e74:	8a07c783          	lbu	a5,-1888(a5) # 8000b710 <_ZGVZN15MemoryAllocator8InstanceEvE8instance>
    80002e78:	00078863          	beqz	a5,80002e88 <_ZN15MemoryAllocator8InstanceEv+0x18>
}
    80002e7c:	00009517          	auipc	a0,0x9
    80002e80:	89c50513          	addi	a0,a0,-1892 # 8000b718 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80002e84:	00008067          	ret
MemoryAllocator* MemoryAllocator::Instance() {
    80002e88:	ff010113          	addi	sp,sp,-16
    80002e8c:	00113423          	sd	ra,8(sp)
    80002e90:	00813023          	sd	s0,0(sp)
    80002e94:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80002e98:	00009517          	auipc	a0,0x9
    80002e9c:	88050513          	addi	a0,a0,-1920 # 8000b718 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80002ea0:	00000097          	auipc	ra,0x0
    80002ea4:	ea0080e7          	jalr	-352(ra) # 80002d40 <_ZN15MemoryAllocatorC1Ev>
    80002ea8:	00100793          	li	a5,1
    80002eac:	00009717          	auipc	a4,0x9
    80002eb0:	86f70223          	sb	a5,-1948(a4) # 8000b710 <_ZGVZN15MemoryAllocator8InstanceEvE8instance>
}
    80002eb4:	00009517          	auipc	a0,0x9
    80002eb8:	86450513          	addi	a0,a0,-1948 # 8000b718 <_ZZN15MemoryAllocator8InstanceEvE8instance>
    80002ebc:	00813083          	ld	ra,8(sp)
    80002ec0:	00013403          	ld	s0,0(sp)
    80002ec4:	01010113          	addi	sp,sp,16
    80002ec8:	00008067          	ret

0000000080002ecc <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>:

void MemoryAllocator::tryToJoin(FreeMem *node) {
    80002ecc:	ff010113          	addi	sp,sp,-16
    80002ed0:	00813423          	sd	s0,8(sp)
    80002ed4:	01010413          	addi	s0,sp,16
    if(!node) return;
    80002ed8:	00058e63          	beqz	a1,80002ef4 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    FreeMem* nextnode = node->next;
    80002edc:	0005b783          	ld	a5,0(a1)
    if(nextnode && (char*)nextnode == ((char*)node + node->size * MEM_BLOCK_SIZE)){
    80002ee0:	00078a63          	beqz	a5,80002ef4 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    80002ee4:	0105b683          	ld	a3,16(a1)
    80002ee8:	00669713          	slli	a4,a3,0x6
    80002eec:	00e58733          	add	a4,a1,a4
    80002ef0:	00f70863          	beq	a4,a5,80002f00 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x34>
        node->size += nextnode->size;
        node->next = nextnode->next;
        if(node->next)node->next->prev = node;
    }
}
    80002ef4:	00813403          	ld	s0,8(sp)
    80002ef8:	01010113          	addi	sp,sp,16
    80002efc:	00008067          	ret
        node->size += nextnode->size;
    80002f00:	0107b703          	ld	a4,16(a5)
    80002f04:	00e686b3          	add	a3,a3,a4
    80002f08:	00d5b823          	sd	a3,16(a1)
        node->next = nextnode->next;
    80002f0c:	0007b783          	ld	a5,0(a5)
    80002f10:	00f5b023          	sd	a5,0(a1)
        if(node->next)node->next->prev = node;
    80002f14:	fe0780e3          	beqz	a5,80002ef4 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>
    80002f18:	00b7b423          	sd	a1,8(a5)
    80002f1c:	fd9ff06f          	j	80002ef4 <_ZN15MemoryAllocator9tryToJoinEP7FreeMem+0x28>

0000000080002f20 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void *ptr) {
    if(!ptr) return -1;
    80002f20:	0e058263          	beqz	a1,80003004 <_ZN15MemoryAllocator8mem_freeEPv+0xe4>
int MemoryAllocator::mem_free(void *ptr) {
    80002f24:	fe010113          	addi	sp,sp,-32
    80002f28:	00113c23          	sd	ra,24(sp)
    80002f2c:	00813823          	sd	s0,16(sp)
    80002f30:	00913423          	sd	s1,8(sp)
    80002f34:	01213023          	sd	s2,0(sp)
    80002f38:	02010413          	addi	s0,sp,32
    80002f3c:	00050913          	mv	s2,a0

    Header* header = (Header*)ptr;

    //outside of the heap error
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    80002f40:	00008797          	auipc	a5,0x8
    80002f44:	7187b783          	ld	a5,1816(a5) # 8000b658 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002f48:	0007b783          	ld	a5,0(a5)
    80002f4c:	0cf5e063          	bltu	a1,a5,8000300c <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002f50:	00008797          	auipc	a5,0x8
    80002f54:	7387b783          	ld	a5,1848(a5) # 8000b688 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002f58:	0007b783          	ld	a5,0(a5)
    80002f5c:	0ab7ec63          	bltu	a5,a1,80003014 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
    //not aligned to a block error
    //if(((char*)header - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;

    FreeMem* newnode = (FreeMem*)header;
    newnode->size = header->numOfBlocks;
    80002f60:	0005b783          	ld	a5,0(a1)
    80002f64:	00f5b823          	sd	a5,16(a1)
    newnode->prev = nullptr;
    80002f68:	0005b423          	sd	zero,8(a1)
    newnode->next = nullptr;
    80002f6c:	0005b023          	sd	zero,0(a1)
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    80002f70:	00053703          	ld	a4,0(a0)
    80002f74:	02070463          	beqz	a4,80002f9c <_ZN15MemoryAllocator8mem_freeEPv+0x7c>
    80002f78:	02e5e663          	bltu	a1,a4,80002fa4 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
    80002f7c:	00070793          	mv	a5,a4
        while(temp->next && (char*)temp->next < (char*)newnode)
    80002f80:	00078493          	mv	s1,a5
    80002f84:	0007b783          	ld	a5,0(a5)
    80002f88:	00078463          	beqz	a5,80002f90 <_ZN15MemoryAllocator8mem_freeEPv+0x70>
    80002f8c:	feb7eae3          	bltu	a5,a1,80002f80 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
        {
            temp = temp->next;
        }
    }
    if(temp)
    80002f90:	00048c63          	beqz	s1,80002fa8 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    {
        newnode->next = temp->next;
    80002f94:	00f5b023          	sd	a5,0(a1)
    80002f98:	0140006f          	j	80002fac <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
        temp = 0;
    80002f9c:	00070493          	mv	s1,a4
    80002fa0:	0080006f          	j	80002fa8 <_ZN15MemoryAllocator8mem_freeEPv+0x88>
    80002fa4:	00000493          	li	s1,0
    }
    else {
        newnode->next = fmem_head;
    80002fa8:	00e5b023          	sd	a4,0(a1)
    }
    if(newnode->next)
    80002fac:	0005b783          	ld	a5,0(a1)
    80002fb0:	00078463          	beqz	a5,80002fb8 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
    {
        newnode->next->prev = newnode;
    80002fb4:	00b7b423          	sd	a1,8(a5)
    }
    if(temp){
    80002fb8:	04048263          	beqz	s1,80002ffc <_ZN15MemoryAllocator8mem_freeEPv+0xdc>
        temp->next = newnode;
    80002fbc:	00b4b023          	sd	a1,0(s1)
        newnode->prev = temp;
    80002fc0:	0095b423          	sd	s1,8(a1)
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    80002fc4:	00090513          	mv	a0,s2
    80002fc8:	00000097          	auipc	ra,0x0
    80002fcc:	f04080e7          	jalr	-252(ra) # 80002ecc <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(temp);
    80002fd0:	00048593          	mv	a1,s1
    80002fd4:	00090513          	mv	a0,s2
    80002fd8:	00000097          	auipc	ra,0x0
    80002fdc:	ef4080e7          	jalr	-268(ra) # 80002ecc <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    80002fe0:	00000513          	li	a0,0
}
    80002fe4:	01813083          	ld	ra,24(sp)
    80002fe8:	01013403          	ld	s0,16(sp)
    80002fec:	00813483          	ld	s1,8(sp)
    80002ff0:	00013903          	ld	s2,0(sp)
    80002ff4:	02010113          	addi	sp,sp,32
    80002ff8:	00008067          	ret
        fmem_head = newnode;
    80002ffc:	00b93023          	sd	a1,0(s2)
    80003000:	fc5ff06f          	j	80002fc4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    if(!ptr) return -1;
    80003004:	fff00513          	li	a0,-1
}
    80003008:	00008067          	ret
    if((uint64)header < (uint64)HEAP_START_ADDR || (uint64)header > (uint64)HEAP_END_ADDR) return -2;
    8000300c:	ffe00513          	li	a0,-2
    80003010:	fd5ff06f          	j	80002fe4 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>
    80003014:	ffe00513          	li	a0,-2
    80003018:	fcdff06f          	j	80002fe4 <_ZN15MemoryAllocator8mem_freeEPv+0xc4>

000000008000301c <_ZN15MemoryAllocator15mem_free_kernelEPvmm>:

int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    if(!ptr) return -1;
    8000301c:	0e058e63          	beqz	a1,80003118 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xfc>
int MemoryAllocator::mem_free_kernel(void* ptr, size_t N, size_t sizeOfElem){
    80003020:	fe010113          	addi	sp,sp,-32
    80003024:	00113c23          	sd	ra,24(sp)
    80003028:	00813823          	sd	s0,16(sp)
    8000302c:	00913423          	sd	s1,8(sp)
    80003030:	01213023          	sd	s2,0(sp)
    80003034:	02010413          	addi	s0,sp,32
    80003038:	00050913          	mv	s2,a0


    //outside of the heap error
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    8000303c:	00008797          	auipc	a5,0x8
    80003040:	61c7b783          	ld	a5,1564(a5) # 8000b658 <_GLOBAL_OFFSET_TABLE_+0x8>
    80003044:	0007b783          	ld	a5,0(a5)
    80003048:	0cf5ec63          	bltu	a1,a5,80003120 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x104>
    8000304c:	00008797          	auipc	a5,0x8
    80003050:	63c7b783          	ld	a5,1596(a5) # 8000b688 <_GLOBAL_OFFSET_TABLE_+0x38>
    80003054:	0007b783          	ld	a5,0(a5)
    80003058:	0cb7e863          	bltu	a5,a1,80003128 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x10c>
    //not aligned to a block error
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    8000305c:	00053783          	ld	a5,0(a0)
    80003060:	40f587b3          	sub	a5,a1,a5
    80003064:	03f7f793          	andi	a5,a5,63
    80003068:	0c079463          	bnez	a5,80003130 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x114>
    size_t numOfBlocks = (N * sizeOfElem + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    8000306c:	02d60633          	mul	a2,a2,a3
    80003070:	03f60613          	addi	a2,a2,63
    80003074:	00665613          	srli	a2,a2,0x6

    FreeMem* newnode = (FreeMem*)ptr;
    newnode->size = numOfBlocks;
    80003078:	00c5b823          	sd	a2,16(a1)
    newnode->prev = nullptr;
    8000307c:	0005b423          	sd	zero,8(a1)
    newnode->next = nullptr;
    80003080:	0005b023          	sd	zero,0(a1)
    FreeMem* temp = 0;
    if(!fmem_head || (char*)fmem_head > (char*)newnode)
    80003084:	00053703          	ld	a4,0(a0)
    80003088:	02070463          	beqz	a4,800030b0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x94>
    8000308c:	02e5e663          	bltu	a1,a4,800030b8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x9c>
    {
        temp = 0;
    }
    else
    {
        temp = fmem_head;
    80003090:	00070793          	mv	a5,a4
        while(temp->next && (char*)temp->next < (char*)newnode)
    80003094:	00078493          	mv	s1,a5
    80003098:	0007b783          	ld	a5,0(a5)
    8000309c:	00078463          	beqz	a5,800030a4 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x88>
    800030a0:	feb7eae3          	bltu	a5,a1,80003094 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0x78>
        {
            temp = temp->next;
        }
    }
    if(temp)
    800030a4:	00048c63          	beqz	s1,800030bc <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa0>
    {
        newnode->next = temp->next;
    800030a8:	00f5b023          	sd	a5,0(a1)
    800030ac:	0140006f          	j	800030c0 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa4>
        temp = 0;
    800030b0:	00070493          	mv	s1,a4
    800030b4:	0080006f          	j	800030bc <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xa0>
    800030b8:	00000493          	li	s1,0
    }
    else {
        newnode->next = fmem_head;
    800030bc:	00e5b023          	sd	a4,0(a1)
    }
    if(newnode->next)
    800030c0:	0005b783          	ld	a5,0(a1)
    800030c4:	00078463          	beqz	a5,800030cc <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xb0>
    {
        newnode->next->prev = newnode;
    800030c8:	00b7b423          	sd	a1,8(a5)
    }
    if(temp){
    800030cc:	04048263          	beqz	s1,80003110 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xf4>
        temp->next = newnode;
    800030d0:	00b4b023          	sd	a1,0(s1)
        newnode->prev = temp;
    800030d4:	0095b423          	sd	s1,8(a1)
    }
    else
    {
        fmem_head = newnode;
    }
    tryToJoin(newnode);
    800030d8:	00090513          	mv	a0,s2
    800030dc:	00000097          	auipc	ra,0x0
    800030e0:	df0080e7          	jalr	-528(ra) # 80002ecc <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    tryToJoin(temp);
    800030e4:	00048593          	mv	a1,s1
    800030e8:	00090513          	mv	a0,s2
    800030ec:	00000097          	auipc	ra,0x0
    800030f0:	de0080e7          	jalr	-544(ra) # 80002ecc <_ZN15MemoryAllocator9tryToJoinEP7FreeMem>
    return 0;
    800030f4:	00000513          	li	a0,0
}
    800030f8:	01813083          	ld	ra,24(sp)
    800030fc:	01013403          	ld	s0,16(sp)
    80003100:	00813483          	ld	s1,8(sp)
    80003104:	00013903          	ld	s2,0(sp)
    80003108:	02010113          	addi	sp,sp,32
    8000310c:	00008067          	ret
        fmem_head = newnode;
    80003110:	00b93023          	sd	a1,0(s2)
    80003114:	fc5ff06f          	j	800030d8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xbc>
    if(!ptr) return -1;
    80003118:	fff00513          	li	a0,-1
}
    8000311c:	00008067          	ret
    if((uint64)ptr < (uint64)HEAP_START_ADDR || (uint64)ptr > (uint64)HEAP_END_ADDR) return -2;
    80003120:	ffe00513          	li	a0,-2
    80003124:	fd5ff06f          	j	800030f8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>
    80003128:	ffe00513          	li	a0,-2
    8000312c:	fcdff06f          	j	800030f8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>
    if(((char*)ptr - (char*)fmem_head) % MEM_BLOCK_SIZE != 0) return -3;
    80003130:	ffd00513          	li	a0,-3
    80003134:	fc5ff06f          	j	800030f8 <_ZN15MemoryAllocator15mem_free_kernelEPvmm+0xdc>

0000000080003138 <_ZN15MemoryAllocator21free_memory_remainingEv>:

size_t MemoryAllocator::free_memory_remaining() {
    80003138:	ff010113          	addi	sp,sp,-16
    8000313c:	00813423          	sd	s0,8(sp)
    80003140:	01010413          	addi	s0,sp,16
    return fmem_head->size * MEM_BLOCK_SIZE;
    80003144:	00053783          	ld	a5,0(a0)
    80003148:	0107b503          	ld	a0,16(a5)
}
    8000314c:	00651513          	slli	a0,a0,0x6
    80003150:	00813403          	ld	s0,8(sp)
    80003154:	01010113          	addi	sp,sp,16
    80003158:	00008067          	ret

000000008000315c <_ZN15MemoryAllocator21get_largest_mem_blockEv>:
size_t MemoryAllocator::get_largest_mem_block() {
    8000315c:	ff010113          	addi	sp,sp,-16
    80003160:	00813423          	sd	s0,8(sp)
    80003164:	01010413          	addi	s0,sp,16
    if(fmem_head == nullptr) return 0;
    80003168:	00053783          	ld	a5,0(a0)
    8000316c:	02078a63          	beqz	a5,800031a0 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x44>
    FreeMem* temp = fmem_head;
    size_t maxBlocks = temp->size;
    80003170:	0107b503          	ld	a0,16(a5)
    80003174:	0080006f          	j	8000317c <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x20>
    while(temp)
    {
        if(temp->size > maxBlocks){
            maxBlocks = temp->size;
        }
        temp = temp->next;
    80003178:	0007b783          	ld	a5,0(a5)
    while(temp)
    8000317c:	00078a63          	beqz	a5,80003190 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x34>
        if(temp->size > maxBlocks){
    80003180:	0107b703          	ld	a4,16(a5)
    80003184:	fee57ae3          	bgeu	a0,a4,80003178 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x1c>
            maxBlocks = temp->size;
    80003188:	00070513          	mv	a0,a4
    8000318c:	fedff06f          	j	80003178 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x1c>
    }
    return maxBlocks * MEM_BLOCK_SIZE;
    80003190:	00651513          	slli	a0,a0,0x6

}
    80003194:	00813403          	ld	s0,8(sp)
    80003198:	01010113          	addi	sp,sp,16
    8000319c:	00008067          	ret
    if(fmem_head == nullptr) return 0;
    800031a0:	00000513          	li	a0,0
    800031a4:	ff1ff06f          	j	80003194 <_ZN15MemoryAllocator21get_largest_mem_blockEv+0x38>

00000000800031a8 <_ZN8ListNodeI6ThreadEC1EPS0_>:
#include "../h/List.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/Thread.hpp"

template<typename T>
ListNode<T>::ListNode(T* t) : next(nullptr), prev(nullptr), object(t) {}
    800031a8:	ff010113          	addi	sp,sp,-16
    800031ac:	00813423          	sd	s0,8(sp)
    800031b0:	01010413          	addi	s0,sp,16
    800031b4:	00053023          	sd	zero,0(a0)
    800031b8:	00053423          	sd	zero,8(a0)
    800031bc:	00b53823          	sd	a1,16(a0)
    800031c0:	00813403          	ld	s0,8(sp)
    800031c4:	01010113          	addi	sp,sp,16
    800031c8:	00008067          	ret

00000000800031cc <_ZN8ListNodeI6ThreadEnwEm>:


template<typename T>
void* ListNode<T>::operator new(size_t size) {
    800031cc:	fe010113          	addi	sp,sp,-32
    800031d0:	00113c23          	sd	ra,24(sp)
    800031d4:	00813823          	sd	s0,16(sp)
    800031d8:	00913423          	sd	s1,8(sp)
    800031dc:	02010413          	addi	s0,sp,32
    uint64 numOfBlocks = (size + sizeof(Header) + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    800031e0:	04750493          	addi	s1,a0,71
    800031e4:	0064d493          	srli	s1,s1,0x6
    return MemoryAllocator::Instance()->mem_alloc(numOfBlocks);
    800031e8:	00000097          	auipc	ra,0x0
    800031ec:	c88080e7          	jalr	-888(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    800031f0:	00048593          	mv	a1,s1
    800031f4:	00000097          	auipc	ra,0x0
    800031f8:	9f4080e7          	jalr	-1548(ra) # 80002be8 <_ZN15MemoryAllocator9mem_allocEm>
}
    800031fc:	01813083          	ld	ra,24(sp)
    80003200:	01013403          	ld	s0,16(sp)
    80003204:	00813483          	ld	s1,8(sp)
    80003208:	02010113          	addi	sp,sp,32
    8000320c:	00008067          	ret

0000000080003210 <_ZN8ListNodeI6ThreadEdlEPv>:

template<typename T>
void ListNode<T>::operator delete(void* obj) {
    80003210:	fe010113          	addi	sp,sp,-32
    80003214:	00113c23          	sd	ra,24(sp)
    80003218:	00813823          	sd	s0,16(sp)
    8000321c:	00913423          	sd	s1,8(sp)
    80003220:	02010413          	addi	s0,sp,32
    char* header = (char*)obj - sizeof(Header);
    80003224:	ff850493          	addi	s1,a0,-8
    MemoryAllocator::Instance()->mem_free(header);
    80003228:	00000097          	auipc	ra,0x0
    8000322c:	c48080e7          	jalr	-952(ra) # 80002e70 <_ZN15MemoryAllocator8InstanceEv>
    80003230:	00048593          	mv	a1,s1
    80003234:	00000097          	auipc	ra,0x0
    80003238:	cec080e7          	jalr	-788(ra) # 80002f20 <_ZN15MemoryAllocator8mem_freeEPv>
}
    8000323c:	01813083          	ld	ra,24(sp)
    80003240:	01013403          	ld	s0,16(sp)
    80003244:	00813483          	ld	s1,8(sp)
    80003248:	02010113          	addi	sp,sp,32
    8000324c:	00008067          	ret

0000000080003250 <_ZN4ListI6ThreadEC1Ev>:


template<typename T>
List<T>::List() : head(nullptr), tail(nullptr) {}
    80003250:	ff010113          	addi	sp,sp,-16
    80003254:	00813423          	sd	s0,8(sp)
    80003258:	01010413          	addi	s0,sp,16
    8000325c:	00053023          	sd	zero,0(a0)
    80003260:	00053423          	sd	zero,8(a0)
    80003264:	00813403          	ld	s0,8(sp)
    80003268:	01010113          	addi	sp,sp,16
    8000326c:	00008067          	ret

0000000080003270 <_ZN4ListI6ThreadED1Ev>:

template<typename T>
List<T>::~List() {
    ListNode<T>* current = head;
    80003270:	00053503          	ld	a0,0(a0)
    while (current) {
    80003274:	04050063          	beqz	a0,800032b4 <_ZN4ListI6ThreadED1Ev+0x44>
List<T>::~List() {
    80003278:	fe010113          	addi	sp,sp,-32
    8000327c:	00113c23          	sd	ra,24(sp)
    80003280:	00813823          	sd	s0,16(sp)
    80003284:	00913423          	sd	s1,8(sp)
    80003288:	02010413          	addi	s0,sp,32
        ListNode<T>* next = current->next;
    8000328c:	00053483          	ld	s1,0(a0)
        delete current;
    80003290:	00000097          	auipc	ra,0x0
    80003294:	f80080e7          	jalr	-128(ra) # 80003210 <_ZN8ListNodeI6ThreadEdlEPv>
        current = next;
    80003298:	00048513          	mv	a0,s1
    while (current) {
    8000329c:	fe0498e3          	bnez	s1,8000328c <_ZN4ListI6ThreadED1Ev+0x1c>
    }
    head = tail = nullptr;
}
    800032a0:	01813083          	ld	ra,24(sp)
    800032a4:	01013403          	ld	s0,16(sp)
    800032a8:	00813483          	ld	s1,8(sp)
    800032ac:	02010113          	addi	sp,sp,32
    800032b0:	00008067          	ret
    800032b4:	00008067          	ret

00000000800032b8 <_ZN4ListI6ThreadE7add_endEPS0_>:
bool List<T>::empty() {
    return head == nullptr;
}

template<typename T>
void List<T>::add_end(T* t) {
    800032b8:	fd010113          	addi	sp,sp,-48
    800032bc:	02113423          	sd	ra,40(sp)
    800032c0:	02813023          	sd	s0,32(sp)
    800032c4:	00913c23          	sd	s1,24(sp)
    800032c8:	01213823          	sd	s2,16(sp)
    800032cc:	01313423          	sd	s3,8(sp)
    800032d0:	03010413          	addi	s0,sp,48
    800032d4:	00050493          	mv	s1,a0
    800032d8:	00058993          	mv	s3,a1
    ListNode<T>* newnode = new ListNode<T>(t);
    800032dc:	01800513          	li	a0,24
    800032e0:	00000097          	auipc	ra,0x0
    800032e4:	eec080e7          	jalr	-276(ra) # 800031cc <_ZN8ListNodeI6ThreadEnwEm>
    800032e8:	00050913          	mv	s2,a0
    800032ec:	00098593          	mv	a1,s3
    800032f0:	00000097          	auipc	ra,0x0
    800032f4:	eb8080e7          	jalr	-328(ra) # 800031a8 <_ZN8ListNodeI6ThreadEC1EPS0_>
    if (!head) {
    800032f8:	0004b783          	ld	a5,0(s1)
    800032fc:	02078a63          	beqz	a5,80003330 <_ZN4ListI6ThreadE7add_endEPS0_+0x78>
        head = newnode;
    } else {
        tail->next = newnode;
    80003300:	0084b783          	ld	a5,8(s1)
    80003304:	0127b023          	sd	s2,0(a5)
        newnode->prev = tail;
    80003308:	0084b783          	ld	a5,8(s1)
    8000330c:	00f93423          	sd	a5,8(s2)
    }
    tail = newnode;
    80003310:	0124b423          	sd	s2,8(s1)
}
    80003314:	02813083          	ld	ra,40(sp)
    80003318:	02013403          	ld	s0,32(sp)
    8000331c:	01813483          	ld	s1,24(sp)
    80003320:	01013903          	ld	s2,16(sp)
    80003324:	00813983          	ld	s3,8(sp)
    80003328:	03010113          	addi	sp,sp,48
    8000332c:	00008067          	ret
        head = newnode;
    80003330:	0124b023          	sd	s2,0(s1)
    80003334:	fddff06f          	j	80003310 <_ZN4ListI6ThreadE7add_endEPS0_+0x58>
    80003338:	00050493          	mv	s1,a0
    ListNode<T>* newnode = new ListNode<T>(t);
    8000333c:	00090513          	mv	a0,s2
    80003340:	00000097          	auipc	ra,0x0
    80003344:	ed0080e7          	jalr	-304(ra) # 80003210 <_ZN8ListNodeI6ThreadEdlEPv>
    80003348:	00048513          	mv	a0,s1
    8000334c:	00009097          	auipc	ra,0x9
    80003350:	50c080e7          	jalr	1292(ra) # 8000c858 <_Unwind_Resume>

0000000080003354 <_ZN4ListI6ThreadE16remove_beginningEv>:

template<typename T>
T* List<T>::remove_beginning() {
    80003354:	fe010113          	addi	sp,sp,-32
    80003358:	00113c23          	sd	ra,24(sp)
    8000335c:	00813823          	sd	s0,16(sp)
    80003360:	00913423          	sd	s1,8(sp)
    80003364:	02010413          	addi	s0,sp,32
    80003368:	00050793          	mv	a5,a0
    if (!head) return nullptr;
    8000336c:	00053503          	ld	a0,0(a0)
    80003370:	04050063          	beqz	a0,800033b0 <_ZN4ListI6ThreadE16remove_beginningEv+0x5c>
    ListNode<T>* node = head;
    head = head->next;
    80003374:	00053703          	ld	a4,0(a0)
    80003378:	00e7b023          	sd	a4,0(a5)
    if (head)
    8000337c:	02070663          	beqz	a4,800033a8 <_ZN4ListI6ThreadE16remove_beginningEv+0x54>
        head->prev = nullptr;
    80003380:	00073423          	sd	zero,8(a4)
    else
        tail = nullptr;

    node->next = nullptr;
    node->prev = nullptr;
    T* obj = node->object;
    80003384:	01053483          	ld	s1,16(a0)
    delete node;
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	e88080e7          	jalr	-376(ra) # 80003210 <_ZN8ListNodeI6ThreadEdlEPv>
    return obj;
}
    80003390:	00048513          	mv	a0,s1
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00813483          	ld	s1,8(sp)
    800033a0:	02010113          	addi	sp,sp,32
    800033a4:	00008067          	ret
        tail = nullptr;
    800033a8:	0007b423          	sd	zero,8(a5)
    800033ac:	fd9ff06f          	j	80003384 <_ZN4ListI6ThreadE16remove_beginningEv+0x30>
    if (!head) return nullptr;
    800033b0:	00050493          	mv	s1,a0
    800033b4:	fddff06f          	j	80003390 <_ZN4ListI6ThreadE16remove_beginningEv+0x3c>

00000000800033b8 <_ZN4ListI6ThreadE5emptyEv>:
bool List<T>::empty() {
    800033b8:	ff010113          	addi	sp,sp,-16
    800033bc:	00813423          	sd	s0,8(sp)
    800033c0:	01010413          	addi	s0,sp,16
    return head == nullptr;
    800033c4:	00053503          	ld	a0,0(a0)
}
    800033c8:	00153513          	seqz	a0,a0
    800033cc:	00813403          	ld	s0,8(sp)
    800033d0:	01010113          	addi	sp,sp,16
    800033d4:	00008067          	ret

00000000800033d8 <_ZN13SemaphorePoolC1Ev>:

#include "../h/SemaphorePool.hpp"

SemaphorePool::SemaphorePool() : pool(nullptr), used(nullptr) {}
    800033d8:	ff010113          	addi	sp,sp,-16
    800033dc:	00813423          	sd	s0,8(sp)
    800033e0:	01010413          	addi	s0,sp,16
    800033e4:	00053023          	sd	zero,0(a0)
    800033e8:	00053423          	sd	zero,8(a0)
    800033ec:	00813403          	ld	s0,8(sp)
    800033f0:	01010113          	addi	sp,sp,16
    800033f4:	00008067          	ret

00000000800033f8 <_ZN13SemaphorePool4initEPvS0_>:

void SemaphorePool::init(void* poolStartAddress, void* usedStartAddress) {
    800033f8:	ff010113          	addi	sp,sp,-16
    800033fc:	00813423          	sd	s0,8(sp)
    80003400:	01010413          	addi	s0,sp,16
    pool = (Semaphore*)poolStartAddress;
    80003404:	00b53023          	sd	a1,0(a0)
    used = (bool*)usedStartAddress;
    80003408:	00c53423          	sd	a2,8(a0)
    for (int i = 0; i < MAX_SEMAPHORES; i++) used[i] = false;
    8000340c:	00000793          	li	a5,0
    80003410:	00900713          	li	a4,9
    80003414:	00f74c63          	blt	a4,a5,8000342c <_ZN13SemaphorePool4initEPvS0_+0x34>
    80003418:	00853703          	ld	a4,8(a0)
    8000341c:	00f70733          	add	a4,a4,a5
    80003420:	00070023          	sb	zero,0(a4)
    80003424:	0017879b          	addiw	a5,a5,1
    80003428:	fe9ff06f          	j	80003410 <_ZN13SemaphorePool4initEPvS0_+0x18>
}
    8000342c:	00813403          	ld	s0,8(sp)
    80003430:	01010113          	addi	sp,sp,16
    80003434:	00008067          	ret

0000000080003438 <_ZN13SemaphorePool16getSemaphoreByIdEj>:

Semaphore* SemaphorePool::getSemaphoreById(sem_t id){
    80003438:	ff010113          	addi	sp,sp,-16
    8000343c:	00813423          	sd	s0,8(sp)
    80003440:	01010413          	addi	s0,sp,16
    80003444:	00050693          	mv	a3,a0
    for(int i = 0; i < MAX_SEMAPHORES; i++){
    80003448:	00000793          	li	a5,0
    8000344c:	0080006f          	j	80003454 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x1c>
    80003450:	0017879b          	addiw	a5,a5,1
    80003454:	00900713          	li	a4,9
    80003458:	02f74663          	blt	a4,a5,80003484 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x4c>
        if(used[i] == true && pool[i].myHandle == id){
    8000345c:	0086b703          	ld	a4,8(a3)
    80003460:	00f70733          	add	a4,a4,a5
    80003464:	00074703          	lbu	a4,0(a4)
    80003468:	fe0704e3          	beqz	a4,80003450 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x18>
    8000346c:	0006b503          	ld	a0,0(a3)
    80003470:	00579713          	slli	a4,a5,0x5
    80003474:	00e50533          	add	a0,a0,a4
    80003478:	00852703          	lw	a4,8(a0)
    8000347c:	fcb71ae3          	bne	a4,a1,80003450 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x18>
    80003480:	0080006f          	j	80003488 <_ZN13SemaphorePool16getSemaphoreByIdEj+0x50>
            return &pool[i];
        }
    }
    return nullptr;
    80003484:	00000513          	li	a0,0
}
    80003488:	00813403          	ld	s0,8(sp)
    8000348c:	01010113          	addi	sp,sp,16
    80003490:	00008067          	ret

0000000080003494 <_ZN13SemaphorePool8allocateEv>:
Semaphore* SemaphorePool::allocate() {
    80003494:	ff010113          	addi	sp,sp,-16
    80003498:	00813423          	sd	s0,8(sp)
    8000349c:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    800034a0:	00000793          	li	a5,0
    800034a4:	00900713          	li	a4,9
    800034a8:	02f74c63          	blt	a4,a5,800034e0 <_ZN13SemaphorePool8allocateEv+0x4c>
        if (!used[i]) {
    800034ac:	00853703          	ld	a4,8(a0)
    800034b0:	00078613          	mv	a2,a5
    800034b4:	00f70733          	add	a4,a4,a5
    800034b8:	00074683          	lbu	a3,0(a4)
    800034bc:	00068663          	beqz	a3,800034c8 <_ZN13SemaphorePool8allocateEv+0x34>
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    800034c0:	0017879b          	addiw	a5,a5,1
    800034c4:	fe1ff06f          	j	800034a4 <_ZN13SemaphorePool8allocateEv+0x10>
            used[i] = true;
    800034c8:	00100793          	li	a5,1
    800034cc:	00f70023          	sb	a5,0(a4)
            return &pool[i];
    800034d0:	00053503          	ld	a0,0(a0)
    800034d4:	00561613          	slli	a2,a2,0x5
    800034d8:	00c50533          	add	a0,a0,a2
    800034dc:	0080006f          	j	800034e4 <_ZN13SemaphorePool8allocateEv+0x50>
        }
    }
    return nullptr;
    800034e0:	00000513          	li	a0,0
}
    800034e4:	00813403          	ld	s0,8(sp)
    800034e8:	01010113          	addi	sp,sp,16
    800034ec:	00008067          	ret

00000000800034f0 <_ZN13SemaphorePool10deallocateEP9Semaphore>:

void SemaphorePool::deallocate(Semaphore* obj) {
    800034f0:	ff010113          	addi	sp,sp,-16
    800034f4:	00813423          	sd	s0,8(sp)
    800034f8:	01010413          	addi	s0,sp,16
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    800034fc:	00000793          	li	a5,0
    80003500:	00900713          	li	a4,9
    80003504:	02f74663          	blt	a4,a5,80003530 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x40>
        if (&pool[i] == obj) {
    80003508:	00053703          	ld	a4,0(a0)
    8000350c:	00078613          	mv	a2,a5
    80003510:	00579693          	slli	a3,a5,0x5
    80003514:	00d70733          	add	a4,a4,a3
    80003518:	00b70663          	beq	a4,a1,80003524 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x34>
    for (int i = 0; i < MAX_SEMAPHORES; i++) {
    8000351c:	0017879b          	addiw	a5,a5,1
    80003520:	fe1ff06f          	j	80003500 <_ZN13SemaphorePool10deallocateEP9Semaphore+0x10>
            used[i] = false;
    80003524:	00853783          	ld	a5,8(a0)
    80003528:	00c78633          	add	a2,a5,a2
    8000352c:	00060023          	sb	zero,0(a2)
            return;
        }
    }
}
    80003530:	00813403          	ld	s0,8(sp)
    80003534:	01010113          	addi	sp,sp,16
    80003538:	00008067          	ret

000000008000353c <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    8000353c:	fe010113          	addi	sp,sp,-32
    80003540:	00113c23          	sd	ra,24(sp)
    80003544:	00813823          	sd	s0,16(sp)
    80003548:	00913423          	sd	s1,8(sp)
    8000354c:	01213023          	sd	s2,0(sp)
    80003550:	02010413          	addi	s0,sp,32
    80003554:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003558:	00000913          	li	s2,0
    8000355c:	00c0006f          	j	80003568 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003560:	ffffe097          	auipc	ra,0xffffe
    80003564:	110080e7          	jalr	272(ra) # 80001670 <thread_dispatch>
    while ((key = getc()) != 0x1b) {
    80003568:	ffffe097          	auipc	ra,0xffffe
    8000356c:	2e0080e7          	jalr	736(ra) # 80001848 <getc>
    80003570:	0005059b          	sext.w	a1,a0
    80003574:	01b00793          	li	a5,27
    80003578:	02f58a63          	beq	a1,a5,800035ac <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    8000357c:	0084b503          	ld	a0,8(s1)
    80003580:	00003097          	auipc	ra,0x3
    80003584:	188080e7          	jalr	392(ra) # 80006708 <_ZN6Buffer3putEi>
        i++;
    80003588:	0019071b          	addiw	a4,s2,1
    8000358c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003590:	0004a683          	lw	a3,0(s1)
    80003594:	0026979b          	slliw	a5,a3,0x2
    80003598:	00d787bb          	addw	a5,a5,a3
    8000359c:	0017979b          	slliw	a5,a5,0x1
    800035a0:	02f767bb          	remw	a5,a4,a5
    800035a4:	fc0792e3          	bnez	a5,80003568 <_ZL16producerKeyboardPv+0x2c>
    800035a8:	fb9ff06f          	j	80003560 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800035ac:	00100793          	li	a5,1
    800035b0:	00008717          	auipc	a4,0x8
    800035b4:	18f72823          	sw	a5,400(a4) # 8000b740 <_ZL9threadEnd>
    data->buffer->put('!');
    800035b8:	02100593          	li	a1,33
    800035bc:	0084b503          	ld	a0,8(s1)
    800035c0:	00003097          	auipc	ra,0x3
    800035c4:	148080e7          	jalr	328(ra) # 80006708 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800035c8:	0104a503          	lw	a0,16(s1)
    800035cc:	ffffe097          	auipc	ra,0xffffe
    800035d0:	1bc080e7          	jalr	444(ra) # 80001788 <sem_signal>
}
    800035d4:	01813083          	ld	ra,24(sp)
    800035d8:	01013403          	ld	s0,16(sp)
    800035dc:	00813483          	ld	s1,8(sp)
    800035e0:	00013903          	ld	s2,0(sp)
    800035e4:	02010113          	addi	sp,sp,32
    800035e8:	00008067          	ret

00000000800035ec <_ZL8producerPv>:

static void producer(void *arg) {
    800035ec:	fe010113          	addi	sp,sp,-32
    800035f0:	00113c23          	sd	ra,24(sp)
    800035f4:	00813823          	sd	s0,16(sp)
    800035f8:	00913423          	sd	s1,8(sp)
    800035fc:	01213023          	sd	s2,0(sp)
    80003600:	02010413          	addi	s0,sp,32
    80003604:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003608:	00000913          	li	s2,0
    8000360c:	00c0006f          	j	80003618 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	060080e7          	jalr	96(ra) # 80001670 <thread_dispatch>
    while (!threadEnd) {
    80003618:	00008797          	auipc	a5,0x8
    8000361c:	1287a783          	lw	a5,296(a5) # 8000b740 <_ZL9threadEnd>
    80003620:	02079e63          	bnez	a5,8000365c <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003624:	0004a583          	lw	a1,0(s1)
    80003628:	0305859b          	addiw	a1,a1,48
    8000362c:	0084b503          	ld	a0,8(s1)
    80003630:	00003097          	auipc	ra,0x3
    80003634:	0d8080e7          	jalr	216(ra) # 80006708 <_ZN6Buffer3putEi>
        i++;
    80003638:	0019071b          	addiw	a4,s2,1
    8000363c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003640:	0004a683          	lw	a3,0(s1)
    80003644:	0026979b          	slliw	a5,a3,0x2
    80003648:	00d787bb          	addw	a5,a5,a3
    8000364c:	0017979b          	slliw	a5,a5,0x1
    80003650:	02f767bb          	remw	a5,a4,a5
    80003654:	fc0792e3          	bnez	a5,80003618 <_ZL8producerPv+0x2c>
    80003658:	fb9ff06f          	j	80003610 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    8000365c:	0104a503          	lw	a0,16(s1)
    80003660:	ffffe097          	auipc	ra,0xffffe
    80003664:	128080e7          	jalr	296(ra) # 80001788 <sem_signal>
}
    80003668:	01813083          	ld	ra,24(sp)
    8000366c:	01013403          	ld	s0,16(sp)
    80003670:	00813483          	ld	s1,8(sp)
    80003674:	00013903          	ld	s2,0(sp)
    80003678:	02010113          	addi	sp,sp,32
    8000367c:	00008067          	ret

0000000080003680 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80003680:	fd010113          	addi	sp,sp,-48
    80003684:	02113423          	sd	ra,40(sp)
    80003688:	02813023          	sd	s0,32(sp)
    8000368c:	00913c23          	sd	s1,24(sp)
    80003690:	01213823          	sd	s2,16(sp)
    80003694:	01313423          	sd	s3,8(sp)
    80003698:	03010413          	addi	s0,sp,48
    8000369c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800036a0:	00000993          	li	s3,0
    800036a4:	01c0006f          	j	800036c0 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800036a8:	ffffe097          	auipc	ra,0xffffe
    800036ac:	fc8080e7          	jalr	-56(ra) # 80001670 <thread_dispatch>
    800036b0:	0500006f          	j	80003700 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800036b4:	00a00513          	li	a0,10
    800036b8:	ffffe097          	auipc	ra,0xffffe
    800036bc:	150080e7          	jalr	336(ra) # 80001808 <putc>
    while (!threadEnd) {
    800036c0:	00008797          	auipc	a5,0x8
    800036c4:	0807a783          	lw	a5,128(a5) # 8000b740 <_ZL9threadEnd>
    800036c8:	06079063          	bnez	a5,80003728 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800036cc:	00893503          	ld	a0,8(s2)
    800036d0:	00003097          	auipc	ra,0x3
    800036d4:	0c8080e7          	jalr	200(ra) # 80006798 <_ZN6Buffer3getEv>
        i++;
    800036d8:	0019849b          	addiw	s1,s3,1
    800036dc:	0004899b          	sext.w	s3,s1
        putc(key);
    800036e0:	0ff57513          	andi	a0,a0,255
    800036e4:	ffffe097          	auipc	ra,0xffffe
    800036e8:	124080e7          	jalr	292(ra) # 80001808 <putc>
        if (i % (5 * data->id) == 0) {
    800036ec:	00092703          	lw	a4,0(s2)
    800036f0:	0027179b          	slliw	a5,a4,0x2
    800036f4:	00e787bb          	addw	a5,a5,a4
    800036f8:	02f4e7bb          	remw	a5,s1,a5
    800036fc:	fa0786e3          	beqz	a5,800036a8 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003700:	05000793          	li	a5,80
    80003704:	02f4e4bb          	remw	s1,s1,a5
    80003708:	fa049ce3          	bnez	s1,800036c0 <_ZL8consumerPv+0x40>
    8000370c:	fa9ff06f          	j	800036b4 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003710:	00893503          	ld	a0,8(s2)
    80003714:	00003097          	auipc	ra,0x3
    80003718:	084080e7          	jalr	132(ra) # 80006798 <_ZN6Buffer3getEv>
        putc(key);
    8000371c:	0ff57513          	andi	a0,a0,255
    80003720:	ffffe097          	auipc	ra,0xffffe
    80003724:	0e8080e7          	jalr	232(ra) # 80001808 <putc>
    while (data->buffer->getCnt() > 0) {
    80003728:	00893503          	ld	a0,8(s2)
    8000372c:	00003097          	auipc	ra,0x3
    80003730:	0f8080e7          	jalr	248(ra) # 80006824 <_ZN6Buffer6getCntEv>
    80003734:	fca04ee3          	bgtz	a0,80003710 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003738:	01092503          	lw	a0,16(s2)
    8000373c:	ffffe097          	auipc	ra,0xffffe
    80003740:	04c080e7          	jalr	76(ra) # 80001788 <sem_signal>
}
    80003744:	02813083          	ld	ra,40(sp)
    80003748:	02013403          	ld	s0,32(sp)
    8000374c:	01813483          	ld	s1,24(sp)
    80003750:	01013903          	ld	s2,16(sp)
    80003754:	00813983          	ld	s3,8(sp)
    80003758:	03010113          	addi	sp,sp,48
    8000375c:	00008067          	ret

0000000080003760 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003760:	f9010113          	addi	sp,sp,-112
    80003764:	06113423          	sd	ra,104(sp)
    80003768:	06813023          	sd	s0,96(sp)
    8000376c:	04913c23          	sd	s1,88(sp)
    80003770:	05213823          	sd	s2,80(sp)
    80003774:	05313423          	sd	s3,72(sp)
    80003778:	05413023          	sd	s4,64(sp)
    8000377c:	03513c23          	sd	s5,56(sp)
    80003780:	03613823          	sd	s6,48(sp)
    80003784:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003788:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    8000378c:	00006517          	auipc	a0,0x6
    80003790:	92c50513          	addi	a0,a0,-1748 # 800090b8 <CONSOLE_STATUS+0xa8>
    80003794:	00002097          	auipc	ra,0x2
    80003798:	1e0080e7          	jalr	480(ra) # 80005974 <_Z11printStringPKc>
    getString(input, 30);
    8000379c:	01e00593          	li	a1,30
    800037a0:	fa040493          	addi	s1,s0,-96
    800037a4:	00048513          	mv	a0,s1
    800037a8:	00002097          	auipc	ra,0x2
    800037ac:	254080e7          	jalr	596(ra) # 800059fc <_Z9getStringPci>
    threadNum = stringToInt(input);
    800037b0:	00048513          	mv	a0,s1
    800037b4:	00002097          	auipc	ra,0x2
    800037b8:	320080e7          	jalr	800(ra) # 80005ad4 <_Z11stringToIntPKc>
    800037bc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800037c0:	00006517          	auipc	a0,0x6
    800037c4:	91850513          	addi	a0,a0,-1768 # 800090d8 <CONSOLE_STATUS+0xc8>
    800037c8:	00002097          	auipc	ra,0x2
    800037cc:	1ac080e7          	jalr	428(ra) # 80005974 <_Z11printStringPKc>
    getString(input, 30);
    800037d0:	01e00593          	li	a1,30
    800037d4:	00048513          	mv	a0,s1
    800037d8:	00002097          	auipc	ra,0x2
    800037dc:	224080e7          	jalr	548(ra) # 800059fc <_Z9getStringPci>
    n = stringToInt(input);
    800037e0:	00048513          	mv	a0,s1
    800037e4:	00002097          	auipc	ra,0x2
    800037e8:	2f0080e7          	jalr	752(ra) # 80005ad4 <_Z11stringToIntPKc>
    800037ec:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800037f0:	00006517          	auipc	a0,0x6
    800037f4:	90850513          	addi	a0,a0,-1784 # 800090f8 <CONSOLE_STATUS+0xe8>
    800037f8:	00002097          	auipc	ra,0x2
    800037fc:	17c080e7          	jalr	380(ra) # 80005974 <_Z11printStringPKc>
    80003800:	00000613          	li	a2,0
    80003804:	00a00593          	li	a1,10
    80003808:	00090513          	mv	a0,s2
    8000380c:	00002097          	auipc	ra,0x2
    80003810:	318080e7          	jalr	792(ra) # 80005b24 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003814:	00006517          	auipc	a0,0x6
    80003818:	8fc50513          	addi	a0,a0,-1796 # 80009110 <CONSOLE_STATUS+0x100>
    8000381c:	00002097          	auipc	ra,0x2
    80003820:	158080e7          	jalr	344(ra) # 80005974 <_Z11printStringPKc>
    80003824:	00000613          	li	a2,0
    80003828:	00a00593          	li	a1,10
    8000382c:	00048513          	mv	a0,s1
    80003830:	00002097          	auipc	ra,0x2
    80003834:	2f4080e7          	jalr	756(ra) # 80005b24 <_Z8printIntiii>
    printString(".\n");
    80003838:	00006517          	auipc	a0,0x6
    8000383c:	8f050513          	addi	a0,a0,-1808 # 80009128 <CONSOLE_STATUS+0x118>
    80003840:	00002097          	auipc	ra,0x2
    80003844:	134080e7          	jalr	308(ra) # 80005974 <_Z11printStringPKc>
    if(threadNum > n) {
    80003848:	0324c463          	blt	s1,s2,80003870 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    8000384c:	03205c63          	blez	s2,80003884 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003850:	02800513          	li	a0,40
    80003854:	fffff097          	auipc	ra,0xfffff
    80003858:	2f4080e7          	jalr	756(ra) # 80002b48 <_Znwm>
    8000385c:	00050a13          	mv	s4,a0
    80003860:	00048593          	mv	a1,s1
    80003864:	00003097          	auipc	ra,0x3
    80003868:	e08080e7          	jalr	-504(ra) # 8000666c <_ZN6BufferC1Ei>
    8000386c:	0300006f          	j	8000389c <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003870:	00006517          	auipc	a0,0x6
    80003874:	8c050513          	addi	a0,a0,-1856 # 80009130 <CONSOLE_STATUS+0x120>
    80003878:	00002097          	auipc	ra,0x2
    8000387c:	0fc080e7          	jalr	252(ra) # 80005974 <_Z11printStringPKc>
        return;
    80003880:	0140006f          	j	80003894 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003884:	00006517          	auipc	a0,0x6
    80003888:	8ec50513          	addi	a0,a0,-1812 # 80009170 <CONSOLE_STATUS+0x160>
    8000388c:	00002097          	auipc	ra,0x2
    80003890:	0e8080e7          	jalr	232(ra) # 80005974 <_Z11printStringPKc>
        return;
    80003894:	000b0113          	mv	sp,s6
    80003898:	1500006f          	j	800039e8 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    8000389c:	00000593          	li	a1,0
    800038a0:	00008517          	auipc	a0,0x8
    800038a4:	ea450513          	addi	a0,a0,-348 # 8000b744 <_ZL10waitForAll>
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	e48080e7          	jalr	-440(ra) # 800016f0 <sem_open>
    thread_t threads[threadNum];
    800038b0:	00291793          	slli	a5,s2,0x2
    800038b4:	00f78793          	addi	a5,a5,15
    800038b8:	ff07f793          	andi	a5,a5,-16
    800038bc:	40f10133          	sub	sp,sp,a5
    800038c0:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800038c4:	0019071b          	addiw	a4,s2,1
    800038c8:	00171793          	slli	a5,a4,0x1
    800038cc:	00e787b3          	add	a5,a5,a4
    800038d0:	00379793          	slli	a5,a5,0x3
    800038d4:	00f78793          	addi	a5,a5,15
    800038d8:	ff07f793          	andi	a5,a5,-16
    800038dc:	40f10133          	sub	sp,sp,a5
    800038e0:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800038e4:	00191613          	slli	a2,s2,0x1
    800038e8:	012607b3          	add	a5,a2,s2
    800038ec:	00379793          	slli	a5,a5,0x3
    800038f0:	00f987b3          	add	a5,s3,a5
    800038f4:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800038f8:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800038fc:	00008717          	auipc	a4,0x8
    80003900:	e4872703          	lw	a4,-440(a4) # 8000b744 <_ZL10waitForAll>
    80003904:	00e7a823          	sw	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003908:	00078613          	mv	a2,a5
    8000390c:	00000597          	auipc	a1,0x0
    80003910:	d7458593          	addi	a1,a1,-652 # 80003680 <_ZL8consumerPv>
    80003914:	f9c40513          	addi	a0,s0,-100
    80003918:	ffffe097          	auipc	ra,0xffffe
    8000391c:	ca0080e7          	jalr	-864(ra) # 800015b8 <thread_create>
    for (int i = 0; i < threadNum; i++) {
    80003920:	00000493          	li	s1,0
    80003924:	0280006f          	j	8000394c <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003928:	00000597          	auipc	a1,0x0
    8000392c:	c1458593          	addi	a1,a1,-1004 # 8000353c <_ZL16producerKeyboardPv>
                      data + i);
    80003930:	00179613          	slli	a2,a5,0x1
    80003934:	00f60633          	add	a2,a2,a5
    80003938:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    8000393c:	00c98633          	add	a2,s3,a2
    80003940:	ffffe097          	auipc	ra,0xffffe
    80003944:	c78080e7          	jalr	-904(ra) # 800015b8 <thread_create>
    for (int i = 0; i < threadNum; i++) {
    80003948:	0014849b          	addiw	s1,s1,1
    8000394c:	0524d263          	bge	s1,s2,80003990 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003950:	00149793          	slli	a5,s1,0x1
    80003954:	009787b3          	add	a5,a5,s1
    80003958:	00379793          	slli	a5,a5,0x3
    8000395c:	00f987b3          	add	a5,s3,a5
    80003960:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003964:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003968:	00008717          	auipc	a4,0x8
    8000396c:	ddc72703          	lw	a4,-548(a4) # 8000b744 <_ZL10waitForAll>
    80003970:	00e7a823          	sw	a4,16(a5)
        thread_create(threads + i,
    80003974:	00048793          	mv	a5,s1
    80003978:	00249513          	slli	a0,s1,0x2
    8000397c:	00aa8533          	add	a0,s5,a0
    80003980:	fa9054e3          	blez	s1,80003928 <_Z22producerConsumer_C_APIv+0x1c8>
    80003984:	00000597          	auipc	a1,0x0
    80003988:	c6858593          	addi	a1,a1,-920 # 800035ec <_ZL8producerPv>
    8000398c:	fa5ff06f          	j	80003930 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003990:	ffffe097          	auipc	ra,0xffffe
    80003994:	ce0080e7          	jalr	-800(ra) # 80001670 <thread_dispatch>
    for (int i = 0; i <= threadNum; i++) {
    80003998:	00000493          	li	s1,0
    8000399c:	00994e63          	blt	s2,s1,800039b8 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800039a0:	00008517          	auipc	a0,0x8
    800039a4:	da452503          	lw	a0,-604(a0) # 8000b744 <_ZL10waitForAll>
    800039a8:	ffffe097          	auipc	ra,0xffffe
    800039ac:	d98080e7          	jalr	-616(ra) # 80001740 <sem_wait>
    for (int i = 0; i <= threadNum; i++) {
    800039b0:	0014849b          	addiw	s1,s1,1
    800039b4:	fe9ff06f          	j	8000399c <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800039b8:	00008517          	auipc	a0,0x8
    800039bc:	d8c52503          	lw	a0,-628(a0) # 8000b744 <_ZL10waitForAll>
    800039c0:	ffffe097          	auipc	ra,0xffffe
    800039c4:	e08080e7          	jalr	-504(ra) # 800017c8 <sem_close>
    delete buffer;
    800039c8:	000a0e63          	beqz	s4,800039e4 <_Z22producerConsumer_C_APIv+0x284>
    800039cc:	000a0513          	mv	a0,s4
    800039d0:	00003097          	auipc	ra,0x3
    800039d4:	edc080e7          	jalr	-292(ra) # 800068ac <_ZN6BufferD1Ev>
    800039d8:	000a0513          	mv	a0,s4
    800039dc:	fffff097          	auipc	ra,0xfffff
    800039e0:	1bc080e7          	jalr	444(ra) # 80002b98 <_ZdlPv>
    800039e4:	000b0113          	mv	sp,s6

}
    800039e8:	f9040113          	addi	sp,s0,-112
    800039ec:	06813083          	ld	ra,104(sp)
    800039f0:	06013403          	ld	s0,96(sp)
    800039f4:	05813483          	ld	s1,88(sp)
    800039f8:	05013903          	ld	s2,80(sp)
    800039fc:	04813983          	ld	s3,72(sp)
    80003a00:	04013a03          	ld	s4,64(sp)
    80003a04:	03813a83          	ld	s5,56(sp)
    80003a08:	03013b03          	ld	s6,48(sp)
    80003a0c:	07010113          	addi	sp,sp,112
    80003a10:	00008067          	ret
    80003a14:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003a18:	000a0513          	mv	a0,s4
    80003a1c:	fffff097          	auipc	ra,0xfffff
    80003a20:	17c080e7          	jalr	380(ra) # 80002b98 <_ZdlPv>
    80003a24:	00048513          	mv	a0,s1
    80003a28:	00009097          	auipc	ra,0x9
    80003a2c:	e30080e7          	jalr	-464(ra) # 8000c858 <_Unwind_Resume>

0000000080003a30 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003a30:	fe010113          	addi	sp,sp,-32
    80003a34:	00113c23          	sd	ra,24(sp)
    80003a38:	00813823          	sd	s0,16(sp)
    80003a3c:	00913423          	sd	s1,8(sp)
    80003a40:	01213023          	sd	s2,0(sp)
    80003a44:	02010413          	addi	s0,sp,32
    80003a48:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003a4c:	00100793          	li	a5,1
    80003a50:	02a7f863          	bgeu	a5,a0,80003a80 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003a54:	00a00793          	li	a5,10
    80003a58:	02f577b3          	remu	a5,a0,a5
    80003a5c:	02078e63          	beqz	a5,80003a98 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003a60:	fff48513          	addi	a0,s1,-1
    80003a64:	00000097          	auipc	ra,0x0
    80003a68:	fcc080e7          	jalr	-52(ra) # 80003a30 <_ZL9fibonaccim>
    80003a6c:	00050913          	mv	s2,a0
    80003a70:	ffe48513          	addi	a0,s1,-2
    80003a74:	00000097          	auipc	ra,0x0
    80003a78:	fbc080e7          	jalr	-68(ra) # 80003a30 <_ZL9fibonaccim>
    80003a7c:	00a90533          	add	a0,s2,a0
}
    80003a80:	01813083          	ld	ra,24(sp)
    80003a84:	01013403          	ld	s0,16(sp)
    80003a88:	00813483          	ld	s1,8(sp)
    80003a8c:	00013903          	ld	s2,0(sp)
    80003a90:	02010113          	addi	sp,sp,32
    80003a94:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003a98:	ffffe097          	auipc	ra,0xffffe
    80003a9c:	bd8080e7          	jalr	-1064(ra) # 80001670 <thread_dispatch>
    80003aa0:	fc1ff06f          	j	80003a60 <_ZL9fibonaccim+0x30>

0000000080003aa4 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003aa4:	fe010113          	addi	sp,sp,-32
    80003aa8:	00113c23          	sd	ra,24(sp)
    80003aac:	00813823          	sd	s0,16(sp)
    80003ab0:	00913423          	sd	s1,8(sp)
    80003ab4:	01213023          	sd	s2,0(sp)
    80003ab8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003abc:	00000913          	li	s2,0
    80003ac0:	0300006f          	j	80003af0 <_ZN7WorkerA11workerBodyAEPv+0x4c>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10; j++) {
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80003ac4:	00178793          	addi	a5,a5,1
    80003ac8:	01d00713          	li	a4,29
    80003acc:	fef77ce3          	bgeu	a4,a5,80003ac4 <_ZN7WorkerA11workerBodyAEPv+0x20>
            thread_dispatch();
    80003ad0:	ffffe097          	auipc	ra,0xffffe
    80003ad4:	ba0080e7          	jalr	-1120(ra) # 80001670 <thread_dispatch>
        for (uint64 j = 0; j < 10; j++) {
    80003ad8:	00148493          	addi	s1,s1,1
    80003adc:	00900793          	li	a5,9
    80003ae0:	0097e663          	bltu	a5,s1,80003aec <_ZN7WorkerA11workerBodyAEPv+0x48>
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80003ae4:	00000793          	li	a5,0
    80003ae8:	fe1ff06f          	j	80003ac8 <_ZN7WorkerA11workerBodyAEPv+0x24>
    for (uint64 i = 0; i < 10; i++) {
    80003aec:	00190913          	addi	s2,s2,1
    80003af0:	00900793          	li	a5,9
    80003af4:	0527e063          	bltu	a5,s2,80003b34 <_ZN7WorkerA11workerBodyAEPv+0x90>
        printString("A: i="); printInt(i); printString("\n");
    80003af8:	00005517          	auipc	a0,0x5
    80003afc:	6a850513          	addi	a0,a0,1704 # 800091a0 <CONSOLE_STATUS+0x190>
    80003b00:	00002097          	auipc	ra,0x2
    80003b04:	e74080e7          	jalr	-396(ra) # 80005974 <_Z11printStringPKc>
    80003b08:	00000613          	li	a2,0
    80003b0c:	00a00593          	li	a1,10
    80003b10:	0009051b          	sext.w	a0,s2
    80003b14:	00002097          	auipc	ra,0x2
    80003b18:	010080e7          	jalr	16(ra) # 80005b24 <_Z8printIntiii>
    80003b1c:	00005517          	auipc	a0,0x5
    80003b20:	5d450513          	addi	a0,a0,1492 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003b24:	00002097          	auipc	ra,0x2
    80003b28:	e50080e7          	jalr	-432(ra) # 80005974 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    80003b2c:	00000493          	li	s1,0
    80003b30:	fadff06f          	j	80003adc <_ZN7WorkerA11workerBodyAEPv+0x38>
        }
    }
    printString("A finished!\n");
    80003b34:	00005517          	auipc	a0,0x5
    80003b38:	67450513          	addi	a0,a0,1652 # 800091a8 <CONSOLE_STATUS+0x198>
    80003b3c:	00002097          	auipc	ra,0x2
    80003b40:	e38080e7          	jalr	-456(ra) # 80005974 <_Z11printStringPKc>
    finishedA = true;
    80003b44:	00100793          	li	a5,1
    80003b48:	00008717          	auipc	a4,0x8
    80003b4c:	c0f70023          	sb	a5,-1024(a4) # 8000b748 <_ZL9finishedA>
}
    80003b50:	01813083          	ld	ra,24(sp)
    80003b54:	01013403          	ld	s0,16(sp)
    80003b58:	00813483          	ld	s1,8(sp)
    80003b5c:	00013903          	ld	s2,0(sp)
    80003b60:	02010113          	addi	sp,sp,32
    80003b64:	00008067          	ret

0000000080003b68 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003b68:	fe010113          	addi	sp,sp,-32
    80003b6c:	00113c23          	sd	ra,24(sp)
    80003b70:	00813823          	sd	s0,16(sp)
    80003b74:	00913423          	sd	s1,8(sp)
    80003b78:	01213023          	sd	s2,0(sp)
    80003b7c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003b80:	00000913          	li	s2,0
    80003b84:	0300006f          	j	80003bb4 <_ZN7WorkerB11workerBodyBEPv+0x4c>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10; j++) {
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80003b88:	00178793          	addi	a5,a5,1
    80003b8c:	01d00713          	li	a4,29
    80003b90:	fef77ce3          	bgeu	a4,a5,80003b88 <_ZN7WorkerB11workerBodyBEPv+0x20>
            thread_dispatch();
    80003b94:	ffffe097          	auipc	ra,0xffffe
    80003b98:	adc080e7          	jalr	-1316(ra) # 80001670 <thread_dispatch>
        for (uint64 j = 0; j < 10; j++) {
    80003b9c:	00148493          	addi	s1,s1,1
    80003ba0:	00900793          	li	a5,9
    80003ba4:	0097e663          	bltu	a5,s1,80003bb0 <_ZN7WorkerB11workerBodyBEPv+0x48>
            for (uint64 k = 0; k < 30; k++) { /* busy wait */ }
    80003ba8:	00000793          	li	a5,0
    80003bac:	fe1ff06f          	j	80003b8c <_ZN7WorkerB11workerBodyBEPv+0x24>
    for (uint64 i = 0; i < 16; i++) {
    80003bb0:	00190913          	addi	s2,s2,1
    80003bb4:	00f00793          	li	a5,15
    80003bb8:	0527e063          	bltu	a5,s2,80003bf8 <_ZN7WorkerB11workerBodyBEPv+0x90>
        printString("B: i="); printInt(i); printString("\n");
    80003bbc:	00005517          	auipc	a0,0x5
    80003bc0:	5fc50513          	addi	a0,a0,1532 # 800091b8 <CONSOLE_STATUS+0x1a8>
    80003bc4:	00002097          	auipc	ra,0x2
    80003bc8:	db0080e7          	jalr	-592(ra) # 80005974 <_Z11printStringPKc>
    80003bcc:	00000613          	li	a2,0
    80003bd0:	00a00593          	li	a1,10
    80003bd4:	0009051b          	sext.w	a0,s2
    80003bd8:	00002097          	auipc	ra,0x2
    80003bdc:	f4c080e7          	jalr	-180(ra) # 80005b24 <_Z8printIntiii>
    80003be0:	00005517          	auipc	a0,0x5
    80003be4:	51050513          	addi	a0,a0,1296 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003be8:	00002097          	auipc	ra,0x2
    80003bec:	d8c080e7          	jalr	-628(ra) # 80005974 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10; j++) {
    80003bf0:	00000493          	li	s1,0
    80003bf4:	fadff06f          	j	80003ba0 <_ZN7WorkerB11workerBodyBEPv+0x38>
        }
    }
    printString("B finished!\n");
    80003bf8:	00005517          	auipc	a0,0x5
    80003bfc:	5c850513          	addi	a0,a0,1480 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80003c00:	00002097          	auipc	ra,0x2
    80003c04:	d74080e7          	jalr	-652(ra) # 80005974 <_Z11printStringPKc>
    finishedB = true;
    80003c08:	00100793          	li	a5,1
    80003c0c:	00008717          	auipc	a4,0x8
    80003c10:	b2f70ea3          	sb	a5,-1219(a4) # 8000b749 <_ZL9finishedB>
    thread_dispatch();
    80003c14:	ffffe097          	auipc	ra,0xffffe
    80003c18:	a5c080e7          	jalr	-1444(ra) # 80001670 <thread_dispatch>
}
    80003c1c:	01813083          	ld	ra,24(sp)
    80003c20:	01013403          	ld	s0,16(sp)
    80003c24:	00813483          	ld	s1,8(sp)
    80003c28:	00013903          	ld	s2,0(sp)
    80003c2c:	02010113          	addi	sp,sp,32
    80003c30:	00008067          	ret

0000000080003c34 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003c34:	fe010113          	addi	sp,sp,-32
    80003c38:	00113c23          	sd	ra,24(sp)
    80003c3c:	00813823          	sd	s0,16(sp)
    80003c40:	00913423          	sd	s1,8(sp)
    80003c44:	01213023          	sd	s2,0(sp)
    80003c48:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003c4c:	00000493          	li	s1,0
    80003c50:	0400006f          	j	80003c90 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003c54:	00005517          	auipc	a0,0x5
    80003c58:	57c50513          	addi	a0,a0,1404 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80003c5c:	00002097          	auipc	ra,0x2
    80003c60:	d18080e7          	jalr	-744(ra) # 80005974 <_Z11printStringPKc>
    80003c64:	00000613          	li	a2,0
    80003c68:	00a00593          	li	a1,10
    80003c6c:	00048513          	mv	a0,s1
    80003c70:	00002097          	auipc	ra,0x2
    80003c74:	eb4080e7          	jalr	-332(ra) # 80005b24 <_Z8printIntiii>
    80003c78:	00005517          	auipc	a0,0x5
    80003c7c:	47850513          	addi	a0,a0,1144 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003c80:	00002097          	auipc	ra,0x2
    80003c84:	cf4080e7          	jalr	-780(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003c88:	0014849b          	addiw	s1,s1,1
    80003c8c:	0ff4f493          	andi	s1,s1,255
    80003c90:	00200793          	li	a5,2
    80003c94:	fc97f0e3          	bgeu	a5,s1,80003c54 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003c98:	00005517          	auipc	a0,0x5
    80003c9c:	54050513          	addi	a0,a0,1344 # 800091d8 <CONSOLE_STATUS+0x1c8>
    80003ca0:	00002097          	auipc	ra,0x2
    80003ca4:	cd4080e7          	jalr	-812(ra) # 80005974 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003ca8:	00700313          	li	t1,7

    thread_dispatch();
    80003cac:	ffffe097          	auipc	ra,0xffffe
    80003cb0:	9c4080e7          	jalr	-1596(ra) # 80001670 <thread_dispatch>


    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003cb4:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003cb8:	00005517          	auipc	a0,0x5
    80003cbc:	53050513          	addi	a0,a0,1328 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80003cc0:	00002097          	auipc	ra,0x2
    80003cc4:	cb4080e7          	jalr	-844(ra) # 80005974 <_Z11printStringPKc>
    80003cc8:	00000613          	li	a2,0
    80003ccc:	00a00593          	li	a1,10
    80003cd0:	0009051b          	sext.w	a0,s2
    80003cd4:	00002097          	auipc	ra,0x2
    80003cd8:	e50080e7          	jalr	-432(ra) # 80005b24 <_Z8printIntiii>
    80003cdc:	00005517          	auipc	a0,0x5
    80003ce0:	41450513          	addi	a0,a0,1044 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003ce4:	00002097          	auipc	ra,0x2
    80003ce8:	c90080e7          	jalr	-880(ra) # 80005974 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003cec:	00c00513          	li	a0,12
    80003cf0:	00000097          	auipc	ra,0x0
    80003cf4:	d40080e7          	jalr	-704(ra) # 80003a30 <_ZL9fibonaccim>
    80003cf8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003cfc:	00005517          	auipc	a0,0x5
    80003d00:	4f450513          	addi	a0,a0,1268 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80003d04:	00002097          	auipc	ra,0x2
    80003d08:	c70080e7          	jalr	-912(ra) # 80005974 <_Z11printStringPKc>
    80003d0c:	00000613          	li	a2,0
    80003d10:	00a00593          	li	a1,10
    80003d14:	0009051b          	sext.w	a0,s2
    80003d18:	00002097          	auipc	ra,0x2
    80003d1c:	e0c080e7          	jalr	-500(ra) # 80005b24 <_Z8printIntiii>
    80003d20:	00005517          	auipc	a0,0x5
    80003d24:	3d050513          	addi	a0,a0,976 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003d28:	00002097          	auipc	ra,0x2
    80003d2c:	c4c080e7          	jalr	-948(ra) # 80005974 <_Z11printStringPKc>
    80003d30:	0400006f          	j	80003d70 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d34:	00005517          	auipc	a0,0x5
    80003d38:	49c50513          	addi	a0,a0,1180 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80003d3c:	00002097          	auipc	ra,0x2
    80003d40:	c38080e7          	jalr	-968(ra) # 80005974 <_Z11printStringPKc>
    80003d44:	00000613          	li	a2,0
    80003d48:	00a00593          	li	a1,10
    80003d4c:	00048513          	mv	a0,s1
    80003d50:	00002097          	auipc	ra,0x2
    80003d54:	dd4080e7          	jalr	-556(ra) # 80005b24 <_Z8printIntiii>
    80003d58:	00005517          	auipc	a0,0x5
    80003d5c:	39850513          	addi	a0,a0,920 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003d60:	00002097          	auipc	ra,0x2
    80003d64:	c14080e7          	jalr	-1004(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003d68:	0014849b          	addiw	s1,s1,1
    80003d6c:	0ff4f493          	andi	s1,s1,255
    80003d70:	00500793          	li	a5,5
    80003d74:	fc97f0e3          	bgeu	a5,s1,80003d34 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003d78:	00005517          	auipc	a0,0x5
    80003d7c:	43050513          	addi	a0,a0,1072 # 800091a8 <CONSOLE_STATUS+0x198>
    80003d80:	00002097          	auipc	ra,0x2
    80003d84:	bf4080e7          	jalr	-1036(ra) # 80005974 <_Z11printStringPKc>
    finishedC = true;
    80003d88:	00100793          	li	a5,1
    80003d8c:	00008717          	auipc	a4,0x8
    80003d90:	9af70f23          	sb	a5,-1602(a4) # 8000b74a <_ZL9finishedC>

    thread_dispatch();
    80003d94:	ffffe097          	auipc	ra,0xffffe
    80003d98:	8dc080e7          	jalr	-1828(ra) # 80001670 <thread_dispatch>

}
    80003d9c:	01813083          	ld	ra,24(sp)
    80003da0:	01013403          	ld	s0,16(sp)
    80003da4:	00813483          	ld	s1,8(sp)
    80003da8:	00013903          	ld	s2,0(sp)
    80003dac:	02010113          	addi	sp,sp,32
    80003db0:	00008067          	ret

0000000080003db4 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003db4:	fe010113          	addi	sp,sp,-32
    80003db8:	00113c23          	sd	ra,24(sp)
    80003dbc:	00813823          	sd	s0,16(sp)
    80003dc0:	00913423          	sd	s1,8(sp)
    80003dc4:	01213023          	sd	s2,0(sp)
    80003dc8:	02010413          	addi	s0,sp,32

    uint8 i = 10;
    80003dcc:	00a00493          	li	s1,10
    80003dd0:	0400006f          	j	80003e10 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003dd4:	00005517          	auipc	a0,0x5
    80003dd8:	42c50513          	addi	a0,a0,1068 # 80009200 <CONSOLE_STATUS+0x1f0>
    80003ddc:	00002097          	auipc	ra,0x2
    80003de0:	b98080e7          	jalr	-1128(ra) # 80005974 <_Z11printStringPKc>
    80003de4:	00000613          	li	a2,0
    80003de8:	00a00593          	li	a1,10
    80003dec:	00048513          	mv	a0,s1
    80003df0:	00002097          	auipc	ra,0x2
    80003df4:	d34080e7          	jalr	-716(ra) # 80005b24 <_Z8printIntiii>
    80003df8:	00005517          	auipc	a0,0x5
    80003dfc:	2f850513          	addi	a0,a0,760 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003e00:	00002097          	auipc	ra,0x2
    80003e04:	b74080e7          	jalr	-1164(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003e08:	0014849b          	addiw	s1,s1,1
    80003e0c:	0ff4f493          	andi	s1,s1,255
    80003e10:	00c00793          	li	a5,12
    80003e14:	fc97f0e3          	bgeu	a5,s1,80003dd4 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003e18:	00005517          	auipc	a0,0x5
    80003e1c:	3f050513          	addi	a0,a0,1008 # 80009208 <CONSOLE_STATUS+0x1f8>
    80003e20:	00002097          	auipc	ra,0x2
    80003e24:	b54080e7          	jalr	-1196(ra) # 80005974 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003e28:	00500313          	li	t1,5

    thread_dispatch();
    80003e2c:	ffffe097          	auipc	ra,0xffffe
    80003e30:	844080e7          	jalr	-1980(ra) # 80001670 <thread_dispatch>


    uint64 result = fibonacci(16);
    80003e34:	01000513          	li	a0,16
    80003e38:	00000097          	auipc	ra,0x0
    80003e3c:	bf8080e7          	jalr	-1032(ra) # 80003a30 <_ZL9fibonaccim>
    80003e40:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003e44:	00005517          	auipc	a0,0x5
    80003e48:	3d450513          	addi	a0,a0,980 # 80009218 <CONSOLE_STATUS+0x208>
    80003e4c:	00002097          	auipc	ra,0x2
    80003e50:	b28080e7          	jalr	-1240(ra) # 80005974 <_Z11printStringPKc>
    80003e54:	00000613          	li	a2,0
    80003e58:	00a00593          	li	a1,10
    80003e5c:	0009051b          	sext.w	a0,s2
    80003e60:	00002097          	auipc	ra,0x2
    80003e64:	cc4080e7          	jalr	-828(ra) # 80005b24 <_Z8printIntiii>
    80003e68:	00005517          	auipc	a0,0x5
    80003e6c:	28850513          	addi	a0,a0,648 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003e70:	00002097          	auipc	ra,0x2
    80003e74:	b04080e7          	jalr	-1276(ra) # 80005974 <_Z11printStringPKc>
    80003e78:	0400006f          	j	80003eb8 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003e7c:	00005517          	auipc	a0,0x5
    80003e80:	38450513          	addi	a0,a0,900 # 80009200 <CONSOLE_STATUS+0x1f0>
    80003e84:	00002097          	auipc	ra,0x2
    80003e88:	af0080e7          	jalr	-1296(ra) # 80005974 <_Z11printStringPKc>
    80003e8c:	00000613          	li	a2,0
    80003e90:	00a00593          	li	a1,10
    80003e94:	00048513          	mv	a0,s1
    80003e98:	00002097          	auipc	ra,0x2
    80003e9c:	c8c080e7          	jalr	-884(ra) # 80005b24 <_Z8printIntiii>
    80003ea0:	00005517          	auipc	a0,0x5
    80003ea4:	25050513          	addi	a0,a0,592 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003ea8:	00002097          	auipc	ra,0x2
    80003eac:	acc080e7          	jalr	-1332(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003eb0:	0014849b          	addiw	s1,s1,1
    80003eb4:	0ff4f493          	andi	s1,s1,255
    80003eb8:	00f00793          	li	a5,15
    80003ebc:	fc97f0e3          	bgeu	a5,s1,80003e7c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003ec0:	00005517          	auipc	a0,0x5
    80003ec4:	36850513          	addi	a0,a0,872 # 80009228 <CONSOLE_STATUS+0x218>
    80003ec8:	00002097          	auipc	ra,0x2
    80003ecc:	aac080e7          	jalr	-1364(ra) # 80005974 <_Z11printStringPKc>
    finishedD = true;
    80003ed0:	00100793          	li	a5,1
    80003ed4:	00008717          	auipc	a4,0x8
    80003ed8:	86f70ba3          	sb	a5,-1929(a4) # 8000b74b <_ZL9finishedD>

    thread_dispatch();
    80003edc:	ffffd097          	auipc	ra,0xffffd
    80003ee0:	794080e7          	jalr	1940(ra) # 80001670 <thread_dispatch>

}
    80003ee4:	01813083          	ld	ra,24(sp)
    80003ee8:	01013403          	ld	s0,16(sp)
    80003eec:	00813483          	ld	s1,8(sp)
    80003ef0:	00013903          	ld	s2,0(sp)
    80003ef4:	02010113          	addi	sp,sp,32
    80003ef8:	00008067          	ret

0000000080003efc <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003efc:	fc010113          	addi	sp,sp,-64
    80003f00:	02113c23          	sd	ra,56(sp)
    80003f04:	02813823          	sd	s0,48(sp)
    80003f08:	02913423          	sd	s1,40(sp)
    80003f0c:	03213023          	sd	s2,32(sp)
    80003f10:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003f14:	08800513          	li	a0,136
    80003f18:	ffffe097          	auipc	ra,0xffffe
    80003f1c:	550080e7          	jalr	1360(ra) # 80002468 <_ZN6ThreadnwEm>
    80003f20:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003f24:	ffffe097          	auipc	ra,0xffffe
    80003f28:	258080e7          	jalr	600(ra) # 8000217c <_ZN6ThreadC1Ev>
    80003f2c:	00007797          	auipc	a5,0x7
    80003f30:	58c78793          	addi	a5,a5,1420 # 8000b4b8 <_ZTV7WorkerA+0x10>
    80003f34:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003f38:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003f3c:	00005517          	auipc	a0,0x5
    80003f40:	2fc50513          	addi	a0,a0,764 # 80009238 <CONSOLE_STATUS+0x228>
    80003f44:	00002097          	auipc	ra,0x2
    80003f48:	a30080e7          	jalr	-1488(ra) # 80005974 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003f4c:	08800513          	li	a0,136
    80003f50:	ffffe097          	auipc	ra,0xffffe
    80003f54:	518080e7          	jalr	1304(ra) # 80002468 <_ZN6ThreadnwEm>
    80003f58:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003f5c:	ffffe097          	auipc	ra,0xffffe
    80003f60:	220080e7          	jalr	544(ra) # 8000217c <_ZN6ThreadC1Ev>
    80003f64:	00007797          	auipc	a5,0x7
    80003f68:	57c78793          	addi	a5,a5,1404 # 8000b4e0 <_ZTV7WorkerB+0x10>
    80003f6c:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003f70:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003f74:	00005517          	auipc	a0,0x5
    80003f78:	2dc50513          	addi	a0,a0,732 # 80009250 <CONSOLE_STATUS+0x240>
    80003f7c:	00002097          	auipc	ra,0x2
    80003f80:	9f8080e7          	jalr	-1544(ra) # 80005974 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003f84:	08800513          	li	a0,136
    80003f88:	ffffe097          	auipc	ra,0xffffe
    80003f8c:	4e0080e7          	jalr	1248(ra) # 80002468 <_ZN6ThreadnwEm>
    80003f90:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003f94:	ffffe097          	auipc	ra,0xffffe
    80003f98:	1e8080e7          	jalr	488(ra) # 8000217c <_ZN6ThreadC1Ev>
    80003f9c:	00007797          	auipc	a5,0x7
    80003fa0:	56c78793          	addi	a5,a5,1388 # 8000b508 <_ZTV7WorkerC+0x10>
    80003fa4:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003fa8:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003fac:	00005517          	auipc	a0,0x5
    80003fb0:	2bc50513          	addi	a0,a0,700 # 80009268 <CONSOLE_STATUS+0x258>
    80003fb4:	00002097          	auipc	ra,0x2
    80003fb8:	9c0080e7          	jalr	-1600(ra) # 80005974 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003fbc:	08800513          	li	a0,136
    80003fc0:	ffffe097          	auipc	ra,0xffffe
    80003fc4:	4a8080e7          	jalr	1192(ra) # 80002468 <_ZN6ThreadnwEm>
    80003fc8:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003fcc:	ffffe097          	auipc	ra,0xffffe
    80003fd0:	1b0080e7          	jalr	432(ra) # 8000217c <_ZN6ThreadC1Ev>
    80003fd4:	00007797          	auipc	a5,0x7
    80003fd8:	55c78793          	addi	a5,a5,1372 # 8000b530 <_ZTV7WorkerD+0x10>
    80003fdc:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003fe0:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003fe4:	00005517          	auipc	a0,0x5
    80003fe8:	29c50513          	addi	a0,a0,668 # 80009280 <CONSOLE_STATUS+0x270>
    80003fec:	00002097          	auipc	ra,0x2
    80003ff0:	988080e7          	jalr	-1656(ra) # 80005974 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003ff4:	00000493          	li	s1,0
    80003ff8:	00300793          	li	a5,3
    80003ffc:	0297c663          	blt	a5,s1,80004028 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004000:	00349793          	slli	a5,s1,0x3
    80004004:	fe040713          	addi	a4,s0,-32
    80004008:	00f707b3          	add	a5,a4,a5
    8000400c:	fe07b503          	ld	a0,-32(a5)
    80004010:	ffffe097          	auipc	ra,0xffffe
    80004014:	640080e7          	jalr	1600(ra) # 80002650 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004018:	0014849b          	addiw	s1,s1,1
    8000401c:	fddff06f          	j	80003ff8 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {

        Thread::dispatch();
    80004020:	ffffe097          	auipc	ra,0xffffe
    80004024:	608080e7          	jalr	1544(ra) # 80002628 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004028:	00007797          	auipc	a5,0x7
    8000402c:	7207c783          	lbu	a5,1824(a5) # 8000b748 <_ZL9finishedA>
    80004030:	fe0788e3          	beqz	a5,80004020 <_Z20Threads_CPP_API_testv+0x124>
    80004034:	00007797          	auipc	a5,0x7
    80004038:	7157c783          	lbu	a5,1813(a5) # 8000b749 <_ZL9finishedB>
    8000403c:	fe0782e3          	beqz	a5,80004020 <_Z20Threads_CPP_API_testv+0x124>
    80004040:	00007797          	auipc	a5,0x7
    80004044:	70a7c783          	lbu	a5,1802(a5) # 8000b74a <_ZL9finishedC>
    80004048:	fc078ce3          	beqz	a5,80004020 <_Z20Threads_CPP_API_testv+0x124>
    8000404c:	00007797          	auipc	a5,0x7
    80004050:	6ff7c783          	lbu	a5,1791(a5) # 8000b74b <_ZL9finishedD>
    80004054:	fc0786e3          	beqz	a5,80004020 <_Z20Threads_CPP_API_testv+0x124>
    80004058:	fc040493          	addi	s1,s0,-64
    8000405c:	0080006f          	j	80004064 <_Z20Threads_CPP_API_testv+0x168>

    }

    for (auto thread: threads) { delete thread; }
    80004060:	00848493          	addi	s1,s1,8
    80004064:	fe040793          	addi	a5,s0,-32
    80004068:	08f48663          	beq	s1,a5,800040f4 <_Z20Threads_CPP_API_testv+0x1f8>
    8000406c:	0004b503          	ld	a0,0(s1)
    80004070:	fe0508e3          	beqz	a0,80004060 <_Z20Threads_CPP_API_testv+0x164>
    80004074:	00053783          	ld	a5,0(a0)
    80004078:	0087b783          	ld	a5,8(a5)
    8000407c:	000780e7          	jalr	a5
    80004080:	fe1ff06f          	j	80004060 <_Z20Threads_CPP_API_testv+0x164>
    80004084:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004088:	00048513          	mv	a0,s1
    8000408c:	ffffe097          	auipc	ra,0xffffe
    80004090:	52c080e7          	jalr	1324(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004094:	00090513          	mv	a0,s2
    80004098:	00008097          	auipc	ra,0x8
    8000409c:	7c0080e7          	jalr	1984(ra) # 8000c858 <_Unwind_Resume>
    800040a0:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800040a4:	00048513          	mv	a0,s1
    800040a8:	ffffe097          	auipc	ra,0xffffe
    800040ac:	510080e7          	jalr	1296(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800040b0:	00090513          	mv	a0,s2
    800040b4:	00008097          	auipc	ra,0x8
    800040b8:	7a4080e7          	jalr	1956(ra) # 8000c858 <_Unwind_Resume>
    800040bc:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800040c0:	00048513          	mv	a0,s1
    800040c4:	ffffe097          	auipc	ra,0xffffe
    800040c8:	4f4080e7          	jalr	1268(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800040cc:	00090513          	mv	a0,s2
    800040d0:	00008097          	auipc	ra,0x8
    800040d4:	788080e7          	jalr	1928(ra) # 8000c858 <_Unwind_Resume>
    800040d8:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800040dc:	00048513          	mv	a0,s1
    800040e0:	ffffe097          	auipc	ra,0xffffe
    800040e4:	4d8080e7          	jalr	1240(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800040e8:	00090513          	mv	a0,s2
    800040ec:	00008097          	auipc	ra,0x8
    800040f0:	76c080e7          	jalr	1900(ra) # 8000c858 <_Unwind_Resume>
}
    800040f4:	03813083          	ld	ra,56(sp)
    800040f8:	03013403          	ld	s0,48(sp)
    800040fc:	02813483          	ld	s1,40(sp)
    80004100:	02013903          	ld	s2,32(sp)
    80004104:	04010113          	addi	sp,sp,64
    80004108:	00008067          	ret

000000008000410c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000410c:	ff010113          	addi	sp,sp,-16
    80004110:	00113423          	sd	ra,8(sp)
    80004114:	00813023          	sd	s0,0(sp)
    80004118:	01010413          	addi	s0,sp,16
    8000411c:	00007797          	auipc	a5,0x7
    80004120:	39c78793          	addi	a5,a5,924 # 8000b4b8 <_ZTV7WorkerA+0x10>
    80004124:	00f53023          	sd	a5,0(a0)
    80004128:	ffffe097          	auipc	ra,0xffffe
    8000412c:	fb0080e7          	jalr	-80(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80004130:	00813083          	ld	ra,8(sp)
    80004134:	00013403          	ld	s0,0(sp)
    80004138:	01010113          	addi	sp,sp,16
    8000413c:	00008067          	ret

0000000080004140 <_ZN7WorkerAD0Ev>:
    80004140:	fe010113          	addi	sp,sp,-32
    80004144:	00113c23          	sd	ra,24(sp)
    80004148:	00813823          	sd	s0,16(sp)
    8000414c:	00913423          	sd	s1,8(sp)
    80004150:	02010413          	addi	s0,sp,32
    80004154:	00050493          	mv	s1,a0
    80004158:	00007797          	auipc	a5,0x7
    8000415c:	36078793          	addi	a5,a5,864 # 8000b4b8 <_ZTV7WorkerA+0x10>
    80004160:	00f53023          	sd	a5,0(a0)
    80004164:	ffffe097          	auipc	ra,0xffffe
    80004168:	f74080e7          	jalr	-140(ra) # 800020d8 <_ZN6ThreadD1Ev>
    8000416c:	00048513          	mv	a0,s1
    80004170:	ffffe097          	auipc	ra,0xffffe
    80004174:	448080e7          	jalr	1096(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004178:	01813083          	ld	ra,24(sp)
    8000417c:	01013403          	ld	s0,16(sp)
    80004180:	00813483          	ld	s1,8(sp)
    80004184:	02010113          	addi	sp,sp,32
    80004188:	00008067          	ret

000000008000418c <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    8000418c:	ff010113          	addi	sp,sp,-16
    80004190:	00113423          	sd	ra,8(sp)
    80004194:	00813023          	sd	s0,0(sp)
    80004198:	01010413          	addi	s0,sp,16
    8000419c:	00007797          	auipc	a5,0x7
    800041a0:	34478793          	addi	a5,a5,836 # 8000b4e0 <_ZTV7WorkerB+0x10>
    800041a4:	00f53023          	sd	a5,0(a0)
    800041a8:	ffffe097          	auipc	ra,0xffffe
    800041ac:	f30080e7          	jalr	-208(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800041b0:	00813083          	ld	ra,8(sp)
    800041b4:	00013403          	ld	s0,0(sp)
    800041b8:	01010113          	addi	sp,sp,16
    800041bc:	00008067          	ret

00000000800041c0 <_ZN7WorkerBD0Ev>:
    800041c0:	fe010113          	addi	sp,sp,-32
    800041c4:	00113c23          	sd	ra,24(sp)
    800041c8:	00813823          	sd	s0,16(sp)
    800041cc:	00913423          	sd	s1,8(sp)
    800041d0:	02010413          	addi	s0,sp,32
    800041d4:	00050493          	mv	s1,a0
    800041d8:	00007797          	auipc	a5,0x7
    800041dc:	30878793          	addi	a5,a5,776 # 8000b4e0 <_ZTV7WorkerB+0x10>
    800041e0:	00f53023          	sd	a5,0(a0)
    800041e4:	ffffe097          	auipc	ra,0xffffe
    800041e8:	ef4080e7          	jalr	-268(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800041ec:	00048513          	mv	a0,s1
    800041f0:	ffffe097          	auipc	ra,0xffffe
    800041f4:	3c8080e7          	jalr	968(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800041f8:	01813083          	ld	ra,24(sp)
    800041fc:	01013403          	ld	s0,16(sp)
    80004200:	00813483          	ld	s1,8(sp)
    80004204:	02010113          	addi	sp,sp,32
    80004208:	00008067          	ret

000000008000420c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000420c:	ff010113          	addi	sp,sp,-16
    80004210:	00113423          	sd	ra,8(sp)
    80004214:	00813023          	sd	s0,0(sp)
    80004218:	01010413          	addi	s0,sp,16
    8000421c:	00007797          	auipc	a5,0x7
    80004220:	2ec78793          	addi	a5,a5,748 # 8000b508 <_ZTV7WorkerC+0x10>
    80004224:	00f53023          	sd	a5,0(a0)
    80004228:	ffffe097          	auipc	ra,0xffffe
    8000422c:	eb0080e7          	jalr	-336(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80004230:	00813083          	ld	ra,8(sp)
    80004234:	00013403          	ld	s0,0(sp)
    80004238:	01010113          	addi	sp,sp,16
    8000423c:	00008067          	ret

0000000080004240 <_ZN7WorkerCD0Ev>:
    80004240:	fe010113          	addi	sp,sp,-32
    80004244:	00113c23          	sd	ra,24(sp)
    80004248:	00813823          	sd	s0,16(sp)
    8000424c:	00913423          	sd	s1,8(sp)
    80004250:	02010413          	addi	s0,sp,32
    80004254:	00050493          	mv	s1,a0
    80004258:	00007797          	auipc	a5,0x7
    8000425c:	2b078793          	addi	a5,a5,688 # 8000b508 <_ZTV7WorkerC+0x10>
    80004260:	00f53023          	sd	a5,0(a0)
    80004264:	ffffe097          	auipc	ra,0xffffe
    80004268:	e74080e7          	jalr	-396(ra) # 800020d8 <_ZN6ThreadD1Ev>
    8000426c:	00048513          	mv	a0,s1
    80004270:	ffffe097          	auipc	ra,0xffffe
    80004274:	348080e7          	jalr	840(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004278:	01813083          	ld	ra,24(sp)
    8000427c:	01013403          	ld	s0,16(sp)
    80004280:	00813483          	ld	s1,8(sp)
    80004284:	02010113          	addi	sp,sp,32
    80004288:	00008067          	ret

000000008000428c <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    8000428c:	ff010113          	addi	sp,sp,-16
    80004290:	00113423          	sd	ra,8(sp)
    80004294:	00813023          	sd	s0,0(sp)
    80004298:	01010413          	addi	s0,sp,16
    8000429c:	00007797          	auipc	a5,0x7
    800042a0:	29478793          	addi	a5,a5,660 # 8000b530 <_ZTV7WorkerD+0x10>
    800042a4:	00f53023          	sd	a5,0(a0)
    800042a8:	ffffe097          	auipc	ra,0xffffe
    800042ac:	e30080e7          	jalr	-464(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800042b0:	00813083          	ld	ra,8(sp)
    800042b4:	00013403          	ld	s0,0(sp)
    800042b8:	01010113          	addi	sp,sp,16
    800042bc:	00008067          	ret

00000000800042c0 <_ZN7WorkerDD0Ev>:
    800042c0:	fe010113          	addi	sp,sp,-32
    800042c4:	00113c23          	sd	ra,24(sp)
    800042c8:	00813823          	sd	s0,16(sp)
    800042cc:	00913423          	sd	s1,8(sp)
    800042d0:	02010413          	addi	s0,sp,32
    800042d4:	00050493          	mv	s1,a0
    800042d8:	00007797          	auipc	a5,0x7
    800042dc:	25878793          	addi	a5,a5,600 # 8000b530 <_ZTV7WorkerD+0x10>
    800042e0:	00f53023          	sd	a5,0(a0)
    800042e4:	ffffe097          	auipc	ra,0xffffe
    800042e8:	df4080e7          	jalr	-524(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800042ec:	00048513          	mv	a0,s1
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	2c8080e7          	jalr	712(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800042f8:	01813083          	ld	ra,24(sp)
    800042fc:	01013403          	ld	s0,16(sp)
    80004300:	00813483          	ld	s1,8(sp)
    80004304:	02010113          	addi	sp,sp,32
    80004308:	00008067          	ret

000000008000430c <_ZN7WorkerA3runEv>:
    void run() override {
    8000430c:	ff010113          	addi	sp,sp,-16
    80004310:	00113423          	sd	ra,8(sp)
    80004314:	00813023          	sd	s0,0(sp)
    80004318:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000431c:	00000593          	li	a1,0
    80004320:	fffff097          	auipc	ra,0xfffff
    80004324:	784080e7          	jalr	1924(ra) # 80003aa4 <_ZN7WorkerA11workerBodyAEPv>
    }
    80004328:	00813083          	ld	ra,8(sp)
    8000432c:	00013403          	ld	s0,0(sp)
    80004330:	01010113          	addi	sp,sp,16
    80004334:	00008067          	ret

0000000080004338 <_ZN7WorkerB3runEv>:
    void run() override {
    80004338:	ff010113          	addi	sp,sp,-16
    8000433c:	00113423          	sd	ra,8(sp)
    80004340:	00813023          	sd	s0,0(sp)
    80004344:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80004348:	00000593          	li	a1,0
    8000434c:	00000097          	auipc	ra,0x0
    80004350:	81c080e7          	jalr	-2020(ra) # 80003b68 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004354:	00813083          	ld	ra,8(sp)
    80004358:	00013403          	ld	s0,0(sp)
    8000435c:	01010113          	addi	sp,sp,16
    80004360:	00008067          	ret

0000000080004364 <_ZN7WorkerC3runEv>:
    void run() override {
    80004364:	ff010113          	addi	sp,sp,-16
    80004368:	00113423          	sd	ra,8(sp)
    8000436c:	00813023          	sd	s0,0(sp)
    80004370:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80004374:	00000593          	li	a1,0
    80004378:	00000097          	auipc	ra,0x0
    8000437c:	8bc080e7          	jalr	-1860(ra) # 80003c34 <_ZN7WorkerC11workerBodyCEPv>
    }
    80004380:	00813083          	ld	ra,8(sp)
    80004384:	00013403          	ld	s0,0(sp)
    80004388:	01010113          	addi	sp,sp,16
    8000438c:	00008067          	ret

0000000080004390 <_ZN7WorkerD3runEv>:
    void run() override {
    80004390:	ff010113          	addi	sp,sp,-16
    80004394:	00113423          	sd	ra,8(sp)
    80004398:	00813023          	sd	s0,0(sp)
    8000439c:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800043a0:	00000593          	li	a1,0
    800043a4:	00000097          	auipc	ra,0x0
    800043a8:	a10080e7          	jalr	-1520(ra) # 80003db4 <_ZN7WorkerD11workerBodyDEPv>
    }
    800043ac:	00813083          	ld	ra,8(sp)
    800043b0:	00013403          	ld	s0,0(sp)
    800043b4:	01010113          	addi	sp,sp,16
    800043b8:	00008067          	ret

00000000800043bc <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800043bc:	f8010113          	addi	sp,sp,-128
    800043c0:	06113c23          	sd	ra,120(sp)
    800043c4:	06813823          	sd	s0,112(sp)
    800043c8:	06913423          	sd	s1,104(sp)
    800043cc:	07213023          	sd	s2,96(sp)
    800043d0:	05313c23          	sd	s3,88(sp)
    800043d4:	05413823          	sd	s4,80(sp)
    800043d8:	05513423          	sd	s5,72(sp)
    800043dc:	05613023          	sd	s6,64(sp)
    800043e0:	03713c23          	sd	s7,56(sp)
    800043e4:	03813823          	sd	s8,48(sp)
    800043e8:	03913423          	sd	s9,40(sp)
    800043ec:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800043f0:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800043f4:	00005517          	auipc	a0,0x5
    800043f8:	cc450513          	addi	a0,a0,-828 # 800090b8 <CONSOLE_STATUS+0xa8>
    800043fc:	00001097          	auipc	ra,0x1
    80004400:	578080e7          	jalr	1400(ra) # 80005974 <_Z11printStringPKc>
    getString(input, 30);
    80004404:	01e00593          	li	a1,30
    80004408:	f8040493          	addi	s1,s0,-128
    8000440c:	00048513          	mv	a0,s1
    80004410:	00001097          	auipc	ra,0x1
    80004414:	5ec080e7          	jalr	1516(ra) # 800059fc <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004418:	00048513          	mv	a0,s1
    8000441c:	00001097          	auipc	ra,0x1
    80004420:	6b8080e7          	jalr	1720(ra) # 80005ad4 <_Z11stringToIntPKc>
    80004424:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80004428:	00005517          	auipc	a0,0x5
    8000442c:	cb050513          	addi	a0,a0,-848 # 800090d8 <CONSOLE_STATUS+0xc8>
    80004430:	00001097          	auipc	ra,0x1
    80004434:	544080e7          	jalr	1348(ra) # 80005974 <_Z11printStringPKc>
    getString(input, 30);
    80004438:	01e00593          	li	a1,30
    8000443c:	00048513          	mv	a0,s1
    80004440:	00001097          	auipc	ra,0x1
    80004444:	5bc080e7          	jalr	1468(ra) # 800059fc <_Z9getStringPci>
    n = stringToInt(input);
    80004448:	00048513          	mv	a0,s1
    8000444c:	00001097          	auipc	ra,0x1
    80004450:	688080e7          	jalr	1672(ra) # 80005ad4 <_Z11stringToIntPKc>
    80004454:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80004458:	00005517          	auipc	a0,0x5
    8000445c:	ca050513          	addi	a0,a0,-864 # 800090f8 <CONSOLE_STATUS+0xe8>
    80004460:	00001097          	auipc	ra,0x1
    80004464:	514080e7          	jalr	1300(ra) # 80005974 <_Z11printStringPKc>
    printInt(threadNum);
    80004468:	00000613          	li	a2,0
    8000446c:	00a00593          	li	a1,10
    80004470:	00098513          	mv	a0,s3
    80004474:	00001097          	auipc	ra,0x1
    80004478:	6b0080e7          	jalr	1712(ra) # 80005b24 <_Z8printIntiii>
    printString(" i velicina bafera ");
    8000447c:	00005517          	auipc	a0,0x5
    80004480:	c9450513          	addi	a0,a0,-876 # 80009110 <CONSOLE_STATUS+0x100>
    80004484:	00001097          	auipc	ra,0x1
    80004488:	4f0080e7          	jalr	1264(ra) # 80005974 <_Z11printStringPKc>
    printInt(n);
    8000448c:	00000613          	li	a2,0
    80004490:	00a00593          	li	a1,10
    80004494:	00048513          	mv	a0,s1
    80004498:	00001097          	auipc	ra,0x1
    8000449c:	68c080e7          	jalr	1676(ra) # 80005b24 <_Z8printIntiii>
    printString(".\n");
    800044a0:	00005517          	auipc	a0,0x5
    800044a4:	c8850513          	addi	a0,a0,-888 # 80009128 <CONSOLE_STATUS+0x118>
    800044a8:	00001097          	auipc	ra,0x1
    800044ac:	4cc080e7          	jalr	1228(ra) # 80005974 <_Z11printStringPKc>
    if (threadNum > n) {
    800044b0:	0334c463          	blt	s1,s3,800044d8 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800044b4:	03305c63          	blez	s3,800044ec <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800044b8:	03800513          	li	a0,56
    800044bc:	ffffe097          	auipc	ra,0xffffe
    800044c0:	68c080e7          	jalr	1676(ra) # 80002b48 <_Znwm>
    800044c4:	00050a93          	mv	s5,a0
    800044c8:	00048593          	mv	a1,s1
    800044cc:	00001097          	auipc	ra,0x1
    800044d0:	778080e7          	jalr	1912(ra) # 80005c44 <_ZN9BufferCPPC1Ei>
    800044d4:	0300006f          	j	80004504 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800044d8:	00005517          	auipc	a0,0x5
    800044dc:	c5850513          	addi	a0,a0,-936 # 80009130 <CONSOLE_STATUS+0x120>
    800044e0:	00001097          	auipc	ra,0x1
    800044e4:	494080e7          	jalr	1172(ra) # 80005974 <_Z11printStringPKc>
        return;
    800044e8:	0140006f          	j	800044fc <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800044ec:	00005517          	auipc	a0,0x5
    800044f0:	c8450513          	addi	a0,a0,-892 # 80009170 <CONSOLE_STATUS+0x160>
    800044f4:	00001097          	auipc	ra,0x1
    800044f8:	480080e7          	jalr	1152(ra) # 80005974 <_Z11printStringPKc>
        return;
    800044fc:	000c0113          	mv	sp,s8
    80004500:	2140006f          	j	80004714 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004504:	02000513          	li	a0,32
    80004508:	ffffd097          	auipc	ra,0xffffd
    8000450c:	588080e7          	jalr	1416(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80004510:	00050913          	mv	s2,a0
    80004514:	00000593          	li	a1,0
    80004518:	ffffd097          	auipc	ra,0xffffd
    8000451c:	50c080e7          	jalr	1292(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    80004520:	00007797          	auipc	a5,0x7
    80004524:	2327bc23          	sd	s2,568(a5) # 8000b758 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80004528:	00399793          	slli	a5,s3,0x3
    8000452c:	00f78793          	addi	a5,a5,15
    80004530:	ff07f793          	andi	a5,a5,-16
    80004534:	40f10133          	sub	sp,sp,a5
    80004538:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    8000453c:	0019871b          	addiw	a4,s3,1
    80004540:	00171793          	slli	a5,a4,0x1
    80004544:	00e787b3          	add	a5,a5,a4
    80004548:	00379793          	slli	a5,a5,0x3
    8000454c:	00f78793          	addi	a5,a5,15
    80004550:	ff07f793          	andi	a5,a5,-16
    80004554:	40f10133          	sub	sp,sp,a5
    80004558:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    8000455c:	00199493          	slli	s1,s3,0x1
    80004560:	013484b3          	add	s1,s1,s3
    80004564:	00349493          	slli	s1,s1,0x3
    80004568:	009b04b3          	add	s1,s6,s1
    8000456c:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80004570:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80004574:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004578:	09000513          	li	a0,144
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	eec080e7          	jalr	-276(ra) # 80002468 <_ZN6ThreadnwEm>
    80004584:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80004588:	ffffe097          	auipc	ra,0xffffe
    8000458c:	bf4080e7          	jalr	-1036(ra) # 8000217c <_ZN6ThreadC1Ev>
    80004590:	00007797          	auipc	a5,0x7
    80004594:	01878793          	addi	a5,a5,24 # 8000b5a8 <_ZTV8Consumer+0x10>
    80004598:	00fbb023          	sd	a5,0(s7)
    8000459c:	089bb423          	sd	s1,136(s7)
    consumer->start();
    800045a0:	000b8513          	mv	a0,s7
    800045a4:	ffffe097          	auipc	ra,0xffffe
    800045a8:	0ac080e7          	jalr	172(ra) # 80002650 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800045ac:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800045b0:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800045b4:	00007797          	auipc	a5,0x7
    800045b8:	1a47b783          	ld	a5,420(a5) # 8000b758 <_ZL10waitForAll>
    800045bc:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800045c0:	09000513          	li	a0,144
    800045c4:	ffffe097          	auipc	ra,0xffffe
    800045c8:	ea4080e7          	jalr	-348(ra) # 80002468 <_ZN6ThreadnwEm>
    800045cc:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    800045d0:	ffffe097          	auipc	ra,0xffffe
    800045d4:	bac080e7          	jalr	-1108(ra) # 8000217c <_ZN6ThreadC1Ev>
    800045d8:	00007797          	auipc	a5,0x7
    800045dc:	f8078793          	addi	a5,a5,-128 # 8000b558 <_ZTV16ProducerKeyborad+0x10>
    800045e0:	00f4b023          	sd	a5,0(s1)
    800045e4:	0964b423          	sd	s6,136(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800045e8:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    800045ec:	00048513          	mv	a0,s1
    800045f0:	ffffe097          	auipc	ra,0xffffe
    800045f4:	060080e7          	jalr	96(ra) # 80002650 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    800045f8:	00100913          	li	s2,1
    800045fc:	0300006f          	j	8000462c <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004600:	00007797          	auipc	a5,0x7
    80004604:	f8078793          	addi	a5,a5,-128 # 8000b580 <_ZTV8Producer+0x10>
    80004608:	00fcb023          	sd	a5,0(s9)
    8000460c:	089cb423          	sd	s1,136(s9)
        producers[i] = new Producer(&threadData[i]);
    80004610:	00391793          	slli	a5,s2,0x3
    80004614:	00fa07b3          	add	a5,s4,a5
    80004618:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    8000461c:	000c8513          	mv	a0,s9
    80004620:	ffffe097          	auipc	ra,0xffffe
    80004624:	030080e7          	jalr	48(ra) # 80002650 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004628:	0019091b          	addiw	s2,s2,1
    8000462c:	05395263          	bge	s2,s3,80004670 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004630:	00191493          	slli	s1,s2,0x1
    80004634:	012484b3          	add	s1,s1,s2
    80004638:	00349493          	slli	s1,s1,0x3
    8000463c:	009b04b3          	add	s1,s6,s1
    80004640:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004644:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80004648:	00007797          	auipc	a5,0x7
    8000464c:	1107b783          	ld	a5,272(a5) # 8000b758 <_ZL10waitForAll>
    80004650:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004654:	09000513          	li	a0,144
    80004658:	ffffe097          	auipc	ra,0xffffe
    8000465c:	e10080e7          	jalr	-496(ra) # 80002468 <_ZN6ThreadnwEm>
    80004660:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004664:	ffffe097          	auipc	ra,0xffffe
    80004668:	b18080e7          	jalr	-1256(ra) # 8000217c <_ZN6ThreadC1Ev>
    8000466c:	f95ff06f          	j	80004600 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80004670:	ffffe097          	auipc	ra,0xffffe
    80004674:	fb8080e7          	jalr	-72(ra) # 80002628 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004678:	00000493          	li	s1,0
    8000467c:	0099ce63          	blt	s3,s1,80004698 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80004680:	00007517          	auipc	a0,0x7
    80004684:	0d853503          	ld	a0,216(a0) # 8000b758 <_ZL10waitForAll>
    80004688:	ffffd097          	auipc	ra,0xffffd
    8000468c:	74c080e7          	jalr	1868(ra) # 80001dd4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004690:	0014849b          	addiw	s1,s1,1
    80004694:	fe9ff06f          	j	8000467c <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80004698:	00007517          	auipc	a0,0x7
    8000469c:	0c053503          	ld	a0,192(a0) # 8000b758 <_ZL10waitForAll>
    800046a0:	00050863          	beqz	a0,800046b0 <_Z20testConsumerProducerv+0x2f4>
    800046a4:	00053783          	ld	a5,0(a0)
    800046a8:	0087b783          	ld	a5,8(a5)
    800046ac:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800046b0:	00000493          	li	s1,0
    800046b4:	0080006f          	j	800046bc <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800046b8:	0014849b          	addiw	s1,s1,1
    800046bc:	0334d263          	bge	s1,s3,800046e0 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800046c0:	00349793          	slli	a5,s1,0x3
    800046c4:	00fa07b3          	add	a5,s4,a5
    800046c8:	0007b503          	ld	a0,0(a5)
    800046cc:	fe0506e3          	beqz	a0,800046b8 <_Z20testConsumerProducerv+0x2fc>
    800046d0:	00053783          	ld	a5,0(a0)
    800046d4:	0087b783          	ld	a5,8(a5)
    800046d8:	000780e7          	jalr	a5
    800046dc:	fddff06f          	j	800046b8 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    800046e0:	000b8a63          	beqz	s7,800046f4 <_Z20testConsumerProducerv+0x338>
    800046e4:	000bb783          	ld	a5,0(s7)
    800046e8:	0087b783          	ld	a5,8(a5)
    800046ec:	000b8513          	mv	a0,s7
    800046f0:	000780e7          	jalr	a5
    delete buffer;
    800046f4:	000a8e63          	beqz	s5,80004710 <_Z20testConsumerProducerv+0x354>
    800046f8:	000a8513          	mv	a0,s5
    800046fc:	00002097          	auipc	ra,0x2
    80004700:	840080e7          	jalr	-1984(ra) # 80005f3c <_ZN9BufferCPPD1Ev>
    80004704:	000a8513          	mv	a0,s5
    80004708:	ffffe097          	auipc	ra,0xffffe
    8000470c:	490080e7          	jalr	1168(ra) # 80002b98 <_ZdlPv>
    80004710:	000c0113          	mv	sp,s8
}
    80004714:	f8040113          	addi	sp,s0,-128
    80004718:	07813083          	ld	ra,120(sp)
    8000471c:	07013403          	ld	s0,112(sp)
    80004720:	06813483          	ld	s1,104(sp)
    80004724:	06013903          	ld	s2,96(sp)
    80004728:	05813983          	ld	s3,88(sp)
    8000472c:	05013a03          	ld	s4,80(sp)
    80004730:	04813a83          	ld	s5,72(sp)
    80004734:	04013b03          	ld	s6,64(sp)
    80004738:	03813b83          	ld	s7,56(sp)
    8000473c:	03013c03          	ld	s8,48(sp)
    80004740:	02813c83          	ld	s9,40(sp)
    80004744:	08010113          	addi	sp,sp,128
    80004748:	00008067          	ret
    8000474c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004750:	000a8513          	mv	a0,s5
    80004754:	ffffe097          	auipc	ra,0xffffe
    80004758:	444080e7          	jalr	1092(ra) # 80002b98 <_ZdlPv>
    8000475c:	00048513          	mv	a0,s1
    80004760:	00008097          	auipc	ra,0x8
    80004764:	0f8080e7          	jalr	248(ra) # 8000c858 <_Unwind_Resume>
    80004768:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    8000476c:	00090513          	mv	a0,s2
    80004770:	ffffd097          	auipc	ra,0xffffd
    80004774:	358080e7          	jalr	856(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80004778:	00048513          	mv	a0,s1
    8000477c:	00008097          	auipc	ra,0x8
    80004780:	0dc080e7          	jalr	220(ra) # 8000c858 <_Unwind_Resume>
    80004784:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004788:	000b8513          	mv	a0,s7
    8000478c:	ffffe097          	auipc	ra,0xffffe
    80004790:	e2c080e7          	jalr	-468(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004794:	00048513          	mv	a0,s1
    80004798:	00008097          	auipc	ra,0x8
    8000479c:	0c0080e7          	jalr	192(ra) # 8000c858 <_Unwind_Resume>
    800047a0:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800047a4:	00048513          	mv	a0,s1
    800047a8:	ffffe097          	auipc	ra,0xffffe
    800047ac:	e10080e7          	jalr	-496(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800047b0:	00090513          	mv	a0,s2
    800047b4:	00008097          	auipc	ra,0x8
    800047b8:	0a4080e7          	jalr	164(ra) # 8000c858 <_Unwind_Resume>
    800047bc:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    800047c0:	000c8513          	mv	a0,s9
    800047c4:	ffffe097          	auipc	ra,0xffffe
    800047c8:	df4080e7          	jalr	-524(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800047cc:	00048513          	mv	a0,s1
    800047d0:	00008097          	auipc	ra,0x8
    800047d4:	088080e7          	jalr	136(ra) # 8000c858 <_Unwind_Resume>

00000000800047d8 <_ZN8Consumer3runEv>:
    void run() override {
    800047d8:	fd010113          	addi	sp,sp,-48
    800047dc:	02113423          	sd	ra,40(sp)
    800047e0:	02813023          	sd	s0,32(sp)
    800047e4:	00913c23          	sd	s1,24(sp)
    800047e8:	01213823          	sd	s2,16(sp)
    800047ec:	01313423          	sd	s3,8(sp)
    800047f0:	03010413          	addi	s0,sp,48
    800047f4:	00050913          	mv	s2,a0
        int i = 0;
    800047f8:	00000993          	li	s3,0
    800047fc:	0100006f          	j	8000480c <_ZN8Consumer3runEv+0x34>
#include "../lib/console.h"

class Console {
public:
    static void putc(char chr) {
        __putc(chr);   // poziva funkciju iz console.h
    80004800:	00a00513          	li	a0,10
    80004804:	00004097          	auipc	ra,0x4
    80004808:	248080e7          	jalr	584(ra) # 80008a4c <__putc>
        while (!threadEnd) {
    8000480c:	00007797          	auipc	a5,0x7
    80004810:	f447a783          	lw	a5,-188(a5) # 8000b750 <_ZL9threadEnd>
    80004814:	04079a63          	bnez	a5,80004868 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004818:	08893783          	ld	a5,136(s2)
    8000481c:	0087b503          	ld	a0,8(a5)
    80004820:	00001097          	auipc	ra,0x1
    80004824:	608080e7          	jalr	1544(ra) # 80005e28 <_ZN9BufferCPP3getEv>
            i++;
    80004828:	0019849b          	addiw	s1,s3,1
    8000482c:	0004899b          	sext.w	s3,s1
    80004830:	0ff57513          	andi	a0,a0,255
    80004834:	00004097          	auipc	ra,0x4
    80004838:	218080e7          	jalr	536(ra) # 80008a4c <__putc>
            if (i % 80 == 0) {
    8000483c:	05000793          	li	a5,80
    80004840:	02f4e4bb          	remw	s1,s1,a5
    80004844:	fc0494e3          	bnez	s1,8000480c <_ZN8Consumer3runEv+0x34>
    80004848:	fb9ff06f          	j	80004800 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    8000484c:	08893783          	ld	a5,136(s2)
    80004850:	0087b503          	ld	a0,8(a5)
    80004854:	00001097          	auipc	ra,0x1
    80004858:	5d4080e7          	jalr	1492(ra) # 80005e28 <_ZN9BufferCPP3getEv>
    8000485c:	0ff57513          	andi	a0,a0,255
    80004860:	00004097          	auipc	ra,0x4
    80004864:	1ec080e7          	jalr	492(ra) # 80008a4c <__putc>
        while (td->buffer->getCnt() > 0) {
    80004868:	08893783          	ld	a5,136(s2)
    8000486c:	0087b503          	ld	a0,8(a5)
    80004870:	00001097          	auipc	ra,0x1
    80004874:	644080e7          	jalr	1604(ra) # 80005eb4 <_ZN9BufferCPP6getCntEv>
    80004878:	fca04ae3          	bgtz	a0,8000484c <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    8000487c:	08893783          	ld	a5,136(s2)
    80004880:	0107b503          	ld	a0,16(a5)
    80004884:	ffffd097          	auipc	ra,0xffffd
    80004888:	638080e7          	jalr	1592(ra) # 80001ebc <_ZN9Semaphore6signalEv>
    }
    8000488c:	02813083          	ld	ra,40(sp)
    80004890:	02013403          	ld	s0,32(sp)
    80004894:	01813483          	ld	s1,24(sp)
    80004898:	01013903          	ld	s2,16(sp)
    8000489c:	00813983          	ld	s3,8(sp)
    800048a0:	03010113          	addi	sp,sp,48
    800048a4:	00008067          	ret

00000000800048a8 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800048a8:	ff010113          	addi	sp,sp,-16
    800048ac:	00113423          	sd	ra,8(sp)
    800048b0:	00813023          	sd	s0,0(sp)
    800048b4:	01010413          	addi	s0,sp,16
    800048b8:	00007797          	auipc	a5,0x7
    800048bc:	cf078793          	addi	a5,a5,-784 # 8000b5a8 <_ZTV8Consumer+0x10>
    800048c0:	00f53023          	sd	a5,0(a0)
    800048c4:	ffffe097          	auipc	ra,0xffffe
    800048c8:	814080e7          	jalr	-2028(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800048cc:	00813083          	ld	ra,8(sp)
    800048d0:	00013403          	ld	s0,0(sp)
    800048d4:	01010113          	addi	sp,sp,16
    800048d8:	00008067          	ret

00000000800048dc <_ZN8ConsumerD0Ev>:
    800048dc:	fe010113          	addi	sp,sp,-32
    800048e0:	00113c23          	sd	ra,24(sp)
    800048e4:	00813823          	sd	s0,16(sp)
    800048e8:	00913423          	sd	s1,8(sp)
    800048ec:	02010413          	addi	s0,sp,32
    800048f0:	00050493          	mv	s1,a0
    800048f4:	00007797          	auipc	a5,0x7
    800048f8:	cb478793          	addi	a5,a5,-844 # 8000b5a8 <_ZTV8Consumer+0x10>
    800048fc:	00f53023          	sd	a5,0(a0)
    80004900:	ffffd097          	auipc	ra,0xffffd
    80004904:	7d8080e7          	jalr	2008(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80004908:	00048513          	mv	a0,s1
    8000490c:	ffffe097          	auipc	ra,0xffffe
    80004910:	cac080e7          	jalr	-852(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004914:	01813083          	ld	ra,24(sp)
    80004918:	01013403          	ld	s0,16(sp)
    8000491c:	00813483          	ld	s1,8(sp)
    80004920:	02010113          	addi	sp,sp,32
    80004924:	00008067          	ret

0000000080004928 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004928:	ff010113          	addi	sp,sp,-16
    8000492c:	00113423          	sd	ra,8(sp)
    80004930:	00813023          	sd	s0,0(sp)
    80004934:	01010413          	addi	s0,sp,16
    80004938:	00007797          	auipc	a5,0x7
    8000493c:	c2078793          	addi	a5,a5,-992 # 8000b558 <_ZTV16ProducerKeyborad+0x10>
    80004940:	00f53023          	sd	a5,0(a0)
    80004944:	ffffd097          	auipc	ra,0xffffd
    80004948:	794080e7          	jalr	1940(ra) # 800020d8 <_ZN6ThreadD1Ev>
    8000494c:	00813083          	ld	ra,8(sp)
    80004950:	00013403          	ld	s0,0(sp)
    80004954:	01010113          	addi	sp,sp,16
    80004958:	00008067          	ret

000000008000495c <_ZN16ProducerKeyboradD0Ev>:
    8000495c:	fe010113          	addi	sp,sp,-32
    80004960:	00113c23          	sd	ra,24(sp)
    80004964:	00813823          	sd	s0,16(sp)
    80004968:	00913423          	sd	s1,8(sp)
    8000496c:	02010413          	addi	s0,sp,32
    80004970:	00050493          	mv	s1,a0
    80004974:	00007797          	auipc	a5,0x7
    80004978:	be478793          	addi	a5,a5,-1052 # 8000b558 <_ZTV16ProducerKeyborad+0x10>
    8000497c:	00f53023          	sd	a5,0(a0)
    80004980:	ffffd097          	auipc	ra,0xffffd
    80004984:	758080e7          	jalr	1880(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80004988:	00048513          	mv	a0,s1
    8000498c:	ffffe097          	auipc	ra,0xffffe
    80004990:	c2c080e7          	jalr	-980(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004994:	01813083          	ld	ra,24(sp)
    80004998:	01013403          	ld	s0,16(sp)
    8000499c:	00813483          	ld	s1,8(sp)
    800049a0:	02010113          	addi	sp,sp,32
    800049a4:	00008067          	ret

00000000800049a8 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800049a8:	ff010113          	addi	sp,sp,-16
    800049ac:	00113423          	sd	ra,8(sp)
    800049b0:	00813023          	sd	s0,0(sp)
    800049b4:	01010413          	addi	s0,sp,16
    800049b8:	00007797          	auipc	a5,0x7
    800049bc:	bc878793          	addi	a5,a5,-1080 # 8000b580 <_ZTV8Producer+0x10>
    800049c0:	00f53023          	sd	a5,0(a0)
    800049c4:	ffffd097          	auipc	ra,0xffffd
    800049c8:	714080e7          	jalr	1812(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800049cc:	00813083          	ld	ra,8(sp)
    800049d0:	00013403          	ld	s0,0(sp)
    800049d4:	01010113          	addi	sp,sp,16
    800049d8:	00008067          	ret

00000000800049dc <_ZN8ProducerD0Ev>:
    800049dc:	fe010113          	addi	sp,sp,-32
    800049e0:	00113c23          	sd	ra,24(sp)
    800049e4:	00813823          	sd	s0,16(sp)
    800049e8:	00913423          	sd	s1,8(sp)
    800049ec:	02010413          	addi	s0,sp,32
    800049f0:	00050493          	mv	s1,a0
    800049f4:	00007797          	auipc	a5,0x7
    800049f8:	b8c78793          	addi	a5,a5,-1140 # 8000b580 <_ZTV8Producer+0x10>
    800049fc:	00f53023          	sd	a5,0(a0)
    80004a00:	ffffd097          	auipc	ra,0xffffd
    80004a04:	6d8080e7          	jalr	1752(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80004a08:	00048513          	mv	a0,s1
    80004a0c:	ffffe097          	auipc	ra,0xffffe
    80004a10:	bac080e7          	jalr	-1108(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80004a14:	01813083          	ld	ra,24(sp)
    80004a18:	01013403          	ld	s0,16(sp)
    80004a1c:	00813483          	ld	s1,8(sp)
    80004a20:	02010113          	addi	sp,sp,32
    80004a24:	00008067          	ret

0000000080004a28 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004a28:	fe010113          	addi	sp,sp,-32
    80004a2c:	00113c23          	sd	ra,24(sp)
    80004a30:	00813823          	sd	s0,16(sp)
    80004a34:	00913423          	sd	s1,8(sp)
    80004a38:	02010413          	addi	s0,sp,32
    80004a3c:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004a40:	ffffd097          	auipc	ra,0xffffd
    80004a44:	e08080e7          	jalr	-504(ra) # 80001848 <getc>
    80004a48:	0005059b          	sext.w	a1,a0
    80004a4c:	01b00793          	li	a5,27
    80004a50:	00f58c63          	beq	a1,a5,80004a68 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004a54:	0884b783          	ld	a5,136(s1)
    80004a58:	0087b503          	ld	a0,8(a5)
    80004a5c:	00001097          	auipc	ra,0x1
    80004a60:	33c080e7          	jalr	828(ra) # 80005d98 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004a64:	fddff06f          	j	80004a40 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004a68:	00100793          	li	a5,1
    80004a6c:	00007717          	auipc	a4,0x7
    80004a70:	cef72223          	sw	a5,-796(a4) # 8000b750 <_ZL9threadEnd>
        td->buffer->put('!');
    80004a74:	0884b783          	ld	a5,136(s1)
    80004a78:	02100593          	li	a1,33
    80004a7c:	0087b503          	ld	a0,8(a5)
    80004a80:	00001097          	auipc	ra,0x1
    80004a84:	318080e7          	jalr	792(ra) # 80005d98 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004a88:	0884b783          	ld	a5,136(s1)
    80004a8c:	0107b503          	ld	a0,16(a5)
    80004a90:	ffffd097          	auipc	ra,0xffffd
    80004a94:	42c080e7          	jalr	1068(ra) # 80001ebc <_ZN9Semaphore6signalEv>
    }
    80004a98:	01813083          	ld	ra,24(sp)
    80004a9c:	01013403          	ld	s0,16(sp)
    80004aa0:	00813483          	ld	s1,8(sp)
    80004aa4:	02010113          	addi	sp,sp,32
    80004aa8:	00008067          	ret

0000000080004aac <_ZN8Producer3runEv>:
    void run() override {
    80004aac:	fe010113          	addi	sp,sp,-32
    80004ab0:	00113c23          	sd	ra,24(sp)
    80004ab4:	00813823          	sd	s0,16(sp)
    80004ab8:	00913423          	sd	s1,8(sp)
    80004abc:	02010413          	addi	s0,sp,32
    80004ac0:	00050493          	mv	s1,a0
        while (!threadEnd) {
    80004ac4:	00007797          	auipc	a5,0x7
    80004ac8:	c8c7a783          	lw	a5,-884(a5) # 8000b750 <_ZL9threadEnd>
    80004acc:	02079063          	bnez	a5,80004aec <_ZN8Producer3runEv+0x40>
            td->buffer->put(td->id + '0');
    80004ad0:	0884b783          	ld	a5,136(s1)
    80004ad4:	0007a583          	lw	a1,0(a5)
    80004ad8:	0305859b          	addiw	a1,a1,48
    80004adc:	0087b503          	ld	a0,8(a5)
    80004ae0:	00001097          	auipc	ra,0x1
    80004ae4:	2b8080e7          	jalr	696(ra) # 80005d98 <_ZN9BufferCPP3putEi>
        while (!threadEnd) {
    80004ae8:	fddff06f          	j	80004ac4 <_ZN8Producer3runEv+0x18>
        td->sem->signal();
    80004aec:	0884b783          	ld	a5,136(s1)
    80004af0:	0107b503          	ld	a0,16(a5)
    80004af4:	ffffd097          	auipc	ra,0xffffd
    80004af8:	3c8080e7          	jalr	968(ra) # 80001ebc <_ZN9Semaphore6signalEv>
    }
    80004afc:	01813083          	ld	ra,24(sp)
    80004b00:	01013403          	ld	s0,16(sp)
    80004b04:	00813483          	ld	s1,8(sp)
    80004b08:	02010113          	addi	sp,sp,32
    80004b0c:	00008067          	ret

0000000080004b10 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004b10:	fe010113          	addi	sp,sp,-32
    80004b14:	00113c23          	sd	ra,24(sp)
    80004b18:	00813823          	sd	s0,16(sp)
    80004b1c:	00913423          	sd	s1,8(sp)
    80004b20:	01213023          	sd	s2,0(sp)
    80004b24:	02010413          	addi	s0,sp,32
    80004b28:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004b2c:	00100793          	li	a5,1
    80004b30:	02a7f863          	bgeu	a5,a0,80004b60 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004b34:	00a00793          	li	a5,10
    80004b38:	02f577b3          	remu	a5,a0,a5
    80004b3c:	02078e63          	beqz	a5,80004b78 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004b40:	fff48513          	addi	a0,s1,-1
    80004b44:	00000097          	auipc	ra,0x0
    80004b48:	fcc080e7          	jalr	-52(ra) # 80004b10 <_ZL9fibonaccim>
    80004b4c:	00050913          	mv	s2,a0
    80004b50:	ffe48513          	addi	a0,s1,-2
    80004b54:	00000097          	auipc	ra,0x0
    80004b58:	fbc080e7          	jalr	-68(ra) # 80004b10 <_ZL9fibonaccim>
    80004b5c:	00a90533          	add	a0,s2,a0
}
    80004b60:	01813083          	ld	ra,24(sp)
    80004b64:	01013403          	ld	s0,16(sp)
    80004b68:	00813483          	ld	s1,8(sp)
    80004b6c:	00013903          	ld	s2,0(sp)
    80004b70:	02010113          	addi	sp,sp,32
    80004b74:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004b78:	ffffd097          	auipc	ra,0xffffd
    80004b7c:	af8080e7          	jalr	-1288(ra) # 80001670 <thread_dispatch>
    80004b80:	fc1ff06f          	j	80004b40 <_ZL9fibonaccim+0x30>

0000000080004b84 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004b84:	fe010113          	addi	sp,sp,-32
    80004b88:	00113c23          	sd	ra,24(sp)
    80004b8c:	00813823          	sd	s0,16(sp)
    80004b90:	00913423          	sd	s1,8(sp)
    80004b94:	01213023          	sd	s2,0(sp)
    80004b98:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004b9c:	00a00493          	li	s1,10
    80004ba0:	0400006f          	j	80004be0 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004ba4:	00004517          	auipc	a0,0x4
    80004ba8:	65c50513          	addi	a0,a0,1628 # 80009200 <CONSOLE_STATUS+0x1f0>
    80004bac:	00001097          	auipc	ra,0x1
    80004bb0:	dc8080e7          	jalr	-568(ra) # 80005974 <_Z11printStringPKc>
    80004bb4:	00000613          	li	a2,0
    80004bb8:	00a00593          	li	a1,10
    80004bbc:	00048513          	mv	a0,s1
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	f64080e7          	jalr	-156(ra) # 80005b24 <_Z8printIntiii>
    80004bc8:	00004517          	auipc	a0,0x4
    80004bcc:	52850513          	addi	a0,a0,1320 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004bd0:	00001097          	auipc	ra,0x1
    80004bd4:	da4080e7          	jalr	-604(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004bd8:	0014849b          	addiw	s1,s1,1
    80004bdc:	0ff4f493          	andi	s1,s1,255
    80004be0:	00c00793          	li	a5,12
    80004be4:	fc97f0e3          	bgeu	a5,s1,80004ba4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004be8:	00004517          	auipc	a0,0x4
    80004bec:	62050513          	addi	a0,a0,1568 # 80009208 <CONSOLE_STATUS+0x1f8>
    80004bf0:	00001097          	auipc	ra,0x1
    80004bf4:	d84080e7          	jalr	-636(ra) # 80005974 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004bf8:	00500313          	li	t1,5
    thread_dispatch();
    80004bfc:	ffffd097          	auipc	ra,0xffffd
    80004c00:	a74080e7          	jalr	-1420(ra) # 80001670 <thread_dispatch>

    uint64 result = fibonacci(16);
    80004c04:	01000513          	li	a0,16
    80004c08:	00000097          	auipc	ra,0x0
    80004c0c:	f08080e7          	jalr	-248(ra) # 80004b10 <_ZL9fibonaccim>
    80004c10:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004c14:	00004517          	auipc	a0,0x4
    80004c18:	60450513          	addi	a0,a0,1540 # 80009218 <CONSOLE_STATUS+0x208>
    80004c1c:	00001097          	auipc	ra,0x1
    80004c20:	d58080e7          	jalr	-680(ra) # 80005974 <_Z11printStringPKc>
    80004c24:	00000613          	li	a2,0
    80004c28:	00a00593          	li	a1,10
    80004c2c:	0009051b          	sext.w	a0,s2
    80004c30:	00001097          	auipc	ra,0x1
    80004c34:	ef4080e7          	jalr	-268(ra) # 80005b24 <_Z8printIntiii>
    80004c38:	00004517          	auipc	a0,0x4
    80004c3c:	4b850513          	addi	a0,a0,1208 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004c40:	00001097          	auipc	ra,0x1
    80004c44:	d34080e7          	jalr	-716(ra) # 80005974 <_Z11printStringPKc>
    80004c48:	0400006f          	j	80004c88 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c4c:	00004517          	auipc	a0,0x4
    80004c50:	5b450513          	addi	a0,a0,1460 # 80009200 <CONSOLE_STATUS+0x1f0>
    80004c54:	00001097          	auipc	ra,0x1
    80004c58:	d20080e7          	jalr	-736(ra) # 80005974 <_Z11printStringPKc>
    80004c5c:	00000613          	li	a2,0
    80004c60:	00a00593          	li	a1,10
    80004c64:	00048513          	mv	a0,s1
    80004c68:	00001097          	auipc	ra,0x1
    80004c6c:	ebc080e7          	jalr	-324(ra) # 80005b24 <_Z8printIntiii>
    80004c70:	00004517          	auipc	a0,0x4
    80004c74:	48050513          	addi	a0,a0,1152 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004c78:	00001097          	auipc	ra,0x1
    80004c7c:	cfc080e7          	jalr	-772(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004c80:	0014849b          	addiw	s1,s1,1
    80004c84:	0ff4f493          	andi	s1,s1,255
    80004c88:	00f00793          	li	a5,15
    80004c8c:	fc97f0e3          	bgeu	a5,s1,80004c4c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004c90:	00004517          	auipc	a0,0x4
    80004c94:	59850513          	addi	a0,a0,1432 # 80009228 <CONSOLE_STATUS+0x218>
    80004c98:	00001097          	auipc	ra,0x1
    80004c9c:	cdc080e7          	jalr	-804(ra) # 80005974 <_Z11printStringPKc>
    finishedD = true;
    80004ca0:	00100793          	li	a5,1
    80004ca4:	00007717          	auipc	a4,0x7
    80004ca8:	aaf70e23          	sb	a5,-1348(a4) # 8000b760 <_ZL9finishedD>
    thread_dispatch();
    80004cac:	ffffd097          	auipc	ra,0xffffd
    80004cb0:	9c4080e7          	jalr	-1596(ra) # 80001670 <thread_dispatch>
}
    80004cb4:	01813083          	ld	ra,24(sp)
    80004cb8:	01013403          	ld	s0,16(sp)
    80004cbc:	00813483          	ld	s1,8(sp)
    80004cc0:	00013903          	ld	s2,0(sp)
    80004cc4:	02010113          	addi	sp,sp,32
    80004cc8:	00008067          	ret

0000000080004ccc <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004ccc:	fe010113          	addi	sp,sp,-32
    80004cd0:	00113c23          	sd	ra,24(sp)
    80004cd4:	00813823          	sd	s0,16(sp)
    80004cd8:	00913423          	sd	s1,8(sp)
    80004cdc:	01213023          	sd	s2,0(sp)
    80004ce0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004ce4:	00000493          	li	s1,0
    80004ce8:	0400006f          	j	80004d28 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004cec:	00004517          	auipc	a0,0x4
    80004cf0:	4e450513          	addi	a0,a0,1252 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80004cf4:	00001097          	auipc	ra,0x1
    80004cf8:	c80080e7          	jalr	-896(ra) # 80005974 <_Z11printStringPKc>
    80004cfc:	00000613          	li	a2,0
    80004d00:	00a00593          	li	a1,10
    80004d04:	00048513          	mv	a0,s1
    80004d08:	00001097          	auipc	ra,0x1
    80004d0c:	e1c080e7          	jalr	-484(ra) # 80005b24 <_Z8printIntiii>
    80004d10:	00004517          	auipc	a0,0x4
    80004d14:	3e050513          	addi	a0,a0,992 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004d18:	00001097          	auipc	ra,0x1
    80004d1c:	c5c080e7          	jalr	-932(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004d20:	0014849b          	addiw	s1,s1,1
    80004d24:	0ff4f493          	andi	s1,s1,255
    80004d28:	00200793          	li	a5,2
    80004d2c:	fc97f0e3          	bgeu	a5,s1,80004cec <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004d30:	00004517          	auipc	a0,0x4
    80004d34:	4a850513          	addi	a0,a0,1192 # 800091d8 <CONSOLE_STATUS+0x1c8>
    80004d38:	00001097          	auipc	ra,0x1
    80004d3c:	c3c080e7          	jalr	-964(ra) # 80005974 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004d40:	00700313          	li	t1,7
    thread_dispatch();
    80004d44:	ffffd097          	auipc	ra,0xffffd
    80004d48:	92c080e7          	jalr	-1748(ra) # 80001670 <thread_dispatch>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004d4c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004d50:	00004517          	auipc	a0,0x4
    80004d54:	49850513          	addi	a0,a0,1176 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80004d58:	00001097          	auipc	ra,0x1
    80004d5c:	c1c080e7          	jalr	-996(ra) # 80005974 <_Z11printStringPKc>
    80004d60:	00000613          	li	a2,0
    80004d64:	00a00593          	li	a1,10
    80004d68:	0009051b          	sext.w	a0,s2
    80004d6c:	00001097          	auipc	ra,0x1
    80004d70:	db8080e7          	jalr	-584(ra) # 80005b24 <_Z8printIntiii>
    80004d74:	00004517          	auipc	a0,0x4
    80004d78:	37c50513          	addi	a0,a0,892 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004d7c:	00001097          	auipc	ra,0x1
    80004d80:	bf8080e7          	jalr	-1032(ra) # 80005974 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004d84:	00c00513          	li	a0,12
    80004d88:	00000097          	auipc	ra,0x0
    80004d8c:	d88080e7          	jalr	-632(ra) # 80004b10 <_ZL9fibonaccim>
    80004d90:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004d94:	00004517          	auipc	a0,0x4
    80004d98:	45c50513          	addi	a0,a0,1116 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80004d9c:	00001097          	auipc	ra,0x1
    80004da0:	bd8080e7          	jalr	-1064(ra) # 80005974 <_Z11printStringPKc>
    80004da4:	00000613          	li	a2,0
    80004da8:	00a00593          	li	a1,10
    80004dac:	0009051b          	sext.w	a0,s2
    80004db0:	00001097          	auipc	ra,0x1
    80004db4:	d74080e7          	jalr	-652(ra) # 80005b24 <_Z8printIntiii>
    80004db8:	00004517          	auipc	a0,0x4
    80004dbc:	33850513          	addi	a0,a0,824 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004dc0:	00001097          	auipc	ra,0x1
    80004dc4:	bb4080e7          	jalr	-1100(ra) # 80005974 <_Z11printStringPKc>
    80004dc8:	0400006f          	j	80004e08 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004dcc:	00004517          	auipc	a0,0x4
    80004dd0:	40450513          	addi	a0,a0,1028 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80004dd4:	00001097          	auipc	ra,0x1
    80004dd8:	ba0080e7          	jalr	-1120(ra) # 80005974 <_Z11printStringPKc>
    80004ddc:	00000613          	li	a2,0
    80004de0:	00a00593          	li	a1,10
    80004de4:	00048513          	mv	a0,s1
    80004de8:	00001097          	auipc	ra,0x1
    80004dec:	d3c080e7          	jalr	-708(ra) # 80005b24 <_Z8printIntiii>
    80004df0:	00004517          	auipc	a0,0x4
    80004df4:	30050513          	addi	a0,a0,768 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004df8:	00001097          	auipc	ra,0x1
    80004dfc:	b7c080e7          	jalr	-1156(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004e00:	0014849b          	addiw	s1,s1,1
    80004e04:	0ff4f493          	andi	s1,s1,255
    80004e08:	00500793          	li	a5,5
    80004e0c:	fc97f0e3          	bgeu	a5,s1,80004dcc <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004e10:	00004517          	auipc	a0,0x4
    80004e14:	39850513          	addi	a0,a0,920 # 800091a8 <CONSOLE_STATUS+0x198>
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	b5c080e7          	jalr	-1188(ra) # 80005974 <_Z11printStringPKc>
    finishedC = true;
    80004e20:	00100793          	li	a5,1
    80004e24:	00007717          	auipc	a4,0x7
    80004e28:	92f70ea3          	sb	a5,-1731(a4) # 8000b761 <_ZL9finishedC>
    thread_dispatch();
    80004e2c:	ffffd097          	auipc	ra,0xffffd
    80004e30:	844080e7          	jalr	-1980(ra) # 80001670 <thread_dispatch>
}
    80004e34:	01813083          	ld	ra,24(sp)
    80004e38:	01013403          	ld	s0,16(sp)
    80004e3c:	00813483          	ld	s1,8(sp)
    80004e40:	00013903          	ld	s2,0(sp)
    80004e44:	02010113          	addi	sp,sp,32
    80004e48:	00008067          	ret

0000000080004e4c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004e4c:	fe010113          	addi	sp,sp,-32
    80004e50:	00113c23          	sd	ra,24(sp)
    80004e54:	00813823          	sd	s0,16(sp)
    80004e58:	00913423          	sd	s1,8(sp)
    80004e5c:	01213023          	sd	s2,0(sp)
    80004e60:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004e64:	00000913          	li	s2,0
    80004e68:	0380006f          	j	80004ea0 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004e6c:	ffffd097          	auipc	ra,0xffffd
    80004e70:	804080e7          	jalr	-2044(ra) # 80001670 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    80004e74:	00148493          	addi	s1,s1,1
    80004e78:	000027b7          	lui	a5,0x2
    80004e7c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004e80:	0097ee63          	bltu	a5,s1,80004e9c <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004e84:	00000713          	li	a4,0
    80004e88:	000077b7          	lui	a5,0x7
    80004e8c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004e90:	fce7eee3          	bltu	a5,a4,80004e6c <_ZL11workerBodyBPv+0x20>
    80004e94:	00170713          	addi	a4,a4,1
    80004e98:	ff1ff06f          	j	80004e88 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004e9c:	00190913          	addi	s2,s2,1
    80004ea0:	00f00793          	li	a5,15
    80004ea4:	0527e063          	bltu	a5,s2,80004ee4 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004ea8:	00004517          	auipc	a0,0x4
    80004eac:	31050513          	addi	a0,a0,784 # 800091b8 <CONSOLE_STATUS+0x1a8>
    80004eb0:	00001097          	auipc	ra,0x1
    80004eb4:	ac4080e7          	jalr	-1340(ra) # 80005974 <_Z11printStringPKc>
    80004eb8:	00000613          	li	a2,0
    80004ebc:	00a00593          	li	a1,10
    80004ec0:	0009051b          	sext.w	a0,s2
    80004ec4:	00001097          	auipc	ra,0x1
    80004ec8:	c60080e7          	jalr	-928(ra) # 80005b24 <_Z8printIntiii>
    80004ecc:	00004517          	auipc	a0,0x4
    80004ed0:	22450513          	addi	a0,a0,548 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004ed4:	00001097          	auipc	ra,0x1
    80004ed8:	aa0080e7          	jalr	-1376(ra) # 80005974 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004edc:	00000493          	li	s1,0
    80004ee0:	f99ff06f          	j	80004e78 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004ee4:	00004517          	auipc	a0,0x4
    80004ee8:	2dc50513          	addi	a0,a0,732 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80004eec:	00001097          	auipc	ra,0x1
    80004ef0:	a88080e7          	jalr	-1400(ra) # 80005974 <_Z11printStringPKc>
    finishedB = true;
    80004ef4:	00100793          	li	a5,1
    80004ef8:	00007717          	auipc	a4,0x7
    80004efc:	86f70523          	sb	a5,-1942(a4) # 8000b762 <_ZL9finishedB>
    thread_dispatch();
    80004f00:	ffffc097          	auipc	ra,0xffffc
    80004f04:	770080e7          	jalr	1904(ra) # 80001670 <thread_dispatch>
}
    80004f08:	01813083          	ld	ra,24(sp)
    80004f0c:	01013403          	ld	s0,16(sp)
    80004f10:	00813483          	ld	s1,8(sp)
    80004f14:	00013903          	ld	s2,0(sp)
    80004f18:	02010113          	addi	sp,sp,32
    80004f1c:	00008067          	ret

0000000080004f20 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004f20:	fe010113          	addi	sp,sp,-32
    80004f24:	00113c23          	sd	ra,24(sp)
    80004f28:	00813823          	sd	s0,16(sp)
    80004f2c:	00913423          	sd	s1,8(sp)
    80004f30:	01213023          	sd	s2,0(sp)
    80004f34:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004f38:	00000913          	li	s2,0
    80004f3c:	0380006f          	j	80004f74 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004f40:	ffffc097          	auipc	ra,0xffffc
    80004f44:	730080e7          	jalr	1840(ra) # 80001670 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    80004f48:	00148493          	addi	s1,s1,1
    80004f4c:	000027b7          	lui	a5,0x2
    80004f50:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004f54:	0097ee63          	bltu	a5,s1,80004f70 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004f58:	00000713          	li	a4,0
    80004f5c:	000077b7          	lui	a5,0x7
    80004f60:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004f64:	fce7eee3          	bltu	a5,a4,80004f40 <_ZL11workerBodyAPv+0x20>
    80004f68:	00170713          	addi	a4,a4,1
    80004f6c:	ff1ff06f          	j	80004f5c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004f70:	00190913          	addi	s2,s2,1
    80004f74:	00900793          	li	a5,9
    80004f78:	0527e063          	bltu	a5,s2,80004fb8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004f7c:	00004517          	auipc	a0,0x4
    80004f80:	22450513          	addi	a0,a0,548 # 800091a0 <CONSOLE_STATUS+0x190>
    80004f84:	00001097          	auipc	ra,0x1
    80004f88:	9f0080e7          	jalr	-1552(ra) # 80005974 <_Z11printStringPKc>
    80004f8c:	00000613          	li	a2,0
    80004f90:	00a00593          	li	a1,10
    80004f94:	0009051b          	sext.w	a0,s2
    80004f98:	00001097          	auipc	ra,0x1
    80004f9c:	b8c080e7          	jalr	-1140(ra) # 80005b24 <_Z8printIntiii>
    80004fa0:	00004517          	auipc	a0,0x4
    80004fa4:	15050513          	addi	a0,a0,336 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004fa8:	00001097          	auipc	ra,0x1
    80004fac:	9cc080e7          	jalr	-1588(ra) # 80005974 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004fb0:	00000493          	li	s1,0
    80004fb4:	f99ff06f          	j	80004f4c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004fb8:	00004517          	auipc	a0,0x4
    80004fbc:	1f050513          	addi	a0,a0,496 # 800091a8 <CONSOLE_STATUS+0x198>
    80004fc0:	00001097          	auipc	ra,0x1
    80004fc4:	9b4080e7          	jalr	-1612(ra) # 80005974 <_Z11printStringPKc>
    finishedA = true;
    80004fc8:	00100793          	li	a5,1
    80004fcc:	00006717          	auipc	a4,0x6
    80004fd0:	78f70ba3          	sb	a5,1943(a4) # 8000b763 <_ZL9finishedA>
}
    80004fd4:	01813083          	ld	ra,24(sp)
    80004fd8:	01013403          	ld	s0,16(sp)
    80004fdc:	00813483          	ld	s1,8(sp)
    80004fe0:	00013903          	ld	s2,0(sp)
    80004fe4:	02010113          	addi	sp,sp,32
    80004fe8:	00008067          	ret

0000000080004fec <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004fec:	fe010113          	addi	sp,sp,-32
    80004ff0:	00113c23          	sd	ra,24(sp)
    80004ff4:	00813823          	sd	s0,16(sp)
    80004ff8:	02010413          	addi	s0,sp,32
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004ffc:	00000613          	li	a2,0
    80005000:	00000597          	auipc	a1,0x0
    80005004:	f2058593          	addi	a1,a1,-224 # 80004f20 <_ZL11workerBodyAPv>
    80005008:	fe040513          	addi	a0,s0,-32
    8000500c:	ffffc097          	auipc	ra,0xffffc
    80005010:	5ac080e7          	jalr	1452(ra) # 800015b8 <thread_create>
    printString("ThreadA created\n");
    80005014:	00004517          	auipc	a0,0x4
    80005018:	22450513          	addi	a0,a0,548 # 80009238 <CONSOLE_STATUS+0x228>
    8000501c:	00001097          	auipc	ra,0x1
    80005020:	958080e7          	jalr	-1704(ra) # 80005974 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005024:	00000613          	li	a2,0
    80005028:	00000597          	auipc	a1,0x0
    8000502c:	e2458593          	addi	a1,a1,-476 # 80004e4c <_ZL11workerBodyBPv>
    80005030:	fe440513          	addi	a0,s0,-28
    80005034:	ffffc097          	auipc	ra,0xffffc
    80005038:	584080e7          	jalr	1412(ra) # 800015b8 <thread_create>
    printString("ThreadB created\n");
    8000503c:	00004517          	auipc	a0,0x4
    80005040:	21450513          	addi	a0,a0,532 # 80009250 <CONSOLE_STATUS+0x240>
    80005044:	00001097          	auipc	ra,0x1
    80005048:	930080e7          	jalr	-1744(ra) # 80005974 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000504c:	00000613          	li	a2,0
    80005050:	00000597          	auipc	a1,0x0
    80005054:	c7c58593          	addi	a1,a1,-900 # 80004ccc <_ZL11workerBodyCPv>
    80005058:	fe840513          	addi	a0,s0,-24
    8000505c:	ffffc097          	auipc	ra,0xffffc
    80005060:	55c080e7          	jalr	1372(ra) # 800015b8 <thread_create>
    printString("ThreadC created\n");
    80005064:	00004517          	auipc	a0,0x4
    80005068:	20450513          	addi	a0,a0,516 # 80009268 <CONSOLE_STATUS+0x258>
    8000506c:	00001097          	auipc	ra,0x1
    80005070:	908080e7          	jalr	-1784(ra) # 80005974 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005074:	00000613          	li	a2,0
    80005078:	00000597          	auipc	a1,0x0
    8000507c:	b0c58593          	addi	a1,a1,-1268 # 80004b84 <_ZL11workerBodyDPv>
    80005080:	fec40513          	addi	a0,s0,-20
    80005084:	ffffc097          	auipc	ra,0xffffc
    80005088:	534080e7          	jalr	1332(ra) # 800015b8 <thread_create>
    printString("ThreadD created\n");
    8000508c:	00004517          	auipc	a0,0x4
    80005090:	1f450513          	addi	a0,a0,500 # 80009280 <CONSOLE_STATUS+0x270>
    80005094:	00001097          	auipc	ra,0x1
    80005098:	8e0080e7          	jalr	-1824(ra) # 80005974 <_Z11printStringPKc>
    8000509c:	00c0006f          	j	800050a8 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800050a0:	ffffc097          	auipc	ra,0xffffc
    800050a4:	5d0080e7          	jalr	1488(ra) # 80001670 <thread_dispatch>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800050a8:	00006797          	auipc	a5,0x6
    800050ac:	6bb7c783          	lbu	a5,1723(a5) # 8000b763 <_ZL9finishedA>
    800050b0:	fe0788e3          	beqz	a5,800050a0 <_Z18Threads_C_API_testv+0xb4>
    800050b4:	00006797          	auipc	a5,0x6
    800050b8:	6ae7c783          	lbu	a5,1710(a5) # 8000b762 <_ZL9finishedB>
    800050bc:	fe0782e3          	beqz	a5,800050a0 <_Z18Threads_C_API_testv+0xb4>
    800050c0:	00006797          	auipc	a5,0x6
    800050c4:	6a17c783          	lbu	a5,1697(a5) # 8000b761 <_ZL9finishedC>
    800050c8:	fc078ce3          	beqz	a5,800050a0 <_Z18Threads_C_API_testv+0xb4>
    800050cc:	00006797          	auipc	a5,0x6
    800050d0:	6947c783          	lbu	a5,1684(a5) # 8000b760 <_ZL9finishedD>
    800050d4:	fc0786e3          	beqz	a5,800050a0 <_Z18Threads_C_API_testv+0xb4>
    }

}
    800050d8:	01813083          	ld	ra,24(sp)
    800050dc:	01013403          	ld	s0,16(sp)
    800050e0:	02010113          	addi	sp,sp,32
    800050e4:	00008067          	ret

00000000800050e8 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    800050e8:	fd010113          	addi	sp,sp,-48
    800050ec:	02113423          	sd	ra,40(sp)
    800050f0:	02813023          	sd	s0,32(sp)
    800050f4:	00913c23          	sd	s1,24(sp)
    800050f8:	01213823          	sd	s2,16(sp)
    800050fc:	01313423          	sd	s3,8(sp)
    80005100:	03010413          	addi	s0,sp,48
    80005104:	00050993          	mv	s3,a0
    80005108:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000510c:	00000913          	li	s2,0
    80005110:	00c0006f          	j	8000511c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005114:	ffffd097          	auipc	ra,0xffffd
    80005118:	514080e7          	jalr	1300(ra) # 80002628 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    8000511c:	ffffc097          	auipc	ra,0xffffc
    80005120:	72c080e7          	jalr	1836(ra) # 80001848 <getc>
    80005124:	0005059b          	sext.w	a1,a0
    80005128:	01b00793          	li	a5,27
    8000512c:	02f58a63          	beq	a1,a5,80005160 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005130:	0084b503          	ld	a0,8(s1)
    80005134:	00001097          	auipc	ra,0x1
    80005138:	c64080e7          	jalr	-924(ra) # 80005d98 <_ZN9BufferCPP3putEi>
        i++;
    8000513c:	0019071b          	addiw	a4,s2,1
    80005140:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005144:	0004a683          	lw	a3,0(s1)
    80005148:	0026979b          	slliw	a5,a3,0x2
    8000514c:	00d787bb          	addw	a5,a5,a3
    80005150:	0017979b          	slliw	a5,a5,0x1
    80005154:	02f767bb          	remw	a5,a4,a5
    80005158:	fc0792e3          	bnez	a5,8000511c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    8000515c:	fb9ff06f          	j	80005114 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80005160:	00100793          	li	a5,1
    80005164:	00006717          	auipc	a4,0x6
    80005168:	60f72223          	sw	a5,1540(a4) # 8000b768 <_ZL9threadEnd>
    td->buffer->put('!');
    8000516c:	0889b783          	ld	a5,136(s3)
    80005170:	02100593          	li	a1,33
    80005174:	0087b503          	ld	a0,8(a5)
    80005178:	00001097          	auipc	ra,0x1
    8000517c:	c20080e7          	jalr	-992(ra) # 80005d98 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80005180:	0104b503          	ld	a0,16(s1)
    80005184:	ffffd097          	auipc	ra,0xffffd
    80005188:	d38080e7          	jalr	-712(ra) # 80001ebc <_ZN9Semaphore6signalEv>
}
    8000518c:	02813083          	ld	ra,40(sp)
    80005190:	02013403          	ld	s0,32(sp)
    80005194:	01813483          	ld	s1,24(sp)
    80005198:	01013903          	ld	s2,16(sp)
    8000519c:	00813983          	ld	s3,8(sp)
    800051a0:	03010113          	addi	sp,sp,48
    800051a4:	00008067          	ret

00000000800051a8 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800051a8:	fe010113          	addi	sp,sp,-32
    800051ac:	00113c23          	sd	ra,24(sp)
    800051b0:	00813823          	sd	s0,16(sp)
    800051b4:	00913423          	sd	s1,8(sp)
    800051b8:	01213023          	sd	s2,0(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800051c4:	00000913          	li	s2,0
    800051c8:	00c0006f          	j	800051d4 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800051cc:	ffffd097          	auipc	ra,0xffffd
    800051d0:	45c080e7          	jalr	1116(ra) # 80002628 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800051d4:	00006797          	auipc	a5,0x6
    800051d8:	5947a783          	lw	a5,1428(a5) # 8000b768 <_ZL9threadEnd>
    800051dc:	02079e63          	bnez	a5,80005218 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    800051e0:	0004a583          	lw	a1,0(s1)
    800051e4:	0305859b          	addiw	a1,a1,48
    800051e8:	0084b503          	ld	a0,8(s1)
    800051ec:	00001097          	auipc	ra,0x1
    800051f0:	bac080e7          	jalr	-1108(ra) # 80005d98 <_ZN9BufferCPP3putEi>
        i++;
    800051f4:	0019071b          	addiw	a4,s2,1
    800051f8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800051fc:	0004a683          	lw	a3,0(s1)
    80005200:	0026979b          	slliw	a5,a3,0x2
    80005204:	00d787bb          	addw	a5,a5,a3
    80005208:	0017979b          	slliw	a5,a5,0x1
    8000520c:	02f767bb          	remw	a5,a4,a5
    80005210:	fc0792e3          	bnez	a5,800051d4 <_ZN12ProducerSync8producerEPv+0x2c>
    80005214:	fb9ff06f          	j	800051cc <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80005218:	0104b503          	ld	a0,16(s1)
    8000521c:	ffffd097          	auipc	ra,0xffffd
    80005220:	ca0080e7          	jalr	-864(ra) # 80001ebc <_ZN9Semaphore6signalEv>
}
    80005224:	01813083          	ld	ra,24(sp)
    80005228:	01013403          	ld	s0,16(sp)
    8000522c:	00813483          	ld	s1,8(sp)
    80005230:	00013903          	ld	s2,0(sp)
    80005234:	02010113          	addi	sp,sp,32
    80005238:	00008067          	ret

000000008000523c <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    8000523c:	fd010113          	addi	sp,sp,-48
    80005240:	02113423          	sd	ra,40(sp)
    80005244:	02813023          	sd	s0,32(sp)
    80005248:	00913c23          	sd	s1,24(sp)
    8000524c:	01213823          	sd	s2,16(sp)
    80005250:	01313423          	sd	s3,8(sp)
    80005254:	01413023          	sd	s4,0(sp)
    80005258:	03010413          	addi	s0,sp,48
    8000525c:	00050993          	mv	s3,a0
    80005260:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005264:	00000a13          	li	s4,0
    80005268:	01c0006f          	j	80005284 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    8000526c:	ffffd097          	auipc	ra,0xffffd
    80005270:	3bc080e7          	jalr	956(ra) # 80002628 <_ZN6Thread8dispatchEv>
    80005274:	0500006f          	j	800052c4 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80005278:	00a00513          	li	a0,10
    8000527c:	ffffc097          	auipc	ra,0xffffc
    80005280:	58c080e7          	jalr	1420(ra) # 80001808 <putc>
    while (!threadEnd) {
    80005284:	00006797          	auipc	a5,0x6
    80005288:	4e47a783          	lw	a5,1252(a5) # 8000b768 <_ZL9threadEnd>
    8000528c:	06079263          	bnez	a5,800052f0 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005290:	00893503          	ld	a0,8(s2)
    80005294:	00001097          	auipc	ra,0x1
    80005298:	b94080e7          	jalr	-1132(ra) # 80005e28 <_ZN9BufferCPP3getEv>
        i++;
    8000529c:	001a049b          	addiw	s1,s4,1
    800052a0:	00048a1b          	sext.w	s4,s1
        putc(key);
    800052a4:	0ff57513          	andi	a0,a0,255
    800052a8:	ffffc097          	auipc	ra,0xffffc
    800052ac:	560080e7          	jalr	1376(ra) # 80001808 <putc>
        if (i % (5 * data->id) == 0) {
    800052b0:	00092703          	lw	a4,0(s2)
    800052b4:	0027179b          	slliw	a5,a4,0x2
    800052b8:	00e787bb          	addw	a5,a5,a4
    800052bc:	02f4e7bb          	remw	a5,s1,a5
    800052c0:	fa0786e3          	beqz	a5,8000526c <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800052c4:	05000793          	li	a5,80
    800052c8:	02f4e4bb          	remw	s1,s1,a5
    800052cc:	fa049ce3          	bnez	s1,80005284 <_ZN12ConsumerSync8consumerEPv+0x48>
    800052d0:	fa9ff06f          	j	80005278 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800052d4:	0889b783          	ld	a5,136(s3)
    800052d8:	0087b503          	ld	a0,8(a5)
    800052dc:	00001097          	auipc	ra,0x1
    800052e0:	b4c080e7          	jalr	-1204(ra) # 80005e28 <_ZN9BufferCPP3getEv>
    800052e4:	0ff57513          	andi	a0,a0,255
    800052e8:	00003097          	auipc	ra,0x3
    800052ec:	764080e7          	jalr	1892(ra) # 80008a4c <__putc>
    while (td->buffer->getCnt() > 0) {
    800052f0:	0889b783          	ld	a5,136(s3)
    800052f4:	0087b503          	ld	a0,8(a5)
    800052f8:	00001097          	auipc	ra,0x1
    800052fc:	bbc080e7          	jalr	-1092(ra) # 80005eb4 <_ZN9BufferCPP6getCntEv>
    80005300:	fca04ae3          	bgtz	a0,800052d4 <_ZN12ConsumerSync8consumerEPv+0x98>
        Console::putc(key);
    }

    data->wait->signal();
    80005304:	01093503          	ld	a0,16(s2)
    80005308:	ffffd097          	auipc	ra,0xffffd
    8000530c:	bb4080e7          	jalr	-1100(ra) # 80001ebc <_ZN9Semaphore6signalEv>
}
    80005310:	02813083          	ld	ra,40(sp)
    80005314:	02013403          	ld	s0,32(sp)
    80005318:	01813483          	ld	s1,24(sp)
    8000531c:	01013903          	ld	s2,16(sp)
    80005320:	00813983          	ld	s3,8(sp)
    80005324:	00013a03          	ld	s4,0(sp)
    80005328:	03010113          	addi	sp,sp,48
    8000532c:	00008067          	ret

0000000080005330 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005330:	f8010113          	addi	sp,sp,-128
    80005334:	06113c23          	sd	ra,120(sp)
    80005338:	06813823          	sd	s0,112(sp)
    8000533c:	06913423          	sd	s1,104(sp)
    80005340:	07213023          	sd	s2,96(sp)
    80005344:	05313c23          	sd	s3,88(sp)
    80005348:	05413823          	sd	s4,80(sp)
    8000534c:	05513423          	sd	s5,72(sp)
    80005350:	05613023          	sd	s6,64(sp)
    80005354:	03713c23          	sd	s7,56(sp)
    80005358:	03813823          	sd	s8,48(sp)
    8000535c:	03913423          	sd	s9,40(sp)
    80005360:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80005364:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80005368:	00004517          	auipc	a0,0x4
    8000536c:	d5050513          	addi	a0,a0,-688 # 800090b8 <CONSOLE_STATUS+0xa8>
    80005370:	00000097          	auipc	ra,0x0
    80005374:	604080e7          	jalr	1540(ra) # 80005974 <_Z11printStringPKc>
    getString(input, 30);
    80005378:	01e00593          	li	a1,30
    8000537c:	f8040493          	addi	s1,s0,-128
    80005380:	00048513          	mv	a0,s1
    80005384:	00000097          	auipc	ra,0x0
    80005388:	678080e7          	jalr	1656(ra) # 800059fc <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000538c:	00048513          	mv	a0,s1
    80005390:	00000097          	auipc	ra,0x0
    80005394:	744080e7          	jalr	1860(ra) # 80005ad4 <_Z11stringToIntPKc>
    80005398:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000539c:	00004517          	auipc	a0,0x4
    800053a0:	d3c50513          	addi	a0,a0,-708 # 800090d8 <CONSOLE_STATUS+0xc8>
    800053a4:	00000097          	auipc	ra,0x0
    800053a8:	5d0080e7          	jalr	1488(ra) # 80005974 <_Z11printStringPKc>
    getString(input, 30);
    800053ac:	01e00593          	li	a1,30
    800053b0:	00048513          	mv	a0,s1
    800053b4:	00000097          	auipc	ra,0x0
    800053b8:	648080e7          	jalr	1608(ra) # 800059fc <_Z9getStringPci>
    n = stringToInt(input);
    800053bc:	00048513          	mv	a0,s1
    800053c0:	00000097          	auipc	ra,0x0
    800053c4:	714080e7          	jalr	1812(ra) # 80005ad4 <_Z11stringToIntPKc>
    800053c8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800053cc:	00004517          	auipc	a0,0x4
    800053d0:	d2c50513          	addi	a0,a0,-724 # 800090f8 <CONSOLE_STATUS+0xe8>
    800053d4:	00000097          	auipc	ra,0x0
    800053d8:	5a0080e7          	jalr	1440(ra) # 80005974 <_Z11printStringPKc>
    800053dc:	00000613          	li	a2,0
    800053e0:	00a00593          	li	a1,10
    800053e4:	00090513          	mv	a0,s2
    800053e8:	00000097          	auipc	ra,0x0
    800053ec:	73c080e7          	jalr	1852(ra) # 80005b24 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800053f0:	00004517          	auipc	a0,0x4
    800053f4:	d2050513          	addi	a0,a0,-736 # 80009110 <CONSOLE_STATUS+0x100>
    800053f8:	00000097          	auipc	ra,0x0
    800053fc:	57c080e7          	jalr	1404(ra) # 80005974 <_Z11printStringPKc>
    80005400:	00000613          	li	a2,0
    80005404:	00a00593          	li	a1,10
    80005408:	00048513          	mv	a0,s1
    8000540c:	00000097          	auipc	ra,0x0
    80005410:	718080e7          	jalr	1816(ra) # 80005b24 <_Z8printIntiii>
    printString(".\n");
    80005414:	00004517          	auipc	a0,0x4
    80005418:	d1450513          	addi	a0,a0,-748 # 80009128 <CONSOLE_STATUS+0x118>
    8000541c:	00000097          	auipc	ra,0x0
    80005420:	558080e7          	jalr	1368(ra) # 80005974 <_Z11printStringPKc>
    if(threadNum > n) {
    80005424:	0324c463          	blt	s1,s2,8000544c <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80005428:	03205c63          	blez	s2,80005460 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    8000542c:	03800513          	li	a0,56
    80005430:	ffffd097          	auipc	ra,0xffffd
    80005434:	718080e7          	jalr	1816(ra) # 80002b48 <_Znwm>
    80005438:	00050a93          	mv	s5,a0
    8000543c:	00048593          	mv	a1,s1
    80005440:	00001097          	auipc	ra,0x1
    80005444:	804080e7          	jalr	-2044(ra) # 80005c44 <_ZN9BufferCPPC1Ei>
    80005448:	0300006f          	j	80005478 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000544c:	00004517          	auipc	a0,0x4
    80005450:	ce450513          	addi	a0,a0,-796 # 80009130 <CONSOLE_STATUS+0x120>
    80005454:	00000097          	auipc	ra,0x0
    80005458:	520080e7          	jalr	1312(ra) # 80005974 <_Z11printStringPKc>
        return;
    8000545c:	0140006f          	j	80005470 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80005460:	00004517          	auipc	a0,0x4
    80005464:	d1050513          	addi	a0,a0,-752 # 80009170 <CONSOLE_STATUS+0x160>
    80005468:	00000097          	auipc	ra,0x0
    8000546c:	50c080e7          	jalr	1292(ra) # 80005974 <_Z11printStringPKc>
        return;
    80005470:	000b8113          	mv	sp,s7
    80005474:	2380006f          	j	800056ac <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80005478:	02000513          	li	a0,32
    8000547c:	ffffc097          	auipc	ra,0xffffc
    80005480:	614080e7          	jalr	1556(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80005484:	00050493          	mv	s1,a0
    80005488:	00000593          	li	a1,0
    8000548c:	ffffc097          	auipc	ra,0xffffc
    80005490:	598080e7          	jalr	1432(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    80005494:	00006797          	auipc	a5,0x6
    80005498:	2c97be23          	sd	s1,732(a5) # 8000b770 <_ZL10waitForAll>
    Thread* threads[threadNum];
    8000549c:	00391793          	slli	a5,s2,0x3
    800054a0:	00f78793          	addi	a5,a5,15
    800054a4:	ff07f793          	andi	a5,a5,-16
    800054a8:	40f10133          	sub	sp,sp,a5
    800054ac:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    800054b0:	0019071b          	addiw	a4,s2,1
    800054b4:	00171793          	slli	a5,a4,0x1
    800054b8:	00e787b3          	add	a5,a5,a4
    800054bc:	00379793          	slli	a5,a5,0x3
    800054c0:	00f78793          	addi	a5,a5,15
    800054c4:	ff07f793          	andi	a5,a5,-16
    800054c8:	40f10133          	sub	sp,sp,a5
    800054cc:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    800054d0:	00191c13          	slli	s8,s2,0x1
    800054d4:	012c07b3          	add	a5,s8,s2
    800054d8:	00379793          	slli	a5,a5,0x3
    800054dc:	00fa07b3          	add	a5,s4,a5
    800054e0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800054e4:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    800054e8:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    800054ec:	09000513          	li	a0,144
    800054f0:	ffffd097          	auipc	ra,0xffffd
    800054f4:	f78080e7          	jalr	-136(ra) # 80002468 <_ZN6ThreadnwEm>
    800054f8:	00050b13          	mv	s6,a0
    800054fc:	012c0c33          	add	s8,s8,s2
    80005500:	003c1c13          	slli	s8,s8,0x3
    80005504:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80005508:	ffffd097          	auipc	ra,0xffffd
    8000550c:	c74080e7          	jalr	-908(ra) # 8000217c <_ZN6ThreadC1Ev>
    80005510:	00006797          	auipc	a5,0x6
    80005514:	11078793          	addi	a5,a5,272 # 8000b620 <_ZTV12ConsumerSync+0x10>
    80005518:	00fb3023          	sd	a5,0(s6)
    8000551c:	098b3423          	sd	s8,136(s6)
    consumerThread->start();
    80005520:	000b0513          	mv	a0,s6
    80005524:	ffffd097          	auipc	ra,0xffffd
    80005528:	12c080e7          	jalr	300(ra) # 80002650 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    8000552c:	00000493          	li	s1,0
    80005530:	0380006f          	j	80005568 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005534:	00006797          	auipc	a5,0x6
    80005538:	0c478793          	addi	a5,a5,196 # 8000b5f8 <_ZTV12ProducerSync+0x10>
    8000553c:	00fcb023          	sd	a5,0(s9)
    80005540:	098cb423          	sd	s8,136(s9)
            threads[i] = new ProducerSync(data+i);
    80005544:	00349793          	slli	a5,s1,0x3
    80005548:	00f987b3          	add	a5,s3,a5
    8000554c:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80005550:	00349793          	slli	a5,s1,0x3
    80005554:	00f987b3          	add	a5,s3,a5
    80005558:	0007b503          	ld	a0,0(a5)
    8000555c:	ffffd097          	auipc	ra,0xffffd
    80005560:	0f4080e7          	jalr	244(ra) # 80002650 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005564:	0014849b          	addiw	s1,s1,1
    80005568:	0b24d063          	bge	s1,s2,80005608 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    8000556c:	00149793          	slli	a5,s1,0x1
    80005570:	009787b3          	add	a5,a5,s1
    80005574:	00379793          	slli	a5,a5,0x3
    80005578:	00fa07b3          	add	a5,s4,a5
    8000557c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80005580:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005584:	00006717          	auipc	a4,0x6
    80005588:	1ec73703          	ld	a4,492(a4) # 8000b770 <_ZL10waitForAll>
    8000558c:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005590:	02905863          	blez	s1,800055c0 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005594:	09000513          	li	a0,144
    80005598:	ffffd097          	auipc	ra,0xffffd
    8000559c:	ed0080e7          	jalr	-304(ra) # 80002468 <_ZN6ThreadnwEm>
    800055a0:	00050c93          	mv	s9,a0
    800055a4:	00149c13          	slli	s8,s1,0x1
    800055a8:	009c0c33          	add	s8,s8,s1
    800055ac:	003c1c13          	slli	s8,s8,0x3
    800055b0:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800055b4:	ffffd097          	auipc	ra,0xffffd
    800055b8:	bc8080e7          	jalr	-1080(ra) # 8000217c <_ZN6ThreadC1Ev>
    800055bc:	f79ff06f          	j	80005534 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    800055c0:	09000513          	li	a0,144
    800055c4:	ffffd097          	auipc	ra,0xffffd
    800055c8:	ea4080e7          	jalr	-348(ra) # 80002468 <_ZN6ThreadnwEm>
    800055cc:	00050c93          	mv	s9,a0
    800055d0:	00149c13          	slli	s8,s1,0x1
    800055d4:	009c0c33          	add	s8,s8,s1
    800055d8:	003c1c13          	slli	s8,s8,0x3
    800055dc:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    800055e0:	ffffd097          	auipc	ra,0xffffd
    800055e4:	b9c080e7          	jalr	-1124(ra) # 8000217c <_ZN6ThreadC1Ev>
    800055e8:	00006797          	auipc	a5,0x6
    800055ec:	fe878793          	addi	a5,a5,-24 # 8000b5d0 <_ZTV16ProducerKeyboard+0x10>
    800055f0:	00fcb023          	sd	a5,0(s9)
    800055f4:	098cb423          	sd	s8,136(s9)
            threads[i] = new ProducerKeyboard(data+i);
    800055f8:	00349793          	slli	a5,s1,0x3
    800055fc:	00f987b3          	add	a5,s3,a5
    80005600:	0197b023          	sd	s9,0(a5)
    80005604:	f4dff06f          	j	80005550 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005608:	ffffd097          	auipc	ra,0xffffd
    8000560c:	020080e7          	jalr	32(ra) # 80002628 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005610:	00000493          	li	s1,0
    80005614:	00994e63          	blt	s2,s1,80005630 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80005618:	00006517          	auipc	a0,0x6
    8000561c:	15853503          	ld	a0,344(a0) # 8000b770 <_ZL10waitForAll>
    80005620:	ffffc097          	auipc	ra,0xffffc
    80005624:	7b4080e7          	jalr	1972(ra) # 80001dd4 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80005628:	0014849b          	addiw	s1,s1,1
    8000562c:	fe9ff06f          	j	80005614 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005630:	00000493          	li	s1,0
    80005634:	0080006f          	j	8000563c <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80005638:	0014849b          	addiw	s1,s1,1
    8000563c:	0324d263          	bge	s1,s2,80005660 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80005640:	00349793          	slli	a5,s1,0x3
    80005644:	00f987b3          	add	a5,s3,a5
    80005648:	0007b503          	ld	a0,0(a5)
    8000564c:	fe0506e3          	beqz	a0,80005638 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80005650:	00053783          	ld	a5,0(a0)
    80005654:	0087b783          	ld	a5,8(a5)
    80005658:	000780e7          	jalr	a5
    8000565c:	fddff06f          	j	80005638 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80005660:	000b0a63          	beqz	s6,80005674 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80005664:	000b3783          	ld	a5,0(s6)
    80005668:	0087b783          	ld	a5,8(a5)
    8000566c:	000b0513          	mv	a0,s6
    80005670:	000780e7          	jalr	a5
    delete waitForAll;
    80005674:	00006517          	auipc	a0,0x6
    80005678:	0fc53503          	ld	a0,252(a0) # 8000b770 <_ZL10waitForAll>
    8000567c:	00050863          	beqz	a0,8000568c <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80005680:	00053783          	ld	a5,0(a0)
    80005684:	0087b783          	ld	a5,8(a5)
    80005688:	000780e7          	jalr	a5
    delete buffer;
    8000568c:	000a8e63          	beqz	s5,800056a8 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005690:	000a8513          	mv	a0,s5
    80005694:	00001097          	auipc	ra,0x1
    80005698:	8a8080e7          	jalr	-1880(ra) # 80005f3c <_ZN9BufferCPPD1Ev>
    8000569c:	000a8513          	mv	a0,s5
    800056a0:	ffffd097          	auipc	ra,0xffffd
    800056a4:	4f8080e7          	jalr	1272(ra) # 80002b98 <_ZdlPv>
    800056a8:	000b8113          	mv	sp,s7

}
    800056ac:	f8040113          	addi	sp,s0,-128
    800056b0:	07813083          	ld	ra,120(sp)
    800056b4:	07013403          	ld	s0,112(sp)
    800056b8:	06813483          	ld	s1,104(sp)
    800056bc:	06013903          	ld	s2,96(sp)
    800056c0:	05813983          	ld	s3,88(sp)
    800056c4:	05013a03          	ld	s4,80(sp)
    800056c8:	04813a83          	ld	s5,72(sp)
    800056cc:	04013b03          	ld	s6,64(sp)
    800056d0:	03813b83          	ld	s7,56(sp)
    800056d4:	03013c03          	ld	s8,48(sp)
    800056d8:	02813c83          	ld	s9,40(sp)
    800056dc:	08010113          	addi	sp,sp,128
    800056e0:	00008067          	ret
    800056e4:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800056e8:	000a8513          	mv	a0,s5
    800056ec:	ffffd097          	auipc	ra,0xffffd
    800056f0:	4ac080e7          	jalr	1196(ra) # 80002b98 <_ZdlPv>
    800056f4:	00048513          	mv	a0,s1
    800056f8:	00007097          	auipc	ra,0x7
    800056fc:	160080e7          	jalr	352(ra) # 8000c858 <_Unwind_Resume>
    80005700:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005704:	00048513          	mv	a0,s1
    80005708:	ffffc097          	auipc	ra,0xffffc
    8000570c:	3c0080e7          	jalr	960(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80005710:	00090513          	mv	a0,s2
    80005714:	00007097          	auipc	ra,0x7
    80005718:	144080e7          	jalr	324(ra) # 8000c858 <_Unwind_Resume>
    8000571c:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005720:	000b0513          	mv	a0,s6
    80005724:	ffffd097          	auipc	ra,0xffffd
    80005728:	e94080e7          	jalr	-364(ra) # 800025b8 <_ZN6ThreaddlEPv>
    8000572c:	00048513          	mv	a0,s1
    80005730:	00007097          	auipc	ra,0x7
    80005734:	128080e7          	jalr	296(ra) # 8000c858 <_Unwind_Resume>
    80005738:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    8000573c:	000c8513          	mv	a0,s9
    80005740:	ffffd097          	auipc	ra,0xffffd
    80005744:	e78080e7          	jalr	-392(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80005748:	00048513          	mv	a0,s1
    8000574c:	00007097          	auipc	ra,0x7
    80005750:	10c080e7          	jalr	268(ra) # 8000c858 <_Unwind_Resume>
    80005754:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005758:	000c8513          	mv	a0,s9
    8000575c:	ffffd097          	auipc	ra,0xffffd
    80005760:	e5c080e7          	jalr	-420(ra) # 800025b8 <_ZN6ThreaddlEPv>
    80005764:	00048513          	mv	a0,s1
    80005768:	00007097          	auipc	ra,0x7
    8000576c:	0f0080e7          	jalr	240(ra) # 8000c858 <_Unwind_Resume>

0000000080005770 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005770:	ff010113          	addi	sp,sp,-16
    80005774:	00113423          	sd	ra,8(sp)
    80005778:	00813023          	sd	s0,0(sp)
    8000577c:	01010413          	addi	s0,sp,16
    80005780:	00006797          	auipc	a5,0x6
    80005784:	ea078793          	addi	a5,a5,-352 # 8000b620 <_ZTV12ConsumerSync+0x10>
    80005788:	00f53023          	sd	a5,0(a0)
    8000578c:	ffffd097          	auipc	ra,0xffffd
    80005790:	94c080e7          	jalr	-1716(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80005794:	00813083          	ld	ra,8(sp)
    80005798:	00013403          	ld	s0,0(sp)
    8000579c:	01010113          	addi	sp,sp,16
    800057a0:	00008067          	ret

00000000800057a4 <_ZN12ConsumerSyncD0Ev>:
    800057a4:	fe010113          	addi	sp,sp,-32
    800057a8:	00113c23          	sd	ra,24(sp)
    800057ac:	00813823          	sd	s0,16(sp)
    800057b0:	00913423          	sd	s1,8(sp)
    800057b4:	02010413          	addi	s0,sp,32
    800057b8:	00050493          	mv	s1,a0
    800057bc:	00006797          	auipc	a5,0x6
    800057c0:	e6478793          	addi	a5,a5,-412 # 8000b620 <_ZTV12ConsumerSync+0x10>
    800057c4:	00f53023          	sd	a5,0(a0)
    800057c8:	ffffd097          	auipc	ra,0xffffd
    800057cc:	910080e7          	jalr	-1776(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800057d0:	00048513          	mv	a0,s1
    800057d4:	ffffd097          	auipc	ra,0xffffd
    800057d8:	de4080e7          	jalr	-540(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800057dc:	01813083          	ld	ra,24(sp)
    800057e0:	01013403          	ld	s0,16(sp)
    800057e4:	00813483          	ld	s1,8(sp)
    800057e8:	02010113          	addi	sp,sp,32
    800057ec:	00008067          	ret

00000000800057f0 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    800057f0:	ff010113          	addi	sp,sp,-16
    800057f4:	00113423          	sd	ra,8(sp)
    800057f8:	00813023          	sd	s0,0(sp)
    800057fc:	01010413          	addi	s0,sp,16
    80005800:	00006797          	auipc	a5,0x6
    80005804:	df878793          	addi	a5,a5,-520 # 8000b5f8 <_ZTV12ProducerSync+0x10>
    80005808:	00f53023          	sd	a5,0(a0)
    8000580c:	ffffd097          	auipc	ra,0xffffd
    80005810:	8cc080e7          	jalr	-1844(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80005814:	00813083          	ld	ra,8(sp)
    80005818:	00013403          	ld	s0,0(sp)
    8000581c:	01010113          	addi	sp,sp,16
    80005820:	00008067          	ret

0000000080005824 <_ZN12ProducerSyncD0Ev>:
    80005824:	fe010113          	addi	sp,sp,-32
    80005828:	00113c23          	sd	ra,24(sp)
    8000582c:	00813823          	sd	s0,16(sp)
    80005830:	00913423          	sd	s1,8(sp)
    80005834:	02010413          	addi	s0,sp,32
    80005838:	00050493          	mv	s1,a0
    8000583c:	00006797          	auipc	a5,0x6
    80005840:	dbc78793          	addi	a5,a5,-580 # 8000b5f8 <_ZTV12ProducerSync+0x10>
    80005844:	00f53023          	sd	a5,0(a0)
    80005848:	ffffd097          	auipc	ra,0xffffd
    8000584c:	890080e7          	jalr	-1904(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80005850:	00048513          	mv	a0,s1
    80005854:	ffffd097          	auipc	ra,0xffffd
    80005858:	d64080e7          	jalr	-668(ra) # 800025b8 <_ZN6ThreaddlEPv>
    8000585c:	01813083          	ld	ra,24(sp)
    80005860:	01013403          	ld	s0,16(sp)
    80005864:	00813483          	ld	s1,8(sp)
    80005868:	02010113          	addi	sp,sp,32
    8000586c:	00008067          	ret

0000000080005870 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005870:	ff010113          	addi	sp,sp,-16
    80005874:	00113423          	sd	ra,8(sp)
    80005878:	00813023          	sd	s0,0(sp)
    8000587c:	01010413          	addi	s0,sp,16
    80005880:	00006797          	auipc	a5,0x6
    80005884:	d5078793          	addi	a5,a5,-688 # 8000b5d0 <_ZTV16ProducerKeyboard+0x10>
    80005888:	00f53023          	sd	a5,0(a0)
    8000588c:	ffffd097          	auipc	ra,0xffffd
    80005890:	84c080e7          	jalr	-1972(ra) # 800020d8 <_ZN6ThreadD1Ev>
    80005894:	00813083          	ld	ra,8(sp)
    80005898:	00013403          	ld	s0,0(sp)
    8000589c:	01010113          	addi	sp,sp,16
    800058a0:	00008067          	ret

00000000800058a4 <_ZN16ProducerKeyboardD0Ev>:
    800058a4:	fe010113          	addi	sp,sp,-32
    800058a8:	00113c23          	sd	ra,24(sp)
    800058ac:	00813823          	sd	s0,16(sp)
    800058b0:	00913423          	sd	s1,8(sp)
    800058b4:	02010413          	addi	s0,sp,32
    800058b8:	00050493          	mv	s1,a0
    800058bc:	00006797          	auipc	a5,0x6
    800058c0:	d1478793          	addi	a5,a5,-748 # 8000b5d0 <_ZTV16ProducerKeyboard+0x10>
    800058c4:	00f53023          	sd	a5,0(a0)
    800058c8:	ffffd097          	auipc	ra,0xffffd
    800058cc:	810080e7          	jalr	-2032(ra) # 800020d8 <_ZN6ThreadD1Ev>
    800058d0:	00048513          	mv	a0,s1
    800058d4:	ffffd097          	auipc	ra,0xffffd
    800058d8:	ce4080e7          	jalr	-796(ra) # 800025b8 <_ZN6ThreaddlEPv>
    800058dc:	01813083          	ld	ra,24(sp)
    800058e0:	01013403          	ld	s0,16(sp)
    800058e4:	00813483          	ld	s1,8(sp)
    800058e8:	02010113          	addi	sp,sp,32
    800058ec:	00008067          	ret

00000000800058f0 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    800058f0:	ff010113          	addi	sp,sp,-16
    800058f4:	00113423          	sd	ra,8(sp)
    800058f8:	00813023          	sd	s0,0(sp)
    800058fc:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005900:	08853583          	ld	a1,136(a0)
    80005904:	fffff097          	auipc	ra,0xfffff
    80005908:	7e4080e7          	jalr	2020(ra) # 800050e8 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    8000590c:	00813083          	ld	ra,8(sp)
    80005910:	00013403          	ld	s0,0(sp)
    80005914:	01010113          	addi	sp,sp,16
    80005918:	00008067          	ret

000000008000591c <_ZN12ProducerSync3runEv>:
    void run() override {
    8000591c:	ff010113          	addi	sp,sp,-16
    80005920:	00113423          	sd	ra,8(sp)
    80005924:	00813023          	sd	s0,0(sp)
    80005928:	01010413          	addi	s0,sp,16
        producer(td);
    8000592c:	08853583          	ld	a1,136(a0)
    80005930:	00000097          	auipc	ra,0x0
    80005934:	878080e7          	jalr	-1928(ra) # 800051a8 <_ZN12ProducerSync8producerEPv>
    }
    80005938:	00813083          	ld	ra,8(sp)
    8000593c:	00013403          	ld	s0,0(sp)
    80005940:	01010113          	addi	sp,sp,16
    80005944:	00008067          	ret

0000000080005948 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005948:	ff010113          	addi	sp,sp,-16
    8000594c:	00113423          	sd	ra,8(sp)
    80005950:	00813023          	sd	s0,0(sp)
    80005954:	01010413          	addi	s0,sp,16
        consumer(td);
    80005958:	08853583          	ld	a1,136(a0)
    8000595c:	00000097          	auipc	ra,0x0
    80005960:	8e0080e7          	jalr	-1824(ra) # 8000523c <_ZN12ConsumerSync8consumerEPv>
    }
    80005964:	00813083          	ld	ra,8(sp)
    80005968:	00013403          	ld	s0,0(sp)
    8000596c:	01010113          	addi	sp,sp,16
    80005970:	00008067          	ret

0000000080005974 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005974:	fe010113          	addi	sp,sp,-32
    80005978:	00113c23          	sd	ra,24(sp)
    8000597c:	00813823          	sd	s0,16(sp)
    80005980:	00913423          	sd	s1,8(sp)
    80005984:	02010413          	addi	s0,sp,32
    80005988:	00050493          	mv	s1,a0
    LOCK();
    8000598c:	00100613          	li	a2,1
    80005990:	00000593          	li	a1,0
    80005994:	00006517          	auipc	a0,0x6
    80005998:	de450513          	addi	a0,a0,-540 # 8000b778 <lockPrint>
    8000599c:	ffffc097          	auipc	ra,0xffffc
    800059a0:	9b0080e7          	jalr	-1616(ra) # 8000134c <copy_and_swap>
    800059a4:	00050863          	beqz	a0,800059b4 <_Z11printStringPKc+0x40>
    800059a8:	ffffc097          	auipc	ra,0xffffc
    800059ac:	cc8080e7          	jalr	-824(ra) # 80001670 <thread_dispatch>
    800059b0:	fddff06f          	j	8000598c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800059b4:	0004c503          	lbu	a0,0(s1)
    800059b8:	00050a63          	beqz	a0,800059cc <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800059bc:	ffffc097          	auipc	ra,0xffffc
    800059c0:	e4c080e7          	jalr	-436(ra) # 80001808 <putc>
        string++;
    800059c4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800059c8:	fedff06f          	j	800059b4 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    800059cc:	00000613          	li	a2,0
    800059d0:	00100593          	li	a1,1
    800059d4:	00006517          	auipc	a0,0x6
    800059d8:	da450513          	addi	a0,a0,-604 # 8000b778 <lockPrint>
    800059dc:	ffffc097          	auipc	ra,0xffffc
    800059e0:	970080e7          	jalr	-1680(ra) # 8000134c <copy_and_swap>
    800059e4:	fe0514e3          	bnez	a0,800059cc <_Z11printStringPKc+0x58>
}
    800059e8:	01813083          	ld	ra,24(sp)
    800059ec:	01013403          	ld	s0,16(sp)
    800059f0:	00813483          	ld	s1,8(sp)
    800059f4:	02010113          	addi	sp,sp,32
    800059f8:	00008067          	ret

00000000800059fc <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800059fc:	fd010113          	addi	sp,sp,-48
    80005a00:	02113423          	sd	ra,40(sp)
    80005a04:	02813023          	sd	s0,32(sp)
    80005a08:	00913c23          	sd	s1,24(sp)
    80005a0c:	01213823          	sd	s2,16(sp)
    80005a10:	01313423          	sd	s3,8(sp)
    80005a14:	01413023          	sd	s4,0(sp)
    80005a18:	03010413          	addi	s0,sp,48
    80005a1c:	00050993          	mv	s3,a0
    80005a20:	00058a13          	mv	s4,a1
    LOCK();
    80005a24:	00100613          	li	a2,1
    80005a28:	00000593          	li	a1,0
    80005a2c:	00006517          	auipc	a0,0x6
    80005a30:	d4c50513          	addi	a0,a0,-692 # 8000b778 <lockPrint>
    80005a34:	ffffc097          	auipc	ra,0xffffc
    80005a38:	918080e7          	jalr	-1768(ra) # 8000134c <copy_and_swap>
    80005a3c:	00050863          	beqz	a0,80005a4c <_Z9getStringPci+0x50>
    80005a40:	ffffc097          	auipc	ra,0xffffc
    80005a44:	c30080e7          	jalr	-976(ra) # 80001670 <thread_dispatch>
    80005a48:	fddff06f          	j	80005a24 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005a4c:	00000913          	li	s2,0
    80005a50:	00090493          	mv	s1,s2
    80005a54:	0019091b          	addiw	s2,s2,1
    80005a58:	03495a63          	bge	s2,s4,80005a8c <_Z9getStringPci+0x90>
        cc = getc();
    80005a5c:	ffffc097          	auipc	ra,0xffffc
    80005a60:	dec080e7          	jalr	-532(ra) # 80001848 <getc>
        if(cc < 1)
    80005a64:	02050463          	beqz	a0,80005a8c <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005a68:	009984b3          	add	s1,s3,s1
    80005a6c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005a70:	00a00793          	li	a5,10
    80005a74:	00f50a63          	beq	a0,a5,80005a88 <_Z9getStringPci+0x8c>
    80005a78:	00d00793          	li	a5,13
    80005a7c:	fcf51ae3          	bne	a0,a5,80005a50 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005a80:	00090493          	mv	s1,s2
    80005a84:	0080006f          	j	80005a8c <_Z9getStringPci+0x90>
    80005a88:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005a8c:	009984b3          	add	s1,s3,s1
    80005a90:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005a94:	00000613          	li	a2,0
    80005a98:	00100593          	li	a1,1
    80005a9c:	00006517          	auipc	a0,0x6
    80005aa0:	cdc50513          	addi	a0,a0,-804 # 8000b778 <lockPrint>
    80005aa4:	ffffc097          	auipc	ra,0xffffc
    80005aa8:	8a8080e7          	jalr	-1880(ra) # 8000134c <copy_and_swap>
    80005aac:	fe0514e3          	bnez	a0,80005a94 <_Z9getStringPci+0x98>
    return buf;
}
    80005ab0:	00098513          	mv	a0,s3
    80005ab4:	02813083          	ld	ra,40(sp)
    80005ab8:	02013403          	ld	s0,32(sp)
    80005abc:	01813483          	ld	s1,24(sp)
    80005ac0:	01013903          	ld	s2,16(sp)
    80005ac4:	00813983          	ld	s3,8(sp)
    80005ac8:	00013a03          	ld	s4,0(sp)
    80005acc:	03010113          	addi	sp,sp,48
    80005ad0:	00008067          	ret

0000000080005ad4 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005ad4:	ff010113          	addi	sp,sp,-16
    80005ad8:	00813423          	sd	s0,8(sp)
    80005adc:	01010413          	addi	s0,sp,16
    80005ae0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005ae4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005ae8:	0006c603          	lbu	a2,0(a3)
    80005aec:	fd06071b          	addiw	a4,a2,-48
    80005af0:	0ff77713          	andi	a4,a4,255
    80005af4:	00900793          	li	a5,9
    80005af8:	02e7e063          	bltu	a5,a4,80005b18 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005afc:	0025179b          	slliw	a5,a0,0x2
    80005b00:	00a787bb          	addw	a5,a5,a0
    80005b04:	0017979b          	slliw	a5,a5,0x1
    80005b08:	00168693          	addi	a3,a3,1
    80005b0c:	00c787bb          	addw	a5,a5,a2
    80005b10:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005b14:	fd5ff06f          	j	80005ae8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005b18:	00813403          	ld	s0,8(sp)
    80005b1c:	01010113          	addi	sp,sp,16
    80005b20:	00008067          	ret

0000000080005b24 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005b24:	fc010113          	addi	sp,sp,-64
    80005b28:	02113c23          	sd	ra,56(sp)
    80005b2c:	02813823          	sd	s0,48(sp)
    80005b30:	02913423          	sd	s1,40(sp)
    80005b34:	03213023          	sd	s2,32(sp)
    80005b38:	01313c23          	sd	s3,24(sp)
    80005b3c:	04010413          	addi	s0,sp,64
    80005b40:	00050493          	mv	s1,a0
    80005b44:	00058913          	mv	s2,a1
    80005b48:	00060993          	mv	s3,a2
    LOCK();
    80005b4c:	00100613          	li	a2,1
    80005b50:	00000593          	li	a1,0
    80005b54:	00006517          	auipc	a0,0x6
    80005b58:	c2450513          	addi	a0,a0,-988 # 8000b778 <lockPrint>
    80005b5c:	ffffb097          	auipc	ra,0xffffb
    80005b60:	7f0080e7          	jalr	2032(ra) # 8000134c <copy_and_swap>
    80005b64:	00050863          	beqz	a0,80005b74 <_Z8printIntiii+0x50>
    80005b68:	ffffc097          	auipc	ra,0xffffc
    80005b6c:	b08080e7          	jalr	-1272(ra) # 80001670 <thread_dispatch>
    80005b70:	fddff06f          	j	80005b4c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005b74:	00098463          	beqz	s3,80005b7c <_Z8printIntiii+0x58>
    80005b78:	0804c463          	bltz	s1,80005c00 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005b7c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005b80:	00000593          	li	a1,0
    }

    i = 0;
    80005b84:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005b88:	0009079b          	sext.w	a5,s2
    80005b8c:	0325773b          	remuw	a4,a0,s2
    80005b90:	00048613          	mv	a2,s1
    80005b94:	0014849b          	addiw	s1,s1,1
    80005b98:	02071693          	slli	a3,a4,0x20
    80005b9c:	0206d693          	srli	a3,a3,0x20
    80005ba0:	00006717          	auipc	a4,0x6
    80005ba4:	a9870713          	addi	a4,a4,-1384 # 8000b638 <digits>
    80005ba8:	00d70733          	add	a4,a4,a3
    80005bac:	00074683          	lbu	a3,0(a4)
    80005bb0:	fd040713          	addi	a4,s0,-48
    80005bb4:	00c70733          	add	a4,a4,a2
    80005bb8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005bbc:	0005071b          	sext.w	a4,a0
    80005bc0:	0325553b          	divuw	a0,a0,s2
    80005bc4:	fcf772e3          	bgeu	a4,a5,80005b88 <_Z8printIntiii+0x64>
    if(neg)
    80005bc8:	00058c63          	beqz	a1,80005be0 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005bcc:	fd040793          	addi	a5,s0,-48
    80005bd0:	009784b3          	add	s1,a5,s1
    80005bd4:	02d00793          	li	a5,45
    80005bd8:	fef48823          	sb	a5,-16(s1)
    80005bdc:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005be0:	fff4849b          	addiw	s1,s1,-1
    80005be4:	0204c463          	bltz	s1,80005c0c <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005be8:	fd040793          	addi	a5,s0,-48
    80005bec:	009787b3          	add	a5,a5,s1
    80005bf0:	ff07c503          	lbu	a0,-16(a5)
    80005bf4:	ffffc097          	auipc	ra,0xffffc
    80005bf8:	c14080e7          	jalr	-1004(ra) # 80001808 <putc>
    80005bfc:	fe5ff06f          	j	80005be0 <_Z8printIntiii+0xbc>
        x = -xx;
    80005c00:	4090053b          	negw	a0,s1
        neg = 1;
    80005c04:	00100593          	li	a1,1
        x = -xx;
    80005c08:	f7dff06f          	j	80005b84 <_Z8printIntiii+0x60>

    UNLOCK();
    80005c0c:	00000613          	li	a2,0
    80005c10:	00100593          	li	a1,1
    80005c14:	00006517          	auipc	a0,0x6
    80005c18:	b6450513          	addi	a0,a0,-1180 # 8000b778 <lockPrint>
    80005c1c:	ffffb097          	auipc	ra,0xffffb
    80005c20:	730080e7          	jalr	1840(ra) # 8000134c <copy_and_swap>
    80005c24:	fe0514e3          	bnez	a0,80005c0c <_Z8printIntiii+0xe8>
    80005c28:	03813083          	ld	ra,56(sp)
    80005c2c:	03013403          	ld	s0,48(sp)
    80005c30:	02813483          	ld	s1,40(sp)
    80005c34:	02013903          	ld	s2,32(sp)
    80005c38:	01813983          	ld	s3,24(sp)
    80005c3c:	04010113          	addi	sp,sp,64
    80005c40:	00008067          	ret

0000000080005c44 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005c44:	fd010113          	addi	sp,sp,-48
    80005c48:	02113423          	sd	ra,40(sp)
    80005c4c:	02813023          	sd	s0,32(sp)
    80005c50:	00913c23          	sd	s1,24(sp)
    80005c54:	01213823          	sd	s2,16(sp)
    80005c58:	01313423          	sd	s3,8(sp)
    80005c5c:	03010413          	addi	s0,sp,48
    80005c60:	00050493          	mv	s1,a0
    80005c64:	00058913          	mv	s2,a1
    80005c68:	0015879b          	addiw	a5,a1,1
    80005c6c:	0007851b          	sext.w	a0,a5
    80005c70:	00f4a023          	sw	a5,0(s1)
    80005c74:	0004a823          	sw	zero,16(s1)
    80005c78:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005c7c:	00251513          	slli	a0,a0,0x2
    80005c80:	ffffc097          	auipc	ra,0xffffc
    80005c84:	8a4080e7          	jalr	-1884(ra) # 80001524 <mem_alloc>
    80005c88:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005c8c:	02000513          	li	a0,32
    80005c90:	ffffc097          	auipc	ra,0xffffc
    80005c94:	e00080e7          	jalr	-512(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80005c98:	00050993          	mv	s3,a0
    80005c9c:	00000593          	li	a1,0
    80005ca0:	ffffc097          	auipc	ra,0xffffc
    80005ca4:	d84080e7          	jalr	-636(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    80005ca8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005cac:	02000513          	li	a0,32
    80005cb0:	ffffc097          	auipc	ra,0xffffc
    80005cb4:	de0080e7          	jalr	-544(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80005cb8:	00050993          	mv	s3,a0
    80005cbc:	00090593          	mv	a1,s2
    80005cc0:	ffffc097          	auipc	ra,0xffffc
    80005cc4:	d64080e7          	jalr	-668(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    80005cc8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005ccc:	02000513          	li	a0,32
    80005cd0:	ffffc097          	auipc	ra,0xffffc
    80005cd4:	dc0080e7          	jalr	-576(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80005cd8:	00050913          	mv	s2,a0
    80005cdc:	00100593          	li	a1,1
    80005ce0:	ffffc097          	auipc	ra,0xffffc
    80005ce4:	d44080e7          	jalr	-700(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    80005ce8:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005cec:	02000513          	li	a0,32
    80005cf0:	ffffc097          	auipc	ra,0xffffc
    80005cf4:	da0080e7          	jalr	-608(ra) # 80001a90 <_ZN9SemaphorenwEm>
    80005cf8:	00050913          	mv	s2,a0
    80005cfc:	00100593          	li	a1,1
    80005d00:	ffffc097          	auipc	ra,0xffffc
    80005d04:	d24080e7          	jalr	-732(ra) # 80001a24 <_ZN9SemaphoreC1Ej>
    80005d08:	0324b823          	sd	s2,48(s1)
}
    80005d0c:	02813083          	ld	ra,40(sp)
    80005d10:	02013403          	ld	s0,32(sp)
    80005d14:	01813483          	ld	s1,24(sp)
    80005d18:	01013903          	ld	s2,16(sp)
    80005d1c:	00813983          	ld	s3,8(sp)
    80005d20:	03010113          	addi	sp,sp,48
    80005d24:	00008067          	ret
    80005d28:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005d2c:	00098513          	mv	a0,s3
    80005d30:	ffffc097          	auipc	ra,0xffffc
    80005d34:	d98080e7          	jalr	-616(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80005d38:	00048513          	mv	a0,s1
    80005d3c:	00007097          	auipc	ra,0x7
    80005d40:	b1c080e7          	jalr	-1252(ra) # 8000c858 <_Unwind_Resume>
    80005d44:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005d48:	00098513          	mv	a0,s3
    80005d4c:	ffffc097          	auipc	ra,0xffffc
    80005d50:	d7c080e7          	jalr	-644(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80005d54:	00048513          	mv	a0,s1
    80005d58:	00007097          	auipc	ra,0x7
    80005d5c:	b00080e7          	jalr	-1280(ra) # 8000c858 <_Unwind_Resume>
    80005d60:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005d64:	00090513          	mv	a0,s2
    80005d68:	ffffc097          	auipc	ra,0xffffc
    80005d6c:	d60080e7          	jalr	-672(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80005d70:	00048513          	mv	a0,s1
    80005d74:	00007097          	auipc	ra,0x7
    80005d78:	ae4080e7          	jalr	-1308(ra) # 8000c858 <_Unwind_Resume>
    80005d7c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005d80:	00090513          	mv	a0,s2
    80005d84:	ffffc097          	auipc	ra,0xffffc
    80005d88:	d44080e7          	jalr	-700(ra) # 80001ac8 <_ZN9SemaphoredlEPv>
    80005d8c:	00048513          	mv	a0,s1
    80005d90:	00007097          	auipc	ra,0x7
    80005d94:	ac8080e7          	jalr	-1336(ra) # 8000c858 <_Unwind_Resume>

0000000080005d98 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005d98:	fe010113          	addi	sp,sp,-32
    80005d9c:	00113c23          	sd	ra,24(sp)
    80005da0:	00813823          	sd	s0,16(sp)
    80005da4:	00913423          	sd	s1,8(sp)
    80005da8:	01213023          	sd	s2,0(sp)
    80005dac:	02010413          	addi	s0,sp,32
    80005db0:	00050493          	mv	s1,a0
    80005db4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005db8:	01853503          	ld	a0,24(a0)
    80005dbc:	ffffc097          	auipc	ra,0xffffc
    80005dc0:	018080e7          	jalr	24(ra) # 80001dd4 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005dc4:	0304b503          	ld	a0,48(s1)
    80005dc8:	ffffc097          	auipc	ra,0xffffc
    80005dcc:	00c080e7          	jalr	12(ra) # 80001dd4 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005dd0:	0084b783          	ld	a5,8(s1)
    80005dd4:	0144a703          	lw	a4,20(s1)
    80005dd8:	00271713          	slli	a4,a4,0x2
    80005ddc:	00e787b3          	add	a5,a5,a4
    80005de0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005de4:	0144a783          	lw	a5,20(s1)
    80005de8:	0017879b          	addiw	a5,a5,1
    80005dec:	0004a703          	lw	a4,0(s1)
    80005df0:	02e7e7bb          	remw	a5,a5,a4
    80005df4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005df8:	0304b503          	ld	a0,48(s1)
    80005dfc:	ffffc097          	auipc	ra,0xffffc
    80005e00:	0c0080e7          	jalr	192(ra) # 80001ebc <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005e04:	0204b503          	ld	a0,32(s1)
    80005e08:	ffffc097          	auipc	ra,0xffffc
    80005e0c:	0b4080e7          	jalr	180(ra) # 80001ebc <_ZN9Semaphore6signalEv>

}
    80005e10:	01813083          	ld	ra,24(sp)
    80005e14:	01013403          	ld	s0,16(sp)
    80005e18:	00813483          	ld	s1,8(sp)
    80005e1c:	00013903          	ld	s2,0(sp)
    80005e20:	02010113          	addi	sp,sp,32
    80005e24:	00008067          	ret

0000000080005e28 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005e28:	fe010113          	addi	sp,sp,-32
    80005e2c:	00113c23          	sd	ra,24(sp)
    80005e30:	00813823          	sd	s0,16(sp)
    80005e34:	00913423          	sd	s1,8(sp)
    80005e38:	01213023          	sd	s2,0(sp)
    80005e3c:	02010413          	addi	s0,sp,32
    80005e40:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005e44:	02053503          	ld	a0,32(a0)
    80005e48:	ffffc097          	auipc	ra,0xffffc
    80005e4c:	f8c080e7          	jalr	-116(ra) # 80001dd4 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005e50:	0284b503          	ld	a0,40(s1)
    80005e54:	ffffc097          	auipc	ra,0xffffc
    80005e58:	f80080e7          	jalr	-128(ra) # 80001dd4 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005e5c:	0084b703          	ld	a4,8(s1)
    80005e60:	0104a783          	lw	a5,16(s1)
    80005e64:	00279693          	slli	a3,a5,0x2
    80005e68:	00d70733          	add	a4,a4,a3
    80005e6c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005e70:	0017879b          	addiw	a5,a5,1
    80005e74:	0004a703          	lw	a4,0(s1)
    80005e78:	02e7e7bb          	remw	a5,a5,a4
    80005e7c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005e80:	0284b503          	ld	a0,40(s1)
    80005e84:	ffffc097          	auipc	ra,0xffffc
    80005e88:	038080e7          	jalr	56(ra) # 80001ebc <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005e8c:	0184b503          	ld	a0,24(s1)
    80005e90:	ffffc097          	auipc	ra,0xffffc
    80005e94:	02c080e7          	jalr	44(ra) # 80001ebc <_ZN9Semaphore6signalEv>

    return ret;
}
    80005e98:	00090513          	mv	a0,s2
    80005e9c:	01813083          	ld	ra,24(sp)
    80005ea0:	01013403          	ld	s0,16(sp)
    80005ea4:	00813483          	ld	s1,8(sp)
    80005ea8:	00013903          	ld	s2,0(sp)
    80005eac:	02010113          	addi	sp,sp,32
    80005eb0:	00008067          	ret

0000000080005eb4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005eb4:	fe010113          	addi	sp,sp,-32
    80005eb8:	00113c23          	sd	ra,24(sp)
    80005ebc:	00813823          	sd	s0,16(sp)
    80005ec0:	00913423          	sd	s1,8(sp)
    80005ec4:	01213023          	sd	s2,0(sp)
    80005ec8:	02010413          	addi	s0,sp,32
    80005ecc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80005ed0:	02853503          	ld	a0,40(a0)
    80005ed4:	ffffc097          	auipc	ra,0xffffc
    80005ed8:	f00080e7          	jalr	-256(ra) # 80001dd4 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005edc:	0304b503          	ld	a0,48(s1)
    80005ee0:	ffffc097          	auipc	ra,0xffffc
    80005ee4:	ef4080e7          	jalr	-268(ra) # 80001dd4 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005ee8:	0144a783          	lw	a5,20(s1)
    80005eec:	0104a903          	lw	s2,16(s1)
    80005ef0:	0327ce63          	blt	a5,s2,80005f2c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005ef4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005ef8:	0304b503          	ld	a0,48(s1)
    80005efc:	ffffc097          	auipc	ra,0xffffc
    80005f00:	fc0080e7          	jalr	-64(ra) # 80001ebc <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005f04:	0284b503          	ld	a0,40(s1)
    80005f08:	ffffc097          	auipc	ra,0xffffc
    80005f0c:	fb4080e7          	jalr	-76(ra) # 80001ebc <_ZN9Semaphore6signalEv>

    return ret;
}
    80005f10:	00090513          	mv	a0,s2
    80005f14:	01813083          	ld	ra,24(sp)
    80005f18:	01013403          	ld	s0,16(sp)
    80005f1c:	00813483          	ld	s1,8(sp)
    80005f20:	00013903          	ld	s2,0(sp)
    80005f24:	02010113          	addi	sp,sp,32
    80005f28:	00008067          	ret
        ret = cap - head + tail;
    80005f2c:	0004a703          	lw	a4,0(s1)
    80005f30:	4127093b          	subw	s2,a4,s2
    80005f34:	00f9093b          	addw	s2,s2,a5
    80005f38:	fc1ff06f          	j	80005ef8 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005f3c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005f3c:	fe010113          	addi	sp,sp,-32
    80005f40:	00113c23          	sd	ra,24(sp)
    80005f44:	00813823          	sd	s0,16(sp)
    80005f48:	00913423          	sd	s1,8(sp)
    80005f4c:	02010413          	addi	s0,sp,32
    80005f50:	00050493          	mv	s1,a0
    80005f54:	00a00513          	li	a0,10
    80005f58:	00003097          	auipc	ra,0x3
    80005f5c:	af4080e7          	jalr	-1292(ra) # 80008a4c <__putc>
    printString("Buffer deleted!\n");
    80005f60:	00003517          	auipc	a0,0x3
    80005f64:	33850513          	addi	a0,a0,824 # 80009298 <CONSOLE_STATUS+0x288>
    80005f68:	00000097          	auipc	ra,0x0
    80005f6c:	a0c080e7          	jalr	-1524(ra) # 80005974 <_Z11printStringPKc>
    while (getCnt()) {
    80005f70:	00048513          	mv	a0,s1
    80005f74:	00000097          	auipc	ra,0x0
    80005f78:	f40080e7          	jalr	-192(ra) # 80005eb4 <_ZN9BufferCPP6getCntEv>
    80005f7c:	02050c63          	beqz	a0,80005fb4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005f80:	0084b783          	ld	a5,8(s1)
    80005f84:	0104a703          	lw	a4,16(s1)
    80005f88:	00271713          	slli	a4,a4,0x2
    80005f8c:	00e787b3          	add	a5,a5,a4
    80005f90:	0007c503          	lbu	a0,0(a5)
    80005f94:	00003097          	auipc	ra,0x3
    80005f98:	ab8080e7          	jalr	-1352(ra) # 80008a4c <__putc>
        head = (head + 1) % cap;
    80005f9c:	0104a783          	lw	a5,16(s1)
    80005fa0:	0017879b          	addiw	a5,a5,1
    80005fa4:	0004a703          	lw	a4,0(s1)
    80005fa8:	02e7e7bb          	remw	a5,a5,a4
    80005fac:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005fb0:	fc1ff06f          	j	80005f70 <_ZN9BufferCPPD1Ev+0x34>
    80005fb4:	02100513          	li	a0,33
    80005fb8:	00003097          	auipc	ra,0x3
    80005fbc:	a94080e7          	jalr	-1388(ra) # 80008a4c <__putc>
    80005fc0:	00a00513          	li	a0,10
    80005fc4:	00003097          	auipc	ra,0x3
    80005fc8:	a88080e7          	jalr	-1400(ra) # 80008a4c <__putc>
    mem_free(buffer);
    80005fcc:	0084b503          	ld	a0,8(s1)
    80005fd0:	ffffb097          	auipc	ra,0xffffb
    80005fd4:	59c080e7          	jalr	1436(ra) # 8000156c <mem_free>
    delete itemAvailable;
    80005fd8:	0204b503          	ld	a0,32(s1)
    80005fdc:	00050863          	beqz	a0,80005fec <_ZN9BufferCPPD1Ev+0xb0>
    80005fe0:	00053783          	ld	a5,0(a0)
    80005fe4:	0087b783          	ld	a5,8(a5)
    80005fe8:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005fec:	0184b503          	ld	a0,24(s1)
    80005ff0:	00050863          	beqz	a0,80006000 <_ZN9BufferCPPD1Ev+0xc4>
    80005ff4:	00053783          	ld	a5,0(a0)
    80005ff8:	0087b783          	ld	a5,8(a5)
    80005ffc:	000780e7          	jalr	a5
    delete mutexTail;
    80006000:	0304b503          	ld	a0,48(s1)
    80006004:	00050863          	beqz	a0,80006014 <_ZN9BufferCPPD1Ev+0xd8>
    80006008:	00053783          	ld	a5,0(a0)
    8000600c:	0087b783          	ld	a5,8(a5)
    80006010:	000780e7          	jalr	a5
    delete mutexHead;
    80006014:	0284b503          	ld	a0,40(s1)
    80006018:	00050863          	beqz	a0,80006028 <_ZN9BufferCPPD1Ev+0xec>
    8000601c:	00053783          	ld	a5,0(a0)
    80006020:	0087b783          	ld	a5,8(a5)
    80006024:	000780e7          	jalr	a5
}
    80006028:	01813083          	ld	ra,24(sp)
    8000602c:	01013403          	ld	s0,16(sp)
    80006030:	00813483          	ld	s1,8(sp)
    80006034:	02010113          	addi	sp,sp,32
    80006038:	00008067          	ret

000000008000603c <userMain>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

extern "C" void userMain() {
    8000603c:	ff010113          	addi	sp,sp,-16
    80006040:	00113423          	sd	ra,8(sp)
    80006044:	00813023          	sd	s0,0(sp)
    80006048:	01010413          	addi	s0,sp,16
    printString("Unesite broj testa? [1-7]\n");
    8000604c:	00003517          	auipc	a0,0x3
    80006050:	26450513          	addi	a0,a0,612 # 800092b0 <CONSOLE_STATUS+0x2a0>
    80006054:	00000097          	auipc	ra,0x0
    80006058:	920080e7          	jalr	-1760(ra) # 80005974 <_Z11printStringPKc>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
#endif
            break;
        case 2:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_CPP_API_test();
    8000605c:	ffffe097          	auipc	ra,0xffffe
    80006060:	ea0080e7          	jalr	-352(ra) # 80003efc <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006064:	00003517          	auipc	a0,0x3
    80006068:	26c50513          	addi	a0,a0,620 # 800092d0 <CONSOLE_STATUS+0x2c0>
    8000606c:	00000097          	auipc	ra,0x0
    80006070:	908080e7          	jalr	-1784(ra) # 80005974 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006074:	00813083          	ld	ra,8(sp)
    80006078:	00013403          	ld	s0,0(sp)
    8000607c:	01010113          	addi	sp,sp,16
    80006080:	00008067          	ret

0000000080006084 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006084:	fe010113          	addi	sp,sp,-32
    80006088:	00113c23          	sd	ra,24(sp)
    8000608c:	00813823          	sd	s0,16(sp)
    80006090:	00913423          	sd	s1,8(sp)
    80006094:	01213023          	sd	s2,0(sp)
    80006098:	02010413          	addi	s0,sp,32
    8000609c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800060a0:	00100793          	li	a5,1
    800060a4:	02a7f863          	bgeu	a5,a0,800060d4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800060a8:	00a00793          	li	a5,10
    800060ac:	02f577b3          	remu	a5,a0,a5
    800060b0:	02078e63          	beqz	a5,800060ec <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800060b4:	fff48513          	addi	a0,s1,-1
    800060b8:	00000097          	auipc	ra,0x0
    800060bc:	fcc080e7          	jalr	-52(ra) # 80006084 <_ZL9fibonaccim>
    800060c0:	00050913          	mv	s2,a0
    800060c4:	ffe48513          	addi	a0,s1,-2
    800060c8:	00000097          	auipc	ra,0x0
    800060cc:	fbc080e7          	jalr	-68(ra) # 80006084 <_ZL9fibonaccim>
    800060d0:	00a90533          	add	a0,s2,a0
}
    800060d4:	01813083          	ld	ra,24(sp)
    800060d8:	01013403          	ld	s0,16(sp)
    800060dc:	00813483          	ld	s1,8(sp)
    800060e0:	00013903          	ld	s2,0(sp)
    800060e4:	02010113          	addi	sp,sp,32
    800060e8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800060ec:	ffffb097          	auipc	ra,0xffffb
    800060f0:	584080e7          	jalr	1412(ra) # 80001670 <thread_dispatch>
    800060f4:	fc1ff06f          	j	800060b4 <_ZL9fibonaccim+0x30>

00000000800060f8 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800060f8:	fe010113          	addi	sp,sp,-32
    800060fc:	00113c23          	sd	ra,24(sp)
    80006100:	00813823          	sd	s0,16(sp)
    80006104:	00913423          	sd	s1,8(sp)
    80006108:	01213023          	sd	s2,0(sp)
    8000610c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006110:	00a00493          	li	s1,10
    80006114:	0400006f          	j	80006154 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006118:	00003517          	auipc	a0,0x3
    8000611c:	0e850513          	addi	a0,a0,232 # 80009200 <CONSOLE_STATUS+0x1f0>
    80006120:	00000097          	auipc	ra,0x0
    80006124:	854080e7          	jalr	-1964(ra) # 80005974 <_Z11printStringPKc>
    80006128:	00000613          	li	a2,0
    8000612c:	00a00593          	li	a1,10
    80006130:	00048513          	mv	a0,s1
    80006134:	00000097          	auipc	ra,0x0
    80006138:	9f0080e7          	jalr	-1552(ra) # 80005b24 <_Z8printIntiii>
    8000613c:	00003517          	auipc	a0,0x3
    80006140:	fb450513          	addi	a0,a0,-76 # 800090f0 <CONSOLE_STATUS+0xe0>
    80006144:	00000097          	auipc	ra,0x0
    80006148:	830080e7          	jalr	-2000(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000614c:	0014849b          	addiw	s1,s1,1
    80006150:	0ff4f493          	andi	s1,s1,255
    80006154:	00c00793          	li	a5,12
    80006158:	fc97f0e3          	bgeu	a5,s1,80006118 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000615c:	00003517          	auipc	a0,0x3
    80006160:	0ac50513          	addi	a0,a0,172 # 80009208 <CONSOLE_STATUS+0x1f8>
    80006164:	00000097          	auipc	ra,0x0
    80006168:	810080e7          	jalr	-2032(ra) # 80005974 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000616c:	00500313          	li	t1,5
    thread_dispatch();
    80006170:	ffffb097          	auipc	ra,0xffffb
    80006174:	500080e7          	jalr	1280(ra) # 80001670 <thread_dispatch>

    uint64 result = fibonacci(16);
    80006178:	01000513          	li	a0,16
    8000617c:	00000097          	auipc	ra,0x0
    80006180:	f08080e7          	jalr	-248(ra) # 80006084 <_ZL9fibonaccim>
    80006184:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006188:	00003517          	auipc	a0,0x3
    8000618c:	09050513          	addi	a0,a0,144 # 80009218 <CONSOLE_STATUS+0x208>
    80006190:	fffff097          	auipc	ra,0xfffff
    80006194:	7e4080e7          	jalr	2020(ra) # 80005974 <_Z11printStringPKc>
    80006198:	00000613          	li	a2,0
    8000619c:	00a00593          	li	a1,10
    800061a0:	0009051b          	sext.w	a0,s2
    800061a4:	00000097          	auipc	ra,0x0
    800061a8:	980080e7          	jalr	-1664(ra) # 80005b24 <_Z8printIntiii>
    800061ac:	00003517          	auipc	a0,0x3
    800061b0:	f4450513          	addi	a0,a0,-188 # 800090f0 <CONSOLE_STATUS+0xe0>
    800061b4:	fffff097          	auipc	ra,0xfffff
    800061b8:	7c0080e7          	jalr	1984(ra) # 80005974 <_Z11printStringPKc>
    800061bc:	0400006f          	j	800061fc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800061c0:	00003517          	auipc	a0,0x3
    800061c4:	04050513          	addi	a0,a0,64 # 80009200 <CONSOLE_STATUS+0x1f0>
    800061c8:	fffff097          	auipc	ra,0xfffff
    800061cc:	7ac080e7          	jalr	1964(ra) # 80005974 <_Z11printStringPKc>
    800061d0:	00000613          	li	a2,0
    800061d4:	00a00593          	li	a1,10
    800061d8:	00048513          	mv	a0,s1
    800061dc:	00000097          	auipc	ra,0x0
    800061e0:	948080e7          	jalr	-1720(ra) # 80005b24 <_Z8printIntiii>
    800061e4:	00003517          	auipc	a0,0x3
    800061e8:	f0c50513          	addi	a0,a0,-244 # 800090f0 <CONSOLE_STATUS+0xe0>
    800061ec:	fffff097          	auipc	ra,0xfffff
    800061f0:	788080e7          	jalr	1928(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800061f4:	0014849b          	addiw	s1,s1,1
    800061f8:	0ff4f493          	andi	s1,s1,255
    800061fc:	00f00793          	li	a5,15
    80006200:	fc97f0e3          	bgeu	a5,s1,800061c0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80006204:	00003517          	auipc	a0,0x3
    80006208:	02450513          	addi	a0,a0,36 # 80009228 <CONSOLE_STATUS+0x218>
    8000620c:	fffff097          	auipc	ra,0xfffff
    80006210:	768080e7          	jalr	1896(ra) # 80005974 <_Z11printStringPKc>
    finishedD = true;
    80006214:	00100793          	li	a5,1
    80006218:	00005717          	auipc	a4,0x5
    8000621c:	56f70423          	sb	a5,1384(a4) # 8000b780 <_ZL9finishedD>
    thread_dispatch();
    80006220:	ffffb097          	auipc	ra,0xffffb
    80006224:	450080e7          	jalr	1104(ra) # 80001670 <thread_dispatch>
}
    80006228:	01813083          	ld	ra,24(sp)
    8000622c:	01013403          	ld	s0,16(sp)
    80006230:	00813483          	ld	s1,8(sp)
    80006234:	00013903          	ld	s2,0(sp)
    80006238:	02010113          	addi	sp,sp,32
    8000623c:	00008067          	ret

0000000080006240 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006240:	fe010113          	addi	sp,sp,-32
    80006244:	00113c23          	sd	ra,24(sp)
    80006248:	00813823          	sd	s0,16(sp)
    8000624c:	00913423          	sd	s1,8(sp)
    80006250:	01213023          	sd	s2,0(sp)
    80006254:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006258:	00000493          	li	s1,0
    8000625c:	0400006f          	j	8000629c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80006260:	00003517          	auipc	a0,0x3
    80006264:	f7050513          	addi	a0,a0,-144 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80006268:	fffff097          	auipc	ra,0xfffff
    8000626c:	70c080e7          	jalr	1804(ra) # 80005974 <_Z11printStringPKc>
    80006270:	00000613          	li	a2,0
    80006274:	00a00593          	li	a1,10
    80006278:	00048513          	mv	a0,s1
    8000627c:	00000097          	auipc	ra,0x0
    80006280:	8a8080e7          	jalr	-1880(ra) # 80005b24 <_Z8printIntiii>
    80006284:	00003517          	auipc	a0,0x3
    80006288:	e6c50513          	addi	a0,a0,-404 # 800090f0 <CONSOLE_STATUS+0xe0>
    8000628c:	fffff097          	auipc	ra,0xfffff
    80006290:	6e8080e7          	jalr	1768(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006294:	0014849b          	addiw	s1,s1,1
    80006298:	0ff4f493          	andi	s1,s1,255
    8000629c:	00200793          	li	a5,2
    800062a0:	fc97f0e3          	bgeu	a5,s1,80006260 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800062a4:	00003517          	auipc	a0,0x3
    800062a8:	f3450513          	addi	a0,a0,-204 # 800091d8 <CONSOLE_STATUS+0x1c8>
    800062ac:	fffff097          	auipc	ra,0xfffff
    800062b0:	6c8080e7          	jalr	1736(ra) # 80005974 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800062b4:	00700313          	li	t1,7
    thread_dispatch();
    800062b8:	ffffb097          	auipc	ra,0xffffb
    800062bc:	3b8080e7          	jalr	952(ra) # 80001670 <thread_dispatch>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800062c0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800062c4:	00003517          	auipc	a0,0x3
    800062c8:	f2450513          	addi	a0,a0,-220 # 800091e8 <CONSOLE_STATUS+0x1d8>
    800062cc:	fffff097          	auipc	ra,0xfffff
    800062d0:	6a8080e7          	jalr	1704(ra) # 80005974 <_Z11printStringPKc>
    800062d4:	00000613          	li	a2,0
    800062d8:	00a00593          	li	a1,10
    800062dc:	0009051b          	sext.w	a0,s2
    800062e0:	00000097          	auipc	ra,0x0
    800062e4:	844080e7          	jalr	-1980(ra) # 80005b24 <_Z8printIntiii>
    800062e8:	00003517          	auipc	a0,0x3
    800062ec:	e0850513          	addi	a0,a0,-504 # 800090f0 <CONSOLE_STATUS+0xe0>
    800062f0:	fffff097          	auipc	ra,0xfffff
    800062f4:	684080e7          	jalr	1668(ra) # 80005974 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800062f8:	00c00513          	li	a0,12
    800062fc:	00000097          	auipc	ra,0x0
    80006300:	d88080e7          	jalr	-632(ra) # 80006084 <_ZL9fibonaccim>
    80006304:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006308:	00003517          	auipc	a0,0x3
    8000630c:	ee850513          	addi	a0,a0,-280 # 800091f0 <CONSOLE_STATUS+0x1e0>
    80006310:	fffff097          	auipc	ra,0xfffff
    80006314:	664080e7          	jalr	1636(ra) # 80005974 <_Z11printStringPKc>
    80006318:	00000613          	li	a2,0
    8000631c:	00a00593          	li	a1,10
    80006320:	0009051b          	sext.w	a0,s2
    80006324:	00000097          	auipc	ra,0x0
    80006328:	800080e7          	jalr	-2048(ra) # 80005b24 <_Z8printIntiii>
    8000632c:	00003517          	auipc	a0,0x3
    80006330:	dc450513          	addi	a0,a0,-572 # 800090f0 <CONSOLE_STATUS+0xe0>
    80006334:	fffff097          	auipc	ra,0xfffff
    80006338:	640080e7          	jalr	1600(ra) # 80005974 <_Z11printStringPKc>
    8000633c:	0400006f          	j	8000637c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006340:	00003517          	auipc	a0,0x3
    80006344:	e9050513          	addi	a0,a0,-368 # 800091d0 <CONSOLE_STATUS+0x1c0>
    80006348:	fffff097          	auipc	ra,0xfffff
    8000634c:	62c080e7          	jalr	1580(ra) # 80005974 <_Z11printStringPKc>
    80006350:	00000613          	li	a2,0
    80006354:	00a00593          	li	a1,10
    80006358:	00048513          	mv	a0,s1
    8000635c:	fffff097          	auipc	ra,0xfffff
    80006360:	7c8080e7          	jalr	1992(ra) # 80005b24 <_Z8printIntiii>
    80006364:	00003517          	auipc	a0,0x3
    80006368:	d8c50513          	addi	a0,a0,-628 # 800090f0 <CONSOLE_STATUS+0xe0>
    8000636c:	fffff097          	auipc	ra,0xfffff
    80006370:	608080e7          	jalr	1544(ra) # 80005974 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006374:	0014849b          	addiw	s1,s1,1
    80006378:	0ff4f493          	andi	s1,s1,255
    8000637c:	00500793          	li	a5,5
    80006380:	fc97f0e3          	bgeu	a5,s1,80006340 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006384:	00003517          	auipc	a0,0x3
    80006388:	e2450513          	addi	a0,a0,-476 # 800091a8 <CONSOLE_STATUS+0x198>
    8000638c:	fffff097          	auipc	ra,0xfffff
    80006390:	5e8080e7          	jalr	1512(ra) # 80005974 <_Z11printStringPKc>
    finishedC = true;
    80006394:	00100793          	li	a5,1
    80006398:	00005717          	auipc	a4,0x5
    8000639c:	3ef704a3          	sb	a5,1001(a4) # 8000b781 <_ZL9finishedC>
    thread_dispatch();
    800063a0:	ffffb097          	auipc	ra,0xffffb
    800063a4:	2d0080e7          	jalr	720(ra) # 80001670 <thread_dispatch>
}
    800063a8:	01813083          	ld	ra,24(sp)
    800063ac:	01013403          	ld	s0,16(sp)
    800063b0:	00813483          	ld	s1,8(sp)
    800063b4:	00013903          	ld	s2,0(sp)
    800063b8:	02010113          	addi	sp,sp,32
    800063bc:	00008067          	ret

00000000800063c0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800063c0:	fe010113          	addi	sp,sp,-32
    800063c4:	00113c23          	sd	ra,24(sp)
    800063c8:	00813823          	sd	s0,16(sp)
    800063cc:	00913423          	sd	s1,8(sp)
    800063d0:	01213023          	sd	s2,0(sp)
    800063d4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800063d8:	00000913          	li	s2,0
    800063dc:	0400006f          	j	8000641c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800063e0:	ffffb097          	auipc	ra,0xffffb
    800063e4:	290080e7          	jalr	656(ra) # 80001670 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    800063e8:	00148493          	addi	s1,s1,1
    800063ec:	000027b7          	lui	a5,0x2
    800063f0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800063f4:	0097ee63          	bltu	a5,s1,80006410 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800063f8:	00000713          	li	a4,0
    800063fc:	000077b7          	lui	a5,0x7
    80006400:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006404:	fce7eee3          	bltu	a5,a4,800063e0 <_ZL11workerBodyBPv+0x20>
    80006408:	00170713          	addi	a4,a4,1
    8000640c:	ff1ff06f          	j	800063fc <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006410:	00a00793          	li	a5,10
    80006414:	04f90663          	beq	s2,a5,80006460 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006418:	00190913          	addi	s2,s2,1
    8000641c:	00f00793          	li	a5,15
    80006420:	0527e463          	bltu	a5,s2,80006468 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80006424:	00003517          	auipc	a0,0x3
    80006428:	d9450513          	addi	a0,a0,-620 # 800091b8 <CONSOLE_STATUS+0x1a8>
    8000642c:	fffff097          	auipc	ra,0xfffff
    80006430:	548080e7          	jalr	1352(ra) # 80005974 <_Z11printStringPKc>
    80006434:	00000613          	li	a2,0
    80006438:	00a00593          	li	a1,10
    8000643c:	0009051b          	sext.w	a0,s2
    80006440:	fffff097          	auipc	ra,0xfffff
    80006444:	6e4080e7          	jalr	1764(ra) # 80005b24 <_Z8printIntiii>
    80006448:	00003517          	auipc	a0,0x3
    8000644c:	ca850513          	addi	a0,a0,-856 # 800090f0 <CONSOLE_STATUS+0xe0>
    80006450:	fffff097          	auipc	ra,0xfffff
    80006454:	524080e7          	jalr	1316(ra) # 80005974 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006458:	00000493          	li	s1,0
    8000645c:	f91ff06f          	j	800063ec <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006460:	14102ff3          	csrr	t6,sepc
    80006464:	fb5ff06f          	j	80006418 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006468:	00003517          	auipc	a0,0x3
    8000646c:	d5850513          	addi	a0,a0,-680 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80006470:	fffff097          	auipc	ra,0xfffff
    80006474:	504080e7          	jalr	1284(ra) # 80005974 <_Z11printStringPKc>
    finishedB = true;
    80006478:	00100793          	li	a5,1
    8000647c:	00005717          	auipc	a4,0x5
    80006480:	30f70323          	sb	a5,774(a4) # 8000b782 <_ZL9finishedB>
    thread_dispatch();
    80006484:	ffffb097          	auipc	ra,0xffffb
    80006488:	1ec080e7          	jalr	492(ra) # 80001670 <thread_dispatch>
}
    8000648c:	01813083          	ld	ra,24(sp)
    80006490:	01013403          	ld	s0,16(sp)
    80006494:	00813483          	ld	s1,8(sp)
    80006498:	00013903          	ld	s2,0(sp)
    8000649c:	02010113          	addi	sp,sp,32
    800064a0:	00008067          	ret

00000000800064a4 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800064a4:	fe010113          	addi	sp,sp,-32
    800064a8:	00113c23          	sd	ra,24(sp)
    800064ac:	00813823          	sd	s0,16(sp)
    800064b0:	00913423          	sd	s1,8(sp)
    800064b4:	01213023          	sd	s2,0(sp)
    800064b8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800064bc:	00000913          	li	s2,0
    800064c0:	0380006f          	j	800064f8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800064c4:	ffffb097          	auipc	ra,0xffffb
    800064c8:	1ac080e7          	jalr	428(ra) # 80001670 <thread_dispatch>
        for (uint64 j = 0; j < 10000; j++) {
    800064cc:	00148493          	addi	s1,s1,1
    800064d0:	000027b7          	lui	a5,0x2
    800064d4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800064d8:	0097ee63          	bltu	a5,s1,800064f4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800064dc:	00000713          	li	a4,0
    800064e0:	000077b7          	lui	a5,0x7
    800064e4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800064e8:	fce7eee3          	bltu	a5,a4,800064c4 <_ZL11workerBodyAPv+0x20>
    800064ec:	00170713          	addi	a4,a4,1
    800064f0:	ff1ff06f          	j	800064e0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800064f4:	00190913          	addi	s2,s2,1
    800064f8:	00900793          	li	a5,9
    800064fc:	0527e063          	bltu	a5,s2,8000653c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006500:	00003517          	auipc	a0,0x3
    80006504:	ca050513          	addi	a0,a0,-864 # 800091a0 <CONSOLE_STATUS+0x190>
    80006508:	fffff097          	auipc	ra,0xfffff
    8000650c:	46c080e7          	jalr	1132(ra) # 80005974 <_Z11printStringPKc>
    80006510:	00000613          	li	a2,0
    80006514:	00a00593          	li	a1,10
    80006518:	0009051b          	sext.w	a0,s2
    8000651c:	fffff097          	auipc	ra,0xfffff
    80006520:	608080e7          	jalr	1544(ra) # 80005b24 <_Z8printIntiii>
    80006524:	00003517          	auipc	a0,0x3
    80006528:	bcc50513          	addi	a0,a0,-1076 # 800090f0 <CONSOLE_STATUS+0xe0>
    8000652c:	fffff097          	auipc	ra,0xfffff
    80006530:	448080e7          	jalr	1096(ra) # 80005974 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006534:	00000493          	li	s1,0
    80006538:	f99ff06f          	j	800064d0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000653c:	00003517          	auipc	a0,0x3
    80006540:	c6c50513          	addi	a0,a0,-916 # 800091a8 <CONSOLE_STATUS+0x198>
    80006544:	fffff097          	auipc	ra,0xfffff
    80006548:	430080e7          	jalr	1072(ra) # 80005974 <_Z11printStringPKc>
    finishedA = true;
    8000654c:	00100793          	li	a5,1
    80006550:	00005717          	auipc	a4,0x5
    80006554:	22f709a3          	sb	a5,563(a4) # 8000b783 <_ZL9finishedA>
}
    80006558:	01813083          	ld	ra,24(sp)
    8000655c:	01013403          	ld	s0,16(sp)
    80006560:	00813483          	ld	s1,8(sp)
    80006564:	00013903          	ld	s2,0(sp)
    80006568:	02010113          	addi	sp,sp,32
    8000656c:	00008067          	ret

0000000080006570 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006570:	fe010113          	addi	sp,sp,-32
    80006574:	00113c23          	sd	ra,24(sp)
    80006578:	00813823          	sd	s0,16(sp)
    8000657c:	02010413          	addi	s0,sp,32
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006580:	00000613          	li	a2,0
    80006584:	00000597          	auipc	a1,0x0
    80006588:	f2058593          	addi	a1,a1,-224 # 800064a4 <_ZL11workerBodyAPv>
    8000658c:	fe040513          	addi	a0,s0,-32
    80006590:	ffffb097          	auipc	ra,0xffffb
    80006594:	028080e7          	jalr	40(ra) # 800015b8 <thread_create>
    printString("ThreadA created\n");
    80006598:	00003517          	auipc	a0,0x3
    8000659c:	ca050513          	addi	a0,a0,-864 # 80009238 <CONSOLE_STATUS+0x228>
    800065a0:	fffff097          	auipc	ra,0xfffff
    800065a4:	3d4080e7          	jalr	980(ra) # 80005974 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800065a8:	00000613          	li	a2,0
    800065ac:	00000597          	auipc	a1,0x0
    800065b0:	e1458593          	addi	a1,a1,-492 # 800063c0 <_ZL11workerBodyBPv>
    800065b4:	fe440513          	addi	a0,s0,-28
    800065b8:	ffffb097          	auipc	ra,0xffffb
    800065bc:	000080e7          	jalr	ra # 800015b8 <thread_create>
    printString("ThreadB created\n");
    800065c0:	00003517          	auipc	a0,0x3
    800065c4:	c9050513          	addi	a0,a0,-880 # 80009250 <CONSOLE_STATUS+0x240>
    800065c8:	fffff097          	auipc	ra,0xfffff
    800065cc:	3ac080e7          	jalr	940(ra) # 80005974 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800065d0:	00000613          	li	a2,0
    800065d4:	00000597          	auipc	a1,0x0
    800065d8:	c6c58593          	addi	a1,a1,-916 # 80006240 <_ZL11workerBodyCPv>
    800065dc:	fe840513          	addi	a0,s0,-24
    800065e0:	ffffb097          	auipc	ra,0xffffb
    800065e4:	fd8080e7          	jalr	-40(ra) # 800015b8 <thread_create>
    printString("ThreadC created\n");
    800065e8:	00003517          	auipc	a0,0x3
    800065ec:	c8050513          	addi	a0,a0,-896 # 80009268 <CONSOLE_STATUS+0x258>
    800065f0:	fffff097          	auipc	ra,0xfffff
    800065f4:	384080e7          	jalr	900(ra) # 80005974 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800065f8:	00000613          	li	a2,0
    800065fc:	00000597          	auipc	a1,0x0
    80006600:	afc58593          	addi	a1,a1,-1284 # 800060f8 <_ZL11workerBodyDPv>
    80006604:	fec40513          	addi	a0,s0,-20
    80006608:	ffffb097          	auipc	ra,0xffffb
    8000660c:	fb0080e7          	jalr	-80(ra) # 800015b8 <thread_create>
    printString("ThreadD created\n");
    80006610:	00003517          	auipc	a0,0x3
    80006614:	c7050513          	addi	a0,a0,-912 # 80009280 <CONSOLE_STATUS+0x270>
    80006618:	fffff097          	auipc	ra,0xfffff
    8000661c:	35c080e7          	jalr	860(ra) # 80005974 <_Z11printStringPKc>
    80006620:	00c0006f          	j	8000662c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006624:	ffffb097          	auipc	ra,0xffffb
    80006628:	04c080e7          	jalr	76(ra) # 80001670 <thread_dispatch>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000662c:	00005797          	auipc	a5,0x5
    80006630:	1577c783          	lbu	a5,343(a5) # 8000b783 <_ZL9finishedA>
    80006634:	fe0788e3          	beqz	a5,80006624 <_Z16System_Mode_testv+0xb4>
    80006638:	00005797          	auipc	a5,0x5
    8000663c:	14a7c783          	lbu	a5,330(a5) # 8000b782 <_ZL9finishedB>
    80006640:	fe0782e3          	beqz	a5,80006624 <_Z16System_Mode_testv+0xb4>
    80006644:	00005797          	auipc	a5,0x5
    80006648:	13d7c783          	lbu	a5,317(a5) # 8000b781 <_ZL9finishedC>
    8000664c:	fc078ce3          	beqz	a5,80006624 <_Z16System_Mode_testv+0xb4>
    80006650:	00005797          	auipc	a5,0x5
    80006654:	1307c783          	lbu	a5,304(a5) # 8000b780 <_ZL9finishedD>
    80006658:	fc0786e3          	beqz	a5,80006624 <_Z16System_Mode_testv+0xb4>
    }

}
    8000665c:	01813083          	ld	ra,24(sp)
    80006660:	01013403          	ld	s0,16(sp)
    80006664:	02010113          	addi	sp,sp,32
    80006668:	00008067          	ret

000000008000666c <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000666c:	fe010113          	addi	sp,sp,-32
    80006670:	00113c23          	sd	ra,24(sp)
    80006674:	00813823          	sd	s0,16(sp)
    80006678:	00913423          	sd	s1,8(sp)
    8000667c:	01213023          	sd	s2,0(sp)
    80006680:	02010413          	addi	s0,sp,32
    80006684:	00050493          	mv	s1,a0
    80006688:	00058913          	mv	s2,a1
    8000668c:	0015879b          	addiw	a5,a1,1
    80006690:	0007851b          	sext.w	a0,a5
    80006694:	00f4a023          	sw	a5,0(s1)
    80006698:	0004a823          	sw	zero,16(s1)
    8000669c:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800066a0:	00251513          	slli	a0,a0,0x2
    800066a4:	ffffb097          	auipc	ra,0xffffb
    800066a8:	e80080e7          	jalr	-384(ra) # 80001524 <mem_alloc>
    800066ac:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800066b0:	00000593          	li	a1,0
    800066b4:	01c48513          	addi	a0,s1,28
    800066b8:	ffffb097          	auipc	ra,0xffffb
    800066bc:	038080e7          	jalr	56(ra) # 800016f0 <sem_open>
    sem_open(&spaceAvailable, _cap);
    800066c0:	00090593          	mv	a1,s2
    800066c4:	01848513          	addi	a0,s1,24
    800066c8:	ffffb097          	auipc	ra,0xffffb
    800066cc:	028080e7          	jalr	40(ra) # 800016f0 <sem_open>
    sem_open(&mutexHead, 1);
    800066d0:	00100593          	li	a1,1
    800066d4:	02048513          	addi	a0,s1,32
    800066d8:	ffffb097          	auipc	ra,0xffffb
    800066dc:	018080e7          	jalr	24(ra) # 800016f0 <sem_open>
    sem_open(&mutexTail, 1);
    800066e0:	00100593          	li	a1,1
    800066e4:	02448513          	addi	a0,s1,36
    800066e8:	ffffb097          	auipc	ra,0xffffb
    800066ec:	008080e7          	jalr	8(ra) # 800016f0 <sem_open>
}
    800066f0:	01813083          	ld	ra,24(sp)
    800066f4:	01013403          	ld	s0,16(sp)
    800066f8:	00813483          	ld	s1,8(sp)
    800066fc:	00013903          	ld	s2,0(sp)
    80006700:	02010113          	addi	sp,sp,32
    80006704:	00008067          	ret

0000000080006708 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006708:	fe010113          	addi	sp,sp,-32
    8000670c:	00113c23          	sd	ra,24(sp)
    80006710:	00813823          	sd	s0,16(sp)
    80006714:	00913423          	sd	s1,8(sp)
    80006718:	01213023          	sd	s2,0(sp)
    8000671c:	02010413          	addi	s0,sp,32
    80006720:	00050493          	mv	s1,a0
    80006724:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006728:	01852503          	lw	a0,24(a0)
    8000672c:	ffffb097          	auipc	ra,0xffffb
    80006730:	014080e7          	jalr	20(ra) # 80001740 <sem_wait>

    sem_wait(mutexTail);
    80006734:	0244a503          	lw	a0,36(s1)
    80006738:	ffffb097          	auipc	ra,0xffffb
    8000673c:	008080e7          	jalr	8(ra) # 80001740 <sem_wait>
    buffer[tail] = val;
    80006740:	0084b783          	ld	a5,8(s1)
    80006744:	0144a703          	lw	a4,20(s1)
    80006748:	00271713          	slli	a4,a4,0x2
    8000674c:	00e787b3          	add	a5,a5,a4
    80006750:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006754:	0144a783          	lw	a5,20(s1)
    80006758:	0017879b          	addiw	a5,a5,1
    8000675c:	0004a703          	lw	a4,0(s1)
    80006760:	02e7e7bb          	remw	a5,a5,a4
    80006764:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006768:	0244a503          	lw	a0,36(s1)
    8000676c:	ffffb097          	auipc	ra,0xffffb
    80006770:	01c080e7          	jalr	28(ra) # 80001788 <sem_signal>

    sem_signal(itemAvailable);
    80006774:	01c4a503          	lw	a0,28(s1)
    80006778:	ffffb097          	auipc	ra,0xffffb
    8000677c:	010080e7          	jalr	16(ra) # 80001788 <sem_signal>

}
    80006780:	01813083          	ld	ra,24(sp)
    80006784:	01013403          	ld	s0,16(sp)
    80006788:	00813483          	ld	s1,8(sp)
    8000678c:	00013903          	ld	s2,0(sp)
    80006790:	02010113          	addi	sp,sp,32
    80006794:	00008067          	ret

0000000080006798 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006798:	fe010113          	addi	sp,sp,-32
    8000679c:	00113c23          	sd	ra,24(sp)
    800067a0:	00813823          	sd	s0,16(sp)
    800067a4:	00913423          	sd	s1,8(sp)
    800067a8:	01213023          	sd	s2,0(sp)
    800067ac:	02010413          	addi	s0,sp,32
    800067b0:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800067b4:	01c52503          	lw	a0,28(a0)
    800067b8:	ffffb097          	auipc	ra,0xffffb
    800067bc:	f88080e7          	jalr	-120(ra) # 80001740 <sem_wait>

    sem_wait(mutexHead);
    800067c0:	0204a503          	lw	a0,32(s1)
    800067c4:	ffffb097          	auipc	ra,0xffffb
    800067c8:	f7c080e7          	jalr	-132(ra) # 80001740 <sem_wait>

    int ret = buffer[head];
    800067cc:	0084b703          	ld	a4,8(s1)
    800067d0:	0104a783          	lw	a5,16(s1)
    800067d4:	00279693          	slli	a3,a5,0x2
    800067d8:	00d70733          	add	a4,a4,a3
    800067dc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800067e0:	0017879b          	addiw	a5,a5,1
    800067e4:	0004a703          	lw	a4,0(s1)
    800067e8:	02e7e7bb          	remw	a5,a5,a4
    800067ec:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800067f0:	0204a503          	lw	a0,32(s1)
    800067f4:	ffffb097          	auipc	ra,0xffffb
    800067f8:	f94080e7          	jalr	-108(ra) # 80001788 <sem_signal>

    sem_signal(spaceAvailable);
    800067fc:	0184a503          	lw	a0,24(s1)
    80006800:	ffffb097          	auipc	ra,0xffffb
    80006804:	f88080e7          	jalr	-120(ra) # 80001788 <sem_signal>

    return ret;
}
    80006808:	00090513          	mv	a0,s2
    8000680c:	01813083          	ld	ra,24(sp)
    80006810:	01013403          	ld	s0,16(sp)
    80006814:	00813483          	ld	s1,8(sp)
    80006818:	00013903          	ld	s2,0(sp)
    8000681c:	02010113          	addi	sp,sp,32
    80006820:	00008067          	ret

0000000080006824 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006824:	fe010113          	addi	sp,sp,-32
    80006828:	00113c23          	sd	ra,24(sp)
    8000682c:	00813823          	sd	s0,16(sp)
    80006830:	00913423          	sd	s1,8(sp)
    80006834:	01213023          	sd	s2,0(sp)
    80006838:	02010413          	addi	s0,sp,32
    8000683c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006840:	02052503          	lw	a0,32(a0)
    80006844:	ffffb097          	auipc	ra,0xffffb
    80006848:	efc080e7          	jalr	-260(ra) # 80001740 <sem_wait>
    sem_wait(mutexTail);
    8000684c:	0244a503          	lw	a0,36(s1)
    80006850:	ffffb097          	auipc	ra,0xffffb
    80006854:	ef0080e7          	jalr	-272(ra) # 80001740 <sem_wait>

    if (tail >= head) {
    80006858:	0144a783          	lw	a5,20(s1)
    8000685c:	0104a903          	lw	s2,16(s1)
    80006860:	0327ce63          	blt	a5,s2,8000689c <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006864:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006868:	0244a503          	lw	a0,36(s1)
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	f1c080e7          	jalr	-228(ra) # 80001788 <sem_signal>
    sem_signal(mutexHead);
    80006874:	0204a503          	lw	a0,32(s1)
    80006878:	ffffb097          	auipc	ra,0xffffb
    8000687c:	f10080e7          	jalr	-240(ra) # 80001788 <sem_signal>

    return ret;
}
    80006880:	00090513          	mv	a0,s2
    80006884:	01813083          	ld	ra,24(sp)
    80006888:	01013403          	ld	s0,16(sp)
    8000688c:	00813483          	ld	s1,8(sp)
    80006890:	00013903          	ld	s2,0(sp)
    80006894:	02010113          	addi	sp,sp,32
    80006898:	00008067          	ret
        ret = cap - head + tail;
    8000689c:	0004a703          	lw	a4,0(s1)
    800068a0:	4127093b          	subw	s2,a4,s2
    800068a4:	00f9093b          	addw	s2,s2,a5
    800068a8:	fc1ff06f          	j	80006868 <_ZN6Buffer6getCntEv+0x44>

00000000800068ac <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800068ac:	fe010113          	addi	sp,sp,-32
    800068b0:	00113c23          	sd	ra,24(sp)
    800068b4:	00813823          	sd	s0,16(sp)
    800068b8:	00913423          	sd	s1,8(sp)
    800068bc:	02010413          	addi	s0,sp,32
    800068c0:	00050493          	mv	s1,a0
    putc('\n');
    800068c4:	00a00513          	li	a0,10
    800068c8:	ffffb097          	auipc	ra,0xffffb
    800068cc:	f40080e7          	jalr	-192(ra) # 80001808 <putc>
    printString("Buffer deleted!\n");
    800068d0:	00003517          	auipc	a0,0x3
    800068d4:	9c850513          	addi	a0,a0,-1592 # 80009298 <CONSOLE_STATUS+0x288>
    800068d8:	fffff097          	auipc	ra,0xfffff
    800068dc:	09c080e7          	jalr	156(ra) # 80005974 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800068e0:	00048513          	mv	a0,s1
    800068e4:	00000097          	auipc	ra,0x0
    800068e8:	f40080e7          	jalr	-192(ra) # 80006824 <_ZN6Buffer6getCntEv>
    800068ec:	02a05c63          	blez	a0,80006924 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800068f0:	0084b783          	ld	a5,8(s1)
    800068f4:	0104a703          	lw	a4,16(s1)
    800068f8:	00271713          	slli	a4,a4,0x2
    800068fc:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006900:	0007c503          	lbu	a0,0(a5)
    80006904:	ffffb097          	auipc	ra,0xffffb
    80006908:	f04080e7          	jalr	-252(ra) # 80001808 <putc>
        head = (head + 1) % cap;
    8000690c:	0104a783          	lw	a5,16(s1)
    80006910:	0017879b          	addiw	a5,a5,1
    80006914:	0004a703          	lw	a4,0(s1)
    80006918:	02e7e7bb          	remw	a5,a5,a4
    8000691c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006920:	fc1ff06f          	j	800068e0 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006924:	02100513          	li	a0,33
    80006928:	ffffb097          	auipc	ra,0xffffb
    8000692c:	ee0080e7          	jalr	-288(ra) # 80001808 <putc>
    putc('\n');
    80006930:	00a00513          	li	a0,10
    80006934:	ffffb097          	auipc	ra,0xffffb
    80006938:	ed4080e7          	jalr	-300(ra) # 80001808 <putc>
    mem_free(buffer);
    8000693c:	0084b503          	ld	a0,8(s1)
    80006940:	ffffb097          	auipc	ra,0xffffb
    80006944:	c2c080e7          	jalr	-980(ra) # 8000156c <mem_free>
    sem_close(itemAvailable);
    80006948:	01c4a503          	lw	a0,28(s1)
    8000694c:	ffffb097          	auipc	ra,0xffffb
    80006950:	e7c080e7          	jalr	-388(ra) # 800017c8 <sem_close>
    sem_close(spaceAvailable);
    80006954:	0184a503          	lw	a0,24(s1)
    80006958:	ffffb097          	auipc	ra,0xffffb
    8000695c:	e70080e7          	jalr	-400(ra) # 800017c8 <sem_close>
    sem_close(mutexTail);
    80006960:	0244a503          	lw	a0,36(s1)
    80006964:	ffffb097          	auipc	ra,0xffffb
    80006968:	e64080e7          	jalr	-412(ra) # 800017c8 <sem_close>
    sem_close(mutexHead);
    8000696c:	0204a503          	lw	a0,32(s1)
    80006970:	ffffb097          	auipc	ra,0xffffb
    80006974:	e58080e7          	jalr	-424(ra) # 800017c8 <sem_close>
}
    80006978:	01813083          	ld	ra,24(sp)
    8000697c:	01013403          	ld	s0,16(sp)
    80006980:	00813483          	ld	s1,8(sp)
    80006984:	02010113          	addi	sp,sp,32
    80006988:	00008067          	ret

000000008000698c <start>:
    8000698c:	ff010113          	addi	sp,sp,-16
    80006990:	00813423          	sd	s0,8(sp)
    80006994:	01010413          	addi	s0,sp,16
    80006998:	300027f3          	csrr	a5,mstatus
    8000699c:	ffffe737          	lui	a4,0xffffe
    800069a0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1e0f>
    800069a4:	00e7f7b3          	and	a5,a5,a4
    800069a8:	00001737          	lui	a4,0x1
    800069ac:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800069b0:	00e7e7b3          	or	a5,a5,a4
    800069b4:	30079073          	csrw	mstatus,a5
    800069b8:	00000797          	auipc	a5,0x0
    800069bc:	16078793          	addi	a5,a5,352 # 80006b18 <system_main>
    800069c0:	34179073          	csrw	mepc,a5
    800069c4:	00000793          	li	a5,0
    800069c8:	18079073          	csrw	satp,a5
    800069cc:	000107b7          	lui	a5,0x10
    800069d0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800069d4:	30279073          	csrw	medeleg,a5
    800069d8:	30379073          	csrw	mideleg,a5
    800069dc:	104027f3          	csrr	a5,sie
    800069e0:	2227e793          	ori	a5,a5,546
    800069e4:	10479073          	csrw	sie,a5
    800069e8:	fff00793          	li	a5,-1
    800069ec:	00a7d793          	srli	a5,a5,0xa
    800069f0:	3b079073          	csrw	pmpaddr0,a5
    800069f4:	00f00793          	li	a5,15
    800069f8:	3a079073          	csrw	pmpcfg0,a5
    800069fc:	f14027f3          	csrr	a5,mhartid
    80006a00:	0200c737          	lui	a4,0x200c
    80006a04:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006a08:	0007869b          	sext.w	a3,a5
    80006a0c:	00269713          	slli	a4,a3,0x2
    80006a10:	000f4637          	lui	a2,0xf4
    80006a14:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006a18:	00d70733          	add	a4,a4,a3
    80006a1c:	0037979b          	slliw	a5,a5,0x3
    80006a20:	020046b7          	lui	a3,0x2004
    80006a24:	00d787b3          	add	a5,a5,a3
    80006a28:	00c585b3          	add	a1,a1,a2
    80006a2c:	00371693          	slli	a3,a4,0x3
    80006a30:	00005717          	auipc	a4,0x5
    80006a34:	d6070713          	addi	a4,a4,-672 # 8000b790 <timer_scratch>
    80006a38:	00b7b023          	sd	a1,0(a5)
    80006a3c:	00d70733          	add	a4,a4,a3
    80006a40:	00f73c23          	sd	a5,24(a4)
    80006a44:	02c73023          	sd	a2,32(a4)
    80006a48:	34071073          	csrw	mscratch,a4
    80006a4c:	00000797          	auipc	a5,0x0
    80006a50:	6e478793          	addi	a5,a5,1764 # 80007130 <timervec>
    80006a54:	30579073          	csrw	mtvec,a5
    80006a58:	300027f3          	csrr	a5,mstatus
    80006a5c:	0087e793          	ori	a5,a5,8
    80006a60:	30079073          	csrw	mstatus,a5
    80006a64:	304027f3          	csrr	a5,mie
    80006a68:	0807e793          	ori	a5,a5,128
    80006a6c:	30479073          	csrw	mie,a5
    80006a70:	f14027f3          	csrr	a5,mhartid
    80006a74:	0007879b          	sext.w	a5,a5
    80006a78:	00078213          	mv	tp,a5
    80006a7c:	30200073          	mret
    80006a80:	00813403          	ld	s0,8(sp)
    80006a84:	01010113          	addi	sp,sp,16
    80006a88:	00008067          	ret

0000000080006a8c <timerinit>:
    80006a8c:	ff010113          	addi	sp,sp,-16
    80006a90:	00813423          	sd	s0,8(sp)
    80006a94:	01010413          	addi	s0,sp,16
    80006a98:	f14027f3          	csrr	a5,mhartid
    80006a9c:	0200c737          	lui	a4,0x200c
    80006aa0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006aa4:	0007869b          	sext.w	a3,a5
    80006aa8:	00269713          	slli	a4,a3,0x2
    80006aac:	000f4637          	lui	a2,0xf4
    80006ab0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006ab4:	00d70733          	add	a4,a4,a3
    80006ab8:	0037979b          	slliw	a5,a5,0x3
    80006abc:	020046b7          	lui	a3,0x2004
    80006ac0:	00d787b3          	add	a5,a5,a3
    80006ac4:	00c585b3          	add	a1,a1,a2
    80006ac8:	00371693          	slli	a3,a4,0x3
    80006acc:	00005717          	auipc	a4,0x5
    80006ad0:	cc470713          	addi	a4,a4,-828 # 8000b790 <timer_scratch>
    80006ad4:	00b7b023          	sd	a1,0(a5)
    80006ad8:	00d70733          	add	a4,a4,a3
    80006adc:	00f73c23          	sd	a5,24(a4)
    80006ae0:	02c73023          	sd	a2,32(a4)
    80006ae4:	34071073          	csrw	mscratch,a4
    80006ae8:	00000797          	auipc	a5,0x0
    80006aec:	64878793          	addi	a5,a5,1608 # 80007130 <timervec>
    80006af0:	30579073          	csrw	mtvec,a5
    80006af4:	300027f3          	csrr	a5,mstatus
    80006af8:	0087e793          	ori	a5,a5,8
    80006afc:	30079073          	csrw	mstatus,a5
    80006b00:	304027f3          	csrr	a5,mie
    80006b04:	0807e793          	ori	a5,a5,128
    80006b08:	30479073          	csrw	mie,a5
    80006b0c:	00813403          	ld	s0,8(sp)
    80006b10:	01010113          	addi	sp,sp,16
    80006b14:	00008067          	ret

0000000080006b18 <system_main>:
    80006b18:	fe010113          	addi	sp,sp,-32
    80006b1c:	00813823          	sd	s0,16(sp)
    80006b20:	00913423          	sd	s1,8(sp)
    80006b24:	00113c23          	sd	ra,24(sp)
    80006b28:	02010413          	addi	s0,sp,32
    80006b2c:	00000097          	auipc	ra,0x0
    80006b30:	0c4080e7          	jalr	196(ra) # 80006bf0 <cpuid>
    80006b34:	00005497          	auipc	s1,0x5
    80006b38:	b7c48493          	addi	s1,s1,-1156 # 8000b6b0 <started>
    80006b3c:	02050263          	beqz	a0,80006b60 <system_main+0x48>
    80006b40:	0004a783          	lw	a5,0(s1)
    80006b44:	0007879b          	sext.w	a5,a5
    80006b48:	fe078ce3          	beqz	a5,80006b40 <system_main+0x28>
    80006b4c:	0ff0000f          	fence
    80006b50:	00002517          	auipc	a0,0x2
    80006b54:	7f050513          	addi	a0,a0,2032 # 80009340 <CONSOLE_STATUS+0x330>
    80006b58:	00001097          	auipc	ra,0x1
    80006b5c:	a74080e7          	jalr	-1420(ra) # 800075cc <panic>
    80006b60:	00001097          	auipc	ra,0x1
    80006b64:	9c8080e7          	jalr	-1592(ra) # 80007528 <consoleinit>
    80006b68:	00001097          	auipc	ra,0x1
    80006b6c:	154080e7          	jalr	340(ra) # 80007cbc <printfinit>
    80006b70:	00002517          	auipc	a0,0x2
    80006b74:	58050513          	addi	a0,a0,1408 # 800090f0 <CONSOLE_STATUS+0xe0>
    80006b78:	00001097          	auipc	ra,0x1
    80006b7c:	ab0080e7          	jalr	-1360(ra) # 80007628 <__printf>
    80006b80:	00002517          	auipc	a0,0x2
    80006b84:	79050513          	addi	a0,a0,1936 # 80009310 <CONSOLE_STATUS+0x300>
    80006b88:	00001097          	auipc	ra,0x1
    80006b8c:	aa0080e7          	jalr	-1376(ra) # 80007628 <__printf>
    80006b90:	00002517          	auipc	a0,0x2
    80006b94:	56050513          	addi	a0,a0,1376 # 800090f0 <CONSOLE_STATUS+0xe0>
    80006b98:	00001097          	auipc	ra,0x1
    80006b9c:	a90080e7          	jalr	-1392(ra) # 80007628 <__printf>
    80006ba0:	00001097          	auipc	ra,0x1
    80006ba4:	4a8080e7          	jalr	1192(ra) # 80008048 <kinit>
    80006ba8:	00000097          	auipc	ra,0x0
    80006bac:	148080e7          	jalr	328(ra) # 80006cf0 <trapinit>
    80006bb0:	00000097          	auipc	ra,0x0
    80006bb4:	16c080e7          	jalr	364(ra) # 80006d1c <trapinithart>
    80006bb8:	00000097          	auipc	ra,0x0
    80006bbc:	5b8080e7          	jalr	1464(ra) # 80007170 <plicinit>
    80006bc0:	00000097          	auipc	ra,0x0
    80006bc4:	5d8080e7          	jalr	1496(ra) # 80007198 <plicinithart>
    80006bc8:	00000097          	auipc	ra,0x0
    80006bcc:	078080e7          	jalr	120(ra) # 80006c40 <userinit>
    80006bd0:	0ff0000f          	fence
    80006bd4:	00100793          	li	a5,1
    80006bd8:	00002517          	auipc	a0,0x2
    80006bdc:	75050513          	addi	a0,a0,1872 # 80009328 <CONSOLE_STATUS+0x318>
    80006be0:	00f4a023          	sw	a5,0(s1)
    80006be4:	00001097          	auipc	ra,0x1
    80006be8:	a44080e7          	jalr	-1468(ra) # 80007628 <__printf>
    80006bec:	0000006f          	j	80006bec <system_main+0xd4>

0000000080006bf0 <cpuid>:
    80006bf0:	ff010113          	addi	sp,sp,-16
    80006bf4:	00813423          	sd	s0,8(sp)
    80006bf8:	01010413          	addi	s0,sp,16
    80006bfc:	00020513          	mv	a0,tp
    80006c00:	00813403          	ld	s0,8(sp)
    80006c04:	0005051b          	sext.w	a0,a0
    80006c08:	01010113          	addi	sp,sp,16
    80006c0c:	00008067          	ret

0000000080006c10 <mycpu>:
    80006c10:	ff010113          	addi	sp,sp,-16
    80006c14:	00813423          	sd	s0,8(sp)
    80006c18:	01010413          	addi	s0,sp,16
    80006c1c:	00020793          	mv	a5,tp
    80006c20:	00813403          	ld	s0,8(sp)
    80006c24:	0007879b          	sext.w	a5,a5
    80006c28:	00779793          	slli	a5,a5,0x7
    80006c2c:	00006517          	auipc	a0,0x6
    80006c30:	b9450513          	addi	a0,a0,-1132 # 8000c7c0 <cpus>
    80006c34:	00f50533          	add	a0,a0,a5
    80006c38:	01010113          	addi	sp,sp,16
    80006c3c:	00008067          	ret

0000000080006c40 <userinit>:
    80006c40:	ff010113          	addi	sp,sp,-16
    80006c44:	00813423          	sd	s0,8(sp)
    80006c48:	01010413          	addi	s0,sp,16
    80006c4c:	00813403          	ld	s0,8(sp)
    80006c50:	01010113          	addi	sp,sp,16
    80006c54:	ffffc317          	auipc	t1,0xffffc
    80006c58:	dec30067          	jr	-532(t1) # 80002a40 <main>

0000000080006c5c <either_copyout>:
    80006c5c:	ff010113          	addi	sp,sp,-16
    80006c60:	00813023          	sd	s0,0(sp)
    80006c64:	00113423          	sd	ra,8(sp)
    80006c68:	01010413          	addi	s0,sp,16
    80006c6c:	02051663          	bnez	a0,80006c98 <either_copyout+0x3c>
    80006c70:	00058513          	mv	a0,a1
    80006c74:	00060593          	mv	a1,a2
    80006c78:	0006861b          	sext.w	a2,a3
    80006c7c:	00002097          	auipc	ra,0x2
    80006c80:	c58080e7          	jalr	-936(ra) # 800088d4 <__memmove>
    80006c84:	00813083          	ld	ra,8(sp)
    80006c88:	00013403          	ld	s0,0(sp)
    80006c8c:	00000513          	li	a0,0
    80006c90:	01010113          	addi	sp,sp,16
    80006c94:	00008067          	ret
    80006c98:	00002517          	auipc	a0,0x2
    80006c9c:	6d050513          	addi	a0,a0,1744 # 80009368 <CONSOLE_STATUS+0x358>
    80006ca0:	00001097          	auipc	ra,0x1
    80006ca4:	92c080e7          	jalr	-1748(ra) # 800075cc <panic>

0000000080006ca8 <either_copyin>:
    80006ca8:	ff010113          	addi	sp,sp,-16
    80006cac:	00813023          	sd	s0,0(sp)
    80006cb0:	00113423          	sd	ra,8(sp)
    80006cb4:	01010413          	addi	s0,sp,16
    80006cb8:	02059463          	bnez	a1,80006ce0 <either_copyin+0x38>
    80006cbc:	00060593          	mv	a1,a2
    80006cc0:	0006861b          	sext.w	a2,a3
    80006cc4:	00002097          	auipc	ra,0x2
    80006cc8:	c10080e7          	jalr	-1008(ra) # 800088d4 <__memmove>
    80006ccc:	00813083          	ld	ra,8(sp)
    80006cd0:	00013403          	ld	s0,0(sp)
    80006cd4:	00000513          	li	a0,0
    80006cd8:	01010113          	addi	sp,sp,16
    80006cdc:	00008067          	ret
    80006ce0:	00002517          	auipc	a0,0x2
    80006ce4:	6b050513          	addi	a0,a0,1712 # 80009390 <CONSOLE_STATUS+0x380>
    80006ce8:	00001097          	auipc	ra,0x1
    80006cec:	8e4080e7          	jalr	-1820(ra) # 800075cc <panic>

0000000080006cf0 <trapinit>:
    80006cf0:	ff010113          	addi	sp,sp,-16
    80006cf4:	00813423          	sd	s0,8(sp)
    80006cf8:	01010413          	addi	s0,sp,16
    80006cfc:	00813403          	ld	s0,8(sp)
    80006d00:	00002597          	auipc	a1,0x2
    80006d04:	6b858593          	addi	a1,a1,1720 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80006d08:	00006517          	auipc	a0,0x6
    80006d0c:	b3850513          	addi	a0,a0,-1224 # 8000c840 <tickslock>
    80006d10:	01010113          	addi	sp,sp,16
    80006d14:	00001317          	auipc	t1,0x1
    80006d18:	5c430067          	jr	1476(t1) # 800082d8 <initlock>

0000000080006d1c <trapinithart>:
    80006d1c:	ff010113          	addi	sp,sp,-16
    80006d20:	00813423          	sd	s0,8(sp)
    80006d24:	01010413          	addi	s0,sp,16
    80006d28:	00000797          	auipc	a5,0x0
    80006d2c:	2f878793          	addi	a5,a5,760 # 80007020 <kernelvec>
    80006d30:	10579073          	csrw	stvec,a5
    80006d34:	00813403          	ld	s0,8(sp)
    80006d38:	01010113          	addi	sp,sp,16
    80006d3c:	00008067          	ret

0000000080006d40 <usertrap>:
    80006d40:	ff010113          	addi	sp,sp,-16
    80006d44:	00813423          	sd	s0,8(sp)
    80006d48:	01010413          	addi	s0,sp,16
    80006d4c:	00813403          	ld	s0,8(sp)
    80006d50:	01010113          	addi	sp,sp,16
    80006d54:	00008067          	ret

0000000080006d58 <usertrapret>:
    80006d58:	ff010113          	addi	sp,sp,-16
    80006d5c:	00813423          	sd	s0,8(sp)
    80006d60:	01010413          	addi	s0,sp,16
    80006d64:	00813403          	ld	s0,8(sp)
    80006d68:	01010113          	addi	sp,sp,16
    80006d6c:	00008067          	ret

0000000080006d70 <kerneltrap>:
    80006d70:	fe010113          	addi	sp,sp,-32
    80006d74:	00813823          	sd	s0,16(sp)
    80006d78:	00113c23          	sd	ra,24(sp)
    80006d7c:	00913423          	sd	s1,8(sp)
    80006d80:	02010413          	addi	s0,sp,32
    80006d84:	142025f3          	csrr	a1,scause
    80006d88:	100027f3          	csrr	a5,sstatus
    80006d8c:	0027f793          	andi	a5,a5,2
    80006d90:	10079c63          	bnez	a5,80006ea8 <kerneltrap+0x138>
    80006d94:	142027f3          	csrr	a5,scause
    80006d98:	0207ce63          	bltz	a5,80006dd4 <kerneltrap+0x64>
    80006d9c:	00002517          	auipc	a0,0x2
    80006da0:	66450513          	addi	a0,a0,1636 # 80009400 <CONSOLE_STATUS+0x3f0>
    80006da4:	00001097          	auipc	ra,0x1
    80006da8:	884080e7          	jalr	-1916(ra) # 80007628 <__printf>
    80006dac:	141025f3          	csrr	a1,sepc
    80006db0:	14302673          	csrr	a2,stval
    80006db4:	00002517          	auipc	a0,0x2
    80006db8:	65c50513          	addi	a0,a0,1628 # 80009410 <CONSOLE_STATUS+0x400>
    80006dbc:	00001097          	auipc	ra,0x1
    80006dc0:	86c080e7          	jalr	-1940(ra) # 80007628 <__printf>
    80006dc4:	00002517          	auipc	a0,0x2
    80006dc8:	66450513          	addi	a0,a0,1636 # 80009428 <CONSOLE_STATUS+0x418>
    80006dcc:	00001097          	auipc	ra,0x1
    80006dd0:	800080e7          	jalr	-2048(ra) # 800075cc <panic>
    80006dd4:	0ff7f713          	andi	a4,a5,255
    80006dd8:	00900693          	li	a3,9
    80006ddc:	04d70063          	beq	a4,a3,80006e1c <kerneltrap+0xac>
    80006de0:	fff00713          	li	a4,-1
    80006de4:	03f71713          	slli	a4,a4,0x3f
    80006de8:	00170713          	addi	a4,a4,1
    80006dec:	fae798e3          	bne	a5,a4,80006d9c <kerneltrap+0x2c>
    80006df0:	00000097          	auipc	ra,0x0
    80006df4:	e00080e7          	jalr	-512(ra) # 80006bf0 <cpuid>
    80006df8:	06050663          	beqz	a0,80006e64 <kerneltrap+0xf4>
    80006dfc:	144027f3          	csrr	a5,sip
    80006e00:	ffd7f793          	andi	a5,a5,-3
    80006e04:	14479073          	csrw	sip,a5
    80006e08:	01813083          	ld	ra,24(sp)
    80006e0c:	01013403          	ld	s0,16(sp)
    80006e10:	00813483          	ld	s1,8(sp)
    80006e14:	02010113          	addi	sp,sp,32
    80006e18:	00008067          	ret
    80006e1c:	00000097          	auipc	ra,0x0
    80006e20:	3c8080e7          	jalr	968(ra) # 800071e4 <plic_claim>
    80006e24:	00a00793          	li	a5,10
    80006e28:	00050493          	mv	s1,a0
    80006e2c:	06f50863          	beq	a0,a5,80006e9c <kerneltrap+0x12c>
    80006e30:	fc050ce3          	beqz	a0,80006e08 <kerneltrap+0x98>
    80006e34:	00050593          	mv	a1,a0
    80006e38:	00002517          	auipc	a0,0x2
    80006e3c:	5a850513          	addi	a0,a0,1448 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80006e40:	00000097          	auipc	ra,0x0
    80006e44:	7e8080e7          	jalr	2024(ra) # 80007628 <__printf>
    80006e48:	01013403          	ld	s0,16(sp)
    80006e4c:	01813083          	ld	ra,24(sp)
    80006e50:	00048513          	mv	a0,s1
    80006e54:	00813483          	ld	s1,8(sp)
    80006e58:	02010113          	addi	sp,sp,32
    80006e5c:	00000317          	auipc	t1,0x0
    80006e60:	3c030067          	jr	960(t1) # 8000721c <plic_complete>
    80006e64:	00006517          	auipc	a0,0x6
    80006e68:	9dc50513          	addi	a0,a0,-1572 # 8000c840 <tickslock>
    80006e6c:	00001097          	auipc	ra,0x1
    80006e70:	490080e7          	jalr	1168(ra) # 800082fc <acquire>
    80006e74:	00005717          	auipc	a4,0x5
    80006e78:	84070713          	addi	a4,a4,-1984 # 8000b6b4 <ticks>
    80006e7c:	00072783          	lw	a5,0(a4)
    80006e80:	00006517          	auipc	a0,0x6
    80006e84:	9c050513          	addi	a0,a0,-1600 # 8000c840 <tickslock>
    80006e88:	0017879b          	addiw	a5,a5,1
    80006e8c:	00f72023          	sw	a5,0(a4)
    80006e90:	00001097          	auipc	ra,0x1
    80006e94:	538080e7          	jalr	1336(ra) # 800083c8 <release>
    80006e98:	f65ff06f          	j	80006dfc <kerneltrap+0x8c>
    80006e9c:	00001097          	auipc	ra,0x1
    80006ea0:	094080e7          	jalr	148(ra) # 80007f30 <uartintr>
    80006ea4:	fa5ff06f          	j	80006e48 <kerneltrap+0xd8>
    80006ea8:	00002517          	auipc	a0,0x2
    80006eac:	51850513          	addi	a0,a0,1304 # 800093c0 <CONSOLE_STATUS+0x3b0>
    80006eb0:	00000097          	auipc	ra,0x0
    80006eb4:	71c080e7          	jalr	1820(ra) # 800075cc <panic>

0000000080006eb8 <clockintr>:
    80006eb8:	fe010113          	addi	sp,sp,-32
    80006ebc:	00813823          	sd	s0,16(sp)
    80006ec0:	00913423          	sd	s1,8(sp)
    80006ec4:	00113c23          	sd	ra,24(sp)
    80006ec8:	02010413          	addi	s0,sp,32
    80006ecc:	00006497          	auipc	s1,0x6
    80006ed0:	97448493          	addi	s1,s1,-1676 # 8000c840 <tickslock>
    80006ed4:	00048513          	mv	a0,s1
    80006ed8:	00001097          	auipc	ra,0x1
    80006edc:	424080e7          	jalr	1060(ra) # 800082fc <acquire>
    80006ee0:	00004717          	auipc	a4,0x4
    80006ee4:	7d470713          	addi	a4,a4,2004 # 8000b6b4 <ticks>
    80006ee8:	00072783          	lw	a5,0(a4)
    80006eec:	01013403          	ld	s0,16(sp)
    80006ef0:	01813083          	ld	ra,24(sp)
    80006ef4:	00048513          	mv	a0,s1
    80006ef8:	0017879b          	addiw	a5,a5,1
    80006efc:	00813483          	ld	s1,8(sp)
    80006f00:	00f72023          	sw	a5,0(a4)
    80006f04:	02010113          	addi	sp,sp,32
    80006f08:	00001317          	auipc	t1,0x1
    80006f0c:	4c030067          	jr	1216(t1) # 800083c8 <release>

0000000080006f10 <devintr>:
    80006f10:	142027f3          	csrr	a5,scause
    80006f14:	00000513          	li	a0,0
    80006f18:	0007c463          	bltz	a5,80006f20 <devintr+0x10>
    80006f1c:	00008067          	ret
    80006f20:	fe010113          	addi	sp,sp,-32
    80006f24:	00813823          	sd	s0,16(sp)
    80006f28:	00113c23          	sd	ra,24(sp)
    80006f2c:	00913423          	sd	s1,8(sp)
    80006f30:	02010413          	addi	s0,sp,32
    80006f34:	0ff7f713          	andi	a4,a5,255
    80006f38:	00900693          	li	a3,9
    80006f3c:	04d70c63          	beq	a4,a3,80006f94 <devintr+0x84>
    80006f40:	fff00713          	li	a4,-1
    80006f44:	03f71713          	slli	a4,a4,0x3f
    80006f48:	00170713          	addi	a4,a4,1
    80006f4c:	00e78c63          	beq	a5,a4,80006f64 <devintr+0x54>
    80006f50:	01813083          	ld	ra,24(sp)
    80006f54:	01013403          	ld	s0,16(sp)
    80006f58:	00813483          	ld	s1,8(sp)
    80006f5c:	02010113          	addi	sp,sp,32
    80006f60:	00008067          	ret
    80006f64:	00000097          	auipc	ra,0x0
    80006f68:	c8c080e7          	jalr	-884(ra) # 80006bf0 <cpuid>
    80006f6c:	06050663          	beqz	a0,80006fd8 <devintr+0xc8>
    80006f70:	144027f3          	csrr	a5,sip
    80006f74:	ffd7f793          	andi	a5,a5,-3
    80006f78:	14479073          	csrw	sip,a5
    80006f7c:	01813083          	ld	ra,24(sp)
    80006f80:	01013403          	ld	s0,16(sp)
    80006f84:	00813483          	ld	s1,8(sp)
    80006f88:	00200513          	li	a0,2
    80006f8c:	02010113          	addi	sp,sp,32
    80006f90:	00008067          	ret
    80006f94:	00000097          	auipc	ra,0x0
    80006f98:	250080e7          	jalr	592(ra) # 800071e4 <plic_claim>
    80006f9c:	00a00793          	li	a5,10
    80006fa0:	00050493          	mv	s1,a0
    80006fa4:	06f50663          	beq	a0,a5,80007010 <devintr+0x100>
    80006fa8:	00100513          	li	a0,1
    80006fac:	fa0482e3          	beqz	s1,80006f50 <devintr+0x40>
    80006fb0:	00048593          	mv	a1,s1
    80006fb4:	00002517          	auipc	a0,0x2
    80006fb8:	42c50513          	addi	a0,a0,1068 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80006fbc:	00000097          	auipc	ra,0x0
    80006fc0:	66c080e7          	jalr	1644(ra) # 80007628 <__printf>
    80006fc4:	00048513          	mv	a0,s1
    80006fc8:	00000097          	auipc	ra,0x0
    80006fcc:	254080e7          	jalr	596(ra) # 8000721c <plic_complete>
    80006fd0:	00100513          	li	a0,1
    80006fd4:	f7dff06f          	j	80006f50 <devintr+0x40>
    80006fd8:	00006517          	auipc	a0,0x6
    80006fdc:	86850513          	addi	a0,a0,-1944 # 8000c840 <tickslock>
    80006fe0:	00001097          	auipc	ra,0x1
    80006fe4:	31c080e7          	jalr	796(ra) # 800082fc <acquire>
    80006fe8:	00004717          	auipc	a4,0x4
    80006fec:	6cc70713          	addi	a4,a4,1740 # 8000b6b4 <ticks>
    80006ff0:	00072783          	lw	a5,0(a4)
    80006ff4:	00006517          	auipc	a0,0x6
    80006ff8:	84c50513          	addi	a0,a0,-1972 # 8000c840 <tickslock>
    80006ffc:	0017879b          	addiw	a5,a5,1
    80007000:	00f72023          	sw	a5,0(a4)
    80007004:	00001097          	auipc	ra,0x1
    80007008:	3c4080e7          	jalr	964(ra) # 800083c8 <release>
    8000700c:	f65ff06f          	j	80006f70 <devintr+0x60>
    80007010:	00001097          	auipc	ra,0x1
    80007014:	f20080e7          	jalr	-224(ra) # 80007f30 <uartintr>
    80007018:	fadff06f          	j	80006fc4 <devintr+0xb4>
    8000701c:	0000                	unimp
	...

0000000080007020 <kernelvec>:
    80007020:	f0010113          	addi	sp,sp,-256
    80007024:	00113023          	sd	ra,0(sp)
    80007028:	00213423          	sd	sp,8(sp)
    8000702c:	00313823          	sd	gp,16(sp)
    80007030:	00413c23          	sd	tp,24(sp)
    80007034:	02513023          	sd	t0,32(sp)
    80007038:	02613423          	sd	t1,40(sp)
    8000703c:	02713823          	sd	t2,48(sp)
    80007040:	02813c23          	sd	s0,56(sp)
    80007044:	04913023          	sd	s1,64(sp)
    80007048:	04a13423          	sd	a0,72(sp)
    8000704c:	04b13823          	sd	a1,80(sp)
    80007050:	04c13c23          	sd	a2,88(sp)
    80007054:	06d13023          	sd	a3,96(sp)
    80007058:	06e13423          	sd	a4,104(sp)
    8000705c:	06f13823          	sd	a5,112(sp)
    80007060:	07013c23          	sd	a6,120(sp)
    80007064:	09113023          	sd	a7,128(sp)
    80007068:	09213423          	sd	s2,136(sp)
    8000706c:	09313823          	sd	s3,144(sp)
    80007070:	09413c23          	sd	s4,152(sp)
    80007074:	0b513023          	sd	s5,160(sp)
    80007078:	0b613423          	sd	s6,168(sp)
    8000707c:	0b713823          	sd	s7,176(sp)
    80007080:	0b813c23          	sd	s8,184(sp)
    80007084:	0d913023          	sd	s9,192(sp)
    80007088:	0da13423          	sd	s10,200(sp)
    8000708c:	0db13823          	sd	s11,208(sp)
    80007090:	0dc13c23          	sd	t3,216(sp)
    80007094:	0fd13023          	sd	t4,224(sp)
    80007098:	0fe13423          	sd	t5,232(sp)
    8000709c:	0ff13823          	sd	t6,240(sp)
    800070a0:	cd1ff0ef          	jal	ra,80006d70 <kerneltrap>
    800070a4:	00013083          	ld	ra,0(sp)
    800070a8:	00813103          	ld	sp,8(sp)
    800070ac:	01013183          	ld	gp,16(sp)
    800070b0:	02013283          	ld	t0,32(sp)
    800070b4:	02813303          	ld	t1,40(sp)
    800070b8:	03013383          	ld	t2,48(sp)
    800070bc:	03813403          	ld	s0,56(sp)
    800070c0:	04013483          	ld	s1,64(sp)
    800070c4:	04813503          	ld	a0,72(sp)
    800070c8:	05013583          	ld	a1,80(sp)
    800070cc:	05813603          	ld	a2,88(sp)
    800070d0:	06013683          	ld	a3,96(sp)
    800070d4:	06813703          	ld	a4,104(sp)
    800070d8:	07013783          	ld	a5,112(sp)
    800070dc:	07813803          	ld	a6,120(sp)
    800070e0:	08013883          	ld	a7,128(sp)
    800070e4:	08813903          	ld	s2,136(sp)
    800070e8:	09013983          	ld	s3,144(sp)
    800070ec:	09813a03          	ld	s4,152(sp)
    800070f0:	0a013a83          	ld	s5,160(sp)
    800070f4:	0a813b03          	ld	s6,168(sp)
    800070f8:	0b013b83          	ld	s7,176(sp)
    800070fc:	0b813c03          	ld	s8,184(sp)
    80007100:	0c013c83          	ld	s9,192(sp)
    80007104:	0c813d03          	ld	s10,200(sp)
    80007108:	0d013d83          	ld	s11,208(sp)
    8000710c:	0d813e03          	ld	t3,216(sp)
    80007110:	0e013e83          	ld	t4,224(sp)
    80007114:	0e813f03          	ld	t5,232(sp)
    80007118:	0f013f83          	ld	t6,240(sp)
    8000711c:	10010113          	addi	sp,sp,256
    80007120:	10200073          	sret
    80007124:	00000013          	nop
    80007128:	00000013          	nop
    8000712c:	00000013          	nop

0000000080007130 <timervec>:
    80007130:	34051573          	csrrw	a0,mscratch,a0
    80007134:	00b53023          	sd	a1,0(a0)
    80007138:	00c53423          	sd	a2,8(a0)
    8000713c:	00d53823          	sd	a3,16(a0)
    80007140:	01853583          	ld	a1,24(a0)
    80007144:	02053603          	ld	a2,32(a0)
    80007148:	0005b683          	ld	a3,0(a1)
    8000714c:	00c686b3          	add	a3,a3,a2
    80007150:	00d5b023          	sd	a3,0(a1)
    80007154:	00200593          	li	a1,2
    80007158:	14459073          	csrw	sip,a1
    8000715c:	01053683          	ld	a3,16(a0)
    80007160:	00853603          	ld	a2,8(a0)
    80007164:	00053583          	ld	a1,0(a0)
    80007168:	34051573          	csrrw	a0,mscratch,a0
    8000716c:	30200073          	mret

0000000080007170 <plicinit>:
    80007170:	ff010113          	addi	sp,sp,-16
    80007174:	00813423          	sd	s0,8(sp)
    80007178:	01010413          	addi	s0,sp,16
    8000717c:	00813403          	ld	s0,8(sp)
    80007180:	0c0007b7          	lui	a5,0xc000
    80007184:	00100713          	li	a4,1
    80007188:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000718c:	00e7a223          	sw	a4,4(a5)
    80007190:	01010113          	addi	sp,sp,16
    80007194:	00008067          	ret

0000000080007198 <plicinithart>:
    80007198:	ff010113          	addi	sp,sp,-16
    8000719c:	00813023          	sd	s0,0(sp)
    800071a0:	00113423          	sd	ra,8(sp)
    800071a4:	01010413          	addi	s0,sp,16
    800071a8:	00000097          	auipc	ra,0x0
    800071ac:	a48080e7          	jalr	-1464(ra) # 80006bf0 <cpuid>
    800071b0:	0085171b          	slliw	a4,a0,0x8
    800071b4:	0c0027b7          	lui	a5,0xc002
    800071b8:	00e787b3          	add	a5,a5,a4
    800071bc:	40200713          	li	a4,1026
    800071c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800071c4:	00813083          	ld	ra,8(sp)
    800071c8:	00013403          	ld	s0,0(sp)
    800071cc:	00d5151b          	slliw	a0,a0,0xd
    800071d0:	0c2017b7          	lui	a5,0xc201
    800071d4:	00a78533          	add	a0,a5,a0
    800071d8:	00052023          	sw	zero,0(a0)
    800071dc:	01010113          	addi	sp,sp,16
    800071e0:	00008067          	ret

00000000800071e4 <plic_claim>:
    800071e4:	ff010113          	addi	sp,sp,-16
    800071e8:	00813023          	sd	s0,0(sp)
    800071ec:	00113423          	sd	ra,8(sp)
    800071f0:	01010413          	addi	s0,sp,16
    800071f4:	00000097          	auipc	ra,0x0
    800071f8:	9fc080e7          	jalr	-1540(ra) # 80006bf0 <cpuid>
    800071fc:	00813083          	ld	ra,8(sp)
    80007200:	00013403          	ld	s0,0(sp)
    80007204:	00d5151b          	slliw	a0,a0,0xd
    80007208:	0c2017b7          	lui	a5,0xc201
    8000720c:	00a78533          	add	a0,a5,a0
    80007210:	00452503          	lw	a0,4(a0)
    80007214:	01010113          	addi	sp,sp,16
    80007218:	00008067          	ret

000000008000721c <plic_complete>:
    8000721c:	fe010113          	addi	sp,sp,-32
    80007220:	00813823          	sd	s0,16(sp)
    80007224:	00913423          	sd	s1,8(sp)
    80007228:	00113c23          	sd	ra,24(sp)
    8000722c:	02010413          	addi	s0,sp,32
    80007230:	00050493          	mv	s1,a0
    80007234:	00000097          	auipc	ra,0x0
    80007238:	9bc080e7          	jalr	-1604(ra) # 80006bf0 <cpuid>
    8000723c:	01813083          	ld	ra,24(sp)
    80007240:	01013403          	ld	s0,16(sp)
    80007244:	00d5179b          	slliw	a5,a0,0xd
    80007248:	0c201737          	lui	a4,0xc201
    8000724c:	00f707b3          	add	a5,a4,a5
    80007250:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007254:	00813483          	ld	s1,8(sp)
    80007258:	02010113          	addi	sp,sp,32
    8000725c:	00008067          	ret

0000000080007260 <consolewrite>:
    80007260:	fb010113          	addi	sp,sp,-80
    80007264:	04813023          	sd	s0,64(sp)
    80007268:	04113423          	sd	ra,72(sp)
    8000726c:	02913c23          	sd	s1,56(sp)
    80007270:	03213823          	sd	s2,48(sp)
    80007274:	03313423          	sd	s3,40(sp)
    80007278:	03413023          	sd	s4,32(sp)
    8000727c:	01513c23          	sd	s5,24(sp)
    80007280:	05010413          	addi	s0,sp,80
    80007284:	06c05c63          	blez	a2,800072fc <consolewrite+0x9c>
    80007288:	00060993          	mv	s3,a2
    8000728c:	00050a13          	mv	s4,a0
    80007290:	00058493          	mv	s1,a1
    80007294:	00000913          	li	s2,0
    80007298:	fff00a93          	li	s5,-1
    8000729c:	01c0006f          	j	800072b8 <consolewrite+0x58>
    800072a0:	fbf44503          	lbu	a0,-65(s0)
    800072a4:	0019091b          	addiw	s2,s2,1
    800072a8:	00148493          	addi	s1,s1,1
    800072ac:	00001097          	auipc	ra,0x1
    800072b0:	a9c080e7          	jalr	-1380(ra) # 80007d48 <uartputc>
    800072b4:	03298063          	beq	s3,s2,800072d4 <consolewrite+0x74>
    800072b8:	00048613          	mv	a2,s1
    800072bc:	00100693          	li	a3,1
    800072c0:	000a0593          	mv	a1,s4
    800072c4:	fbf40513          	addi	a0,s0,-65
    800072c8:	00000097          	auipc	ra,0x0
    800072cc:	9e0080e7          	jalr	-1568(ra) # 80006ca8 <either_copyin>
    800072d0:	fd5518e3          	bne	a0,s5,800072a0 <consolewrite+0x40>
    800072d4:	04813083          	ld	ra,72(sp)
    800072d8:	04013403          	ld	s0,64(sp)
    800072dc:	03813483          	ld	s1,56(sp)
    800072e0:	02813983          	ld	s3,40(sp)
    800072e4:	02013a03          	ld	s4,32(sp)
    800072e8:	01813a83          	ld	s5,24(sp)
    800072ec:	00090513          	mv	a0,s2
    800072f0:	03013903          	ld	s2,48(sp)
    800072f4:	05010113          	addi	sp,sp,80
    800072f8:	00008067          	ret
    800072fc:	00000913          	li	s2,0
    80007300:	fd5ff06f          	j	800072d4 <consolewrite+0x74>

0000000080007304 <consoleread>:
    80007304:	f9010113          	addi	sp,sp,-112
    80007308:	06813023          	sd	s0,96(sp)
    8000730c:	04913c23          	sd	s1,88(sp)
    80007310:	05213823          	sd	s2,80(sp)
    80007314:	05313423          	sd	s3,72(sp)
    80007318:	05413023          	sd	s4,64(sp)
    8000731c:	03513c23          	sd	s5,56(sp)
    80007320:	03613823          	sd	s6,48(sp)
    80007324:	03713423          	sd	s7,40(sp)
    80007328:	03813023          	sd	s8,32(sp)
    8000732c:	06113423          	sd	ra,104(sp)
    80007330:	01913c23          	sd	s9,24(sp)
    80007334:	07010413          	addi	s0,sp,112
    80007338:	00060b93          	mv	s7,a2
    8000733c:	00050913          	mv	s2,a0
    80007340:	00058c13          	mv	s8,a1
    80007344:	00060b1b          	sext.w	s6,a2
    80007348:	00005497          	auipc	s1,0x5
    8000734c:	52048493          	addi	s1,s1,1312 # 8000c868 <cons>
    80007350:	00400993          	li	s3,4
    80007354:	fff00a13          	li	s4,-1
    80007358:	00a00a93          	li	s5,10
    8000735c:	05705e63          	blez	s7,800073b8 <consoleread+0xb4>
    80007360:	09c4a703          	lw	a4,156(s1)
    80007364:	0984a783          	lw	a5,152(s1)
    80007368:	0007071b          	sext.w	a4,a4
    8000736c:	08e78463          	beq	a5,a4,800073f4 <consoleread+0xf0>
    80007370:	07f7f713          	andi	a4,a5,127
    80007374:	00e48733          	add	a4,s1,a4
    80007378:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000737c:	0017869b          	addiw	a3,a5,1
    80007380:	08d4ac23          	sw	a3,152(s1)
    80007384:	00070c9b          	sext.w	s9,a4
    80007388:	0b370663          	beq	a4,s3,80007434 <consoleread+0x130>
    8000738c:	00100693          	li	a3,1
    80007390:	f9f40613          	addi	a2,s0,-97
    80007394:	000c0593          	mv	a1,s8
    80007398:	00090513          	mv	a0,s2
    8000739c:	f8e40fa3          	sb	a4,-97(s0)
    800073a0:	00000097          	auipc	ra,0x0
    800073a4:	8bc080e7          	jalr	-1860(ra) # 80006c5c <either_copyout>
    800073a8:	01450863          	beq	a0,s4,800073b8 <consoleread+0xb4>
    800073ac:	001c0c13          	addi	s8,s8,1
    800073b0:	fffb8b9b          	addiw	s7,s7,-1
    800073b4:	fb5c94e3          	bne	s9,s5,8000735c <consoleread+0x58>
    800073b8:	000b851b          	sext.w	a0,s7
    800073bc:	06813083          	ld	ra,104(sp)
    800073c0:	06013403          	ld	s0,96(sp)
    800073c4:	05813483          	ld	s1,88(sp)
    800073c8:	05013903          	ld	s2,80(sp)
    800073cc:	04813983          	ld	s3,72(sp)
    800073d0:	04013a03          	ld	s4,64(sp)
    800073d4:	03813a83          	ld	s5,56(sp)
    800073d8:	02813b83          	ld	s7,40(sp)
    800073dc:	02013c03          	ld	s8,32(sp)
    800073e0:	01813c83          	ld	s9,24(sp)
    800073e4:	40ab053b          	subw	a0,s6,a0
    800073e8:	03013b03          	ld	s6,48(sp)
    800073ec:	07010113          	addi	sp,sp,112
    800073f0:	00008067          	ret
    800073f4:	00001097          	auipc	ra,0x1
    800073f8:	1d8080e7          	jalr	472(ra) # 800085cc <push_on>
    800073fc:	0984a703          	lw	a4,152(s1)
    80007400:	09c4a783          	lw	a5,156(s1)
    80007404:	0007879b          	sext.w	a5,a5
    80007408:	fef70ce3          	beq	a4,a5,80007400 <consoleread+0xfc>
    8000740c:	00001097          	auipc	ra,0x1
    80007410:	234080e7          	jalr	564(ra) # 80008640 <pop_on>
    80007414:	0984a783          	lw	a5,152(s1)
    80007418:	07f7f713          	andi	a4,a5,127
    8000741c:	00e48733          	add	a4,s1,a4
    80007420:	01874703          	lbu	a4,24(a4)
    80007424:	0017869b          	addiw	a3,a5,1
    80007428:	08d4ac23          	sw	a3,152(s1)
    8000742c:	00070c9b          	sext.w	s9,a4
    80007430:	f5371ee3          	bne	a4,s3,8000738c <consoleread+0x88>
    80007434:	000b851b          	sext.w	a0,s7
    80007438:	f96bf2e3          	bgeu	s7,s6,800073bc <consoleread+0xb8>
    8000743c:	08f4ac23          	sw	a5,152(s1)
    80007440:	f7dff06f          	j	800073bc <consoleread+0xb8>

0000000080007444 <consputc>:
    80007444:	10000793          	li	a5,256
    80007448:	00f50663          	beq	a0,a5,80007454 <consputc+0x10>
    8000744c:	00001317          	auipc	t1,0x1
    80007450:	9f430067          	jr	-1548(t1) # 80007e40 <uartputc_sync>
    80007454:	ff010113          	addi	sp,sp,-16
    80007458:	00113423          	sd	ra,8(sp)
    8000745c:	00813023          	sd	s0,0(sp)
    80007460:	01010413          	addi	s0,sp,16
    80007464:	00800513          	li	a0,8
    80007468:	00001097          	auipc	ra,0x1
    8000746c:	9d8080e7          	jalr	-1576(ra) # 80007e40 <uartputc_sync>
    80007470:	02000513          	li	a0,32
    80007474:	00001097          	auipc	ra,0x1
    80007478:	9cc080e7          	jalr	-1588(ra) # 80007e40 <uartputc_sync>
    8000747c:	00013403          	ld	s0,0(sp)
    80007480:	00813083          	ld	ra,8(sp)
    80007484:	00800513          	li	a0,8
    80007488:	01010113          	addi	sp,sp,16
    8000748c:	00001317          	auipc	t1,0x1
    80007490:	9b430067          	jr	-1612(t1) # 80007e40 <uartputc_sync>

0000000080007494 <consoleintr>:
    80007494:	fe010113          	addi	sp,sp,-32
    80007498:	00813823          	sd	s0,16(sp)
    8000749c:	00913423          	sd	s1,8(sp)
    800074a0:	01213023          	sd	s2,0(sp)
    800074a4:	00113c23          	sd	ra,24(sp)
    800074a8:	02010413          	addi	s0,sp,32
    800074ac:	00005917          	auipc	s2,0x5
    800074b0:	3bc90913          	addi	s2,s2,956 # 8000c868 <cons>
    800074b4:	00050493          	mv	s1,a0
    800074b8:	00090513          	mv	a0,s2
    800074bc:	00001097          	auipc	ra,0x1
    800074c0:	e40080e7          	jalr	-448(ra) # 800082fc <acquire>
    800074c4:	02048c63          	beqz	s1,800074fc <consoleintr+0x68>
    800074c8:	0a092783          	lw	a5,160(s2)
    800074cc:	09892703          	lw	a4,152(s2)
    800074d0:	07f00693          	li	a3,127
    800074d4:	40e7873b          	subw	a4,a5,a4
    800074d8:	02e6e263          	bltu	a3,a4,800074fc <consoleintr+0x68>
    800074dc:	00d00713          	li	a4,13
    800074e0:	04e48063          	beq	s1,a4,80007520 <consoleintr+0x8c>
    800074e4:	07f7f713          	andi	a4,a5,127
    800074e8:	00e90733          	add	a4,s2,a4
    800074ec:	0017879b          	addiw	a5,a5,1
    800074f0:	0af92023          	sw	a5,160(s2)
    800074f4:	00970c23          	sb	s1,24(a4)
    800074f8:	08f92e23          	sw	a5,156(s2)
    800074fc:	01013403          	ld	s0,16(sp)
    80007500:	01813083          	ld	ra,24(sp)
    80007504:	00813483          	ld	s1,8(sp)
    80007508:	00013903          	ld	s2,0(sp)
    8000750c:	00005517          	auipc	a0,0x5
    80007510:	35c50513          	addi	a0,a0,860 # 8000c868 <cons>
    80007514:	02010113          	addi	sp,sp,32
    80007518:	00001317          	auipc	t1,0x1
    8000751c:	eb030067          	jr	-336(t1) # 800083c8 <release>
    80007520:	00a00493          	li	s1,10
    80007524:	fc1ff06f          	j	800074e4 <consoleintr+0x50>

0000000080007528 <consoleinit>:
    80007528:	fe010113          	addi	sp,sp,-32
    8000752c:	00113c23          	sd	ra,24(sp)
    80007530:	00813823          	sd	s0,16(sp)
    80007534:	00913423          	sd	s1,8(sp)
    80007538:	02010413          	addi	s0,sp,32
    8000753c:	00005497          	auipc	s1,0x5
    80007540:	32c48493          	addi	s1,s1,812 # 8000c868 <cons>
    80007544:	00048513          	mv	a0,s1
    80007548:	00002597          	auipc	a1,0x2
    8000754c:	ef058593          	addi	a1,a1,-272 # 80009438 <CONSOLE_STATUS+0x428>
    80007550:	00001097          	auipc	ra,0x1
    80007554:	d88080e7          	jalr	-632(ra) # 800082d8 <initlock>
    80007558:	00000097          	auipc	ra,0x0
    8000755c:	7ac080e7          	jalr	1964(ra) # 80007d04 <uartinit>
    80007560:	01813083          	ld	ra,24(sp)
    80007564:	01013403          	ld	s0,16(sp)
    80007568:	00000797          	auipc	a5,0x0
    8000756c:	d9c78793          	addi	a5,a5,-612 # 80007304 <consoleread>
    80007570:	0af4bc23          	sd	a5,184(s1)
    80007574:	00000797          	auipc	a5,0x0
    80007578:	cec78793          	addi	a5,a5,-788 # 80007260 <consolewrite>
    8000757c:	0cf4b023          	sd	a5,192(s1)
    80007580:	00813483          	ld	s1,8(sp)
    80007584:	02010113          	addi	sp,sp,32
    80007588:	00008067          	ret

000000008000758c <console_read>:
    8000758c:	ff010113          	addi	sp,sp,-16
    80007590:	00813423          	sd	s0,8(sp)
    80007594:	01010413          	addi	s0,sp,16
    80007598:	00813403          	ld	s0,8(sp)
    8000759c:	00005317          	auipc	t1,0x5
    800075a0:	38433303          	ld	t1,900(t1) # 8000c920 <devsw+0x10>
    800075a4:	01010113          	addi	sp,sp,16
    800075a8:	00030067          	jr	t1

00000000800075ac <console_write>:
    800075ac:	ff010113          	addi	sp,sp,-16
    800075b0:	00813423          	sd	s0,8(sp)
    800075b4:	01010413          	addi	s0,sp,16
    800075b8:	00813403          	ld	s0,8(sp)
    800075bc:	00005317          	auipc	t1,0x5
    800075c0:	36c33303          	ld	t1,876(t1) # 8000c928 <devsw+0x18>
    800075c4:	01010113          	addi	sp,sp,16
    800075c8:	00030067          	jr	t1

00000000800075cc <panic>:
    800075cc:	fe010113          	addi	sp,sp,-32
    800075d0:	00113c23          	sd	ra,24(sp)
    800075d4:	00813823          	sd	s0,16(sp)
    800075d8:	00913423          	sd	s1,8(sp)
    800075dc:	02010413          	addi	s0,sp,32
    800075e0:	00050493          	mv	s1,a0
    800075e4:	00002517          	auipc	a0,0x2
    800075e8:	e5c50513          	addi	a0,a0,-420 # 80009440 <CONSOLE_STATUS+0x430>
    800075ec:	00005797          	auipc	a5,0x5
    800075f0:	3c07ae23          	sw	zero,988(a5) # 8000c9c8 <pr+0x18>
    800075f4:	00000097          	auipc	ra,0x0
    800075f8:	034080e7          	jalr	52(ra) # 80007628 <__printf>
    800075fc:	00048513          	mv	a0,s1
    80007600:	00000097          	auipc	ra,0x0
    80007604:	028080e7          	jalr	40(ra) # 80007628 <__printf>
    80007608:	00002517          	auipc	a0,0x2
    8000760c:	ae850513          	addi	a0,a0,-1304 # 800090f0 <CONSOLE_STATUS+0xe0>
    80007610:	00000097          	auipc	ra,0x0
    80007614:	018080e7          	jalr	24(ra) # 80007628 <__printf>
    80007618:	00100793          	li	a5,1
    8000761c:	00004717          	auipc	a4,0x4
    80007620:	08f72e23          	sw	a5,156(a4) # 8000b6b8 <panicked>
    80007624:	0000006f          	j	80007624 <panic+0x58>

0000000080007628 <__printf>:
    80007628:	f3010113          	addi	sp,sp,-208
    8000762c:	08813023          	sd	s0,128(sp)
    80007630:	07313423          	sd	s3,104(sp)
    80007634:	09010413          	addi	s0,sp,144
    80007638:	05813023          	sd	s8,64(sp)
    8000763c:	08113423          	sd	ra,136(sp)
    80007640:	06913c23          	sd	s1,120(sp)
    80007644:	07213823          	sd	s2,112(sp)
    80007648:	07413023          	sd	s4,96(sp)
    8000764c:	05513c23          	sd	s5,88(sp)
    80007650:	05613823          	sd	s6,80(sp)
    80007654:	05713423          	sd	s7,72(sp)
    80007658:	03913c23          	sd	s9,56(sp)
    8000765c:	03a13823          	sd	s10,48(sp)
    80007660:	03b13423          	sd	s11,40(sp)
    80007664:	00005317          	auipc	t1,0x5
    80007668:	34c30313          	addi	t1,t1,844 # 8000c9b0 <pr>
    8000766c:	01832c03          	lw	s8,24(t1)
    80007670:	00b43423          	sd	a1,8(s0)
    80007674:	00c43823          	sd	a2,16(s0)
    80007678:	00d43c23          	sd	a3,24(s0)
    8000767c:	02e43023          	sd	a4,32(s0)
    80007680:	02f43423          	sd	a5,40(s0)
    80007684:	03043823          	sd	a6,48(s0)
    80007688:	03143c23          	sd	a7,56(s0)
    8000768c:	00050993          	mv	s3,a0
    80007690:	4a0c1663          	bnez	s8,80007b3c <__printf+0x514>
    80007694:	60098c63          	beqz	s3,80007cac <__printf+0x684>
    80007698:	0009c503          	lbu	a0,0(s3)
    8000769c:	00840793          	addi	a5,s0,8
    800076a0:	f6f43c23          	sd	a5,-136(s0)
    800076a4:	00000493          	li	s1,0
    800076a8:	22050063          	beqz	a0,800078c8 <__printf+0x2a0>
    800076ac:	00002a37          	lui	s4,0x2
    800076b0:	00018ab7          	lui	s5,0x18
    800076b4:	000f4b37          	lui	s6,0xf4
    800076b8:	00989bb7          	lui	s7,0x989
    800076bc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800076c0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800076c4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800076c8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800076cc:	00148c9b          	addiw	s9,s1,1
    800076d0:	02500793          	li	a5,37
    800076d4:	01998933          	add	s2,s3,s9
    800076d8:	38f51263          	bne	a0,a5,80007a5c <__printf+0x434>
    800076dc:	00094783          	lbu	a5,0(s2)
    800076e0:	00078c9b          	sext.w	s9,a5
    800076e4:	1e078263          	beqz	a5,800078c8 <__printf+0x2a0>
    800076e8:	0024849b          	addiw	s1,s1,2
    800076ec:	07000713          	li	a4,112
    800076f0:	00998933          	add	s2,s3,s1
    800076f4:	38e78a63          	beq	a5,a4,80007a88 <__printf+0x460>
    800076f8:	20f76863          	bltu	a4,a5,80007908 <__printf+0x2e0>
    800076fc:	42a78863          	beq	a5,a0,80007b2c <__printf+0x504>
    80007700:	06400713          	li	a4,100
    80007704:	40e79663          	bne	a5,a4,80007b10 <__printf+0x4e8>
    80007708:	f7843783          	ld	a5,-136(s0)
    8000770c:	0007a603          	lw	a2,0(a5)
    80007710:	00878793          	addi	a5,a5,8
    80007714:	f6f43c23          	sd	a5,-136(s0)
    80007718:	42064a63          	bltz	a2,80007b4c <__printf+0x524>
    8000771c:	00a00713          	li	a4,10
    80007720:	02e677bb          	remuw	a5,a2,a4
    80007724:	00002d97          	auipc	s11,0x2
    80007728:	d44d8d93          	addi	s11,s11,-700 # 80009468 <digits>
    8000772c:	00900593          	li	a1,9
    80007730:	0006051b          	sext.w	a0,a2
    80007734:	00000c93          	li	s9,0
    80007738:	02079793          	slli	a5,a5,0x20
    8000773c:	0207d793          	srli	a5,a5,0x20
    80007740:	00fd87b3          	add	a5,s11,a5
    80007744:	0007c783          	lbu	a5,0(a5)
    80007748:	02e656bb          	divuw	a3,a2,a4
    8000774c:	f8f40023          	sb	a5,-128(s0)
    80007750:	14c5d863          	bge	a1,a2,800078a0 <__printf+0x278>
    80007754:	06300593          	li	a1,99
    80007758:	00100c93          	li	s9,1
    8000775c:	02e6f7bb          	remuw	a5,a3,a4
    80007760:	02079793          	slli	a5,a5,0x20
    80007764:	0207d793          	srli	a5,a5,0x20
    80007768:	00fd87b3          	add	a5,s11,a5
    8000776c:	0007c783          	lbu	a5,0(a5)
    80007770:	02e6d73b          	divuw	a4,a3,a4
    80007774:	f8f400a3          	sb	a5,-127(s0)
    80007778:	12a5f463          	bgeu	a1,a0,800078a0 <__printf+0x278>
    8000777c:	00a00693          	li	a3,10
    80007780:	00900593          	li	a1,9
    80007784:	02d777bb          	remuw	a5,a4,a3
    80007788:	02079793          	slli	a5,a5,0x20
    8000778c:	0207d793          	srli	a5,a5,0x20
    80007790:	00fd87b3          	add	a5,s11,a5
    80007794:	0007c503          	lbu	a0,0(a5)
    80007798:	02d757bb          	divuw	a5,a4,a3
    8000779c:	f8a40123          	sb	a0,-126(s0)
    800077a0:	48e5f263          	bgeu	a1,a4,80007c24 <__printf+0x5fc>
    800077a4:	06300513          	li	a0,99
    800077a8:	02d7f5bb          	remuw	a1,a5,a3
    800077ac:	02059593          	slli	a1,a1,0x20
    800077b0:	0205d593          	srli	a1,a1,0x20
    800077b4:	00bd85b3          	add	a1,s11,a1
    800077b8:	0005c583          	lbu	a1,0(a1)
    800077bc:	02d7d7bb          	divuw	a5,a5,a3
    800077c0:	f8b401a3          	sb	a1,-125(s0)
    800077c4:	48e57263          	bgeu	a0,a4,80007c48 <__printf+0x620>
    800077c8:	3e700513          	li	a0,999
    800077cc:	02d7f5bb          	remuw	a1,a5,a3
    800077d0:	02059593          	slli	a1,a1,0x20
    800077d4:	0205d593          	srli	a1,a1,0x20
    800077d8:	00bd85b3          	add	a1,s11,a1
    800077dc:	0005c583          	lbu	a1,0(a1)
    800077e0:	02d7d7bb          	divuw	a5,a5,a3
    800077e4:	f8b40223          	sb	a1,-124(s0)
    800077e8:	46e57663          	bgeu	a0,a4,80007c54 <__printf+0x62c>
    800077ec:	02d7f5bb          	remuw	a1,a5,a3
    800077f0:	02059593          	slli	a1,a1,0x20
    800077f4:	0205d593          	srli	a1,a1,0x20
    800077f8:	00bd85b3          	add	a1,s11,a1
    800077fc:	0005c583          	lbu	a1,0(a1)
    80007800:	02d7d7bb          	divuw	a5,a5,a3
    80007804:	f8b402a3          	sb	a1,-123(s0)
    80007808:	46ea7863          	bgeu	s4,a4,80007c78 <__printf+0x650>
    8000780c:	02d7f5bb          	remuw	a1,a5,a3
    80007810:	02059593          	slli	a1,a1,0x20
    80007814:	0205d593          	srli	a1,a1,0x20
    80007818:	00bd85b3          	add	a1,s11,a1
    8000781c:	0005c583          	lbu	a1,0(a1)
    80007820:	02d7d7bb          	divuw	a5,a5,a3
    80007824:	f8b40323          	sb	a1,-122(s0)
    80007828:	3eeaf863          	bgeu	s5,a4,80007c18 <__printf+0x5f0>
    8000782c:	02d7f5bb          	remuw	a1,a5,a3
    80007830:	02059593          	slli	a1,a1,0x20
    80007834:	0205d593          	srli	a1,a1,0x20
    80007838:	00bd85b3          	add	a1,s11,a1
    8000783c:	0005c583          	lbu	a1,0(a1)
    80007840:	02d7d7bb          	divuw	a5,a5,a3
    80007844:	f8b403a3          	sb	a1,-121(s0)
    80007848:	42eb7e63          	bgeu	s6,a4,80007c84 <__printf+0x65c>
    8000784c:	02d7f5bb          	remuw	a1,a5,a3
    80007850:	02059593          	slli	a1,a1,0x20
    80007854:	0205d593          	srli	a1,a1,0x20
    80007858:	00bd85b3          	add	a1,s11,a1
    8000785c:	0005c583          	lbu	a1,0(a1)
    80007860:	02d7d7bb          	divuw	a5,a5,a3
    80007864:	f8b40423          	sb	a1,-120(s0)
    80007868:	42ebfc63          	bgeu	s7,a4,80007ca0 <__printf+0x678>
    8000786c:	02079793          	slli	a5,a5,0x20
    80007870:	0207d793          	srli	a5,a5,0x20
    80007874:	00fd8db3          	add	s11,s11,a5
    80007878:	000dc703          	lbu	a4,0(s11)
    8000787c:	00a00793          	li	a5,10
    80007880:	00900c93          	li	s9,9
    80007884:	f8e404a3          	sb	a4,-119(s0)
    80007888:	00065c63          	bgez	a2,800078a0 <__printf+0x278>
    8000788c:	f9040713          	addi	a4,s0,-112
    80007890:	00f70733          	add	a4,a4,a5
    80007894:	02d00693          	li	a3,45
    80007898:	fed70823          	sb	a3,-16(a4)
    8000789c:	00078c93          	mv	s9,a5
    800078a0:	f8040793          	addi	a5,s0,-128
    800078a4:	01978cb3          	add	s9,a5,s9
    800078a8:	f7f40d13          	addi	s10,s0,-129
    800078ac:	000cc503          	lbu	a0,0(s9)
    800078b0:	fffc8c93          	addi	s9,s9,-1
    800078b4:	00000097          	auipc	ra,0x0
    800078b8:	b90080e7          	jalr	-1136(ra) # 80007444 <consputc>
    800078bc:	ffac98e3          	bne	s9,s10,800078ac <__printf+0x284>
    800078c0:	00094503          	lbu	a0,0(s2)
    800078c4:	e00514e3          	bnez	a0,800076cc <__printf+0xa4>
    800078c8:	1a0c1663          	bnez	s8,80007a74 <__printf+0x44c>
    800078cc:	08813083          	ld	ra,136(sp)
    800078d0:	08013403          	ld	s0,128(sp)
    800078d4:	07813483          	ld	s1,120(sp)
    800078d8:	07013903          	ld	s2,112(sp)
    800078dc:	06813983          	ld	s3,104(sp)
    800078e0:	06013a03          	ld	s4,96(sp)
    800078e4:	05813a83          	ld	s5,88(sp)
    800078e8:	05013b03          	ld	s6,80(sp)
    800078ec:	04813b83          	ld	s7,72(sp)
    800078f0:	04013c03          	ld	s8,64(sp)
    800078f4:	03813c83          	ld	s9,56(sp)
    800078f8:	03013d03          	ld	s10,48(sp)
    800078fc:	02813d83          	ld	s11,40(sp)
    80007900:	0d010113          	addi	sp,sp,208
    80007904:	00008067          	ret
    80007908:	07300713          	li	a4,115
    8000790c:	1ce78a63          	beq	a5,a4,80007ae0 <__printf+0x4b8>
    80007910:	07800713          	li	a4,120
    80007914:	1ee79e63          	bne	a5,a4,80007b10 <__printf+0x4e8>
    80007918:	f7843783          	ld	a5,-136(s0)
    8000791c:	0007a703          	lw	a4,0(a5)
    80007920:	00878793          	addi	a5,a5,8
    80007924:	f6f43c23          	sd	a5,-136(s0)
    80007928:	28074263          	bltz	a4,80007bac <__printf+0x584>
    8000792c:	00002d97          	auipc	s11,0x2
    80007930:	b3cd8d93          	addi	s11,s11,-1220 # 80009468 <digits>
    80007934:	00f77793          	andi	a5,a4,15
    80007938:	00fd87b3          	add	a5,s11,a5
    8000793c:	0007c683          	lbu	a3,0(a5)
    80007940:	00f00613          	li	a2,15
    80007944:	0007079b          	sext.w	a5,a4
    80007948:	f8d40023          	sb	a3,-128(s0)
    8000794c:	0047559b          	srliw	a1,a4,0x4
    80007950:	0047569b          	srliw	a3,a4,0x4
    80007954:	00000c93          	li	s9,0
    80007958:	0ee65063          	bge	a2,a4,80007a38 <__printf+0x410>
    8000795c:	00f6f693          	andi	a3,a3,15
    80007960:	00dd86b3          	add	a3,s11,a3
    80007964:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007968:	0087d79b          	srliw	a5,a5,0x8
    8000796c:	00100c93          	li	s9,1
    80007970:	f8d400a3          	sb	a3,-127(s0)
    80007974:	0cb67263          	bgeu	a2,a1,80007a38 <__printf+0x410>
    80007978:	00f7f693          	andi	a3,a5,15
    8000797c:	00dd86b3          	add	a3,s11,a3
    80007980:	0006c583          	lbu	a1,0(a3)
    80007984:	00f00613          	li	a2,15
    80007988:	0047d69b          	srliw	a3,a5,0x4
    8000798c:	f8b40123          	sb	a1,-126(s0)
    80007990:	0047d593          	srli	a1,a5,0x4
    80007994:	28f67e63          	bgeu	a2,a5,80007c30 <__printf+0x608>
    80007998:	00f6f693          	andi	a3,a3,15
    8000799c:	00dd86b3          	add	a3,s11,a3
    800079a0:	0006c503          	lbu	a0,0(a3)
    800079a4:	0087d813          	srli	a6,a5,0x8
    800079a8:	0087d69b          	srliw	a3,a5,0x8
    800079ac:	f8a401a3          	sb	a0,-125(s0)
    800079b0:	28b67663          	bgeu	a2,a1,80007c3c <__printf+0x614>
    800079b4:	00f6f693          	andi	a3,a3,15
    800079b8:	00dd86b3          	add	a3,s11,a3
    800079bc:	0006c583          	lbu	a1,0(a3)
    800079c0:	00c7d513          	srli	a0,a5,0xc
    800079c4:	00c7d69b          	srliw	a3,a5,0xc
    800079c8:	f8b40223          	sb	a1,-124(s0)
    800079cc:	29067a63          	bgeu	a2,a6,80007c60 <__printf+0x638>
    800079d0:	00f6f693          	andi	a3,a3,15
    800079d4:	00dd86b3          	add	a3,s11,a3
    800079d8:	0006c583          	lbu	a1,0(a3)
    800079dc:	0107d813          	srli	a6,a5,0x10
    800079e0:	0107d69b          	srliw	a3,a5,0x10
    800079e4:	f8b402a3          	sb	a1,-123(s0)
    800079e8:	28a67263          	bgeu	a2,a0,80007c6c <__printf+0x644>
    800079ec:	00f6f693          	andi	a3,a3,15
    800079f0:	00dd86b3          	add	a3,s11,a3
    800079f4:	0006c683          	lbu	a3,0(a3)
    800079f8:	0147d79b          	srliw	a5,a5,0x14
    800079fc:	f8d40323          	sb	a3,-122(s0)
    80007a00:	21067663          	bgeu	a2,a6,80007c0c <__printf+0x5e4>
    80007a04:	02079793          	slli	a5,a5,0x20
    80007a08:	0207d793          	srli	a5,a5,0x20
    80007a0c:	00fd8db3          	add	s11,s11,a5
    80007a10:	000dc683          	lbu	a3,0(s11)
    80007a14:	00800793          	li	a5,8
    80007a18:	00700c93          	li	s9,7
    80007a1c:	f8d403a3          	sb	a3,-121(s0)
    80007a20:	00075c63          	bgez	a4,80007a38 <__printf+0x410>
    80007a24:	f9040713          	addi	a4,s0,-112
    80007a28:	00f70733          	add	a4,a4,a5
    80007a2c:	02d00693          	li	a3,45
    80007a30:	fed70823          	sb	a3,-16(a4)
    80007a34:	00078c93          	mv	s9,a5
    80007a38:	f8040793          	addi	a5,s0,-128
    80007a3c:	01978cb3          	add	s9,a5,s9
    80007a40:	f7f40d13          	addi	s10,s0,-129
    80007a44:	000cc503          	lbu	a0,0(s9)
    80007a48:	fffc8c93          	addi	s9,s9,-1
    80007a4c:	00000097          	auipc	ra,0x0
    80007a50:	9f8080e7          	jalr	-1544(ra) # 80007444 <consputc>
    80007a54:	ff9d18e3          	bne	s10,s9,80007a44 <__printf+0x41c>
    80007a58:	0100006f          	j	80007a68 <__printf+0x440>
    80007a5c:	00000097          	auipc	ra,0x0
    80007a60:	9e8080e7          	jalr	-1560(ra) # 80007444 <consputc>
    80007a64:	000c8493          	mv	s1,s9
    80007a68:	00094503          	lbu	a0,0(s2)
    80007a6c:	c60510e3          	bnez	a0,800076cc <__printf+0xa4>
    80007a70:	e40c0ee3          	beqz	s8,800078cc <__printf+0x2a4>
    80007a74:	00005517          	auipc	a0,0x5
    80007a78:	f3c50513          	addi	a0,a0,-196 # 8000c9b0 <pr>
    80007a7c:	00001097          	auipc	ra,0x1
    80007a80:	94c080e7          	jalr	-1716(ra) # 800083c8 <release>
    80007a84:	e49ff06f          	j	800078cc <__printf+0x2a4>
    80007a88:	f7843783          	ld	a5,-136(s0)
    80007a8c:	03000513          	li	a0,48
    80007a90:	01000d13          	li	s10,16
    80007a94:	00878713          	addi	a4,a5,8
    80007a98:	0007bc83          	ld	s9,0(a5)
    80007a9c:	f6e43c23          	sd	a4,-136(s0)
    80007aa0:	00000097          	auipc	ra,0x0
    80007aa4:	9a4080e7          	jalr	-1628(ra) # 80007444 <consputc>
    80007aa8:	07800513          	li	a0,120
    80007aac:	00000097          	auipc	ra,0x0
    80007ab0:	998080e7          	jalr	-1640(ra) # 80007444 <consputc>
    80007ab4:	00002d97          	auipc	s11,0x2
    80007ab8:	9b4d8d93          	addi	s11,s11,-1612 # 80009468 <digits>
    80007abc:	03ccd793          	srli	a5,s9,0x3c
    80007ac0:	00fd87b3          	add	a5,s11,a5
    80007ac4:	0007c503          	lbu	a0,0(a5)
    80007ac8:	fffd0d1b          	addiw	s10,s10,-1
    80007acc:	004c9c93          	slli	s9,s9,0x4
    80007ad0:	00000097          	auipc	ra,0x0
    80007ad4:	974080e7          	jalr	-1676(ra) # 80007444 <consputc>
    80007ad8:	fe0d12e3          	bnez	s10,80007abc <__printf+0x494>
    80007adc:	f8dff06f          	j	80007a68 <__printf+0x440>
    80007ae0:	f7843783          	ld	a5,-136(s0)
    80007ae4:	0007bc83          	ld	s9,0(a5)
    80007ae8:	00878793          	addi	a5,a5,8
    80007aec:	f6f43c23          	sd	a5,-136(s0)
    80007af0:	000c9a63          	bnez	s9,80007b04 <__printf+0x4dc>
    80007af4:	1080006f          	j	80007bfc <__printf+0x5d4>
    80007af8:	001c8c93          	addi	s9,s9,1
    80007afc:	00000097          	auipc	ra,0x0
    80007b00:	948080e7          	jalr	-1720(ra) # 80007444 <consputc>
    80007b04:	000cc503          	lbu	a0,0(s9)
    80007b08:	fe0518e3          	bnez	a0,80007af8 <__printf+0x4d0>
    80007b0c:	f5dff06f          	j	80007a68 <__printf+0x440>
    80007b10:	02500513          	li	a0,37
    80007b14:	00000097          	auipc	ra,0x0
    80007b18:	930080e7          	jalr	-1744(ra) # 80007444 <consputc>
    80007b1c:	000c8513          	mv	a0,s9
    80007b20:	00000097          	auipc	ra,0x0
    80007b24:	924080e7          	jalr	-1756(ra) # 80007444 <consputc>
    80007b28:	f41ff06f          	j	80007a68 <__printf+0x440>
    80007b2c:	02500513          	li	a0,37
    80007b30:	00000097          	auipc	ra,0x0
    80007b34:	914080e7          	jalr	-1772(ra) # 80007444 <consputc>
    80007b38:	f31ff06f          	j	80007a68 <__printf+0x440>
    80007b3c:	00030513          	mv	a0,t1
    80007b40:	00000097          	auipc	ra,0x0
    80007b44:	7bc080e7          	jalr	1980(ra) # 800082fc <acquire>
    80007b48:	b4dff06f          	j	80007694 <__printf+0x6c>
    80007b4c:	40c0053b          	negw	a0,a2
    80007b50:	00a00713          	li	a4,10
    80007b54:	02e576bb          	remuw	a3,a0,a4
    80007b58:	00002d97          	auipc	s11,0x2
    80007b5c:	910d8d93          	addi	s11,s11,-1776 # 80009468 <digits>
    80007b60:	ff700593          	li	a1,-9
    80007b64:	02069693          	slli	a3,a3,0x20
    80007b68:	0206d693          	srli	a3,a3,0x20
    80007b6c:	00dd86b3          	add	a3,s11,a3
    80007b70:	0006c683          	lbu	a3,0(a3)
    80007b74:	02e557bb          	divuw	a5,a0,a4
    80007b78:	f8d40023          	sb	a3,-128(s0)
    80007b7c:	10b65e63          	bge	a2,a1,80007c98 <__printf+0x670>
    80007b80:	06300593          	li	a1,99
    80007b84:	02e7f6bb          	remuw	a3,a5,a4
    80007b88:	02069693          	slli	a3,a3,0x20
    80007b8c:	0206d693          	srli	a3,a3,0x20
    80007b90:	00dd86b3          	add	a3,s11,a3
    80007b94:	0006c683          	lbu	a3,0(a3)
    80007b98:	02e7d73b          	divuw	a4,a5,a4
    80007b9c:	00200793          	li	a5,2
    80007ba0:	f8d400a3          	sb	a3,-127(s0)
    80007ba4:	bca5ece3          	bltu	a1,a0,8000777c <__printf+0x154>
    80007ba8:	ce5ff06f          	j	8000788c <__printf+0x264>
    80007bac:	40e007bb          	negw	a5,a4
    80007bb0:	00002d97          	auipc	s11,0x2
    80007bb4:	8b8d8d93          	addi	s11,s11,-1864 # 80009468 <digits>
    80007bb8:	00f7f693          	andi	a3,a5,15
    80007bbc:	00dd86b3          	add	a3,s11,a3
    80007bc0:	0006c583          	lbu	a1,0(a3)
    80007bc4:	ff100613          	li	a2,-15
    80007bc8:	0047d69b          	srliw	a3,a5,0x4
    80007bcc:	f8b40023          	sb	a1,-128(s0)
    80007bd0:	0047d59b          	srliw	a1,a5,0x4
    80007bd4:	0ac75e63          	bge	a4,a2,80007c90 <__printf+0x668>
    80007bd8:	00f6f693          	andi	a3,a3,15
    80007bdc:	00dd86b3          	add	a3,s11,a3
    80007be0:	0006c603          	lbu	a2,0(a3)
    80007be4:	00f00693          	li	a3,15
    80007be8:	0087d79b          	srliw	a5,a5,0x8
    80007bec:	f8c400a3          	sb	a2,-127(s0)
    80007bf0:	d8b6e4e3          	bltu	a3,a1,80007978 <__printf+0x350>
    80007bf4:	00200793          	li	a5,2
    80007bf8:	e2dff06f          	j	80007a24 <__printf+0x3fc>
    80007bfc:	00002c97          	auipc	s9,0x2
    80007c00:	84cc8c93          	addi	s9,s9,-1972 # 80009448 <CONSOLE_STATUS+0x438>
    80007c04:	02800513          	li	a0,40
    80007c08:	ef1ff06f          	j	80007af8 <__printf+0x4d0>
    80007c0c:	00700793          	li	a5,7
    80007c10:	00600c93          	li	s9,6
    80007c14:	e0dff06f          	j	80007a20 <__printf+0x3f8>
    80007c18:	00700793          	li	a5,7
    80007c1c:	00600c93          	li	s9,6
    80007c20:	c69ff06f          	j	80007888 <__printf+0x260>
    80007c24:	00300793          	li	a5,3
    80007c28:	00200c93          	li	s9,2
    80007c2c:	c5dff06f          	j	80007888 <__printf+0x260>
    80007c30:	00300793          	li	a5,3
    80007c34:	00200c93          	li	s9,2
    80007c38:	de9ff06f          	j	80007a20 <__printf+0x3f8>
    80007c3c:	00400793          	li	a5,4
    80007c40:	00300c93          	li	s9,3
    80007c44:	dddff06f          	j	80007a20 <__printf+0x3f8>
    80007c48:	00400793          	li	a5,4
    80007c4c:	00300c93          	li	s9,3
    80007c50:	c39ff06f          	j	80007888 <__printf+0x260>
    80007c54:	00500793          	li	a5,5
    80007c58:	00400c93          	li	s9,4
    80007c5c:	c2dff06f          	j	80007888 <__printf+0x260>
    80007c60:	00500793          	li	a5,5
    80007c64:	00400c93          	li	s9,4
    80007c68:	db9ff06f          	j	80007a20 <__printf+0x3f8>
    80007c6c:	00600793          	li	a5,6
    80007c70:	00500c93          	li	s9,5
    80007c74:	dadff06f          	j	80007a20 <__printf+0x3f8>
    80007c78:	00600793          	li	a5,6
    80007c7c:	00500c93          	li	s9,5
    80007c80:	c09ff06f          	j	80007888 <__printf+0x260>
    80007c84:	00800793          	li	a5,8
    80007c88:	00700c93          	li	s9,7
    80007c8c:	bfdff06f          	j	80007888 <__printf+0x260>
    80007c90:	00100793          	li	a5,1
    80007c94:	d91ff06f          	j	80007a24 <__printf+0x3fc>
    80007c98:	00100793          	li	a5,1
    80007c9c:	bf1ff06f          	j	8000788c <__printf+0x264>
    80007ca0:	00900793          	li	a5,9
    80007ca4:	00800c93          	li	s9,8
    80007ca8:	be1ff06f          	j	80007888 <__printf+0x260>
    80007cac:	00001517          	auipc	a0,0x1
    80007cb0:	7a450513          	addi	a0,a0,1956 # 80009450 <CONSOLE_STATUS+0x440>
    80007cb4:	00000097          	auipc	ra,0x0
    80007cb8:	918080e7          	jalr	-1768(ra) # 800075cc <panic>

0000000080007cbc <printfinit>:
    80007cbc:	fe010113          	addi	sp,sp,-32
    80007cc0:	00813823          	sd	s0,16(sp)
    80007cc4:	00913423          	sd	s1,8(sp)
    80007cc8:	00113c23          	sd	ra,24(sp)
    80007ccc:	02010413          	addi	s0,sp,32
    80007cd0:	00005497          	auipc	s1,0x5
    80007cd4:	ce048493          	addi	s1,s1,-800 # 8000c9b0 <pr>
    80007cd8:	00048513          	mv	a0,s1
    80007cdc:	00001597          	auipc	a1,0x1
    80007ce0:	78458593          	addi	a1,a1,1924 # 80009460 <CONSOLE_STATUS+0x450>
    80007ce4:	00000097          	auipc	ra,0x0
    80007ce8:	5f4080e7          	jalr	1524(ra) # 800082d8 <initlock>
    80007cec:	01813083          	ld	ra,24(sp)
    80007cf0:	01013403          	ld	s0,16(sp)
    80007cf4:	0004ac23          	sw	zero,24(s1)
    80007cf8:	00813483          	ld	s1,8(sp)
    80007cfc:	02010113          	addi	sp,sp,32
    80007d00:	00008067          	ret

0000000080007d04 <uartinit>:
    80007d04:	ff010113          	addi	sp,sp,-16
    80007d08:	00813423          	sd	s0,8(sp)
    80007d0c:	01010413          	addi	s0,sp,16
    80007d10:	100007b7          	lui	a5,0x10000
    80007d14:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007d18:	f8000713          	li	a4,-128
    80007d1c:	00e781a3          	sb	a4,3(a5)
    80007d20:	00300713          	li	a4,3
    80007d24:	00e78023          	sb	a4,0(a5)
    80007d28:	000780a3          	sb	zero,1(a5)
    80007d2c:	00e781a3          	sb	a4,3(a5)
    80007d30:	00700693          	li	a3,7
    80007d34:	00d78123          	sb	a3,2(a5)
    80007d38:	00e780a3          	sb	a4,1(a5)
    80007d3c:	00813403          	ld	s0,8(sp)
    80007d40:	01010113          	addi	sp,sp,16
    80007d44:	00008067          	ret

0000000080007d48 <uartputc>:
    80007d48:	00004797          	auipc	a5,0x4
    80007d4c:	9707a783          	lw	a5,-1680(a5) # 8000b6b8 <panicked>
    80007d50:	00078463          	beqz	a5,80007d58 <uartputc+0x10>
    80007d54:	0000006f          	j	80007d54 <uartputc+0xc>
    80007d58:	fd010113          	addi	sp,sp,-48
    80007d5c:	02813023          	sd	s0,32(sp)
    80007d60:	00913c23          	sd	s1,24(sp)
    80007d64:	01213823          	sd	s2,16(sp)
    80007d68:	01313423          	sd	s3,8(sp)
    80007d6c:	02113423          	sd	ra,40(sp)
    80007d70:	03010413          	addi	s0,sp,48
    80007d74:	00004917          	auipc	s2,0x4
    80007d78:	94c90913          	addi	s2,s2,-1716 # 8000b6c0 <uart_tx_r>
    80007d7c:	00093783          	ld	a5,0(s2)
    80007d80:	00004497          	auipc	s1,0x4
    80007d84:	94848493          	addi	s1,s1,-1720 # 8000b6c8 <uart_tx_w>
    80007d88:	0004b703          	ld	a4,0(s1)
    80007d8c:	02078693          	addi	a3,a5,32
    80007d90:	00050993          	mv	s3,a0
    80007d94:	02e69c63          	bne	a3,a4,80007dcc <uartputc+0x84>
    80007d98:	00001097          	auipc	ra,0x1
    80007d9c:	834080e7          	jalr	-1996(ra) # 800085cc <push_on>
    80007da0:	00093783          	ld	a5,0(s2)
    80007da4:	0004b703          	ld	a4,0(s1)
    80007da8:	02078793          	addi	a5,a5,32
    80007dac:	00e79463          	bne	a5,a4,80007db4 <uartputc+0x6c>
    80007db0:	0000006f          	j	80007db0 <uartputc+0x68>
    80007db4:	00001097          	auipc	ra,0x1
    80007db8:	88c080e7          	jalr	-1908(ra) # 80008640 <pop_on>
    80007dbc:	00093783          	ld	a5,0(s2)
    80007dc0:	0004b703          	ld	a4,0(s1)
    80007dc4:	02078693          	addi	a3,a5,32
    80007dc8:	fce688e3          	beq	a3,a4,80007d98 <uartputc+0x50>
    80007dcc:	01f77693          	andi	a3,a4,31
    80007dd0:	00005597          	auipc	a1,0x5
    80007dd4:	c0058593          	addi	a1,a1,-1024 # 8000c9d0 <uart_tx_buf>
    80007dd8:	00d586b3          	add	a3,a1,a3
    80007ddc:	00170713          	addi	a4,a4,1
    80007de0:	01368023          	sb	s3,0(a3)
    80007de4:	00e4b023          	sd	a4,0(s1)
    80007de8:	10000637          	lui	a2,0x10000
    80007dec:	02f71063          	bne	a4,a5,80007e0c <uartputc+0xc4>
    80007df0:	0340006f          	j	80007e24 <uartputc+0xdc>
    80007df4:	00074703          	lbu	a4,0(a4)
    80007df8:	00f93023          	sd	a5,0(s2)
    80007dfc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007e00:	00093783          	ld	a5,0(s2)
    80007e04:	0004b703          	ld	a4,0(s1)
    80007e08:	00f70e63          	beq	a4,a5,80007e24 <uartputc+0xdc>
    80007e0c:	00564683          	lbu	a3,5(a2)
    80007e10:	01f7f713          	andi	a4,a5,31
    80007e14:	00e58733          	add	a4,a1,a4
    80007e18:	0206f693          	andi	a3,a3,32
    80007e1c:	00178793          	addi	a5,a5,1
    80007e20:	fc069ae3          	bnez	a3,80007df4 <uartputc+0xac>
    80007e24:	02813083          	ld	ra,40(sp)
    80007e28:	02013403          	ld	s0,32(sp)
    80007e2c:	01813483          	ld	s1,24(sp)
    80007e30:	01013903          	ld	s2,16(sp)
    80007e34:	00813983          	ld	s3,8(sp)
    80007e38:	03010113          	addi	sp,sp,48
    80007e3c:	00008067          	ret

0000000080007e40 <uartputc_sync>:
    80007e40:	ff010113          	addi	sp,sp,-16
    80007e44:	00813423          	sd	s0,8(sp)
    80007e48:	01010413          	addi	s0,sp,16
    80007e4c:	00004717          	auipc	a4,0x4
    80007e50:	86c72703          	lw	a4,-1940(a4) # 8000b6b8 <panicked>
    80007e54:	02071663          	bnez	a4,80007e80 <uartputc_sync+0x40>
    80007e58:	00050793          	mv	a5,a0
    80007e5c:	100006b7          	lui	a3,0x10000
    80007e60:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007e64:	02077713          	andi	a4,a4,32
    80007e68:	fe070ce3          	beqz	a4,80007e60 <uartputc_sync+0x20>
    80007e6c:	0ff7f793          	andi	a5,a5,255
    80007e70:	00f68023          	sb	a5,0(a3)
    80007e74:	00813403          	ld	s0,8(sp)
    80007e78:	01010113          	addi	sp,sp,16
    80007e7c:	00008067          	ret
    80007e80:	0000006f          	j	80007e80 <uartputc_sync+0x40>

0000000080007e84 <uartstart>:
    80007e84:	ff010113          	addi	sp,sp,-16
    80007e88:	00813423          	sd	s0,8(sp)
    80007e8c:	01010413          	addi	s0,sp,16
    80007e90:	00004617          	auipc	a2,0x4
    80007e94:	83060613          	addi	a2,a2,-2000 # 8000b6c0 <uart_tx_r>
    80007e98:	00004517          	auipc	a0,0x4
    80007e9c:	83050513          	addi	a0,a0,-2000 # 8000b6c8 <uart_tx_w>
    80007ea0:	00063783          	ld	a5,0(a2)
    80007ea4:	00053703          	ld	a4,0(a0)
    80007ea8:	04f70263          	beq	a4,a5,80007eec <uartstart+0x68>
    80007eac:	100005b7          	lui	a1,0x10000
    80007eb0:	00005817          	auipc	a6,0x5
    80007eb4:	b2080813          	addi	a6,a6,-1248 # 8000c9d0 <uart_tx_buf>
    80007eb8:	01c0006f          	j	80007ed4 <uartstart+0x50>
    80007ebc:	0006c703          	lbu	a4,0(a3)
    80007ec0:	00f63023          	sd	a5,0(a2)
    80007ec4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007ec8:	00063783          	ld	a5,0(a2)
    80007ecc:	00053703          	ld	a4,0(a0)
    80007ed0:	00f70e63          	beq	a4,a5,80007eec <uartstart+0x68>
    80007ed4:	01f7f713          	andi	a4,a5,31
    80007ed8:	00e806b3          	add	a3,a6,a4
    80007edc:	0055c703          	lbu	a4,5(a1)
    80007ee0:	00178793          	addi	a5,a5,1
    80007ee4:	02077713          	andi	a4,a4,32
    80007ee8:	fc071ae3          	bnez	a4,80007ebc <uartstart+0x38>
    80007eec:	00813403          	ld	s0,8(sp)
    80007ef0:	01010113          	addi	sp,sp,16
    80007ef4:	00008067          	ret

0000000080007ef8 <uartgetc>:
    80007ef8:	ff010113          	addi	sp,sp,-16
    80007efc:	00813423          	sd	s0,8(sp)
    80007f00:	01010413          	addi	s0,sp,16
    80007f04:	10000737          	lui	a4,0x10000
    80007f08:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007f0c:	0017f793          	andi	a5,a5,1
    80007f10:	00078c63          	beqz	a5,80007f28 <uartgetc+0x30>
    80007f14:	00074503          	lbu	a0,0(a4)
    80007f18:	0ff57513          	andi	a0,a0,255
    80007f1c:	00813403          	ld	s0,8(sp)
    80007f20:	01010113          	addi	sp,sp,16
    80007f24:	00008067          	ret
    80007f28:	fff00513          	li	a0,-1
    80007f2c:	ff1ff06f          	j	80007f1c <uartgetc+0x24>

0000000080007f30 <uartintr>:
    80007f30:	100007b7          	lui	a5,0x10000
    80007f34:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007f38:	0017f793          	andi	a5,a5,1
    80007f3c:	0a078463          	beqz	a5,80007fe4 <uartintr+0xb4>
    80007f40:	fe010113          	addi	sp,sp,-32
    80007f44:	00813823          	sd	s0,16(sp)
    80007f48:	00913423          	sd	s1,8(sp)
    80007f4c:	00113c23          	sd	ra,24(sp)
    80007f50:	02010413          	addi	s0,sp,32
    80007f54:	100004b7          	lui	s1,0x10000
    80007f58:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007f5c:	0ff57513          	andi	a0,a0,255
    80007f60:	fffff097          	auipc	ra,0xfffff
    80007f64:	534080e7          	jalr	1332(ra) # 80007494 <consoleintr>
    80007f68:	0054c783          	lbu	a5,5(s1)
    80007f6c:	0017f793          	andi	a5,a5,1
    80007f70:	fe0794e3          	bnez	a5,80007f58 <uartintr+0x28>
    80007f74:	00003617          	auipc	a2,0x3
    80007f78:	74c60613          	addi	a2,a2,1868 # 8000b6c0 <uart_tx_r>
    80007f7c:	00003517          	auipc	a0,0x3
    80007f80:	74c50513          	addi	a0,a0,1868 # 8000b6c8 <uart_tx_w>
    80007f84:	00063783          	ld	a5,0(a2)
    80007f88:	00053703          	ld	a4,0(a0)
    80007f8c:	04f70263          	beq	a4,a5,80007fd0 <uartintr+0xa0>
    80007f90:	100005b7          	lui	a1,0x10000
    80007f94:	00005817          	auipc	a6,0x5
    80007f98:	a3c80813          	addi	a6,a6,-1476 # 8000c9d0 <uart_tx_buf>
    80007f9c:	01c0006f          	j	80007fb8 <uartintr+0x88>
    80007fa0:	0006c703          	lbu	a4,0(a3)
    80007fa4:	00f63023          	sd	a5,0(a2)
    80007fa8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007fac:	00063783          	ld	a5,0(a2)
    80007fb0:	00053703          	ld	a4,0(a0)
    80007fb4:	00f70e63          	beq	a4,a5,80007fd0 <uartintr+0xa0>
    80007fb8:	01f7f713          	andi	a4,a5,31
    80007fbc:	00e806b3          	add	a3,a6,a4
    80007fc0:	0055c703          	lbu	a4,5(a1)
    80007fc4:	00178793          	addi	a5,a5,1
    80007fc8:	02077713          	andi	a4,a4,32
    80007fcc:	fc071ae3          	bnez	a4,80007fa0 <uartintr+0x70>
    80007fd0:	01813083          	ld	ra,24(sp)
    80007fd4:	01013403          	ld	s0,16(sp)
    80007fd8:	00813483          	ld	s1,8(sp)
    80007fdc:	02010113          	addi	sp,sp,32
    80007fe0:	00008067          	ret
    80007fe4:	00003617          	auipc	a2,0x3
    80007fe8:	6dc60613          	addi	a2,a2,1756 # 8000b6c0 <uart_tx_r>
    80007fec:	00003517          	auipc	a0,0x3
    80007ff0:	6dc50513          	addi	a0,a0,1756 # 8000b6c8 <uart_tx_w>
    80007ff4:	00063783          	ld	a5,0(a2)
    80007ff8:	00053703          	ld	a4,0(a0)
    80007ffc:	04f70263          	beq	a4,a5,80008040 <uartintr+0x110>
    80008000:	100005b7          	lui	a1,0x10000
    80008004:	00005817          	auipc	a6,0x5
    80008008:	9cc80813          	addi	a6,a6,-1588 # 8000c9d0 <uart_tx_buf>
    8000800c:	01c0006f          	j	80008028 <uartintr+0xf8>
    80008010:	0006c703          	lbu	a4,0(a3)
    80008014:	00f63023          	sd	a5,0(a2)
    80008018:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000801c:	00063783          	ld	a5,0(a2)
    80008020:	00053703          	ld	a4,0(a0)
    80008024:	02f70063          	beq	a4,a5,80008044 <uartintr+0x114>
    80008028:	01f7f713          	andi	a4,a5,31
    8000802c:	00e806b3          	add	a3,a6,a4
    80008030:	0055c703          	lbu	a4,5(a1)
    80008034:	00178793          	addi	a5,a5,1
    80008038:	02077713          	andi	a4,a4,32
    8000803c:	fc071ae3          	bnez	a4,80008010 <uartintr+0xe0>
    80008040:	00008067          	ret
    80008044:	00008067          	ret

0000000080008048 <kinit>:
    80008048:	fc010113          	addi	sp,sp,-64
    8000804c:	02913423          	sd	s1,40(sp)
    80008050:	fffff7b7          	lui	a5,0xfffff
    80008054:	00006497          	auipc	s1,0x6
    80008058:	99b48493          	addi	s1,s1,-1637 # 8000d9ef <end+0xfff>
    8000805c:	02813823          	sd	s0,48(sp)
    80008060:	01313c23          	sd	s3,24(sp)
    80008064:	00f4f4b3          	and	s1,s1,a5
    80008068:	02113c23          	sd	ra,56(sp)
    8000806c:	03213023          	sd	s2,32(sp)
    80008070:	01413823          	sd	s4,16(sp)
    80008074:	01513423          	sd	s5,8(sp)
    80008078:	04010413          	addi	s0,sp,64
    8000807c:	000017b7          	lui	a5,0x1
    80008080:	01100993          	li	s3,17
    80008084:	00f487b3          	add	a5,s1,a5
    80008088:	01b99993          	slli	s3,s3,0x1b
    8000808c:	06f9e063          	bltu	s3,a5,800080ec <kinit+0xa4>
    80008090:	00005a97          	auipc	s5,0x5
    80008094:	960a8a93          	addi	s5,s5,-1696 # 8000c9f0 <end>
    80008098:	0754ec63          	bltu	s1,s5,80008110 <kinit+0xc8>
    8000809c:	0734fa63          	bgeu	s1,s3,80008110 <kinit+0xc8>
    800080a0:	00088a37          	lui	s4,0x88
    800080a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800080a8:	00003917          	auipc	s2,0x3
    800080ac:	62890913          	addi	s2,s2,1576 # 8000b6d0 <kmem>
    800080b0:	00ca1a13          	slli	s4,s4,0xc
    800080b4:	0140006f          	j	800080c8 <kinit+0x80>
    800080b8:	000017b7          	lui	a5,0x1
    800080bc:	00f484b3          	add	s1,s1,a5
    800080c0:	0554e863          	bltu	s1,s5,80008110 <kinit+0xc8>
    800080c4:	0534f663          	bgeu	s1,s3,80008110 <kinit+0xc8>
    800080c8:	00001637          	lui	a2,0x1
    800080cc:	00100593          	li	a1,1
    800080d0:	00048513          	mv	a0,s1
    800080d4:	00000097          	auipc	ra,0x0
    800080d8:	5e4080e7          	jalr	1508(ra) # 800086b8 <__memset>
    800080dc:	00093783          	ld	a5,0(s2)
    800080e0:	00f4b023          	sd	a5,0(s1)
    800080e4:	00993023          	sd	s1,0(s2)
    800080e8:	fd4498e3          	bne	s1,s4,800080b8 <kinit+0x70>
    800080ec:	03813083          	ld	ra,56(sp)
    800080f0:	03013403          	ld	s0,48(sp)
    800080f4:	02813483          	ld	s1,40(sp)
    800080f8:	02013903          	ld	s2,32(sp)
    800080fc:	01813983          	ld	s3,24(sp)
    80008100:	01013a03          	ld	s4,16(sp)
    80008104:	00813a83          	ld	s5,8(sp)
    80008108:	04010113          	addi	sp,sp,64
    8000810c:	00008067          	ret
    80008110:	00001517          	auipc	a0,0x1
    80008114:	37050513          	addi	a0,a0,880 # 80009480 <digits+0x18>
    80008118:	fffff097          	auipc	ra,0xfffff
    8000811c:	4b4080e7          	jalr	1204(ra) # 800075cc <panic>

0000000080008120 <freerange>:
    80008120:	fc010113          	addi	sp,sp,-64
    80008124:	000017b7          	lui	a5,0x1
    80008128:	02913423          	sd	s1,40(sp)
    8000812c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008130:	009504b3          	add	s1,a0,s1
    80008134:	fffff537          	lui	a0,0xfffff
    80008138:	02813823          	sd	s0,48(sp)
    8000813c:	02113c23          	sd	ra,56(sp)
    80008140:	03213023          	sd	s2,32(sp)
    80008144:	01313c23          	sd	s3,24(sp)
    80008148:	01413823          	sd	s4,16(sp)
    8000814c:	01513423          	sd	s5,8(sp)
    80008150:	01613023          	sd	s6,0(sp)
    80008154:	04010413          	addi	s0,sp,64
    80008158:	00a4f4b3          	and	s1,s1,a0
    8000815c:	00f487b3          	add	a5,s1,a5
    80008160:	06f5e463          	bltu	a1,a5,800081c8 <freerange+0xa8>
    80008164:	00005a97          	auipc	s5,0x5
    80008168:	88ca8a93          	addi	s5,s5,-1908 # 8000c9f0 <end>
    8000816c:	0954e263          	bltu	s1,s5,800081f0 <freerange+0xd0>
    80008170:	01100993          	li	s3,17
    80008174:	01b99993          	slli	s3,s3,0x1b
    80008178:	0734fc63          	bgeu	s1,s3,800081f0 <freerange+0xd0>
    8000817c:	00058a13          	mv	s4,a1
    80008180:	00003917          	auipc	s2,0x3
    80008184:	55090913          	addi	s2,s2,1360 # 8000b6d0 <kmem>
    80008188:	00002b37          	lui	s6,0x2
    8000818c:	0140006f          	j	800081a0 <freerange+0x80>
    80008190:	000017b7          	lui	a5,0x1
    80008194:	00f484b3          	add	s1,s1,a5
    80008198:	0554ec63          	bltu	s1,s5,800081f0 <freerange+0xd0>
    8000819c:	0534fa63          	bgeu	s1,s3,800081f0 <freerange+0xd0>
    800081a0:	00001637          	lui	a2,0x1
    800081a4:	00100593          	li	a1,1
    800081a8:	00048513          	mv	a0,s1
    800081ac:	00000097          	auipc	ra,0x0
    800081b0:	50c080e7          	jalr	1292(ra) # 800086b8 <__memset>
    800081b4:	00093703          	ld	a4,0(s2)
    800081b8:	016487b3          	add	a5,s1,s6
    800081bc:	00e4b023          	sd	a4,0(s1)
    800081c0:	00993023          	sd	s1,0(s2)
    800081c4:	fcfa76e3          	bgeu	s4,a5,80008190 <freerange+0x70>
    800081c8:	03813083          	ld	ra,56(sp)
    800081cc:	03013403          	ld	s0,48(sp)
    800081d0:	02813483          	ld	s1,40(sp)
    800081d4:	02013903          	ld	s2,32(sp)
    800081d8:	01813983          	ld	s3,24(sp)
    800081dc:	01013a03          	ld	s4,16(sp)
    800081e0:	00813a83          	ld	s5,8(sp)
    800081e4:	00013b03          	ld	s6,0(sp)
    800081e8:	04010113          	addi	sp,sp,64
    800081ec:	00008067          	ret
    800081f0:	00001517          	auipc	a0,0x1
    800081f4:	29050513          	addi	a0,a0,656 # 80009480 <digits+0x18>
    800081f8:	fffff097          	auipc	ra,0xfffff
    800081fc:	3d4080e7          	jalr	980(ra) # 800075cc <panic>

0000000080008200 <kfree>:
    80008200:	fe010113          	addi	sp,sp,-32
    80008204:	00813823          	sd	s0,16(sp)
    80008208:	00113c23          	sd	ra,24(sp)
    8000820c:	00913423          	sd	s1,8(sp)
    80008210:	02010413          	addi	s0,sp,32
    80008214:	03451793          	slli	a5,a0,0x34
    80008218:	04079c63          	bnez	a5,80008270 <kfree+0x70>
    8000821c:	00004797          	auipc	a5,0x4
    80008220:	7d478793          	addi	a5,a5,2004 # 8000c9f0 <end>
    80008224:	00050493          	mv	s1,a0
    80008228:	04f56463          	bltu	a0,a5,80008270 <kfree+0x70>
    8000822c:	01100793          	li	a5,17
    80008230:	01b79793          	slli	a5,a5,0x1b
    80008234:	02f57e63          	bgeu	a0,a5,80008270 <kfree+0x70>
    80008238:	00001637          	lui	a2,0x1
    8000823c:	00100593          	li	a1,1
    80008240:	00000097          	auipc	ra,0x0
    80008244:	478080e7          	jalr	1144(ra) # 800086b8 <__memset>
    80008248:	00003797          	auipc	a5,0x3
    8000824c:	48878793          	addi	a5,a5,1160 # 8000b6d0 <kmem>
    80008250:	0007b703          	ld	a4,0(a5)
    80008254:	01813083          	ld	ra,24(sp)
    80008258:	01013403          	ld	s0,16(sp)
    8000825c:	00e4b023          	sd	a4,0(s1)
    80008260:	0097b023          	sd	s1,0(a5)
    80008264:	00813483          	ld	s1,8(sp)
    80008268:	02010113          	addi	sp,sp,32
    8000826c:	00008067          	ret
    80008270:	00001517          	auipc	a0,0x1
    80008274:	21050513          	addi	a0,a0,528 # 80009480 <digits+0x18>
    80008278:	fffff097          	auipc	ra,0xfffff
    8000827c:	354080e7          	jalr	852(ra) # 800075cc <panic>

0000000080008280 <kalloc>:
    80008280:	fe010113          	addi	sp,sp,-32
    80008284:	00813823          	sd	s0,16(sp)
    80008288:	00913423          	sd	s1,8(sp)
    8000828c:	00113c23          	sd	ra,24(sp)
    80008290:	02010413          	addi	s0,sp,32
    80008294:	00003797          	auipc	a5,0x3
    80008298:	43c78793          	addi	a5,a5,1084 # 8000b6d0 <kmem>
    8000829c:	0007b483          	ld	s1,0(a5)
    800082a0:	02048063          	beqz	s1,800082c0 <kalloc+0x40>
    800082a4:	0004b703          	ld	a4,0(s1)
    800082a8:	00001637          	lui	a2,0x1
    800082ac:	00500593          	li	a1,5
    800082b0:	00048513          	mv	a0,s1
    800082b4:	00e7b023          	sd	a4,0(a5)
    800082b8:	00000097          	auipc	ra,0x0
    800082bc:	400080e7          	jalr	1024(ra) # 800086b8 <__memset>
    800082c0:	01813083          	ld	ra,24(sp)
    800082c4:	01013403          	ld	s0,16(sp)
    800082c8:	00048513          	mv	a0,s1
    800082cc:	00813483          	ld	s1,8(sp)
    800082d0:	02010113          	addi	sp,sp,32
    800082d4:	00008067          	ret

00000000800082d8 <initlock>:
    800082d8:	ff010113          	addi	sp,sp,-16
    800082dc:	00813423          	sd	s0,8(sp)
    800082e0:	01010413          	addi	s0,sp,16
    800082e4:	00813403          	ld	s0,8(sp)
    800082e8:	00b53423          	sd	a1,8(a0)
    800082ec:	00052023          	sw	zero,0(a0)
    800082f0:	00053823          	sd	zero,16(a0)
    800082f4:	01010113          	addi	sp,sp,16
    800082f8:	00008067          	ret

00000000800082fc <acquire>:
    800082fc:	fe010113          	addi	sp,sp,-32
    80008300:	00813823          	sd	s0,16(sp)
    80008304:	00913423          	sd	s1,8(sp)
    80008308:	00113c23          	sd	ra,24(sp)
    8000830c:	01213023          	sd	s2,0(sp)
    80008310:	02010413          	addi	s0,sp,32
    80008314:	00050493          	mv	s1,a0
    80008318:	10002973          	csrr	s2,sstatus
    8000831c:	100027f3          	csrr	a5,sstatus
    80008320:	ffd7f793          	andi	a5,a5,-3
    80008324:	10079073          	csrw	sstatus,a5
    80008328:	fffff097          	auipc	ra,0xfffff
    8000832c:	8e8080e7          	jalr	-1816(ra) # 80006c10 <mycpu>
    80008330:	07852783          	lw	a5,120(a0)
    80008334:	06078e63          	beqz	a5,800083b0 <acquire+0xb4>
    80008338:	fffff097          	auipc	ra,0xfffff
    8000833c:	8d8080e7          	jalr	-1832(ra) # 80006c10 <mycpu>
    80008340:	07852783          	lw	a5,120(a0)
    80008344:	0004a703          	lw	a4,0(s1)
    80008348:	0017879b          	addiw	a5,a5,1
    8000834c:	06f52c23          	sw	a5,120(a0)
    80008350:	04071063          	bnez	a4,80008390 <acquire+0x94>
    80008354:	00100713          	li	a4,1
    80008358:	00070793          	mv	a5,a4
    8000835c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008360:	0007879b          	sext.w	a5,a5
    80008364:	fe079ae3          	bnez	a5,80008358 <acquire+0x5c>
    80008368:	0ff0000f          	fence
    8000836c:	fffff097          	auipc	ra,0xfffff
    80008370:	8a4080e7          	jalr	-1884(ra) # 80006c10 <mycpu>
    80008374:	01813083          	ld	ra,24(sp)
    80008378:	01013403          	ld	s0,16(sp)
    8000837c:	00a4b823          	sd	a0,16(s1)
    80008380:	00013903          	ld	s2,0(sp)
    80008384:	00813483          	ld	s1,8(sp)
    80008388:	02010113          	addi	sp,sp,32
    8000838c:	00008067          	ret
    80008390:	0104b903          	ld	s2,16(s1)
    80008394:	fffff097          	auipc	ra,0xfffff
    80008398:	87c080e7          	jalr	-1924(ra) # 80006c10 <mycpu>
    8000839c:	faa91ce3          	bne	s2,a0,80008354 <acquire+0x58>
    800083a0:	00001517          	auipc	a0,0x1
    800083a4:	0e850513          	addi	a0,a0,232 # 80009488 <digits+0x20>
    800083a8:	fffff097          	auipc	ra,0xfffff
    800083ac:	224080e7          	jalr	548(ra) # 800075cc <panic>
    800083b0:	00195913          	srli	s2,s2,0x1
    800083b4:	fffff097          	auipc	ra,0xfffff
    800083b8:	85c080e7          	jalr	-1956(ra) # 80006c10 <mycpu>
    800083bc:	00197913          	andi	s2,s2,1
    800083c0:	07252e23          	sw	s2,124(a0)
    800083c4:	f75ff06f          	j	80008338 <acquire+0x3c>

00000000800083c8 <release>:
    800083c8:	fe010113          	addi	sp,sp,-32
    800083cc:	00813823          	sd	s0,16(sp)
    800083d0:	00113c23          	sd	ra,24(sp)
    800083d4:	00913423          	sd	s1,8(sp)
    800083d8:	01213023          	sd	s2,0(sp)
    800083dc:	02010413          	addi	s0,sp,32
    800083e0:	00052783          	lw	a5,0(a0)
    800083e4:	00079a63          	bnez	a5,800083f8 <release+0x30>
    800083e8:	00001517          	auipc	a0,0x1
    800083ec:	0a850513          	addi	a0,a0,168 # 80009490 <digits+0x28>
    800083f0:	fffff097          	auipc	ra,0xfffff
    800083f4:	1dc080e7          	jalr	476(ra) # 800075cc <panic>
    800083f8:	01053903          	ld	s2,16(a0)
    800083fc:	00050493          	mv	s1,a0
    80008400:	fffff097          	auipc	ra,0xfffff
    80008404:	810080e7          	jalr	-2032(ra) # 80006c10 <mycpu>
    80008408:	fea910e3          	bne	s2,a0,800083e8 <release+0x20>
    8000840c:	0004b823          	sd	zero,16(s1)
    80008410:	0ff0000f          	fence
    80008414:	0f50000f          	fence	iorw,ow
    80008418:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000841c:	ffffe097          	auipc	ra,0xffffe
    80008420:	7f4080e7          	jalr	2036(ra) # 80006c10 <mycpu>
    80008424:	100027f3          	csrr	a5,sstatus
    80008428:	0027f793          	andi	a5,a5,2
    8000842c:	04079a63          	bnez	a5,80008480 <release+0xb8>
    80008430:	07852783          	lw	a5,120(a0)
    80008434:	02f05e63          	blez	a5,80008470 <release+0xa8>
    80008438:	fff7871b          	addiw	a4,a5,-1
    8000843c:	06e52c23          	sw	a4,120(a0)
    80008440:	00071c63          	bnez	a4,80008458 <release+0x90>
    80008444:	07c52783          	lw	a5,124(a0)
    80008448:	00078863          	beqz	a5,80008458 <release+0x90>
    8000844c:	100027f3          	csrr	a5,sstatus
    80008450:	0027e793          	ori	a5,a5,2
    80008454:	10079073          	csrw	sstatus,a5
    80008458:	01813083          	ld	ra,24(sp)
    8000845c:	01013403          	ld	s0,16(sp)
    80008460:	00813483          	ld	s1,8(sp)
    80008464:	00013903          	ld	s2,0(sp)
    80008468:	02010113          	addi	sp,sp,32
    8000846c:	00008067          	ret
    80008470:	00001517          	auipc	a0,0x1
    80008474:	04050513          	addi	a0,a0,64 # 800094b0 <digits+0x48>
    80008478:	fffff097          	auipc	ra,0xfffff
    8000847c:	154080e7          	jalr	340(ra) # 800075cc <panic>
    80008480:	00001517          	auipc	a0,0x1
    80008484:	01850513          	addi	a0,a0,24 # 80009498 <digits+0x30>
    80008488:	fffff097          	auipc	ra,0xfffff
    8000848c:	144080e7          	jalr	324(ra) # 800075cc <panic>

0000000080008490 <holding>:
    80008490:	00052783          	lw	a5,0(a0)
    80008494:	00079663          	bnez	a5,800084a0 <holding+0x10>
    80008498:	00000513          	li	a0,0
    8000849c:	00008067          	ret
    800084a0:	fe010113          	addi	sp,sp,-32
    800084a4:	00813823          	sd	s0,16(sp)
    800084a8:	00913423          	sd	s1,8(sp)
    800084ac:	00113c23          	sd	ra,24(sp)
    800084b0:	02010413          	addi	s0,sp,32
    800084b4:	01053483          	ld	s1,16(a0)
    800084b8:	ffffe097          	auipc	ra,0xffffe
    800084bc:	758080e7          	jalr	1880(ra) # 80006c10 <mycpu>
    800084c0:	01813083          	ld	ra,24(sp)
    800084c4:	01013403          	ld	s0,16(sp)
    800084c8:	40a48533          	sub	a0,s1,a0
    800084cc:	00153513          	seqz	a0,a0
    800084d0:	00813483          	ld	s1,8(sp)
    800084d4:	02010113          	addi	sp,sp,32
    800084d8:	00008067          	ret

00000000800084dc <push_off>:
    800084dc:	fe010113          	addi	sp,sp,-32
    800084e0:	00813823          	sd	s0,16(sp)
    800084e4:	00113c23          	sd	ra,24(sp)
    800084e8:	00913423          	sd	s1,8(sp)
    800084ec:	02010413          	addi	s0,sp,32
    800084f0:	100024f3          	csrr	s1,sstatus
    800084f4:	100027f3          	csrr	a5,sstatus
    800084f8:	ffd7f793          	andi	a5,a5,-3
    800084fc:	10079073          	csrw	sstatus,a5
    80008500:	ffffe097          	auipc	ra,0xffffe
    80008504:	710080e7          	jalr	1808(ra) # 80006c10 <mycpu>
    80008508:	07852783          	lw	a5,120(a0)
    8000850c:	02078663          	beqz	a5,80008538 <push_off+0x5c>
    80008510:	ffffe097          	auipc	ra,0xffffe
    80008514:	700080e7          	jalr	1792(ra) # 80006c10 <mycpu>
    80008518:	07852783          	lw	a5,120(a0)
    8000851c:	01813083          	ld	ra,24(sp)
    80008520:	01013403          	ld	s0,16(sp)
    80008524:	0017879b          	addiw	a5,a5,1
    80008528:	06f52c23          	sw	a5,120(a0)
    8000852c:	00813483          	ld	s1,8(sp)
    80008530:	02010113          	addi	sp,sp,32
    80008534:	00008067          	ret
    80008538:	0014d493          	srli	s1,s1,0x1
    8000853c:	ffffe097          	auipc	ra,0xffffe
    80008540:	6d4080e7          	jalr	1748(ra) # 80006c10 <mycpu>
    80008544:	0014f493          	andi	s1,s1,1
    80008548:	06952e23          	sw	s1,124(a0)
    8000854c:	fc5ff06f          	j	80008510 <push_off+0x34>

0000000080008550 <pop_off>:
    80008550:	ff010113          	addi	sp,sp,-16
    80008554:	00813023          	sd	s0,0(sp)
    80008558:	00113423          	sd	ra,8(sp)
    8000855c:	01010413          	addi	s0,sp,16
    80008560:	ffffe097          	auipc	ra,0xffffe
    80008564:	6b0080e7          	jalr	1712(ra) # 80006c10 <mycpu>
    80008568:	100027f3          	csrr	a5,sstatus
    8000856c:	0027f793          	andi	a5,a5,2
    80008570:	04079663          	bnez	a5,800085bc <pop_off+0x6c>
    80008574:	07852783          	lw	a5,120(a0)
    80008578:	02f05a63          	blez	a5,800085ac <pop_off+0x5c>
    8000857c:	fff7871b          	addiw	a4,a5,-1
    80008580:	06e52c23          	sw	a4,120(a0)
    80008584:	00071c63          	bnez	a4,8000859c <pop_off+0x4c>
    80008588:	07c52783          	lw	a5,124(a0)
    8000858c:	00078863          	beqz	a5,8000859c <pop_off+0x4c>
    80008590:	100027f3          	csrr	a5,sstatus
    80008594:	0027e793          	ori	a5,a5,2
    80008598:	10079073          	csrw	sstatus,a5
    8000859c:	00813083          	ld	ra,8(sp)
    800085a0:	00013403          	ld	s0,0(sp)
    800085a4:	01010113          	addi	sp,sp,16
    800085a8:	00008067          	ret
    800085ac:	00001517          	auipc	a0,0x1
    800085b0:	f0450513          	addi	a0,a0,-252 # 800094b0 <digits+0x48>
    800085b4:	fffff097          	auipc	ra,0xfffff
    800085b8:	018080e7          	jalr	24(ra) # 800075cc <panic>
    800085bc:	00001517          	auipc	a0,0x1
    800085c0:	edc50513          	addi	a0,a0,-292 # 80009498 <digits+0x30>
    800085c4:	fffff097          	auipc	ra,0xfffff
    800085c8:	008080e7          	jalr	8(ra) # 800075cc <panic>

00000000800085cc <push_on>:
    800085cc:	fe010113          	addi	sp,sp,-32
    800085d0:	00813823          	sd	s0,16(sp)
    800085d4:	00113c23          	sd	ra,24(sp)
    800085d8:	00913423          	sd	s1,8(sp)
    800085dc:	02010413          	addi	s0,sp,32
    800085e0:	100024f3          	csrr	s1,sstatus
    800085e4:	100027f3          	csrr	a5,sstatus
    800085e8:	0027e793          	ori	a5,a5,2
    800085ec:	10079073          	csrw	sstatus,a5
    800085f0:	ffffe097          	auipc	ra,0xffffe
    800085f4:	620080e7          	jalr	1568(ra) # 80006c10 <mycpu>
    800085f8:	07852783          	lw	a5,120(a0)
    800085fc:	02078663          	beqz	a5,80008628 <push_on+0x5c>
    80008600:	ffffe097          	auipc	ra,0xffffe
    80008604:	610080e7          	jalr	1552(ra) # 80006c10 <mycpu>
    80008608:	07852783          	lw	a5,120(a0)
    8000860c:	01813083          	ld	ra,24(sp)
    80008610:	01013403          	ld	s0,16(sp)
    80008614:	0017879b          	addiw	a5,a5,1
    80008618:	06f52c23          	sw	a5,120(a0)
    8000861c:	00813483          	ld	s1,8(sp)
    80008620:	02010113          	addi	sp,sp,32
    80008624:	00008067          	ret
    80008628:	0014d493          	srli	s1,s1,0x1
    8000862c:	ffffe097          	auipc	ra,0xffffe
    80008630:	5e4080e7          	jalr	1508(ra) # 80006c10 <mycpu>
    80008634:	0014f493          	andi	s1,s1,1
    80008638:	06952e23          	sw	s1,124(a0)
    8000863c:	fc5ff06f          	j	80008600 <push_on+0x34>

0000000080008640 <pop_on>:
    80008640:	ff010113          	addi	sp,sp,-16
    80008644:	00813023          	sd	s0,0(sp)
    80008648:	00113423          	sd	ra,8(sp)
    8000864c:	01010413          	addi	s0,sp,16
    80008650:	ffffe097          	auipc	ra,0xffffe
    80008654:	5c0080e7          	jalr	1472(ra) # 80006c10 <mycpu>
    80008658:	100027f3          	csrr	a5,sstatus
    8000865c:	0027f793          	andi	a5,a5,2
    80008660:	04078463          	beqz	a5,800086a8 <pop_on+0x68>
    80008664:	07852783          	lw	a5,120(a0)
    80008668:	02f05863          	blez	a5,80008698 <pop_on+0x58>
    8000866c:	fff7879b          	addiw	a5,a5,-1
    80008670:	06f52c23          	sw	a5,120(a0)
    80008674:	07853783          	ld	a5,120(a0)
    80008678:	00079863          	bnez	a5,80008688 <pop_on+0x48>
    8000867c:	100027f3          	csrr	a5,sstatus
    80008680:	ffd7f793          	andi	a5,a5,-3
    80008684:	10079073          	csrw	sstatus,a5
    80008688:	00813083          	ld	ra,8(sp)
    8000868c:	00013403          	ld	s0,0(sp)
    80008690:	01010113          	addi	sp,sp,16
    80008694:	00008067          	ret
    80008698:	00001517          	auipc	a0,0x1
    8000869c:	e4050513          	addi	a0,a0,-448 # 800094d8 <digits+0x70>
    800086a0:	fffff097          	auipc	ra,0xfffff
    800086a4:	f2c080e7          	jalr	-212(ra) # 800075cc <panic>
    800086a8:	00001517          	auipc	a0,0x1
    800086ac:	e1050513          	addi	a0,a0,-496 # 800094b8 <digits+0x50>
    800086b0:	fffff097          	auipc	ra,0xfffff
    800086b4:	f1c080e7          	jalr	-228(ra) # 800075cc <panic>

00000000800086b8 <__memset>:
    800086b8:	ff010113          	addi	sp,sp,-16
    800086bc:	00813423          	sd	s0,8(sp)
    800086c0:	01010413          	addi	s0,sp,16
    800086c4:	1a060e63          	beqz	a2,80008880 <__memset+0x1c8>
    800086c8:	40a007b3          	neg	a5,a0
    800086cc:	0077f793          	andi	a5,a5,7
    800086d0:	00778693          	addi	a3,a5,7
    800086d4:	00b00813          	li	a6,11
    800086d8:	0ff5f593          	andi	a1,a1,255
    800086dc:	fff6071b          	addiw	a4,a2,-1
    800086e0:	1b06e663          	bltu	a3,a6,8000888c <__memset+0x1d4>
    800086e4:	1cd76463          	bltu	a4,a3,800088ac <__memset+0x1f4>
    800086e8:	1a078e63          	beqz	a5,800088a4 <__memset+0x1ec>
    800086ec:	00b50023          	sb	a1,0(a0)
    800086f0:	00100713          	li	a4,1
    800086f4:	1ae78463          	beq	a5,a4,8000889c <__memset+0x1e4>
    800086f8:	00b500a3          	sb	a1,1(a0)
    800086fc:	00200713          	li	a4,2
    80008700:	1ae78a63          	beq	a5,a4,800088b4 <__memset+0x1fc>
    80008704:	00b50123          	sb	a1,2(a0)
    80008708:	00300713          	li	a4,3
    8000870c:	18e78463          	beq	a5,a4,80008894 <__memset+0x1dc>
    80008710:	00b501a3          	sb	a1,3(a0)
    80008714:	00400713          	li	a4,4
    80008718:	1ae78263          	beq	a5,a4,800088bc <__memset+0x204>
    8000871c:	00b50223          	sb	a1,4(a0)
    80008720:	00500713          	li	a4,5
    80008724:	1ae78063          	beq	a5,a4,800088c4 <__memset+0x20c>
    80008728:	00b502a3          	sb	a1,5(a0)
    8000872c:	00700713          	li	a4,7
    80008730:	18e79e63          	bne	a5,a4,800088cc <__memset+0x214>
    80008734:	00b50323          	sb	a1,6(a0)
    80008738:	00700e93          	li	t4,7
    8000873c:	00859713          	slli	a4,a1,0x8
    80008740:	00e5e733          	or	a4,a1,a4
    80008744:	01059e13          	slli	t3,a1,0x10
    80008748:	01c76e33          	or	t3,a4,t3
    8000874c:	01859313          	slli	t1,a1,0x18
    80008750:	006e6333          	or	t1,t3,t1
    80008754:	02059893          	slli	a7,a1,0x20
    80008758:	40f60e3b          	subw	t3,a2,a5
    8000875c:	011368b3          	or	a7,t1,a7
    80008760:	02859813          	slli	a6,a1,0x28
    80008764:	0108e833          	or	a6,a7,a6
    80008768:	03059693          	slli	a3,a1,0x30
    8000876c:	003e589b          	srliw	a7,t3,0x3
    80008770:	00d866b3          	or	a3,a6,a3
    80008774:	03859713          	slli	a4,a1,0x38
    80008778:	00389813          	slli	a6,a7,0x3
    8000877c:	00f507b3          	add	a5,a0,a5
    80008780:	00e6e733          	or	a4,a3,a4
    80008784:	000e089b          	sext.w	a7,t3
    80008788:	00f806b3          	add	a3,a6,a5
    8000878c:	00e7b023          	sd	a4,0(a5)
    80008790:	00878793          	addi	a5,a5,8
    80008794:	fed79ce3          	bne	a5,a3,8000878c <__memset+0xd4>
    80008798:	ff8e7793          	andi	a5,t3,-8
    8000879c:	0007871b          	sext.w	a4,a5
    800087a0:	01d787bb          	addw	a5,a5,t4
    800087a4:	0ce88e63          	beq	a7,a4,80008880 <__memset+0x1c8>
    800087a8:	00f50733          	add	a4,a0,a5
    800087ac:	00b70023          	sb	a1,0(a4)
    800087b0:	0017871b          	addiw	a4,a5,1
    800087b4:	0cc77663          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    800087b8:	00e50733          	add	a4,a0,a4
    800087bc:	00b70023          	sb	a1,0(a4)
    800087c0:	0027871b          	addiw	a4,a5,2
    800087c4:	0ac77e63          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    800087c8:	00e50733          	add	a4,a0,a4
    800087cc:	00b70023          	sb	a1,0(a4)
    800087d0:	0037871b          	addiw	a4,a5,3
    800087d4:	0ac77663          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    800087d8:	00e50733          	add	a4,a0,a4
    800087dc:	00b70023          	sb	a1,0(a4)
    800087e0:	0047871b          	addiw	a4,a5,4
    800087e4:	08c77e63          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    800087e8:	00e50733          	add	a4,a0,a4
    800087ec:	00b70023          	sb	a1,0(a4)
    800087f0:	0057871b          	addiw	a4,a5,5
    800087f4:	08c77663          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    800087f8:	00e50733          	add	a4,a0,a4
    800087fc:	00b70023          	sb	a1,0(a4)
    80008800:	0067871b          	addiw	a4,a5,6
    80008804:	06c77e63          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008808:	00e50733          	add	a4,a0,a4
    8000880c:	00b70023          	sb	a1,0(a4)
    80008810:	0077871b          	addiw	a4,a5,7
    80008814:	06c77663          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008818:	00e50733          	add	a4,a0,a4
    8000881c:	00b70023          	sb	a1,0(a4)
    80008820:	0087871b          	addiw	a4,a5,8
    80008824:	04c77e63          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008828:	00e50733          	add	a4,a0,a4
    8000882c:	00b70023          	sb	a1,0(a4)
    80008830:	0097871b          	addiw	a4,a5,9
    80008834:	04c77663          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008838:	00e50733          	add	a4,a0,a4
    8000883c:	00b70023          	sb	a1,0(a4)
    80008840:	00a7871b          	addiw	a4,a5,10
    80008844:	02c77e63          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008848:	00e50733          	add	a4,a0,a4
    8000884c:	00b70023          	sb	a1,0(a4)
    80008850:	00b7871b          	addiw	a4,a5,11
    80008854:	02c77663          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008858:	00e50733          	add	a4,a0,a4
    8000885c:	00b70023          	sb	a1,0(a4)
    80008860:	00c7871b          	addiw	a4,a5,12
    80008864:	00c77e63          	bgeu	a4,a2,80008880 <__memset+0x1c8>
    80008868:	00e50733          	add	a4,a0,a4
    8000886c:	00b70023          	sb	a1,0(a4)
    80008870:	00d7879b          	addiw	a5,a5,13
    80008874:	00c7f663          	bgeu	a5,a2,80008880 <__memset+0x1c8>
    80008878:	00f507b3          	add	a5,a0,a5
    8000887c:	00b78023          	sb	a1,0(a5)
    80008880:	00813403          	ld	s0,8(sp)
    80008884:	01010113          	addi	sp,sp,16
    80008888:	00008067          	ret
    8000888c:	00b00693          	li	a3,11
    80008890:	e55ff06f          	j	800086e4 <__memset+0x2c>
    80008894:	00300e93          	li	t4,3
    80008898:	ea5ff06f          	j	8000873c <__memset+0x84>
    8000889c:	00100e93          	li	t4,1
    800088a0:	e9dff06f          	j	8000873c <__memset+0x84>
    800088a4:	00000e93          	li	t4,0
    800088a8:	e95ff06f          	j	8000873c <__memset+0x84>
    800088ac:	00000793          	li	a5,0
    800088b0:	ef9ff06f          	j	800087a8 <__memset+0xf0>
    800088b4:	00200e93          	li	t4,2
    800088b8:	e85ff06f          	j	8000873c <__memset+0x84>
    800088bc:	00400e93          	li	t4,4
    800088c0:	e7dff06f          	j	8000873c <__memset+0x84>
    800088c4:	00500e93          	li	t4,5
    800088c8:	e75ff06f          	j	8000873c <__memset+0x84>
    800088cc:	00600e93          	li	t4,6
    800088d0:	e6dff06f          	j	8000873c <__memset+0x84>

00000000800088d4 <__memmove>:
    800088d4:	ff010113          	addi	sp,sp,-16
    800088d8:	00813423          	sd	s0,8(sp)
    800088dc:	01010413          	addi	s0,sp,16
    800088e0:	0e060863          	beqz	a2,800089d0 <__memmove+0xfc>
    800088e4:	fff6069b          	addiw	a3,a2,-1
    800088e8:	0006881b          	sext.w	a6,a3
    800088ec:	0ea5e863          	bltu	a1,a0,800089dc <__memmove+0x108>
    800088f0:	00758713          	addi	a4,a1,7
    800088f4:	00a5e7b3          	or	a5,a1,a0
    800088f8:	40a70733          	sub	a4,a4,a0
    800088fc:	0077f793          	andi	a5,a5,7
    80008900:	00f73713          	sltiu	a4,a4,15
    80008904:	00174713          	xori	a4,a4,1
    80008908:	0017b793          	seqz	a5,a5
    8000890c:	00e7f7b3          	and	a5,a5,a4
    80008910:	10078863          	beqz	a5,80008a20 <__memmove+0x14c>
    80008914:	00900793          	li	a5,9
    80008918:	1107f463          	bgeu	a5,a6,80008a20 <__memmove+0x14c>
    8000891c:	0036581b          	srliw	a6,a2,0x3
    80008920:	fff8081b          	addiw	a6,a6,-1
    80008924:	02081813          	slli	a6,a6,0x20
    80008928:	01d85893          	srli	a7,a6,0x1d
    8000892c:	00858813          	addi	a6,a1,8
    80008930:	00058793          	mv	a5,a1
    80008934:	00050713          	mv	a4,a0
    80008938:	01088833          	add	a6,a7,a6
    8000893c:	0007b883          	ld	a7,0(a5)
    80008940:	00878793          	addi	a5,a5,8
    80008944:	00870713          	addi	a4,a4,8
    80008948:	ff173c23          	sd	a7,-8(a4)
    8000894c:	ff0798e3          	bne	a5,a6,8000893c <__memmove+0x68>
    80008950:	ff867713          	andi	a4,a2,-8
    80008954:	02071793          	slli	a5,a4,0x20
    80008958:	0207d793          	srli	a5,a5,0x20
    8000895c:	00f585b3          	add	a1,a1,a5
    80008960:	40e686bb          	subw	a3,a3,a4
    80008964:	00f507b3          	add	a5,a0,a5
    80008968:	06e60463          	beq	a2,a4,800089d0 <__memmove+0xfc>
    8000896c:	0005c703          	lbu	a4,0(a1)
    80008970:	00e78023          	sb	a4,0(a5)
    80008974:	04068e63          	beqz	a3,800089d0 <__memmove+0xfc>
    80008978:	0015c603          	lbu	a2,1(a1)
    8000897c:	00100713          	li	a4,1
    80008980:	00c780a3          	sb	a2,1(a5)
    80008984:	04e68663          	beq	a3,a4,800089d0 <__memmove+0xfc>
    80008988:	0025c603          	lbu	a2,2(a1)
    8000898c:	00200713          	li	a4,2
    80008990:	00c78123          	sb	a2,2(a5)
    80008994:	02e68e63          	beq	a3,a4,800089d0 <__memmove+0xfc>
    80008998:	0035c603          	lbu	a2,3(a1)
    8000899c:	00300713          	li	a4,3
    800089a0:	00c781a3          	sb	a2,3(a5)
    800089a4:	02e68663          	beq	a3,a4,800089d0 <__memmove+0xfc>
    800089a8:	0045c603          	lbu	a2,4(a1)
    800089ac:	00400713          	li	a4,4
    800089b0:	00c78223          	sb	a2,4(a5)
    800089b4:	00e68e63          	beq	a3,a4,800089d0 <__memmove+0xfc>
    800089b8:	0055c603          	lbu	a2,5(a1)
    800089bc:	00500713          	li	a4,5
    800089c0:	00c782a3          	sb	a2,5(a5)
    800089c4:	00e68663          	beq	a3,a4,800089d0 <__memmove+0xfc>
    800089c8:	0065c703          	lbu	a4,6(a1)
    800089cc:	00e78323          	sb	a4,6(a5)
    800089d0:	00813403          	ld	s0,8(sp)
    800089d4:	01010113          	addi	sp,sp,16
    800089d8:	00008067          	ret
    800089dc:	02061713          	slli	a4,a2,0x20
    800089e0:	02075713          	srli	a4,a4,0x20
    800089e4:	00e587b3          	add	a5,a1,a4
    800089e8:	f0f574e3          	bgeu	a0,a5,800088f0 <__memmove+0x1c>
    800089ec:	02069613          	slli	a2,a3,0x20
    800089f0:	02065613          	srli	a2,a2,0x20
    800089f4:	fff64613          	not	a2,a2
    800089f8:	00e50733          	add	a4,a0,a4
    800089fc:	00c78633          	add	a2,a5,a2
    80008a00:	fff7c683          	lbu	a3,-1(a5)
    80008a04:	fff78793          	addi	a5,a5,-1
    80008a08:	fff70713          	addi	a4,a4,-1
    80008a0c:	00d70023          	sb	a3,0(a4)
    80008a10:	fec798e3          	bne	a5,a2,80008a00 <__memmove+0x12c>
    80008a14:	00813403          	ld	s0,8(sp)
    80008a18:	01010113          	addi	sp,sp,16
    80008a1c:	00008067          	ret
    80008a20:	02069713          	slli	a4,a3,0x20
    80008a24:	02075713          	srli	a4,a4,0x20
    80008a28:	00170713          	addi	a4,a4,1
    80008a2c:	00e50733          	add	a4,a0,a4
    80008a30:	00050793          	mv	a5,a0
    80008a34:	0005c683          	lbu	a3,0(a1)
    80008a38:	00178793          	addi	a5,a5,1
    80008a3c:	00158593          	addi	a1,a1,1
    80008a40:	fed78fa3          	sb	a3,-1(a5)
    80008a44:	fee798e3          	bne	a5,a4,80008a34 <__memmove+0x160>
    80008a48:	f89ff06f          	j	800089d0 <__memmove+0xfc>

0000000080008a4c <__putc>:
    80008a4c:	fe010113          	addi	sp,sp,-32
    80008a50:	00813823          	sd	s0,16(sp)
    80008a54:	00113c23          	sd	ra,24(sp)
    80008a58:	02010413          	addi	s0,sp,32
    80008a5c:	00050793          	mv	a5,a0
    80008a60:	fef40593          	addi	a1,s0,-17
    80008a64:	00100613          	li	a2,1
    80008a68:	00000513          	li	a0,0
    80008a6c:	fef407a3          	sb	a5,-17(s0)
    80008a70:	fffff097          	auipc	ra,0xfffff
    80008a74:	b3c080e7          	jalr	-1220(ra) # 800075ac <console_write>
    80008a78:	01813083          	ld	ra,24(sp)
    80008a7c:	01013403          	ld	s0,16(sp)
    80008a80:	02010113          	addi	sp,sp,32
    80008a84:	00008067          	ret

0000000080008a88 <__getc>:
    80008a88:	fe010113          	addi	sp,sp,-32
    80008a8c:	00813823          	sd	s0,16(sp)
    80008a90:	00113c23          	sd	ra,24(sp)
    80008a94:	02010413          	addi	s0,sp,32
    80008a98:	fe840593          	addi	a1,s0,-24
    80008a9c:	00100613          	li	a2,1
    80008aa0:	00000513          	li	a0,0
    80008aa4:	fffff097          	auipc	ra,0xfffff
    80008aa8:	ae8080e7          	jalr	-1304(ra) # 8000758c <console_read>
    80008aac:	fe844503          	lbu	a0,-24(s0)
    80008ab0:	01813083          	ld	ra,24(sp)
    80008ab4:	01013403          	ld	s0,16(sp)
    80008ab8:	02010113          	addi	sp,sp,32
    80008abc:	00008067          	ret

0000000080008ac0 <console_handler>:
    80008ac0:	fe010113          	addi	sp,sp,-32
    80008ac4:	00813823          	sd	s0,16(sp)
    80008ac8:	00113c23          	sd	ra,24(sp)
    80008acc:	00913423          	sd	s1,8(sp)
    80008ad0:	02010413          	addi	s0,sp,32
    80008ad4:	14202773          	csrr	a4,scause
    80008ad8:	100027f3          	csrr	a5,sstatus
    80008adc:	0027f793          	andi	a5,a5,2
    80008ae0:	06079e63          	bnez	a5,80008b5c <console_handler+0x9c>
    80008ae4:	00074c63          	bltz	a4,80008afc <console_handler+0x3c>
    80008ae8:	01813083          	ld	ra,24(sp)
    80008aec:	01013403          	ld	s0,16(sp)
    80008af0:	00813483          	ld	s1,8(sp)
    80008af4:	02010113          	addi	sp,sp,32
    80008af8:	00008067          	ret
    80008afc:	0ff77713          	andi	a4,a4,255
    80008b00:	00900793          	li	a5,9
    80008b04:	fef712e3          	bne	a4,a5,80008ae8 <console_handler+0x28>
    80008b08:	ffffe097          	auipc	ra,0xffffe
    80008b0c:	6dc080e7          	jalr	1756(ra) # 800071e4 <plic_claim>
    80008b10:	00a00793          	li	a5,10
    80008b14:	00050493          	mv	s1,a0
    80008b18:	02f50c63          	beq	a0,a5,80008b50 <console_handler+0x90>
    80008b1c:	fc0506e3          	beqz	a0,80008ae8 <console_handler+0x28>
    80008b20:	00050593          	mv	a1,a0
    80008b24:	00001517          	auipc	a0,0x1
    80008b28:	8bc50513          	addi	a0,a0,-1860 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80008b2c:	fffff097          	auipc	ra,0xfffff
    80008b30:	afc080e7          	jalr	-1284(ra) # 80007628 <__printf>
    80008b34:	01013403          	ld	s0,16(sp)
    80008b38:	01813083          	ld	ra,24(sp)
    80008b3c:	00048513          	mv	a0,s1
    80008b40:	00813483          	ld	s1,8(sp)
    80008b44:	02010113          	addi	sp,sp,32
    80008b48:	ffffe317          	auipc	t1,0xffffe
    80008b4c:	6d430067          	jr	1748(t1) # 8000721c <plic_complete>
    80008b50:	fffff097          	auipc	ra,0xfffff
    80008b54:	3e0080e7          	jalr	992(ra) # 80007f30 <uartintr>
    80008b58:	fddff06f          	j	80008b34 <console_handler+0x74>
    80008b5c:	00001517          	auipc	a0,0x1
    80008b60:	98450513          	addi	a0,a0,-1660 # 800094e0 <digits+0x78>
    80008b64:	fffff097          	auipc	ra,0xfffff
    80008b68:	a68080e7          	jalr	-1432(ra) # 800075cc <panic>
	...
