
function [A] = simpson(fa,it,xo,xf)
contador=0;
oa = input('numero 1 ---- 1/3 ò numero 2 ----- 3/8     ')
online=inline(fa); 
if(oa==1)
     [A] = simpsonUno(fa,it,xo,xf);
else
         [A]=simpsonDos(fa,it,xo,xf);    
end
A=((xf-xo)/it); 
fprintf(2, '========================     ')
for k=xo:A:xf 
    contador=contador+1;
    ad(contador)=k;
    df(contador)=online(k);
end
hold on
fplot(fa)
bar(ad,df,5)