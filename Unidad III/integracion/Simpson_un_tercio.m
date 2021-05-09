%regla de simpson 1/3
clear all; close all; clc
fun=input('Ingresa la función f(x) entre comillas: ');
f=inline(fun);
n=1;
while mod(n,2)~=0
    n=input('Ingrese el número de subintervalos: ');
    if mod(n,2)~=0
        disp('El número de subintervalos debe ser par, pulse una tecla para continuar')
        pause
    end
end
a=input('Ingrese el límite inferior de la integral: ');
b=input('Ingrese el límite superior de la integral: ');


h=(b-a)/n;


sumai=0;
sumap=0;


for i=1:2:n-1
    sumai=sumai+feval(f,h*i+a);
end
for i=2:2:n-2
    sumap=sumap+feval(f,h*i+a);
end


int=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));


disp(['El resultado de la integral es ' num2str(int)])