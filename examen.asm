.model small
.stack 100
.data
msjop db 13,10,'Resultado Integral: ','$'
msj1 db 13,10,'3/2x^2:  ','$'
msj2 db 13,10,'    4x:  ','$'
msj3 db 13,10,'   x^3:  ','$'
linea db 13,10,'$'
var1 db 0
var2 db 0
var3 db 0
res1 db 0
res2 db 0
res3 db 0

.code
.startup
mov var1,2
mov var2,2
mov var3,4

;-------------3/2x^2-------
mov al,var1
mov bl,var2
mul bl ;mult al=al*bl
mov bl,3
mul bl 
mov bl,var2
div bl  
mov ah,09h
lea dx,msj1 ;imprimir suma
int 21h
mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov res1,dl
mov ah,02h ;imprimir caracter

int 21h
;----------4x------------
mov al,var1
mov bl,var3
mul bl

mov ah,09h
lea dx,msj2 ;imprimir suma
int 21h
mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov res2,dl
mov ah,02h ;imprimir caracter

int 21h

;----------x^3----------
mov al,var1
mov bl,var2
mul bl
mov bl,var1
mul bl

mov ah,09h
lea dx,msj3 ;imprimir 
int 21h
mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov res3,dl
mov ah,02h ;imprimir caracter

int 21h
;--------integral------
mov bl,res2
sub bl,res3
add bl,res1 ; realizo la suma de var2(bl) y var1 y el resultado queda en bl
mov ah,09h
lea dx,msjop ;imprimir integral
int 21h
mov dl,bl ;pongo en dl el numero a imprimir var2(bl)
;add dl,30h ; agrego 30h para obtener el caracter    
mov ah,02h ;imprime un caracter
int 21h


end