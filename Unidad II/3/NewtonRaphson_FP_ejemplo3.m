clc
clear
clear all

format short g
%        |De  | |a | |  R  | |  X   |
%        |Bus | |Bus| 

       
Linedata = [1     4	     0.0000	    0.0576     ;
        4	  5	     0.0170     0.0920     ;
        5     6	     0.0390     0.1700      ;
        3     6	     0.0000	    0.0586	    ;
        6     7	     0.0119     0.1008    ;
        7     8	     0.0085     0.0720     ;
        8     2      0.0000	    0.0625	    ;
        8     9	     0.0320	    0.1610      ;
        9     4	     0.0100	    0.0850     ];      
       
       
%        |Voltaje||Angle||Generacio||Generacio||Carga||Carga   ||Tipo|
%        |Por    ||Por  ||Real     ||Reactive ||Real ||Reactive||de  |
%        |Unit   ||Unit ||Power    ||Potencia ||Poten||Power   ||Bus |

Busdata = [      1.0	  0.0	  0.00	 0.0      0.00	   0.0	   1 ;
                 1.0	  0.0     1.63	 0.0      0.00	   0.0	   2;
                 1.0	  0.0     0.85	 0.0      0.00	   0.0	   2;
                 1.0	  0.0	  0.00	 0.0      0.00	   0.0	   3;
                 1.0	  0.0	  0.00	 0.0      0.90	   .30	   3;
                 1.0	  0.0	  0.00	 0.0      0.00	   0.0	   3 ;
                 1.0	  0.0	  0.00	 0.0      1.00     .35	   3;
                 1.0	  0.0	  0.00	 0.0      0.00	   0.0	   3 ;
                 1.0	  0.0	  0.00	 0.0      1.25     .50	   3];
      

% Busdata=[ 1.00      0        250        0        0         0        1;
%           1.00      0        73.57      0     21.31        0        3;
%           1.00      0         0         0        95        0        3;
%           1.00      0         0         0       91.81      0        3;
%           1.00      0         0         0       53.33      0        3];
      
      
   
    
    
n1=max(Linedata(:,1));
n2=max(Linedata(:,2));
n=max(n1,n2);
x=size(Linedata);
a=x(1);
for k=1:a
b=Linedata(k,:);
f=b(1);
t=b(2);
R=b(3);
X=b(4);
z(f,t)=R+j*X;
y(f,t)=1/(z(f,t));
y(t,f)=y(f,t);
end
y;
for k=1:n
Y(k,k)=sum(y(k,:));  %Diagonal element
end
for p=1:n
for q=1:n
if p~=q
Y(p,q)=-y(p,q);  %Elemento fuera de diagonal
end
end
end
Ybus=Y;          % Matriz de admitancia
[n,m]=size(Busdata);
Ym=abs(Ybus);         
YTheta=angle(Ybus);  % Angulos de la matriz de admitancia en radianes
Vm=Busdata(:,1);  %Voltaje en Barra
Delta=Busdata(:,2); %Angulo en radianes
type=Busdata(:,7); %
Pg=Busdata(:,3)/100; %
Pl=Busdata(:,5)/100; %
Qg=Busdata(:,4)/100; %
Ql=Busdata(:,6)/100; %
P=Pg-Pl; %P
Q=Qg-Ql; %Q
pa=find(type>1); %
o=length(pa); %
pv=find(type>2); %e
l=length(pv); %
pq=find(type==1|type==2); %
pp=find(type==1); %
r=length(pq); %
s=length(pp); %
P=P(pa,:);
Q=Q(pv,:);
display('Inicio de las Iteraciones:');

Iter=0;
este=1;
contador=1;
while (1) %Inicio de las Iteraciones
for ii=1:o
SumP=0;
for ii=1:o
SumP=0;
for t=1:n %Hay un bus slack
SumP=SumP+Vm(pa(ii))*Vm(t)*Ym(pa(ii),t)*cos(YTheta(pa(ii),t)-Delta(pa(ii))+Delta(t));
F(pa(ii),1)=SumP;
end
end
F=F(pa,:);
for ii=1:l
SumQ=0;  %Calculo de la potencia reactiva
for t=1:n
SumQ=SumQ-Vm(pv(ii))*Vm(t)*Ym(pv(ii),t)*sin(YTheta(pv(ii),t)-Delta(pv(ii))+Delta(t));
G(pv(ii),1)=SumQ;
end
end
G=G(pv,:);
dP=P-F;
dQ=Q-G;
Pm=[dP;dQ];  %
for ii=1:o %Calculo de la Matriz Jacobiana
    for k=1:o
        for u=1:l
            for v=1:l
                if(pa(ii)~=pa(k)|pa(ii)~=pv(u)|pv(u)~=pa(ii)|pv(u)~=pv(v)) %Off-diagonal element
H(pa(ii),pa(k))=-Vm(pa(ii))*Vm(pa(k))*Ym(pa(ii),pa(k))*sin(YTheta(pa(ii),pa(k))-Delta(pa(ii))+Delta(pa(k)));
L(pa(ii),pv(u))=Vm(pa(ii))*Ym(pa(ii),pv(u))*cos(YTheta(pa(ii),pv(u))-Delta(pa(ii))+Delta(pv(u)));
M(pv(u),pa(ii))=-1*Vm(pv(u))*Vm(pa(ii))*Ym(pv(u),pa(ii))*cos(YTheta(pv(u),pa(ii))-Delta(pv(u))+Delta(pa(ii)));
N(pv(u),pv(v))=-1*Vm(pv(u))*Ym(pv(u),pv(v))*sin(YTheta(pv(u),pv(v))-Delta(pv(u))+Delta(pv(v)));
                else
sumH=0; sumL=0; sumM=0; sumN=0;  % elementos de la diagonal
for t=1:n
    if (t~=pa(ii)|t~=pv(u))
sumH=sumH+Vm(pa(ii))*Vm(t)*Ym(pa(ii),t)*sin(YTheta(pa(ii),t)-Delta(pa(ii))+Delta(t));
H(pa(ii),pa(k))=sumH;
sumL=sumL+Vm(t)*Ym(pa(ii),t)*cos(YTheta(pa(ii),t)-Delta(pa(ii))+Delta(t));
L(pa(ii),pv(u))=sumL+2*Vm(pa(ii))*Ym(pa(ii),pa(ii))*cos(YTheta(pa(ii),pa(ii)));
sumM=sumM+Vm(pv(u))*Vm(t)*Ym(pv(u),t)*cos(YTheta(pv(u),t)-Delta(pv(u))+Delta(t));
M(pv(u),pa(ii))=sumM;
sumN=sumN+Vm(t)*Ym(pv(u),t)*sin(YTheta(pv(u),t)-Delta(pv(u))+Delta(t));
N(pv(u),pv(v))=-(sumN)-2*Vm(pv(u))*Ym(pv(u),pv(u))*sin(YTheta(pv(u),pv(u)));
end
end
end
end
end
end
end
H=H(:,pa);
H=H(pa,:);   % H Matriz
L=L(pa,:);
L=L(:,pv);   % L Matriz
M=M(pv,:);
M=M(:,pa);   % M Matriz
N=N(pv,:);
N=N(:,pv);    % N Matriz
J=[H L;M N];  %  Matriz Jacobiana
R=J\Pm;       % Result
RAngle=R(1:o); %Resultado de angulo en radianes
RVoltage=R(o+1:l+o); % Resultados de Voltaje
k=1;


for ii=1:n;
    if (type(ii)==2 | type(ii)==3)
        Delta(ii)=RAngle(k) + Delta(ii);
        k=k+1;
    end
end
k=1;
for ii=1:n
if type(ii)==3
Vm(ii)=RVoltage(k)+Vm(ii); %Este valor

voltio(contador,:)=Vm;
contador=contador+1;

k=k+1;
end
end

Iter=Iter+1;
Iteracion(Iter)=Iter;
ea=max(abs(Pm)) ;% Error de precision
Error(Iter)=ea;
if Iter>=50|ea<=0.00001 %Prueba de Convergencia
end
end
break
end
for ii=1:n %Angulo en grados
Angulo(ii,1)=((Delta(ii)*180)/pi); %Este valor
end
Angulo;
Voltaje=Vm;
voltio(3:10,:)=[];
voltio(6:26,:)=[];
voltio(6,:)=[];
voltio(2,:)=[];
voltio(6,:)=[];
display('     Iteracion ||  Error ||      Vm(1) ||      Vm(2)  ||      Vm(3) ||      Vm(4) ||      Vm(5) ||      Vm(6) ||      Vm(7)||      Vm(8) ||      Vm(9)')
display([Iteracion' Error' voltio(1:8,1:9)]);

for ii=1:s
SumP=0;
for t=1:n
SumP=SumP+Vm(pp(ii))*Vm(t)*Ym(pp(ii),t)*cos(YTheta(pp(ii),t)-Delta(pp(ii))+Delta(t));
Pcal(pp(ii),1)=SumP;
end
end
Pcal=Pcal(pp,:);
k=1;
for ii=1:n
if type(ii)==1
Pg(ii)=Pcal(k);
k=k+1;
end
end
Potencia_Real_Generacion=Pg*100;
for ii=1:r
SumQ=0;
for t=1:n
SumQ=SumQ-Vm(pq(ii))*Vm(t)*Ym(pq(ii),t)*sin(YTheta(pq(ii),t)-Delta(pq(ii))+Delta(t));
Qcal(pq(ii),1)=SumQ;
end
end
Qcal=Qcal(pq,:);
k=1;
for ii=1:n
if type(ii)==1|type(ii)==2
Qg(ii)=Qcal(k);
k=k+1;
end
end
Potencia_Reactiva_Generacion=Qg*100;
Real_Power_Load=Pl*100;
Reactive_Power_Load=Ql*100;
display('--------------------------------  VALORES FINALES  ------------------------------')
disp('     Angulo         Voltaje    P.Gener.      Q.Gener.      P.Carga     Q.Carga')
disp([Angulo, Voltaje, Potencia_Real_Generacion, Potencia_Reactiva_Generacion, Real_Power_Load, Reactive_Power_Load])
%Flujo de potencia en las lineas
% P12=-Voltaje(1)*Voltaje(2)*sin(Angulo(2)*pi/180)/Linedata(1,4)*100
% P15=-Voltaje(1)*Voltaje(5)*sin(Angulo(5)*pi/180)/Linedata(2,4)*100
% P25=-Voltaje(2)*Voltaje(5)*sin((Angulo(5)-Angulo(2))*pi/180)/Linedata(3,4)*100
% P24=-Voltaje(2)*Voltaje(4)*sin((Angulo(4)-Angulo(2))*pi/180)/Linedata(4,4)*100
% P23=-Voltaje(2)*Voltaje(3)*sin((Angulo(3)-Angulo(2))*pi/180)/Linedata(5,4)*100
% P34=-Voltaje(3)*Voltaje(4)*sin((Angulo(4)-Angulo(3))*pi/180)/Linedata(6,4)*100
% P45=-Voltaje(4)*Voltaje(5)*sin((Angulo(5)-Angulo(4))*pi/180)/Linedata(7,4)*100



