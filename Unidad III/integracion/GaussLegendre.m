function [quad, raices, nodos, coefs] = GaussLegendre( f, a, b, N)
% Entrada - f es el integrando introducido como una cadena de caracters ’f’
% - a y b limites superior e inferior de integracion
% - N es el numero de nodos en la cuadratura
% Salida - quad es el valor de cuadratura
% - raices es el vector de raices del polinomio de Legendre N
% - nodos es el vector de nodos de la cuadratura e [a,b]
% - coefs es el vector de pesos de la cuadratura
% evaluacion de las N raices del polinomio de Legendre P_N de grado N,
% usando el hecho de que P_N es el polinomio caracteristico de la
% matriz de Jacobi J
v = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
J = diag(v,-1)+diag(v,+1);
raices = eig(J);
% evaluacion de los nodos por medio de transformacion lineal
nodos = (a*(1-raices)+b*(1+raices))/2;
% evaluacion de los coeficientes de la cuadratura por el metodo de
% coeficientes indeterminados
V = (vander(raices))’;
z = (feval(@(k) (1-(-1).^k)./k, N:-1:1))’;
coefs = V\z;
% evaluacion de la cuadratura
quad = ((b-a)/2) * sum(coefs.*feval(f, nodos));
end