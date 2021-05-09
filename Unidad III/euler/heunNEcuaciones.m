%heun
function [Tb,x,y] = heunNEcuaciones(f,a,b,y0,N)
%Método de Heun para ecuaciones de grado N,
%donde f=funciOn a evaluar; a=inicio de intervalo; b=fin de intervalo;
%y0=condiciOn inicial de y; N=nUmero de subintervalos
    h = (b - a)/N;
    x = a:h:b;
    %Verifica si x es columna, de no ser lo convierte
    x = x(:);
    %Inicializamos el vector llenandolo de 0s, la dimensión siempre será el
    y = zeros(N+1,length(y0));
    y(1,:) = y0;
    for k = 1:N
        %Se transponen los vectores k1 y
        k1 = h * feval(f,x(k),y(k,:))';
        k2 = h * feval(f,x(k+1),y(k,:)+k1)';
        y(k+1,:) = y(k,:)+(k1+k2)/2;
    end
    Tb=table(x,y);
    plot(x,y)
    legend('Variable1','Variable2','Variable3')
end