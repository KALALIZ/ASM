TITLE	LAB11 PROGRAM
.MODEL	SMALL
.STACK	100H
.DATA
MSG1	DB	'THE SUM OF $ '
MSG2 	DB 	' AND $'
MSG3	DB	' IS $' 
.CODE
MAIN	PROC

	MOV AX, @DATA
	MOV DS, AX
	
	MOV AH, 2		
	MOV DL, '?'
	INT 21H
	
	MOV AH, 1		;input 1st num
	INT 21H
	MOV BL, AL
	
	MOV AH, 1 		;input 2nd num
	INT 21H
	MOV CL, AL
	
	MOV	AH, 2		; display character function
	MOV	DL, 0DH		; carriage return
	INT	21H			; execute carriage return
	MOV	DL, 0AH		; line feed
	INT	21H			; execute line feed
	
	LEA DX, MSG1	;displat massage1
	MOV AH, 9
	INT 21H
	
	MOV DL, BL
	MOV AH, 2
	INT 21H
	
	LEA DX, MSG2	;displat massage2
	MOV AH, 9
	INT 21H
	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	
	SUB BL, 30H
	SUB CL, 30H
	
	ADD CL, BL
	ADD CL, 30H
	
	LEA DX, MSG3	;displat massage3
	MOV AH, 9
	INT 21H
	
	MOV DL, CL
	MOV AH, 2
	INT 21H
	
	MOV AH, 4CH
	INT 21H

MAIN	ENDP
	END MAIN