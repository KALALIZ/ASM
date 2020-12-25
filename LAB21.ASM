TITLE	LAB12 PROGRAM
.MODEL	SMALL
.STACK	100H
.DATA
.CODE
MAIN	PROC
; display prompt
	MOV	AH, 2		; display character function
	MOV	DL, '?'		; character is '?'
	INT	21H			; display it
; input a character
	MOV	AH, 1		; read character function
	INT	21H			; character in AL
	MOV	BL, AL		; save it in BL
; input a character
	MOV	AH, 1		; read character function
	INT	21H			; character in AL
	MOV	CL, AL		; save it in CL
; go to a new line
	MOV	AH, 2		; display character function
	MOV	DL, 0DH		; carriage return
	INT	21H			; execute carriage return
	MOV	DL, 0AH		; line feed
	INT	21H			; execute line feed

	MOV AH, 2
;if BL <= CL
	CMP BL, CL		;compare ascii
	JNBE ELSE_
;then
	MOV DL, BL
	MOV AH, 2
	JMP DISPLAY1
A:	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	JMP END_IF
	
ELSE_:
	MOV DL, CL
	MOV AH, 2
	JMP DISPLAY2
B:	
	MOV DL, BL
	MOV AH, 2
	INT 21H
	JMP END_IF

DISPLAY1:
	INT 21H
	JMP A
	
DISPLAY2:
	INT 21H
	JMP B
	
END_IF:
	MOV	AH, 4CH
	INT	21H		; DOS exit
	
MAIN	ENDP
	END MAIN