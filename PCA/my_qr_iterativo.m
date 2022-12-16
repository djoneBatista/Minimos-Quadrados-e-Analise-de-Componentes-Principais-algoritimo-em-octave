function [lambda,numero_maxima_de_iteracao,U,T] = my_qr_iterativo(A,erro_sugerido,numero_maxima_de_iteracao)  
          printf(' inicia  a  my_qr_iterativo ');
              T = A; 
              T
	        iteracoes = 0;
	        % retorna o maior valor absoluto  entre a  coluna 1  ate  numero de coluna (n-1)
          erro  = max(max(abs(tril(T,-1))));
		      erro
          % matiz identidade na  mesma  ordem da  matriz A
          U     = eye(size(A)); 
          U
        printf(' inicia  QR ');
          while (erro > erro_sugerido)  && (iteracoes <= numero_maxima_de_iteracao)
          % R é uma matriz triangular superior
          % Q é uma matriz ortogonal
          % necessário determinar as matrizes Q e R a cada iteracao
            [Q,R] = qr(T);  
            T     = R*Q;    
            U     = U*Q;
            erro  = max(max(abs(tril(T,-1))));
% O processo termina quando o maior valor absoluto da
% matriz Tk (abaixo da diagonal principal) for menor que
% a precisão dada (erro_sugerido).

            iteracoes++;
% A sequência Tk converge para uma matriz triangular superior em cuja diagonal encontram-se os
% auto-valores da matriz T.
            T
            U
            erro
            iteracoes
            
          end
          
          if (iteracoes >= numero_maxima_de_iteracao)
            printf('atingiu o numero maximo de iteracoes : %d ',iteracoes);
            error(', Nao convergiu');
          end 
          
          if (erro <= erro_sugerido)
            printf('Convergiu com %d iteracoes \n',iteracoes);
          end  
          
		  %  AUTO-VALOR da diagonal da matriz T que esta na diagonal principal
          lambda  = diag( q); 
          lambda
    printf(' saiu   da funcao  QR ');
endfunction  

