TITLE	LAB31
.MODEL	SMALL
.STACK	100H
.DATA
SPC DB	20H
.CODE
MAIN	PROC
	MOV	AX, @DATA	; initialize DS
	MOV	DS, AX
	
	MOV	AH, 2		; display char function
	MOV	CX, 255		; no. of chars to display
	MOV	DL, 128		; DL has ASCII code of null char

	
PRINT_LOOP:	
	INT	21h		; display a char
	
	MOV AH, 2
	LEA DX, SPC
	INT 21H

	INC	DL		; increment ASCII code
	DEC	CX		; decrement counter
	
	JNZ	PRINT_LOOP
; DOS exit
	MOV	AH, 4CH
	INT	21H


MAIN	ENDP
	END MAIN