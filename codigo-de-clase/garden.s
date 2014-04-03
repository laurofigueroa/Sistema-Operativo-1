	.file	"ccUv4o35.cilkc"
	.section	.rodata
	.align 8
.LC0:
	.string	"$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk-sysdep.h.in $ $LastChangedBy: bradley $ $Rev: 2311 $ $Date: 2005-07-13 17:38:21 -0400 (Wed, 13 Jul 2005) $"
	.data
	.align 8
	.type	ident_cilk_sysdep_h, @object
	.size	ident_cilk_sysdep_h, 8
ident_cilk_sysdep_h:
	.quad	.LC0
	.text
	.type	CILK_MB, @function
CILK_MB:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
#APP
# 296 "/home/alumno/cilk/include/cilk/cilk-sysdep.h" 1
	mfence
# 0 "" 2
#NO_APP
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	CILK_MB, .-CILK_MB
	.section	.rodata
	.align 8
.LC1:
	.string	"$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk.h $ $LastChangedBy: bradley $ $Rev: 2672 $ $Date: 2005-12-20 13:30:02 -0500 (Tue, 20 Dec 2005) $"
	.data
	.align 8
	.type	cilk_h_ident, @object
	.size	cilk_h_ident, 8
cilk_h_ident:
	.quad	.LC1
	.section	.rodata
	.align 8
.LC2:
	.string	"$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk-conf.h $ $LastChangedBy: bradley $ $Rev: 1465 $ $Date: 2004-08-02 06:31:06 -0400 (Mon, 02 Aug 2004) $"
	.data
	.align 8
	.type	ident_cilk_conf_h, @object
	.size	ident_cilk_conf_h, 8
ident_cilk_conf_h:
	.quad	.LC2
	.text
	.type	Cilk_internal_malloc_size_to_bucket, @function
Cilk_internal_malloc_size_to_bucket:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	cmpq	$64, -8(%rbp)
	ja	.L4
	movl	$2, %eax
	jmp	.L5
.L4:
	cmpq	$128, -8(%rbp)
	ja	.L6
	movl	$3, %eax
	jmp	.L5
.L6:
	cmpq	$256, -8(%rbp)
	ja	.L7
	movl	$4, %eax
	jmp	.L5
.L7:
	cmpq	$512, -8(%rbp)
	ja	.L8
	movl	$5, %eax
	jmp	.L5
.L8:
	cmpq	$1024, -8(%rbp)
	ja	.L9
	movl	$6, %eax
	jmp	.L5
.L9:
	cmpq	$2048, -8(%rbp)
	ja	.L10
	movl	$7, %eax
	jmp	.L5
.L10:
	cmpq	$4096, -8(%rbp)
	ja	.L11
	movl	$8, %eax
	jmp	.L5
.L11:
	movl	$-1, %eax
.L5:
	leave
	ret
	.cfi_endproc
.LFE8:
	.size	Cilk_internal_malloc_size_to_bucket, .-Cilk_internal_malloc_size_to_bucket
	.type	Cilk_membar_StoreStore, @function
Cilk_membar_StoreStore:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	leave
	ret
	.cfi_endproc
.LFE11:
	.size	Cilk_membar_StoreStore, .-Cilk_membar_StoreStore
	.type	Cilk_membar_StoreLoad, @function
Cilk_membar_StoreLoad:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	call	CILK_MB
	leave
	ret
	.cfi_endproc
.LFE12:
	.size	Cilk_membar_StoreLoad, .-Cilk_membar_StoreLoad
	.section	.rodata
	.align 8
.LC3:
	.string	"$HeadURL: https://bradley.csail.mit.edu/svn/repos/cilk/5.4.3/runtime/cilk-cilk2c-pre.h $ $LastChangedBy: bradley $ $Rev: 1465 $ $Date: 2004-08-02 06:31:06 -0400 (Mon, 02 Aug 2004) $"
	.data
	.align 8
	.type	ident_cilk_cilk2c_pre, @object
	.size	ident_cilk_cilk2c_pre, 8
ident_cilk_cilk2c_pre:
	.quad	.LC3
	.text
	.type	Cilk_internal_malloc_fast, @function
Cilk_internal_malloc_fast:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	cmpq	$4096, -48(%rbp)
	jbe	.L18
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_internal_malloc
	jmp	.L19
.L18:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_internal_malloc_size_to_bucket
	movl	%eax, -4(%rbp)
	movq	-40(%rbp), %rax
	leaq	104(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	(%rdx,%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L20
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-24(%rbp), %rax
	movl	12(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	jmp	.L21
.L20:
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_internal_malloc
	movq	%rax, -16(%rbp)
.L21:
	movq	-16(%rbp), %rax
.L19:
	leave
	ret
	.cfi_endproc
.LFE13:
	.size	Cilk_internal_malloc_fast, .-Cilk_internal_malloc_fast
	.type	Cilk_internal_free_fast, @function
Cilk_internal_free_fast:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	cmpq	$4096, -40(%rbp)
	jbe	.L24
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_internal_free
	jmp	.L27
.L24:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_internal_malloc_size_to_bucket
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	leaq	104(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	jg	.L26
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_internal_free
	jmp	.L27
.L26:
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	leal	-1(%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
.L27:
	leave
	ret
	.cfi_endproc
.LFE14:
	.size	Cilk_internal_free_fast, .-Cilk_internal_free_fast
	.type	Cilk_destroy_frame_fast, @function
Cilk_destroy_frame_fast:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	testq	%rax, %rax
	je	.L29
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_unalloca_internal
.L29:
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_internal_free_fast
	leave
	ret
	.cfi_endproc
.LFE15:
	.size	Cilk_destroy_frame_fast, .-Cilk_destroy_frame_fast
	.type	Cilk_create_frame, @function
Cilk_create_frame:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_internal_malloc_fast
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	leave
	ret
	.cfi_endproc
.LFE16:
	.size	Cilk_create_frame, .-Cilk_create_frame
	.type	Cilk_cilk2c_push_frame, @function
Cilk_cilk2c_push_frame:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	call	Cilk_membar_StoreStore
	leave
	ret
	.cfi_endproc
.LFE17:
	.size	Cilk_cilk2c_push_frame, .-Cilk_cilk2c_push_frame
	.type	Cilk_cilk2c_init_frame, @function
Cilk_cilk2c_init_frame:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_create_frame
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	call	Cilk_membar_StoreStore
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	leave
	ret
	.cfi_endproc
.LFE18:
	.size	Cilk_cilk2c_init_frame, .-Cilk_cilk2c_init_frame
	.type	Cilk_cilk2c_pop_check, @function
Cilk_cilk2c_pop_check:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	call	Cilk_membar_StoreLoad
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	-8(%rbp), %rax
	setae	%al
	movzbl	%al, %eax
	leave
	ret
	.cfi_endproc
.LFE19:
	.size	Cilk_cilk2c_pop_check, .-Cilk_cilk2c_pop_check
	.type	Cilk_cilk2c_pop, @function
Cilk_cilk2c_pop:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	-8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	leave
	ret
	.cfi_endproc
.LFE20:
	.size	Cilk_cilk2c_pop, .-Cilk_cilk2c_pop
	.type	Cilk_cilk2c_event_new_thread_maybe, @function
Cilk_cilk2c_event_new_thread_maybe:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	leave
	ret
	.cfi_endproc
.LFE21:
	.size	Cilk_cilk2c_event_new_thread_maybe, .-Cilk_cilk2c_event_new_thread_maybe
	.type	Cilk_cilk2c_start_thread_slow, @function
Cilk_cilk2c_start_thread_slow:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE22:
	.size	Cilk_cilk2c_start_thread_slow, .-Cilk_cilk2c_start_thread_slow
	.type	Cilk_cilk2c_before_return_fast, @function
Cilk_cilk2c_before_return_fast:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_destroy_frame_fast
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	leaq	-8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	leave
	ret
	.cfi_endproc
.LFE23:
	.size	Cilk_cilk2c_before_return_fast, .-Cilk_cilk2c_before_return_fast
	.type	Cilk_cilk2c_before_return_slow, @function
Cilk_cilk2c_before_return_slow:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_fast
	leave
	ret
	.cfi_endproc
.LFE24:
	.size	Cilk_cilk2c_before_return_slow, .-Cilk_cilk2c_before_return_slow
	.type	Cilk_cilk2c_start_thread_fast_cp, @function
Cilk_cilk2c_start_thread_fast_cp:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE25:
	.size	Cilk_cilk2c_start_thread_fast_cp, .-Cilk_cilk2c_start_thread_fast_cp
	.type	Cilk_cilk2c_start_thread_slow_cp, @function
Cilk_cilk2c_start_thread_slow_cp:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE26:
	.size	Cilk_cilk2c_start_thread_slow_cp, .-Cilk_cilk2c_start_thread_slow_cp
	.type	Cilk_cilk2c_at_thread_boundary_slow_cp, @function
Cilk_cilk2c_at_thread_boundary_slow_cp:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE27:
	.size	Cilk_cilk2c_at_thread_boundary_slow_cp, .-Cilk_cilk2c_at_thread_boundary_slow_cp
	.type	Cilk_cilk2c_before_spawn_fast_cp, @function
Cilk_cilk2c_before_spawn_fast_cp:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE28:
	.size	Cilk_cilk2c_before_spawn_fast_cp, .-Cilk_cilk2c_before_spawn_fast_cp
	.type	Cilk_cilk2c_before_spawn_slow_cp, @function
Cilk_cilk2c_before_spawn_slow_cp:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE29:
	.size	Cilk_cilk2c_before_spawn_slow_cp, .-Cilk_cilk2c_before_spawn_slow_cp
	.type	Cilk_cilk2c_after_spawn_fast_cp, @function
Cilk_cilk2c_after_spawn_fast_cp:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE30:
	.size	Cilk_cilk2c_after_spawn_fast_cp, .-Cilk_cilk2c_after_spawn_fast_cp
	.type	Cilk_cilk2c_after_spawn_slow_cp, @function
Cilk_cilk2c_after_spawn_slow_cp:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE31:
	.size	Cilk_cilk2c_after_spawn_slow_cp, .-Cilk_cilk2c_after_spawn_slow_cp
	.type	Cilk_cilk2c_at_sync_fast_cp, @function
Cilk_cilk2c_at_sync_fast_cp:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE32:
	.size	Cilk_cilk2c_at_sync_fast_cp, .-Cilk_cilk2c_at_sync_fast_cp
	.type	Cilk_cilk2c_before_sync_slow_cp, @function
Cilk_cilk2c_before_sync_slow_cp:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE33:
	.size	Cilk_cilk2c_before_sync_slow_cp, .-Cilk_cilk2c_before_sync_slow_cp
	.type	Cilk_cilk2c_after_sync_slow_cp, @function
Cilk_cilk2c_after_sync_slow_cp:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE34:
	.size	Cilk_cilk2c_after_sync_slow_cp, .-Cilk_cilk2c_after_sync_slow_cp
	.type	Cilk_cilk2c_before_return_fast_cp, @function
Cilk_cilk2c_before_return_fast_cp:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE35:
	.size	Cilk_cilk2c_before_return_fast_cp, .-Cilk_cilk2c_before_return_fast_cp
	.type	Cilk_cilk2c_before_return_slow_cp, @function
Cilk_cilk2c_before_return_slow_cp:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leave
	ret
	.cfi_endproc
.LFE36:
	.size	Cilk_cilk2c_before_return_slow_cp, .-Cilk_cilk2c_before_return_slow_cp
	.data
	.align 8
	.type	Cilk_check_flags_at_link_time, @object
	.size	Cilk_check_flags_at_link_time, 8
Cilk_check_flags_at_link_time:
	.quad	Cilk_flags_are_wrong_NODEBUG_NOTIMING_NOSTATS_please_recompile
	.text
	.type	Cilk_check_flags_at_link_time_hack, @function
Cilk_check_flags_at_link_time_hack:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movq	Cilk_check_flags_at_link_time(%rip), %rax
	movl	(%rax), %eax
	leave
	ret
	.cfi_endproc
.LFE37:
	.size	Cilk_check_flags_at_link_time_hack, .-Cilk_check_flags_at_link_time_hack
.globl visitantes
	.bss
	.align 4
	.type	visitantes, @object
	.size	visitantes, 4
visitantes:
	.zero	4
	.data
	.align 32
	.type	_cilk_molinete_sig, @object
	.size	_cilk_molinete_sig, 40
_cilk_molinete_sig:
	.long	0
	.zero	4
	.quad	40
	.quad	_cilk_molinete_slow
	.long	0
	.zero	4
	.quad	0
	.text
.globl molinete
	.type	molinete, @function
molinete:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$_cilk_molinete_sig, %edx
	movl	$40, %esi
	movq	%rax, %rdi
	call	Cilk_cilk2c_init_frame
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_start_thread_fast_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movl	$0, -4(%rbp)
	jmp	.L76
.L77:
	movl	visitantes(%rip), %eax
	addl	$1, %eax
	movl	%eax, visitantes(%rip)
	addl	$1, -4(%rbp)
.L76:
	cmpl	$99999, -4(%rbp)
	jle	.L77
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_fast_cp
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$40, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_fast
	leave
	ret
	.cfi_endproc
.LFE38:
	.size	molinete, .-molinete
	.type	_cilk_molinete_slow, @function
_cilk_molinete_slow:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_start_thread_slow_cp
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_start_thread_slow
	movl	$0, -4(%rbp)
	jmp	.L80
.L81:
	movl	visitantes(%rip), %eax
	addl	$1, %eax
	movl	%eax, visitantes(%rip)
	addl	$1, -4(%rbp)
.L80:
	cmpl	$99999, -4(%rbp)
	jle	.L81
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	Cilk_set_result
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_slow_cp
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$40, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_slow
	leave
	ret
	.cfi_endproc
.LFE39:
	.size	_cilk_molinete_slow, .-_cilk_molinete_slow
	.type	_cilk_molinete_import, @function
_cilk_molinete_import:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	molinete
	leave
	ret
	.cfi_endproc
.LFE40:
	.size	_cilk_molinete_import, .-_cilk_molinete_import
.globl mt_molinete
	.type	mt_molinete, @function
mt_molinete:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, %ecx
	movl	$0, %edx
	movl	$_cilk_molinete_import, %esi
	movq	%rax, %rdi
	call	Cilk_start
	leave
	ret
	.cfi_endproc
.LFE41:
	.size	mt_molinete, .-mt_molinete
	.data
	.align 32
	.type	_cilk_cilk_main_sig, @object
	.size	_cilk_cilk_main_sig, 160
_cilk_cilk_main_sig:
	.long	4
	.zero	4
	.quad	32
	.quad	_cilk_cilk_main_slow
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.quad	0
	.long	0
	.zero	4
	.quad	0
	.section	.rodata
.LC4:
	.string	"Hoy hubo %d visitantes!\n"
	.text
.globl cilk_main
	.type	cilk_main, @function
cilk_main:
.LFB42:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$_cilk_cilk_main_sig, %edx
	movl	$32, %esi
	movq	%rax, %rdi
	call	Cilk_cilk2c_init_frame
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_start_thread_fast_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movq	-16(%rbp), %rax
	movl	$1, (%rax)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_spawn_fast_cp
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_push_frame
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	molinete
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop_check
	testl	%eax, %eax
	je	.L88
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	Cilk_exception_handler
	testl	%eax, %eax
	je	.L88
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop
	movl	$0, %eax
	jmp	.L89
.L88:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_after_spawn_fast_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movq	-16(%rbp), %rax
	movl	$2, (%rax)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_spawn_fast_cp
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_push_frame
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	molinete
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop_check
	testl	%eax, %eax
	je	.L90
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	Cilk_exception_handler
	testl	%eax, %eax
	je	.L90
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop
	movl	$0, %eax
	jmp	.L89
.L90:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_after_spawn_fast_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_at_sync_fast_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movl	visitantes(%rip), %edx
	movl	$.LC4, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_fast_cp
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$32, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_fast
	movl	-4(%rbp), %eax
.L89:
	leave
	ret
	.cfi_endproc
.LFE42:
	.size	cilk_main, .-cilk_main
	.type	_cilk_cilk_main_slow, @function
_cilk_cilk_main_slow:
.LFB43:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_start_thread_slow_cp
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_start_thread_slow
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$2, %eax
	je	.L104
	cmpl	$3, %eax
	je	.L105
	cmpl	$1, %eax
	je	.L106
	movq	-32(%rbp), %rax
	movl	$1, (%rax)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_spawn_slow_cp
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_push_frame
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	molinete
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop_check
	testl	%eax, %eax
	je	.L100
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	Cilk_exception_handler
	testl	%eax, %eax
	je	.L100
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop
	jmp	.L103
.L100:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_after_spawn_slow_cp
	jmp	.L97
.L106:
	nop
.L97:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_at_thread_boundary_slow_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movq	-32(%rbp), %rax
	movl	$2, (%rax)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_spawn_slow_cp
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_push_frame
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	molinete
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop_check
	testl	%eax, %eax
	je	.L102
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	Cilk_exception_handler
	testl	%eax, %eax
	je	.L102
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_pop
	jmp	.L103
.L102:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_after_spawn_slow_cp
	jmp	.L98
.L104:
	nop
.L98:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_at_thread_boundary_slow_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_sync_slow_cp
	movq	-32(%rbp), %rax
	movl	$3, (%rax)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_sync
	testl	%eax, %eax
	jne	.L107
	jmp	.L99
.L105:
	nop
.L99:
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_after_sync_slow_cp
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_at_thread_boundary_slow_cp
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_cilk2c_event_new_thread_maybe
	movl	visitantes(%rip), %edx
	movl	$.LC4, %eax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$0, -4(%rbp)
	leaq	-4(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_set_result
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_slow_cp
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$32, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	Cilk_cilk2c_before_return_slow
	nop
	jmp	.L103
.L107:
	nop
.L103:
	leave
	ret
	.cfi_endproc
.LFE43:
	.size	_cilk_cilk_main_slow, .-_cilk_cilk_main_slow
	.type	_cilk_cilk_main_import, @function
_cilk_cilk_main_import:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rbx
	.cfi_offset 3, -24
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	cilk_main
	movl	%eax, (%rbx)
	addq	$24, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE44:
	.size	_cilk_cilk_main_import, .-_cilk_cilk_main_import
.globl mt_cilk_main
	.type	mt_cilk_main, @function
mt_cilk_main:
.LFB45:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$4, %edi
	call	Cilk_malloc_fixed
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$4, %ecx
	movl	$_cilk_cilk_main_import, %esi
	movq	%rax, %rdi
	call	Cilk_start
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	Cilk_free
	movl	-4(%rbp), %eax
	leave
	ret
	.cfi_endproc
.LFE45:
	.size	mt_cilk_main, .-mt_cilk_main
	.ident	"GCC: (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
