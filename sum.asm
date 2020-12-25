TITLE	sum of 3
.MODEL	SMALL
.STACK	100H
.CODE
MAIN	PROC
; display prompt
	MOV	AH, 2		; display character function
	MOV	DL, '?'		; character is '?'
	INT	21H		; display it
	
	MOV CX, 50
	MOV AH, 1
	MOV AH, 1
	ADD AX, 3
TOP:
	INT 21H
	LOOP TOP
	
	MOV	DL, AX		; retrieve character
	INT	21H		; and display it
; return to DOS
	
	MOV	AH, 4CH		; DOS exit function
	INT	21H		; exit to DOS
MAIN	ENDP
	END MAIN