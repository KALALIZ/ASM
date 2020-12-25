TITLE	LAB12 PROGRAM
.MODEL	SMALL
.STACK	100H
.DATA
CR	EQU	0DH
LF	EQU	0AH
MSG		DB	'ENTER TREE INITIALS: $'
ED	DB	'$'

.CODE
MAIN	PROC
; intialize DS
	MOV	AX, @DATA	; get data segment
	MOV	DS, AX		; intialize DS
; print user prompt
	LEA	DX, MSG		; get message
	MOV	AH, 9		; display string function
	INT	21H			; display first message
; input a character 
	MOV	AH, 1		
	INT 21H
	MOV BL, AL
	
; input a character 
	MOV	AH, 1		
	INT 21H
	MOV CL, AL
	
; input a character 
	MOV AH, 1
	INT 21H
	MOV ED, AL
	

	MOV	AH, 2		;new line
	MOV	DL, 0DH		
	INT	21H			
	MOV	DL, 0AH		
	INT	21H			
		
	MOV DL, BL		; display 1st character
	MOV AH, 2
	INT	21H			
	
	MOV	AH, 2		;new line
	MOV	DL, 0DH		
	INT	21H			
	MOV	DL, 0AH		
	INT	21H		
		
	MOV DL, CL		; display 2nd character
	MOV AH, 2
	INT	21H			

	MOV	AH, 2		;new line
	MOV	DL, 0DH		
	INT	21H			
	MOV	DL, 0AH		
	INT	21H			
	
	MOV DL, ED		; display 3rd character
	MOV AH, 2
	INT	21H			
; DOS exit
	MOV	AH, 4CH
	INT	21H		; DOS exit
	
MAIN	ENDP
	END MAIN
	