%Universidad de las Fuerzas Armadas ESPE

%.........................................................................
%Recuerde ingresar nùmero 1 para resolver por el mètodo de Trapecio
%-------------------------------------------------------------------------
%y numero 2 para método  Simpson 1/3
%-------------------------------------------------------------------------

clc;

clear  
close all;
fprintf('\n\t\t\tUniversidad de las Fuerzas Armadas ESPE\n\n\n')
fprintf('\n\t\t\tEjercicio 22.10 Libro de Chapra\n\n\n')
fprintf('Ingrese el número 1 para Trapecios y 2 para Simpson 1/3 ')
option = input('\nTrapecio ò SimpsonUnTercio   -----  (1 y 2)\n')


switch option   %Switch generador de opciones
case 1          
clc;

clear  
close all;
    fprintf('\t\tMetodo del TRAPECIO\n')


    f=input('Ingrese la funcion \n f(x)=','s');
    b=input('Ingrese el limite superior de la integral\n');
    a=input('Ingrese el limite inferior de la integral\n');
    n=input('Ingrese el numero de intervalos\n');
    h=(b-a)/n; guardar=inline(f);
    s=0;
    
        for i=1:n
            s=h/2*(guardar(a+(i-1)*h)+guardar(a+(i)*h))+s;
            fprintf('El area aproximada es: %10.15f\n\n',s);
        end

case 2
   clc;

clear  
close all;
format long;
fun=input('Ingresa la función f(x): ','s');
fc=inline(fun);
n=1;
while mod(n,2)~=0
 n=input('Ingrese el número de subintervalos: ');
 if mod(n,2)~=0
 disp('El número de subintervalos debe ser par, pulse una tecla para continuar')
 pause
 end
end
b=input('Ingrese el límite superior de la integral: ');
a=input('Ingrese el límite inferior de la integral: ');

h=(b-a)/n;
sumai=0;
sumap=0;
for i=1:2:n-1
 sumai=sumai+feval(fc,h*i+a);
end
for i=2:2:n-2
 sumap=sumap+feval(fc,h*i+a);
end
int=(h/3)*(feval(fc,a)+4*sumai+2*sumap+feval(fc,b));
disp(['El resultado de la integral es ' num2str(int)])   

end
