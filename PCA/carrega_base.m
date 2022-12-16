function [base_dados,Dados,X,Xtudo,m,n,Media,variancia] = carrega_base(BASE)  
          %armazena os dados sobre os carros
          Dados = load('-ascii','auto-mpg.data.txt')';
          Dados
          base_dados = ' Base : auto mpg data ';
          % estes dados sao divididos em tres classes (última linha e a segunda) 8  e 2
          % remove as variaveis 8 e 2(classificacao)
          X = Dados([1,3:end-1],:);
          Xtudo = Dados(1:end,:);
         [m,n] = size(X);

      % calcula as medias
      Media = diag(sum(X,2)/size(X,2)) * ones(size(X));
      Media
      % centraliza dados (variancia)
      variancia = X - Media;
      variancia
    printf(' saiu da  funcao   carrega base ');
endfunction