SECTION .data
	lab04:      db "Sachkovskaya Sofia",0xa 
		lab04Len:   equ $ - lab04
SECTION .text
	global _start           

_start:                 
        mov eax, 4      
        mov ebx, 1    
        mov ecx, lab04
        mov edx, lab04Len
        int 0x80        
	
	mov eax, 1       
        mov ebx, 0      
        int 0x80        
