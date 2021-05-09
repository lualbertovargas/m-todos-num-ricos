clear all; 
clc; 
 fprintf('Calculo de la integral por el metodo trapecial\n\n'); 
   f=input('introduce la funcion:','s'); 
     a=input('lime inferior:'); 
       b=input('limite superior:'); 
     c=input('numero de segmentos a dividir:'); 
    h=(b-a)/c; 
  z=0; 
for x=a:h:b
k=eval(f);
if x==a,d=k;
end
if x==b,e=k;
end
z=z+k;
end 
  z=z-d-e; 
    z=z*2; 
      z=z+d+e; 
     z=z/(2*c); 
   z=z*(b-a) 
   fprintf('Resultado ');