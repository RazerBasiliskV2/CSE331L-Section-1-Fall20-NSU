.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the number from 0 to 9 : $'
    PROMPT_2  DB  0DH,0AH,'The number is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX                   

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a digit
     INT 21H

     MOV BL, AL                   ; save the digit in BL 

     LEA DX, PROMPT_2             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     TEST BL, 01H                 ; check the digit for even or odd

     JNE @ODD                     ; jump to label @ODD if the number is odd  

     MOV AH, 2                    ; print the letter 'E'
     MOV DL, "E"
     INT 21H

     JMP @EXIT                    ; jump to the label @EXIT

     @ODD:                        ; jump label
       MOV AH, 2                  ; print the letter 'O'
       MOV DL, "O"
       INT 21H

     @EXIT:                       ; jump label

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN
