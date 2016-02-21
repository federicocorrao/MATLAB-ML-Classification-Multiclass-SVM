function [Dataset, Labels] = Z_LoadYeast

    load yeast
    load yeast_labels

    C1 = data(Labels(:) == 1, :);
    C2 = data(Labels(:) == 2, :);
    C3 = data(Labels(:) == 3, :);
    C4 = data(Labels(:) == 4, :);
    C5 = data(Labels(:) == 5, :); %
    C6 = data(Labels(:) == 6, :); %
    C7 = data(Labels(:) == 7, :); %
    C8 = data(Labels(:) == 8, :); %
    C9 = data(Labels(:) == 9, :); %
    C10 = data(Labels(:) == 10, :); %

    % Scartiamo le classi con pochi elementi C10
    Dataset = [C1; C2; C3; C4; ]; %C5]; %C5; C6; C7; C8; C9];

    Labels = [  ...
        1 * ones(size(C1, 1), 1); ...
        2 * ones(size(C2, 1), 1); ...
        3 * ones(size(C3, 1), 1); ...
        4 * ones(size(C4, 1), 1); ...
        % 5 * ones(size(C5, 1), 1); ... 
        %6 * ones(size(C6, 1), 1); ... 
        %7 * ones(size(C7, 1), 1); ... 
        %8 * ones(size(C8, 1), 1); ... 
        %9 * ones(size(C9, 1), 1)
        % 10* ones(size(C10,1), 1);
        ];



