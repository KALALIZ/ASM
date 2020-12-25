TITLE LAB41
.MODEL SMALL
.STACK 100H
.DATA

MSG1  DB  'Enter time : $'
MSG2 DB  ' : $'

.CODE
MAIN	PROC

    MOV AX, @DATA               
    MOV DS, AX

    LEA DX, MSG1           
    MOV AH, 9
    INT 21H

    CALL INDEC                   

    XOR DX, DX                  
    MOV CX, 3600                 
    DIV CX                                     
                  
    CALL OUTDEC                  

    MOV AX, DX                  

    PUSH AX                   

    LEA DX, MSG2        
    MOV AH, 9
    INT 21H

    POP AX 
	 
    XOR DX, DX                 

    MOV CX, 60                   
    DIV CX                       
                    
    CALL OUTDEC                  

    MOV AX, DX  
	 
	PUSH AX
	
    LEA DX, MSG2          
    MOV AH, 9
    INT 21H

    POP AX             
               
    CALL OUTDEC                  

    MOV AH, 4CH                 
    INT 21H
	 	 		 
MAIN ENDP
   INCLUDE	OUTDEC.ASM
   INCLUDE	INDEC.ASM
	END	MAIN
