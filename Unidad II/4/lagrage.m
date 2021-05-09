
clear
clc
disp('Método de interpolación de diferencias divididas de Newton');
syms x;
y=input('Ingrese el número a evaluar: ');
n=input('Ingrese el número de datos: ');
xi=zeros(1,n);
dif=zeros(n,n);
polinomio=0;
factor=1;
for k=1:n
fprintf('Ingrese el valor de x%d: ',k-1);
xi(k)=input('');
fprintf('Ingrese el valor de f(x%d): ',k-1);
dif(k,1)=input('');
if k==1
polinomio=polinomio+dif(k,1);
end
end
for l=2:n
for m=l:n
dif(m,l)=(dif(m,l-1)-dif(m-1,l-1))/(xi(m)-xi(m-l+1));
if m==l
for t=1:l-1
factor=factor*(x-xi(t));
end
polinomio=polinomio+(dif(m,l)*factor);
factor=1;
end
end
end

t=1;
p=1;
while t==1
op=1;
switch op
case 1
for l=1:n
fprintf('\n%.6f\t\t%.f\t\t',xi(l),dif(l,1));
for m=2:p
fprintf('%.6f\t\t',dif(l,m));
end
p=p+1;
end
t=0;
case 2
for l=1:n
fprintf('\n%.8E\t\t%.8E\t\t',xi(l),dif(l,1));
for m=2:p
fprintf('%.8E\t\t',dif(l,m));
end
p=p+1;
end
t=0;
otherwise
disp('Opción incorrecta');
t=1;
end
end
fprintf('\n\nP(x)=\n');
polinomio=collect(polinomio);
pretty(polinomio);
a=subs(polinomio,y);
fprintf('\n\nEl valor de P(%f) es: %.6f\n\n',y,a);
