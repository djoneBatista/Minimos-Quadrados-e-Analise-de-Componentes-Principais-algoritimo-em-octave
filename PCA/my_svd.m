% S- vetor de coluna de valores singulares
% U- Matriz de vetores singular esquerdo
% V- Matriz de vetores singular direito
function [U,S,V] = my_svd(A)
%retorna a dimensao da  matriz , linha=m   e coluna=n
    printf(' inicio  da  funcao svd ');
   
[m,n] = size(A);   

if (m < n)
  error ('m deve ser maior ou igual a n');
end

ATA = A' * A;  % garante que a  matrix ATA é quadrada
ATA

%Calculo dos autovalores
%[lambda,niter,Q,T] = my_qr_iterativo(ATA,1e-12,200065);
[lambda,niter,Q,T] = my_qr_iterativo(ATA,0.01,2000000);
Q
T

%calculo dos autovetores
V = my_autovetores(T,Q,lambda);
V

% S é uma  matriz com zeros da  mesma ordem da  matriz A
S = zeros(size(A));
S

% extrai a raiz de  cada elemento de lambda e adiciona 
% na diagonal principal da matriz S 
S(1:n,1:n) = diag(sqrt(lambda));

AV = A*V;  
AV

%Normaliza os dados com a norma
U= Normalizar_dados(m,n,AV);
U

   printf(' saiu  da  funcao  SVD ');
endfunction