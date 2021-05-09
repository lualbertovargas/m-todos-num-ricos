%Universidad de las Fuerzas Armadas ESPE
function [int] = simpsonTrapecio(fun,n,a,b)


fprintf('\nEjercicio 22.10 Libro de Chapra\n')
fprintf('Ingrese el nombre del mètodo de Integraciòn entre comilla simple:\n ')

ciudad = input('\nTrapecio ò SimpsonUnTercio   -----  (Entre comilla simple)\n')


switch ciudad
case 'Trapecio'

case 'SimpsonUnTercio'
       fprintf('\nIngrese la funcion con las siguientes caracteristicas: \n') 

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
int=(h/3)*(feval(f,a)+4*sumai+2*sumap+feval(f,b));
fprintf('El resultado de la integral es = ')


end




