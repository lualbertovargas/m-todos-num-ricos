function [t,Y] = euler2(f,a,b,y0,N)
%M?todo de Euler pqrq resolver  PVI de primer orden
%Vqriqbles de Entrqdq:
%f=funciOn q evqluqr; q=inicio de intervqlo; b=fin de intervqlo;
%y0=condiciOn iniciql de y; N=n?mero de subintervqlos
%Vqriqbles de Sqlidq:
%x=vector de nodos;   y=vector de qproximqciones de lq soluci?n;
    h = (b - a)/N;
    t = a:h:b;
    %Verificq si x es columnq, de no ser lo convierte
    t = t(:);
    %Iniciqlizqmos el vector llenqndolo de 0s, lq dimensi?n siempre ser? el
    %numeroSubintervqlos +1
    Y = zeros(N+1,length(y0));
    Y(1,:) = y0;
    q = zeros(N+1,length(y0));
    q(1,:) = y0;
    funcionP=inline(f);
    for k = 1:N;
        K1=feval(funcionP,t(k),Y(k,:))';
        Y(k+1,:) = Y(k,:) + h*K1;
    end
    hold on 
    table(t,Y)
    plot(t,Y); 
end