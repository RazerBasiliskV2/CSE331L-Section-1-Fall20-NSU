.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the first number : $ '
    PROMPT_2  DB  'Enter the second number : $'
    PROMPT_3  DB  0DH,0AH,'$'

 .CODE
   MAIN PROC
     MOV AX, @DATA
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a digit
     INT 21H

     MOV BL, AL                   ; save the digit in BL 

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a digit
     INT 21H 

     MOV CL, AL

     LEA DX, PROMPT_3             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H


                     ; jump to label @ODD if the number is odd

       MOV AL, BL
       MUL CL
       CMP AL, 15

       JG @GR 
       MOV AH, 2
       MOV DL, "0"
       INT 21H
       JMP @EXIT

     @GR:
      MOV AH, 2
      MOV DL, "1"
      INT 21H
      JMP @EXIT
                             ; jump label


     @EXIT:                       ; jump label

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN