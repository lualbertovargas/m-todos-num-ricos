%[Tb,x,y] = rk4NEc('funNEc',0,2,[6;4],400)

function [Tb,x,y] = rk4NEc(f,a,b,y0,N)
%MEtodo de Runge-Kutta de cuarto orden para ecuaciones de grado N,
%donde f=funciOn a evaluar; a=inicio de intervalo; b=fin de intervalo;
%y0=condiciOn inicial de y; N=nUmero de subintervalos
    h = (b - a)/N;
    x = a:h:b;
    %Verifica si x es columna, de no ser lo convierte
    x = x(:);
    %Inicializamos el vector llenandolo de 0s, la dimensión es N+1
    y = zeros(N+1,length(y0));
    y(1,:) = y0;
    for k = 1:N
        k1 = feval(f,x(k), y(k,:))';
        k2 = feval(f,x(k)+h/2, y(k,:)+(h/2)*k1)';
		k3 = feval(f,x(k)+h/2, y(k,:)+(h/2)*k2)';
		k4 = feval(f,x(k+1), y(k,:)+h*k3)';

		y(k+1,:) = y(k,:)+h/6 * (k1+2*k2+2*k3+k4);
    end
Tb=table(x,y);
plot(x,y)
        