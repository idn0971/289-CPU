# For Loop
li t1, 5
li t0, 0
li t2, 3
startForLoop:
bge t0, t1, endForLoop
addi t2, t2, 5
addi t0, t0, 1
j, startForLoop
endForLoop: 
mv s0, t2
end: jal end