.data
strA:	.asciiz "Please enter your choice to skip numbers (1-4)\n"
strB:	.asciiz "Total sum:	"

Numbers: .byte 100, -7, 11, 25, -66, 99, -1, 34, 12, 22, -2, -7, 100, 11, 4, 67, 2, -90, 22, 2, 56, 3, -89, 12, -10, 21, 10, -25, -6, 9, 111, 34, 12, 22, -2, -17, 100, 111, -4, 7, 14, -19, -2, 29, 36, 31, -79, 2
.globl main

.text
main:

userinput:	la	$a0,strA	#point $a0 @ .strA
		li	$v0,4		#print string
		syscall			#activate print string
		li	$v0, 5		#read int
		syscall			#activate read int
		move	$t0,$v0		#point $t0 at read in int
		addi	$t3,$zero,0	#sum register
		addi	$t2,$zero,0	#register to read from
		addi	$t1,$zero,0	#counter
	
sum:		lb	$t2,Number($t1)	#load next number
		add	$t3,$t3,$t2	#add next number to sum
		add	$t1,$t1,$t0	#skip by n numbers
		bge	$t1,48,quit	#exit when done with numbers
		j	sum

quit:		la	$a0,strB	#point $a0 @ .strB
		li	$v0,4		#print string
		syscall			#activate print string
		addi	$v0,$zero,1	#display total sum
		move	$a0,$s3		#point $a0 @ sum
		li	$v0,1		#print int
		syscall			#activate print int
		li	$v0,10		#exit program
		syscall			#activate exit
