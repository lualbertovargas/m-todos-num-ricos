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
x1=linspace(a,b,n);
y1=subs(f,x1);
bar(x1,y1)
xlabel('Eje X')
ylabel('Eje y')
title('Metodo del trapecio','color', 'b')
plot(x1,y1,'red','LineWidth',3)