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
ciudad = input('\nTrapecio ò SimpsonUnTercio   -----  (1 y 2)\n')


switch ciudad
case 1
    
fprintf('\t\tMetodo del TRAPECIO\n')

 format long;
        f=inline(fun);
 
 h=(b-a)/n;
 f=0;
 for k=1:n-1
 x=a+h*k;
 f=f+eval(fun);
 end
 f=2*f;
 x=a; f=f+eval(fun); x=b; f=f+eval(fun);
 f=(h/2)*(f);
 fprintf('El valor aproximado es: %10.15f\n\n',f)
case 2
       format long;
        f=inline(fun);
        h=(b-a)/n;
        sumai=0;
        sumap=0;
        for i=1:2:n-1
            sumai=sumai+feval(f,h*i+a);
        end
        for i=2:2:n-2
            sumap=sumap+feval(f,h*i+a);
        end
        func=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));
        fprintf('El resultado de la integral es = ')


end




