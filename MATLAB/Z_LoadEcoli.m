function [Dataset, Labels] = Z_LoadEcoli

    load ecoli
    load ecoli_labels

    C1 = data(Labels(:) == 1, :);
    C2 = data(Labels(:) == 2, :);
    C3 = data(Labels(:) == 3, :);
    C4 = data(Labels(:) == 4, :);
    C5 = data(Labels(:) == 5, :); %
    C6 = data(Labels(:) == 6, :); %
    C7 = data(Labels(:) == 7, :);
    C8 = data(Labels(:) == 8, :); %

    % Scartiamo le classi 5, 6, 8 perché hanno pochi elementi
    % la classe 5 diventa la classe 7
    % C5 = data(Labels(:) == 7);

    Dataset = [C1; C2; C3; C4; C7];

    Labels = [  1 * ones(size(C1, 1), 1); ...
        2 * ones(size(C2, 1), 1); ...
        3 * ones(size(C3, 1), 1); ...
        4 * ones(size(C4, 1), 1); ...
        5 * ones(size(C7, 1), 1); ... % originariamente classe 7
        ];


