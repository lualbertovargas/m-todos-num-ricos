clc;
clear
fprintf('\t\tCALCULO DEL AREA POR EL METODO DE TRAPECIO\n');
f=input('ingrese la funcion \n f(x)=','s');
b=input('ingrese el limite superior de la integral\n');
a=input('ingrese el limite inferior de la integral\n');
n=input('ingrese el numero de intervalos\n');
h=(b-a)/n; g=inline(f);
s=0;
hold on
for i=1:n
 s=h/2*(g(a+(i-1)*h)+g(a+(i)*h))+s;
 fprintf('El area aproximada es: %10.15f\n\n',s);
end
