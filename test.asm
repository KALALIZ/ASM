.MODEL SMALL
 .STACK 100H
.DATA

   sen  DB  'Enter time : $'
   s DB  ' : $'


 .CODE
   MAIN PROC
     MOV AX, @DATA               
     MOV DS, AX

     LEA DX, sen            
     MOV AH, 9
     INT 21H

     CALL INDEC                   

     XOR DX, DX                   ; CLEAR DX
     MOV CX, 3600                 
     DIV CX                                     

                   
     CALL OUTDEC                  

     MOV AX, DX                  

     PUSH AX                   

     LEA DX, s          
     MOV AH, 9
     INT 21H

     POP AX 
	 
     XOR DX, DX                   ; CLEAR DX

     MOV CX, 60                   
     DIV CX                       

                     
     CALL OUTDEC                  

     MOV AX, DX  
	 
	 PUSH AX
	
     LEA DX, s          
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
