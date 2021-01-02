.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the first number : $ '
    PROMPT_2  DB  'Enter the second number : $'
    PROMPT_3  DB  0DH,0AH,'The number is : $'

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

     LEA DX, PROMPT_1             ; load and print PROMPT_1
     MOV AH, 9
     INT 21H

     MOV AH, 1                    ; read a digit
     INT 21H 

     MOV CL, AL

     LEA DX, PROMPT_3             ; load and print PROMPT_2
     MOV AH, 9
     INT 21H

     CMP BL, CL
     JG @CALC;

     @CALC: 
     MOV AH, 0
     MOV AL,BL
     DIV CL
     CMP AH,0
                      ; check the digit for even or odd

     JG @DN                     ; jump to label @ODD if the number is odd

       MOV AL, BL
       MUL CL
       MOV AH, 2                  ; print the letter 'O'
       MOV DL, AL
       INT 21H

     JMP @EXIT                    ; jump to the label @EXIT

     @DN:
      MOV AH, 2                  ; print the letter 'O'
      MOV DL, BL
      INT 21H
                             ; jump label


     @EXIT:                       ; jump label

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP 
 END MAIN