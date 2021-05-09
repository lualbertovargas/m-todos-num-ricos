function [valor]=simpsonTresOctavos(funcion,intervalos,inferior,superior)
format long
q=int(funcion,inferior,superior);
funtionA=inline(funcion);
while mod(intervalos,3)~=0
    disp('Recordemos que debe ser multiplo de 3 los intervalos')
    intervalos=input('Ingrese otro número por favor: ');
end
h=(superior-inferior)/intervalos;
sumaA=0;
sumaB=0;
i=1;
for i=2:intervalos-1
    if mod(i,3)~=0
    sumaB=sumaB+feval(funtionA,h*i+inferior);
    else
    sumaA=sumaA+feval(funtionA,h*i+inferior);
    end
end
valor=(3*h/8)*(funtionA(inferior)+3*sumaB+2*sumaA+funtionA(superior));
error=abs((q-valor)/q)*100;




