function plot_line_direction(X, dir, color)
% desenha o ambiente grafico com  os eixo x e Y
% e plota  os dados
pmin = min(X')'; % valores da primeira coluna
pmax = max(X')'; % valores da ultima coluna
xmin = pmin(1);  % busca o  menor valor
xmax = pmax(1);  % busca o  maior valor

hold on;
    if dir(1)~=0
        plot ( [xmin,xmax],dir(2)/dir(1)*[xmin,xmax], color);
    else
        plot ( dir(1)/dir(2)*[xmin,xmax],[xmin,xmax], color);
    end
hold off;

endfunction