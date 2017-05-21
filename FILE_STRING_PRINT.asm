
;...:::README:::...
;...:::DEFAULT:::...
;Numbers in hexadecimal
;SIMULADOR  emu8086  [for 16 bits]
;https://github.com/mathoian 
 
;OBS: For create file,write string and save in the file , in the HD and USB.
  
;     *review*

;create file(x)
;create string(X)
;save string in the file and save(x)
;print(X)

.model small
org 100h 
.data   

txt_ db "Hell word in assembly! this exercise for create file,write string and save in the file, in the HD and USB.[Marcelo Henrique]$"        ;string que sera gravada no arquivo 
arquivo_ db "C:\HW_Assembly.txt", 0    ; FILE TO BE RECORDED ON DISC Hum...  
;To create and save the file on another disk as a floppy you must pass the creation
;address ex: "D:\InFloppyDisk.txt"
handle dw ?

.code
   mov ax, @data                   ;Recorder receive is date
   mov ds, ax                      ;Movivent of die that is in ax for reg. Sec. Of data
                                   
   main proc                       ;main =]    
       
       mov ah, 3ch                 ;FOR CREATE FILE =]
       mov dx, offset arquivo_     ;DX
       int 21h
       mov handle, ax              ;PASSING THE ADDRESS TO HANDLE THE FILE
       
       mov  ah, 40h             
       mov  bx, handle              
       mov  cx, 300                 ;STRING SIZE
       mov  dx, offset txt_                                               
       MOV AH,09h                   ;FUNCTION OF THE TO SHOW ON THE SCREEN [before] closing the file
       int  21h
       
       mov ah, 3eh                 ;CLOSING THE FILE. 
       
       int 21h
       mov ax, 4ch
       int 21h
       
   endp
