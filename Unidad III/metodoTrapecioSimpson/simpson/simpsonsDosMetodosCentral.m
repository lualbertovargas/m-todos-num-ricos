%Universidad de las Fuerzas Armadas ESPE

%.........................................................................
%Para usar este archivo desde la comand Windows escriba las seguientes dos
%lineas
%====================================================================================================
%syms x
%Recuerde [valor] = simpsonsDosMetodosCentral(funcion,intervalos,inferior,superior)
%[int] = simpsonsDosMetodosCentral(funcion a evaluar,numero de intervalos,Intervalo Inferior,Superior)
%====================================================================================================


function [valor] = simpsonsDosMetodosCentral(funcion,intervalos,inferior,superior)
fprintf('\n\n=============================================\n')
fprintf('|  Universidad de las Fuerzas Armadas ESPE  |\n')
fprintf('=============================================\n\n')
fprintf('Ingrese el número 1 para Simpson 1/3  y 2 para Simpson 3/8  ')
option = input('\nSimpson 1/3 ò Simpson 3/8   -----  (1 Ó 2)\n\t\t')
contador=0;
funtionA=inline(funcion); 

switch option
    case 1       
     [valor] = simpsonUnTercio(funcion,intervalos,inferior,superior);
     
    case 2
         [valor]=simpsonTresOctavos(funcion,intervalos,inferior,superior);
             
end
valor=((superior-inferior)/intervalos); %Valor de la h

for k=inferior:valor:superior %vectores de graficación
    contador=contador+1;
    vector(contador)=k;
    vectorDos(contador)=funtionA(k);
end
hold on
fplot(funcion)
bar(vector,vectorDos,1)


















