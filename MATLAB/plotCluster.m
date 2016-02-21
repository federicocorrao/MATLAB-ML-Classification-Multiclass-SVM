function plotCluster(C, color, style)
%Disegna un insieme di punti con lo stesso stile

    if nargin < 2
        color = 0;  % default color (k)
    end
    if nargin < 3
        style = 0;  % default style (o)
    end
    
    % colori: b, r, g per cluster 1, 2, 3
    if color == 0
        color = 'k';
    elseif color == 1
        color = 'b';
    elseif color == 2
        color = 'c';
    elseif color == 3
        color = 'g';
    elseif color == 4
        color = 'y';
    elseif color == 5
        color = 'm';
    elseif color == 6
        color = 'r';
    end

    if strcmp(style, 'training')      % stile per training set (default)
        plot(C(:, 1), C(:, 2), [color 'o']);
    elseif strcmp(style, 'support')   % stile per vettori di supporto
        plot(C(:, 1), C(:, 2), [color 's'], ...
            'LineWidth',       2,           ...
            'MarkerEdgeColor', [1 0 0],     ...
            'MarkerFaceColor', color,       ...
            'MarkerSize'     , 9);
    elseif strcmp(style, 'test')  % stile per test set
        plot(C(:, 1), C(:, 2), [color 'o'], ...
            'LineWidth',       1,           ...
            'MarkerEdgeColor', [0 0 0],     ...
            'MarkerFaceColor', color,       ...
            'MarkerSize'     , 8);
    elseif strcmp(style, 'miscl')  % stile per elemento test misclassificato
        plot(C(:, 1), C(:, 2), [color 's'], ...
            'LineWidth',       2,           ...
            'MarkerEdgeColor', [1 0 0],     ...
            'MarkerFaceColor', color,       ...
            'MarkerSize'     , 9);
    elseif strcmp(style, 'prediction_map')
        plot(C(:, 1), C(:, 2), [color 'o'], ...
            'LineWidth',       1,           ...
            'MarkerEdgeColor', color,     ...
            'MarkerFaceColor', color,       ...
            'MarkerSize'     , 5);
    end
    
end

