%regla de simpson 3/8
function [I,e]=simpson8_3(fun,n,a,b)
format long
q=int(fun,a,b);
f=inline(fun);
while mod(n,3)~=0
    disp('El número de subintervalos debe ser multiplo de 3')
    n=input('Ingrese otro número de subintervalos: ');
end
h=(b-a)/n;
sumai=0;
sumap=0;
i=1;
for i=2:n-1
    if mod(i,3)~=0
    sumap=sumap+feval(f,h*i+a);
    else
    sumai=sumai+feval(f,h*i+a);
    end
end
I=(3*h/8)*(f(a)+3*sumap+2*sumai+f(b));
e=abs((q-I)/q)*100;