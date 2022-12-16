% precondição : 
% A matriz  AV pode  estar  com  valores  de  -10000  a  10000 

% Pos-condicao : 
%resulta numa  matriz U  com  cada elemento
%estando entre -1 e 1 , ou seja normalizado

function [U] = Normalizar_dados(m,n,AV)
U = eye(m,m); % matriz identidade
%Normaliza os dados com a norma
for i=1:n
  U(:,i) = AV(:,i) / norm(AV(:,i)); 
end
for k=n+1:m
  soma = 0;
  for j=1:k-1
    soma = soma + ( U(:,k)'*U(:,j) ) / ( U(:,j)'*U(:,j) ) * U(:,j);
  end
  U(:,k) = U(:,k) - soma;
  U(:,k) = U(:,k) / norm(U(:,k));  
end 
endfunction