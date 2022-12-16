function [variancia]=norma_desvio_padrao(NORMA,m,n,variancia)
  for i=1:m
      %verifica o parametro NORMA para calcular com a opcao informada
      if (NORMA == 1)
        %divide pelo desvio padrao   
        variancia(i,:) = variancia(i,:) / sqrt(variancia(i,:)*variancia(i,:)' ./ (n-1));
      else
        %dividimos pela norma   
        variancia(i,:) = variancia(i,:) / norm(variancia(i,:));
      end  
  end
   printf(' saiu  da  funcao  norma_desvio_padrao ');
endfunction