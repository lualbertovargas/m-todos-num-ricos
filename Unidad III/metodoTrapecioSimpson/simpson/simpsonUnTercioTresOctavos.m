%Universidad de las Fuerzas Armadas ESPE

%.........................................................................
%Para usar este archivo desde la comand Windows escriba las seguientes dos
%lineas
%-------------------------------------------------------------------------
%syms x
%Recuerde [int] = simpsonTrapecio(fun,n,a,b)
%[int] = simpsonTrapecio(funcion a evaluar,numero de intervalos,Xo,Xn)
%-------------------------------------------------------------------------


function [func] = simpsonTrapecio(fun,n,a,b)


fprintf('\n\t\t\tEjercicio 22.10 Libro de Chapra\n\n\n')
fprintf('Ingrese el número 1 para Trapecios y 2 para Simpson 1/3 ')
option = input('\nTrapecio ò SimpsonUnTercio   -----  (1 y 2)\n')


switch option
case 1
    
    [int] = simpsonUnTercio(fun,n,a,b)

case 2
       


end