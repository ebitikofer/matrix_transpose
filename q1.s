.data
strA: 	 	.asciiz "Original Array:\n "
strB: 	 	.asciiz "Second Array:\n: "
newline: 	.asciiz "\n"
space: 	 	.asciiz " "

Original: 	.word 200, 270, 250, 100
		.word 205, 230, 105, 235
		.word 190, 95, 90, 205
		.word 80, 205, 110, 215
Second: 	.space 64

.align 2
.globl main
.text

main:  		lw 	$s0,Original    #load the location of the first word of original to $s0
		lw 	$s1,Second      #load the location of the first word of second to $s0
		lw 	$s2,Original    #load the location of the first word of original to $s0
		move 	$t0,$s0         #point $t0 @ $s0
		move 	$t1,$s1         #point $t1 @ $s1
		move 	$t2,$s2         #point $t2 @ $s2
	  	addi 	$t3,$zero,0     #set $t3 to the int 0
	  	addi 	$t4,$zero,0     #set $t4 to the int 0

adv:   		bge 	$t3,3,set       #branch to set if $t3 > 3
		addi 	$t0,$t0,16      #move $t0 forward 4 words
		addi 	$t1,$t1,4       #move $t1 forward one word
		sw 	$t0,0($t1)  #set $t1 to $t0 
		addi 	$t3,$t3,1       #add one to counter
		j 	adv             #jump to adv

set:   		addi 	$t2,$t2,4       #move $t2 forward one word
	  	addi 	$t4,$t4,1       #add one to counter
	  	addi 	$t3,$zero,0     #set $t3 to 0
	  	bge 	$t4,3,print     #branch to print if $t4 > 3
	  	j 	adv	        #jump to adv

print: 		move 	$t1,$s1         #point $t1 @ $s1
	  	addi 	$t3,$zero,0     #set $t3 to 0
	  	la 	$a0,Second      #point $a0 to $t0

printloop:    	bge 	$t3,15,exit     #branch to exit if $t3 > 15
	  	li 	$v0,1           #code for print_int
	  	addi 	$a0,$a0,4       #move $a0 forword one word
	  	syscall                 #runs print_int

quit:  		li 	$v0, 10		#code for exit
		syscall                 #runs exit
