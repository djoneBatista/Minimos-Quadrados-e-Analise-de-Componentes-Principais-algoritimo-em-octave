function [lambda,numero_maxima_de_iteracao,U,T] = my_qr_analise(erro_sugerido)  
           numero_maxima_de_iteracao=2000000;
           A=[1 2 3;2 1 4];
           A
           ATA = A' * A; 
           T = ATA; 
          % T
	         iteracoes = 0;
	        % retorna o maior valor absoluto  entre a  coluna 1  ate  numero de coluna (n-1)
          erro  = max(max(abs(tril(T,-1))));
         % erro
		      % matiz identidadeq na  mesma  ordem da  matriz A
          U     = eye(size(A)); 
        %  U
          
             printf(' inicia  o while  do  QR \n');
          
          while (erro > erro_sugerido)  && (iteracoes <= numero_maxima_de_iteracao)
                % R é uma matriz triangular superior
                % Q é uma matriz ortogonal
                % necessário determinar as matrizes Q e R a cada iteracao
                [Q,R] = qr(T);
                R
                Q
                T     = R*Q;    
                U     = U*Q;
                erro  = max(max(abs(tril(T,-1))));
                % O processo termina quando o maior valor absoluto da
                % matriz Tk (abaixo da diagonal principal) for menor que
                % a precisão dada (erro_sugerido).
                iteracoes++;
                % A sequência Tk converge para uma matriz triangular superior em cuja diagonal encontram-se os
                % auto-valores da matriz T.
                iteracoes
               % erro
               % T
               % U
 
          end
     mensagem_iteracoes_QR(iteracoes,numero_maxima_de_iteracao,erro,erro_sugerido); 
		  %  AUTO-VALOR da diagonal da matriz T que esta na diagonal principal
      lambda  = diag(T); 
     % lambda
      autovalor=lambda(1);
      %autovalor
      
endfunction  