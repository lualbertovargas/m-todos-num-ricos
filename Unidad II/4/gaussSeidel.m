function [y,Tabla]=gaussSeidel(A,B,x,emax)
% Resoluci?n de SEL por Gauss-Seidel
% A matriz del sistema
% B t?rmino independiente
% x iterante inicial
% emax tolerancia m?xima

[m,n]=size(A);
y=x;
% iteraci?n
for k=1:100
    y(1)=(B(1)-A(1,2:n)*x(2:n))/A(1,1);
            for i=2:n-1
                y(i)=(B(i)-A(i,1:i-1)*y(1:i-1) - A(i,i+1:n)*x(i+1:n))/A(i,i);
            end
y(n)=(B(n)-A(n,1:n-1)*y(1:n-1))/A(n,n)

sumar=0;
for c = 1:k
    
        H(c) = k;
    sumadort=sumar+1;
end


 if max(abs(y-x))<emax
     ms= ['n? de iteraciones',num2str(k)];
    disp(ms)
%num2str(k)
y(n)

 return
 end
 x=y; 
 
end
sumadort
 Tabla=table(y(n), H(c))
 
 
 
 
