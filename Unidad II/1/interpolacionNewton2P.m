%Algoritmo del Ejercicio 18.4 ejercicio de Métodos Númericos de Chapra
%Recordemos que para llamar a una funcion debemos usar la sintaxis
%//La variable a llamar dentro del parentesis representa-----(funcion a evaluar, numero de iteraciones de la tabla)
%[a]=interpolacionNewton2P(2.8,3)
%Use para el orden que desee


function [a]=interpolacionNewton2P(y,n)
disp('Método de interpolación de diferencias divididas de Newton');
syms x;
fprintf('El número a evaluar es = (%.1f) \n',y);
fprintf('El número de datos es = (%.1f) \n',n);
xi=zeros(1,n);
dif=zeros(n,n);
polinomio=0;
factor=1;
for k=1:n
    %//valores ingresados de la tabla una vez llamada la duncion llenar
fprintf('Ingrese el valor de x(%d): ',k-1);
xi(k)=input('');
fprintf('Ingrese el valor de f(%d): ',k-1);
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
for l=1:n
fprintf('\n%.6f\t\t%.f\t\t',xi(l),dif(l,1));
    for m=2:p
fprintf('%.6f\t\t',dif(l,m));
    end
p=p+1;
end
t=0;
fprintf('\n\nP(x)=\n');
polinomio=collect(polinomio);
pretty(polinomio);
format short %//reducir el tamaño de decimales
a=subs(polinomio,y);
fprintf('\n\nEl valor de P(%f) es: %.6f\n\n',y,a);

