function [X]=SustitucionRegresiva(UB,n)
for i=n:-1:1
    Sumatoria=0;
    for p=i+1:n
        Sumatoria=Sumatoria+UB(i,p)*X(p,1);
    end
    X(i,1)=(UB(i,n+1)-Sumatoria)/UB(i,i);
end
