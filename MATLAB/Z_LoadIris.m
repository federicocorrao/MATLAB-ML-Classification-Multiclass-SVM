function [Dataset, Labels] = Z_LoadIris

    load fisheriris
    data    = meas;
    Labels  = species;
    
    C1 = data(strcmp(Labels(:), 'setosa')       , :);
    C2 = data(strcmp(Labels(:), 'versicolor')   , :);
    C3 = data(strcmp(Labels(:), 'virginica')    , :);
    
    Dataset = [C1; C2; C3];
    
    Labels = [  ...
        1 * ones(size(C1, 1), 1); ...
        2 * ones(size(C2, 1), 1); ...
        3 * ones(size(C3, 1), 1); ...
        ];



