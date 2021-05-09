function [L,U] = doolittle 

format long
[ A,n,b ] = Matriz;
 
for k=1:n
    for j=k:n
        Acumulador2 = 0;
        for p=1:k-1
            Acumulador2 = Acumulador2 + L(k,p)*U(p,j);
        end
        U(k,j) =  A(k,j) - Acumulador2;
    end
    for i= k:n
        Acumulador = 0;
        for p=1:k-1
            Acumulador = Acumulador + L(i,p)*U(p,k);
        end
        L(i,k) = (A(i,k) - Acumulador)/U(k,k);
    end
 
end
disp('U=')
disp (U)
disp('L=')
disp (L)  
Lb=Aumentada(L,b);
z=SustitucionProgresiva(Lb,n);
[Uz]=Aumentada(U,z);
X=SustitucionRegresiva(Uz,n);
disp('X=')
disp(X)
end
