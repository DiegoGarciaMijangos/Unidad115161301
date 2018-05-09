
.model small
.stack 100
.data
msj1 db 'Numero : ','$'
msj2 db 13,10,'Numero 2: ','$'

msj5 db 13,10,'impar: ','$'
msj6 db 13,10,'par: ','$'
linea db 13,10,'$'
numero db 0
var2 db 0
var3 db 0

.code
.startup
;lee del teclado
call limpia
mov ah,09h
lea dx, msj1 ;desplegar numero 1:
int 21h
call leer ;lee primer numero
sub al,30h ;restar 30h para obtener el numero
mov numero,al ;lo guardo en var1
mov ah,09h

ciclo proc near
cmp numero,1
jne llamada
.exit
ciclo endp
llamada proc near
xor ax,ax ;limpiamos el registro ax. 
mov al,2
mov bl,al
mov al,numero
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX
mov bl,al
mov dl,bl

cmp ah,0
je espar
cmp ah,1
je esimpar
call ciclo

.exit
llamada endp


;******************si es impar numero*3+1
esimpar proc near

mov ah,09h
lea dx,msj5 ;desplegar mult
int 21h
mov al,numero 
mov bl,3
mul bl ;mult al=al*bl
add al,1 ; realizo la suma de var2(bl) y var1 y el resultado queda en bl
mov numero,al
mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov ah,02h ;imprimir caracter
int 21h
call ciclo
.exit
esimpar endp


;***************** par numero / 2
espar proc near
mov ah,09h
lea dx,msj6 ;desplegar div
int 21h
xor ax,ax ;limpiamos el registro ax. 
mov al,2
mov bl,al
mov al,numero
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX
mov numero,al
mov dl,al
add dl,30h
mov ah,02h
int 21h
call ciclo

.exit
espar endp


; ****************PROCEDIMIENTOS
salto proc near
mov ah,09h
lea dx,linea
int 21h
mov dl,00h
ret
salto endp

 
leer proc near
mov ah,01h;leer caracter desde el teclado
int 21h;lee primer caracter
ret
leer endp

limpia proc near
mov ah,00h
mov al,03h
int 10h
ret
limpia endp
end
