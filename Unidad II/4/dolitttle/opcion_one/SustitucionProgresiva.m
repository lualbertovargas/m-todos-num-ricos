function [z]=SustitucionProgresiva(Lb,n)
for i=1:n
    Sumatoria=0;
    for p=1:i-1
        Sumatoria=Sumatoria+Lb(i,p)*z(p,1);
    end
    z(i,1)=(Lb(i,n+1)-Sumatoria)/Lb(i,i);
end
