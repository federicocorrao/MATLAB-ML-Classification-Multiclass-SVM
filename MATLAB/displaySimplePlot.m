function displaySimplePlot(Dataset, DataLabels, I, J, Z)
    
    % Etichette delle classi (stringhe)
    Labels = unique(DataLabels);
    StrLabels = {};
    for l = Labels'
        StrLabels = [StrLabels num2str(l)];
    end
    
    Clusters = {};
    PStrLabels = {};
    
    for i = 1:size(Labels, 1)
        l = Labels(i);
        Clusters{i} = Dataset(DataLabels == l, :);
        
        % Rimuovo dalla legenda clusters con 0 elementi
        if (size(Clusters{i}, 1) ~= 0); PStrLabels = [PStrLabels StrLabels(i)]; end
    end
    
    % plot clusters & cluster
    figure; 
    hold all;
    for i = 1:size(Clusters, 2)
        T = Clusters{i};
        
        if i == 0
            color = 'k';
        elseif i == 1
            color = 'b';
        elseif i == 2
            color = 'c';
        elseif i == 3
            color = 'g';
        elseif i == 4
            color = 'y';
        elseif i == 5
            color = 'm';
        end
        
        if nargin == 4
            plot(T(:, I), T(:, J), [color 'o'], ...
                'LineWidth',       1,           ...
                'MarkerEdgeColor', [0 0 0],     ...
                'MarkerFaceColor', color,       ...
                'MarkerSize'     , 8);
        elseif nargin == 5
            plot3(T(:, I), T(:, J), T(:, Z), [color 'o'], ...
                'LineWidth',       1,           ...
                'MarkerEdgeColor', [0 0 0],     ...
                'MarkerFaceColor', color,       ...
                'MarkerSize'     , 8);
        end
    end
    hold off;
   
    legend(PStrLabels);   

end

