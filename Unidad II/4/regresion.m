function [a,b]=regresion(x,y)
x=x(:);
y=y(:);
n=length(x);
sumX=sum(x);
sumY=sum(y);
xx=x.^2;
yy=y.^2;
xy=x.*y;
sumXX=sum(xx);
sumYY=sum(yy);
sumXY=sum(xy);
c=[sumXX sumX sumXY;sumX n sumY];
resp=rref(c)
a=resp(1,3);
b=resp(2,3);
plot(x,y,"r*")
fy=a*x+b;
hold on
plot(x,fy,"b")