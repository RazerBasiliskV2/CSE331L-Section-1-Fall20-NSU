

.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The Lower Case Letters from z to a are: $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 26                   ; initialize CX

     MOV AH, 2                    ; set output function
     MOV DL, 122                  ; set Dl with 'z'

     @LOOP:                       ; loop start
       INT 21H                    ; print character

       DEC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX

     JNZ @LOOP                    ; Jump to label @LOOP if CX is 0f

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN