
function [L,U] = doolittle (A) 
  % Reservar espacio para las matrices L y U
  % Empezando con ceros hay sitios que ya no tendremos que tocar
  L = zeros(size(A));
  U = zeros(size(A));
  [nRows, nColumns] = size(A);
  % Recorremos en orden de columnas, es más rápido en MATLAB
  for j=1:nColumns
    for i=1:nRows
     % Estamos por encima de la diagonal, hallamos elemento de U
if i<=j
       U(i,j) = A(i,j);
       for k=1:i-1
         U(i,j) = U(i,j) - L(i,k)*U(k,j);
       end
     end    
     % Estamos por debajo de la diagonal, hallamos elemento de L
     if j<=i
       L(i,j) = A(i,j);
       for k=1:j-1
         L(i,j) = L(i,j) - L(i,k)*U(k,j);
end
       L(i,j) = L(i,j)/U(j,j);
     end
   end
end








