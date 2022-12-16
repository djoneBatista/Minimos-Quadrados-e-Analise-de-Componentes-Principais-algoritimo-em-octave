    
function mensagem_iteracoes_QR(iteracoes,numero_maxima_de_iteracao,erro,erro_sugerido)  
     
          if (iteracoes >= numero_maxima_de_iteracao)
            printf('atingiu o numero maximo de iteracoes : %d ',iteracoes);
            error(', Nao convergiu');
          end 
          
          if (erro <= erro_sugerido)
            printf('Convergiu com %d iteracoes \n',iteracoes);
          end  
          
 endfunction