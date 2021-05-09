function [ A n b iteraciones tolerancia vector_inicial factor_de_relajacion] = Matriz
A= [4 5 9 2 8 ; 9 7 8 12 3; 2 5 7 2 4 ; 2 6 8 4 8; 1 7 4 3 7];
b = [2 9 7 4 5]' ;
      iteraciones = 1000;
      tolerancia = 1* 10^-7;
      vector_inicial = [1 3 4 5 4];
      factor_de_relajacion = 1;
n = size(A);
n = n(1);
 end
