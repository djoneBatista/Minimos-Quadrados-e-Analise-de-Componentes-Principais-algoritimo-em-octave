%Entrada para parametros:  
% SVD = 1 (calcula com svd do octave)
% SVD diferente de um (calcula com nossa svd implementada)
% NORMA = 1(normaliza pela divisÃ£o com a norma)
% NORMA diferente de um (calcula pelo desvio padrao)
% FIGURA: gera a figura com o numero especificado.
% BASE=1  usa a base auto mpg data  
% BASE diferente de um usa a base household power consumptio  
% NORMALIZAR=1  normaliza os dados  
% NORMALIZAR  diferente de 1  nao  normaliza
     
function funcao_mq(SVD,NORMA,FIGURA,BASE,NORMALIZAR)
[base_dados,Dados,X,Xtudo,m,n,Media,variancia] = carrega_base(BASE);

if (NORMALIZAR == 1) 
  if(NORMA==1)
        mensagem3 = ' e  divide pelo desvio padrao  ';
  else
        mensagem3 = ' e dividimos pela norma ';
  end
  variancia=norma_desvio_padrao(NORMA,m,n,variancia);  
  mensagem1 = 'MQ  normalizado  (';
else
  mensagem1 = 'MQ nao normalizado (';
  mensagem3 = ' ';
end
 %calculo de M(A) usando traço dos dados centralizados
 Ma =(trace(variancia*variancia')*eye(m))-(variancia*variancia');

% SVD da matriz de covariancia
% verifica o parametro SVD para calcular com a opcao informada
if (SVD == 1)
  [U,S,V] = svd(Ma);
    mensagem2 = ' SVD do octave )';
else
  [U,S,V] = my_svd(Ma);
   mensagem2 = ' SVD implementada pelo grupo )';
end

strcat (mensagem1, mensagem2,mensagem3)

U
S
V
% projeçoes dos pontos em R4 no hiperplano
% utilzado a média da base de dados e o vetor normal (autovetor ligado ao menor autovalor)
% calculo: dado centralizado - (dado centralizado , normal) * (normal)
% o comando dot eh o produto interno

for i=1:n
  H(:,i) = variancia(:,i) - dot(variancia(:,i),V(:,m))*V(:,m);
end  

gerar_grafico_mq(V,H,Dados,Xtudo,SVD,NORMA,NORMALIZAR,base_dados,FIGURA,BASE,m);

endfunction
