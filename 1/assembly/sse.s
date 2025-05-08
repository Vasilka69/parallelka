	.file	"sse.c"
	.text
	.globl	sse
	.type	sse, @function
sse:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rcx
#APP
# 6 "/home/vasili4/projects/parallelka/1/src/sse.c" 1
	movups (%rax), %xmm0
movups (%rdx), %xmm1
mulps %xmm1, %xmm0
movups %xmm0, (%rcx)

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	sse, .-sse
	.section	.rodata
	.align 8
.LC0:
	.string	"\320\235\320\265\320\277\321\200\320\260\320\262\320\270\320\273\321\214\320\275\320\276\320\265 \320\272\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\276 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\276\320\262 :("
	.align 8
.LC1:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\277\320\276\320\273\320\276\320\266\320\270\321\202\320\265\320\273\321\214\320\275\320\276\320\265 \321\206\320\265\320\273\320\276\320\265 \321\207\320\270\321\201\320\273\320\276 \320\260\321\200\320\263\321\203\320\274\320\265\320\275\321\202\320\276\320\262."
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -84(%rbp)
	je	.L3
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L8
.L3:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -68(%rbp)
	cmpl	$0, -68(%rbp)
	jg	.L5
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L8
.L5:
	movss	.LC2(%rip), %xmm0
	movss	%xmm0, -64(%rbp)
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -60(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, -56(%rbp)
	movss	.LC5(%rip), %xmm0
	movss	%xmm0, -52(%rbp)
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, -48(%rbp)
	movss	.LC7(%rip), %xmm0
	movss	%xmm0, -44(%rbp)
	movss	.LC8(%rip), %xmm0
	movss	%xmm0, -40(%rbp)
	movss	.LC9(%rip), %xmm0
	movss	%xmm0, -36(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L6
.L7:
	leaq	-32(%rbp), %rdx
	leaq	-48(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	sse
	addl	$1, -72(%rbp)
.L6:
	movl	-72(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L7
	movl	$0, %eax
.L8:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	1073741824
	.align 4
.LC4:
	.long	1077936128
	.align 4
.LC5:
	.long	1082130432
	.align 4
.LC6:
	.long	1084227584
	.align 4
.LC7:
	.long	1086324736
	.align 4
.LC8:
	.long	1088421888
	.align 4
.LC9:
	.long	1090519040
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
