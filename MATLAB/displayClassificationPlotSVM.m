function displayClassificationPlotSVM ...
    (Training, Test, TrainingLabels, TestLabels, SVMStruct, L)
% Mostra grafico di classificazione per SVM
% - Questa funzione lavora con qualsiasi etichetta (anche negative)
% - Lavora solo nel caso binario (quindi è inutile evidenziare quale sia la
% classe predetta: vengono evidenziati direttamente i misclassificati)

% Inizializzazione
    
    % Creazione figure
    figure_handle = figure('Name', 'SVM', 'Position', [0 0 900 400]);
    movegui(figure_handle, 'center');

    % Etichette delle classi (stringhe)
    Labels = unique([unique(TrainingLabels); unique(TestLabels)]);
    StrLabels = {'Boundary'};
    for l = Labels'
        StrLabels = [StrLabels num2str(l)];
    end
    
% Trovo superficie di separazione
% NOTA - funziona solo nel caso bidimensionale

    % Calcolo griglia
    step = 0.5;
    [X, Y] = meshgrid(...
        min(Test(:, 1)) : step : max(Test(:, 1)), ...
        min(Test(:, 2)) : step : max(Test(:, 2)));
    Grid = [X(:) Y(:)];
    
    % Classifico ottengo distanze punti griglia
    GridDistances = getSVMScores(SVMStruct, Grid);
    
    % Questa sembra essere una matrice che rappresenta la superficie
    Boundary = reshape(GridDistances(:, 1), size(X));

% SUBFIGURE TRAINING

subplot(1, 2, 1);
title('SVM Training Set');
    
    % Disegno superficie di separazione
    contour(X, Y, Boundary, [0 0], 'k')
    
    % Disegno vettori di Training e legenda
    
    Clusters = {};
    TrainStrLabels = StrLabels;
    
    for i = 1:size(Labels, 1)
        l = Labels(i);
        Clusters{i} = Training(TrainingLabels == l, :);
        
        % Rimuovo dalla legenda clusters con 0 elementi
        if (size(Clusters{i}, 1) == 0); TrainStrLabels(i) = []; end
    end
    TrainStrLabels = strcat({'Training '}, TrainStrLabels);
    TrainStrLabels{1} = 'Boundary';
    
    plotClusters('training', Clusters{:});
    legend(TrainStrLabels{:});
    
    % Evidenzio vettori di supporto
    
    SVLabels    = TrainingLabels(SVMStruct.SupportVectorIndices);
    USVLabels   = unique(SVLabels);
    SupportVectors = Training(SVMStruct.SupportVectorIndices, :);
    
    Clusters = {};
    for i = 1:size(USVLabels, 1);
        Clusters{i} = SupportVectors(SVLabels == USVLabels(i), :);
    end
    
    subplot(1, 2, 1);
    plotClusters('support', Clusters{:});
    
% SUBFIGURE TEST

subplot(1, 2, 2);
title('SVM Test Set');

    % Disegno superficie di separazione
    
    contour(X, Y, Boundary, [0 0], 'k')
    
    % Disegno vettori di Test e legenda
    
    Clusters = {};
    TestStrLabels = StrLabels;
    
    for i = 1:size(Labels, 1)
        l = Labels(i);
        Clusters{i} = Test(TestLabels == l, :);
        
        % Rimuovo dalla legenda clusters con 0 elementi
        if (size(Clusters{i}, 1) == 0); TestStrLabels(i) = []; end
    end
    TestStrLabels = strcat({'Test '}, TestStrLabels); 
    TestStrLabels{1} = 'Boundary';
    
    plotClusters('test', Clusters{:});
    legend(TestStrLabels{:});   
    
    % Evidenzio vettori misclassificati
    
    if nargin >= 6 % Se L è stato passato
        
        Clusters = {};
        for i = 1:size(Labels, 1)
            l = Labels(i);
            Clusters{i} = Test((TestLabels == l) & (TestLabels ~= L), :);
        end
        plotClusters('miscl', Clusters{:});
    end
    
end
