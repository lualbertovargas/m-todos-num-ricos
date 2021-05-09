function programa_entero(a,b,y0,N)

f='TORRICELLI_EDO';
%Datos de ejemplo de Ingreso
% a=0;
% b=19;
% y0=5.2;
% N=10; %En 10 pasos

[t,Y] = euler(f,a,b,y0,N); %Metodo Euler
[Tb2,x2,y2] = heunNEcuaciones(f,a,b,y0,N); %Metodo Heun
[Tb3,x3,y3] = rk3NEc(f,a,b,y0,N); %Metodo RK de orden 3
[Tb4,x4,y4] = rk4NEc(f,a,b,y0,N); %Metodo RK de orden 4

plot(t,Y,'m',x2,y2,'b',x3,y3,'r',x4,y4,'g')
grid on;
xlabel('Tiempo');
ylabel('Altura');
legend('1. Euler','2. Heun','3.RK3','4.RK4');

fprintf('Metodo de Euler\n')
fprintf('tiempo[s] Altura[cm]\n')
h=Y;
Euler=table(t,h)

fprintf('Metodo de Heun\n')
fprintf('tiempo[s] Altura[cm]\n')
Euler=Tb2

fprintf('Metodo de Runge Kutta orden 3\n')
fprintf('tiempo[s] Altura[cm]\n')
Euler=Tb3

fprintf('Metodo de Runge Kutta orden 4\n')
fprintf('tiempo[s] Altura[cm]\n')
Euler=Tb3

%Calculo de valores reales

h_real=(t./9.968218-22.731034/9.968218).^2

%Error=(Y'-h_real)./h_real*100
% Imprimir todas
m=[t';Y';y2';y3';y4'];
fprintf('Tiempo Euler  Heun   RK3   RK4  \n')
fprintf('--------------------------------\n')
fprintf('%2.2f   %2.2f   %2.2f   %2.2f  %2.2f  \n',m)

function f = TORRICELLI_EDO(t,h)
g=980.7; %gravedad

f=-(0.35/5.2)^2*(2*g*h)^0.5;
end

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
    t=x;h=y;
  Tb=table(t,h);
%     plot(x,y)
%     legend('Variable1','Variable2','Variable3')
end


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
      t=x;h=y;
  Tb=table(t,h);
%Tb=table(x,y);
% plot(x,y)
end

function [Tb,x,y] = rk3NEc(f,a,b,y0,N)
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
	
		y(k+1,:) = y(k,:)+h/6 * (k1+2*k2+2*k3);
    end
      t=x;h=y;
  Tb=table(t,h);
% Tb=table(x,y);
% plot(x,y)
end

end

