
f='TORRICELLI_EDO';
a=0;
b=10;
y0=5.2;
N=10; %En 10 pasos
[t,Y] = euler(f,a,b,y0,N); %Metodo Euler
[Tb2,x2,y2] = heunNEcuaciones(f,a,b,y0,N); %Metodo Heun
[Tb3,x3,y3] = rk3NEc(f,a,b,y0,N); %Metodo RK de orden 3
[Tb4,x4,y4] = rk4NEc(f,a,b,y0,N); %Metodo RK de orden 4

plot(t,y,'m',x2,y2,'b',x3,y3,'r',x4,y4,'g')
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


% Imprimir todas
m=[t';Y';y2';y3';y4'];
fprintf('Tiempo Euler  Heun   RK3   RK4    \n')
fprintf('-------------------------------\n')
fprintf('%2.2f   %2.2f   %2.2f   %2.2f  %2.2f\n',m)
