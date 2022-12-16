
function [V] = my_autovetores(T,U,lambda)
[linha,coluna] = size(T);
    V = zeros(coluna); % matriz com valores zeros

  for k=1:coluna  
        yy = -(T(1:k-1,1:k-1) - lambda(k)*eye(k-1)) \ T(1:k-1,k);
        y  = [yy; 1; zeros(coluna-k,1)];
        V(:,k) = U*y;  
  end  

endfunction