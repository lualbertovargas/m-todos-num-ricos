fprintf('Interpolacion de newton\n')
clear;
clc;
ep=1;
fprintf('el grado del polinomio es: ')
n=3
fprintf('Se necesitan %.0f puntos\n',n+1);
X=[0.1 0.33 0.57 0.8  ]
Y=[-3.16 -1.735 -1.3146 -1.1041 ]
Q=X;
DD=zeros(n+1);
DD(:,1)=Y;
for k=2:n+1
    for J=k:n+1
        DD(J,k)=[DD(J,k-1)-DD(J-1,k-1)]/[X(J)-X(J-k+1)];
    end
end
disp('La matriz de diferencias divididas es:');
disp(DD);
disp('El polinomio de newton es');
syms x;
polnew=DD(1,1);
P=1;
for i=1:n
    P=P*(x-X(i));
    polnew=polnew+P*DD(i+1,i+1);
end
polnew=expand(polnew);
pretty(polnew);
fprintf('El valor a interpolar es: ');
x=0.35
vi=eval(polnew);
fprintf('el valor interpolado es %.2f\n',vi);
hold on;
ezplot(polnew,[X(1) X(n+1)]);
plot(x,vi,'r+');
%calculo del error lagrange
syms x
dP=diff(P,x,4)
dt=inline(dP);
for k=k:4
    ep=ep*(1.5-Q(k));
end
if dP==0
    Error=0*ep
else
    Error=dt(0,35)*ep
end
