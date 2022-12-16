% Entrada para parametros:  
% SVD = 1 (calcula com svd do octave)
% SVD diferente de um (calcula com nossa svd implementada)
% NORMA = 1(normaliza pela divisão com a norma)
% NORMA diferente de um (calcula pelo desvio padrao)
% FIGURA: gera a figura com o numero especificado.
% NORMALIZAR=1  normaliza os dados  
% NORMALIZAR  diferente de 1  nao  normaliza   
function funcao_pca(SVD,NORMA,FIGURA,BASE,NORMALIZAR)
  
  
  
[base_dados,Dados,X,Xtudo,m,n,Media,variancia] = carrega_base(BASE);

 if (NORMALIZAR == 1)
     if(NORMA==1)
        mensagem3 = ' e  divide pelo desvio padrao  ';
     else
        mensagem3 = ' e dividimos pela norma ';
     end
     variancia=norma_desvio_padrao(NORMA,m,n,variancia); 
     mensagem1 = 'PCA  normalizado  (';
 else 
    mensagem1 = 'PCA nao normalizado (';
    mensagem3 = ' ';
 end

 variancia
% verificar se os dados estao centralizados
sum(variancia,2)

% calcula a matriz de covariancia
Sx = variancia * variancia' / (n-1);
Sx
% SVD da matriz de covariancia
% verifica o parametro SVD para calcular com a opcao informada
if (SVD == 1)
    mensagem2 = ' SVD do octave )';
   [U,S,V] = svd(Sx);
else
   mensagem2 = ' SVD implementada pelo grupo )';
   [U,S,V] = my_svd(Sx);
   %corrige rotacao do grafico quando necessario
   V
   V = V * -1;
end


strcat (mensagem1, mensagem2,mensagem3)

U
S
V

   printf('   gerar grafico  ');
gerar_grafico_pca(V,variancia,FIGURA,Dados,BASE,Xtudo,SVD,NORMA,NORMALIZAR,base_dados,m);
			
endfunction