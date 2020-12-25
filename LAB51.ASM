TITLE	LAB51
.MODEL	SMALL
.STACK	100H
.DATA
AVG		DW	4 DUP(0)
SCORES	DB  'Mary Allen  ',67,45,98,33
        DB  'Scott Baylis',70,56,87,44
        DB  'George Frank',82,72,89,40
        DB  'Sam Wong    ',78,76,92,60 

MSG1	DB ': $'
MSG2	DB '$'

.CODE
MAIN	PROC
	MOV	AX, @DATA	; initialize DS
	MOV	DS, AX
	
	LEA DI, AVG		;set DI = offset address
	LEA SI, SCORES	;set SI = offset address
	ADD	SI, 12		;name	SI = SI+12
	MOV CX, 4
	
	AVERAGE:
	XOR AX, AX		;clear AX
	MOV DX, 4		;set DX=4
	
	SUM:
	XOR BH, BH		;clear BH
	MOV BL, [SI] 	
	ADD AX, BX
	
	INC SI
	DEC DX
	
	JG SUM
	
	MOV BX, 4
	DIV BX
	
	MOV [DI], AX
	ADD DI, 2
	ADD SI, 12
	
	LOOP	AVERAGE
	
	LEA SI, AVG
	LEA DI, SCORES
	MOV CX, 4
	
	RESULT:
	MOV MSG2, 12
	MOV AH, 2
	
	PRINT_NAME:
	MOV DL, [DI]
	INT 21H
	
	INT DI
	DEC MSG2
	JG PRINT_NAME
	
	
	LEA DX, MSG1
	MOV AH, 9
	INT 21H
	
	XOR AH, AH
	MOV AL, [SI]
	
	CALL OUTDEC
	
	MOV AH, 2		;CR
	MOV DL, 0DH
	INT 21H
	MOV DL, 0AH
	INT 21H
	
	ADD SI, 2
	ADD DI, 4
	LOOP	RESULT
	
	MOV AH, 4CH
	INT 21H
	
MAIN ENDP
	INCLUDE	OUTDEC.ASM
	
	END MAIN