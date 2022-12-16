function gerar_grafico_pca(V,Xtil,FIGURA,Dados,BASE,Xtudo,SVD,NORMA,NORMALIZAR,base_dados,m)
% direcoes principais: calculo dos autovetores correspondentes
% aos maiores autovalores da decomposicao singular
% multiplicar pela esquerda por V' significa rotacionar as direcoes
% principais para coincidir com os eixos cartesianos
Xrot = V' * Xtil;

% projeta no R^2
Xproj = Xrot(1:2,:);

	%plota figura com o numero informado no parametro FIGURA
	figure(FIGURA);
    if (BASE == 1) 
%  plotagem  do  grafico auto mpg data -------------------------------------------------
            hold on;
            pmin = min(Xproj')'; 
            pmax = max(Xproj')';

            % desenha as categorias e subcategorias com cores diferentes, de acordo com a info
            % do dadaset que retiramos
            cat1 = find(Dados(8,:) == 1); %pego todas as linhas que na coluna 8 for = 1
            cat2 = find(Dados(8,:) == 2); %pego todas as linhas que na coluna 8 for = 2
            cat3 = find(Dados(8,:) == 3); %pego todas as linhas que na coluna 8 for = 3


            %pego todas as linhas que na coluna 8 a categoria = 1 e na coluna 2 forem (8,6,4,3)
            z = 1; z2 = 1; z3 = 1; z4 = 1;
            cat11 = zeros(1,1);
            cat12 = zeros(1,1);
            cat13 = zeros(1,1);
            cat14 = zeros(1,1);
            for i=1:length(cat1)
              v = cat1(1,i);
              if (Xtudo(2,v) == 8)
                cat11(1,z) = v;
                z++;
              elseif (Xtudo(2,v) == 6)
                cat12(1,z2) = v;
                z2++;  
              elseif (Xtudo(2,v) == 4) 
                cat13(1,z3) = v;
                z3++; 
              elseif (Xtudo(2,v) == 3) 
                cat14(1,z4) = v;
                z4++; 
              end
              i++;
            end

%pego todas as linhas que na coluna 8 a categoria = 2 e na coluna 2 forem (8,6,4,3)
            z = 1; z2 = 1; z3 = 1; z4 = 1;
            cat21 = zeros(1,1);
            cat22 = zeros(1,1);
            cat23 = zeros(1,1);
            cat24 = zeros(1,1);
            for i=1:length(cat2)
              v = cat2(1,i);
              if (Xtudo(2,v) == 8)
                cat21(1,z) = v;
                z++;
              elseif (Xtudo(2,v) == 6)
                cat22(1,z2) = v;
                z2++;  
              elseif (Xtudo(2,v) == 4) 
                cat23(1,z3) = v;
                z3++; 
              elseif (Xtudo(2,v) == 3) 
                cat24(1,z4) = v;
                z4++; 
              end
              i++;
            end

%pego todas as linhas que na coluna 8 a categoria = 3 e na coluna 2 forem (8,6,4,3)
            z = 1; z2 = 1; z3 = 1; z4 = 1;
            cat31 = zeros(1,1);
            cat32 = zeros(1,1);
            cat33 = zeros(1,1);
            cat34 = zeros(1,1);
            for i=1:length(cat3)
              v = cat3(1,i);
              if (Xtudo(2,v) == 8)
                cat31(1,z) = v;
                z++;
              elseif (Xtudo(2,v) == 6)
                cat32(1,z2) = v;
                z2++;  
              elseif (Xtudo(2,v) == 4) 
                cat33(1,z3) = v;
                z3++; 
              elseif (Xtudo(2,v) == 3) 
                cat34(1,z4) = v;
                z4++; 
              end
              i++;
            end

            %Ploto os dados
            if (cat11(1,1)>0)
              plot (Xproj(1,cat11(1,:)), Xproj(2,cat11(1,:)), 'ro');
            end
            if (cat12(1,1)>0)
              plot (Xproj(1,cat12(1,:)), Xproj(2,cat12(1,:)), 'r*'); 
            end
            if (cat13(1,1)>0)
              plot (Xproj(1,cat13(1,:)), Xproj(2,cat13(1,:)), 'rx'); 
            end
            if (cat14(1,1)>0)
              plot (Xproj(1,cat14(1,:)), Xproj(2,cat14(1,:)), 'r+'); 
            end 

            if (cat21(1,1)>0)
              plot (Xproj(1,cat21(1,:)), Xproj(2,cat21(1,:)), 'go');
            end
            if (cat22(1,1)>0)
              plot (Xproj(1,cat22(1,:)), Xproj(2,cat22(1,:)), 'g*'); 
            end
            if (cat23(1,1)>0)
              plot (Xproj(1,cat23(1,:)), Xproj(2,cat23(1,:)), 'gx'); 
            end
            if (cat24(1,1)>0)
              plot (Xproj(1,cat24(1,:)), Xproj(2,cat24(1,:)), 'g+'); 
            end

            if (cat31(1,1)>0)
              plot (Xproj(1,cat31(1,:)), Xproj(2,cat31(1,:)), 'bo');
            end
            if (cat32(1,1)>0)
              plot (Xproj(1,cat32(1,:)), Xproj(2,cat32(1,:)), 'b*'); 
            end
            if (cat33(1,1)>0)
              plot (Xproj(1,cat33(1,:)), Xproj(2,cat33(1,:)), 'bx'); 
            end
            if (cat34(1,1)>0)
              plot (Xproj(1,cat34(1,:)), Xproj(2,cat34(1,:)), 'b+'); 
            end

    else  
%  plotagem  do  grafico  household_power_consumptio ------------------------------------
 
            hold on;
            pmin = min(Xproj')'; pmax = max(Xproj')';

            %visualização dos dados em R2
            plot (Xproj(1,:), Xproj(2,:), 'g.');
    
    end     

           %desenha informacoes no grafico
            xlabel('eixo x'); 
            ylabel('eixo y');

            titlesvd = ""; 
            titlenorma = "";
            if (SVD == 1)
              titlesvd = ' svd do octave';
            else 
              titlesvd = ' nosso svd';   
            end
            if (NORMA == 1)
               if (NORMALIZAR == 1)
                 titlenorma = ' e com desvio padrao)';
               else
                 titlenorma = ' e sem normalizacao )';
               end
            else 
               if (NORMALIZAR == 1)
                 titlenorma = ' e com norma)';
               else
                 titlenorma = ' e sem normalizacao )';
               end  
            end
              
            title(strcat('Grafico de PCA (com ',titlesvd, titlenorma,base_dados));
            grid;	

            axis([pmin(1) pmax(1) pmin(2) pmax(2)]);
            hold off;

            % calcular eixos cartesianos rotacionados no espaco dos eixos principais
            Eixo = V' * eye(m);

            hold on
            quiver(0,0, Eixo(1,1), Eixo(1,2), 'r');
            quiver(0,0, Eixo(2,1), Eixo(2,2), 'b');

            hold off

            % desenhar direcoes principais alinhadas com os eixos cartesianos
            plot_line_direction(Xproj, [1;0], '-r');
            plot_line_direction(Xproj, [0;1], '-b');			
			
endfunction