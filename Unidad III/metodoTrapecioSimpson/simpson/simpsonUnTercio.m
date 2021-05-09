function [valor] = simpsonUnTercio(funcion,intervalos,inferior,superior)
format long;
funtionA=inline(funcion);
h=(superior-inferior)/intervalos;
sumaA=0;
sumaB=0;
for i=1:2:intervalos-1
    sumaA=sumaA+feval(funtionA,h*i+inferior);
end
for i=2:2:intervalos-2
    sumaB=sumaB+feval(funtionA,h*i+inferior);
end
valor=(h/3)*(feval(funtionA,inferior)+4*sumaA+2*sumaB+feval(funtionA,superior));
fprintf('El area de la integral es = ')