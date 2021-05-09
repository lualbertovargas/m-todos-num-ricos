% [t,Y] = euler('funNEc',0,2,[6;4],400)

function [t,Y] = euler(f,a,b,y0,N)
%M?todo de Euler para resolver  PVI de primer orden
%Variables de Entrada:
%f=funciOn a evaluar; a=inicio de intervalo; b=fin de intervalo;
%y0=condiciOn inicial de y; N=n?mero de subintervalos
%Variables de Salida:
%x=vector de nodos;   y=vector de aproximaciones de la soluci?n;
    h = (b - a)/N;
    t = a:h:b;
    %Verifica si x es columna, de no ser lo convierte
    t = t(:);
    %Inicializamos el vector llenandolo de 0s, la dimensi?n siempre ser? el
    %numeroSubintervalos +1
    Y = zeros(N+1,length(y0));
    Y(1,:) = y0;
    for k = 1:N;
        K1=feval(f,t(k),Y(k,:))';
        Y(k+1,:) = Y(k,:) + h*K1; 
        %feval permite evaluar funciones
    end   
end
