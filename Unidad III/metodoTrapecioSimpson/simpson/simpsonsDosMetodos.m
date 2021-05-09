%Universidad de las Fuerzas Armadas ESPE

%.........................................................................
%Para usar este archivo desde la comand Windows escriba las seguientes dos
%lineas
%-------------------------------------------------------------------------
%syms x
%Recuerde [int] = simpsonTrapecio(fun,n,a,b)
%[int] = simpsonTrapecio(funcion a evaluar,numero de intervalos,Xo,Xn)
%-------------------------------------------------------------------------


function [valor] = simpsonsDosMetodosCentral(fun,n,a,b)
fprintf('\n\n=============================================\n')
fprintf('|  Universidad de las Fuerzas Armadas ESPE  |\n')
fprintf('=============================================\n\n')
fprintf('Ingrese el número 1 para Simpson 1/3  y 2 para Simpson 3/8  ')
option = input('\nSimpson 1/3 ò Simpson 3/8   -----  (1 y 2)\n\t\t')
contador=0;
f=inline(fun); 

switch option
    case 1
        
        
        
     [valor] = simpsonUnTercio(fun,n,a,b);
     
     

    case 2
         [valor]=simpsonTresOctavos(fun,n,a,b);
             

end
valor=((b-a)/n); %Valor de la h

for k=a:valor:b
    contador=contador+1;
    vector(contador)=k;
    vectordos(contador)=f(k);
end
hold on
fplot(fun)
bar(vector,vectordos,1)


















