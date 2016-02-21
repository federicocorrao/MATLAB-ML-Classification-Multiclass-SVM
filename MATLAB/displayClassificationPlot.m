function displayClassificationPlot ...
    (method, Training, Test, TrainingLabels, TestLabels, varargin)
% Mostra un grafico della classificazione (adatto al caso multiclasse)
% Subfigure 1: training e testset, elementi misclassificati
% Subfigure 2: test set con etichette predette

% Inizializzazione

    % Creazione figure
    if size(varargin, 2) >= 1
        figure_handle = figure('Name', method, 'Position', [0 0 900 400]);
        movegui(figure_handle, 'center');
    
        L = varargin{1};
    else
        figure;
    end

    % Etichette delle classi (stringhe)
    Labels = unique([unique(TrainingLabels); unique(TestLabels)]);
    StrLabels = {};
    for l = Labels'
        StrLabels = [StrLabels num2str(l)];
    end

% SUBFIGURE TRAINING & TEST

if size(varargin, 2) >= 1
    subplot(1, 2, 1);
end
title([method ' Training & Test Set']);
    
    % Disegno vettori di Training
    
    Clusters = {};
    TrainStrLabels = {};
    
    for i = 1:size(Labels, 1)
        l = Labels(i);
        Clusters{i} = Training(TrainingLabels == l, :);
        
        % Rimuovo dalla legenda clusters con 0 elementi
        if (size(Clusters{i}, 1) ~= 0); TrainStrLabels = [TrainStrLabels StrLabels(i)]; end
    end
    TrainStrLabels = strcat({'Training '}, TrainStrLabels);
    
    plotClusters('training', Clusters{:});
    
    % Disegno vettori di Test

    Clusters = {};
    TestStrLabels = {};
    
    for i = 1:size(Labels, 1)
        l = Labels(i);
        Clusters{i} = Test(TestLabels == l, :);
        
        % Rimuovo dalla legenda clusters con 0 elementi
        if (size(Clusters{i}, 1) ~= 0); TestStrLabels = [TestStrLabels StrLabels(i)]; end
    end
    TestStrLabels = strcat({'Test '}, TestStrLabels); 
    
    plotClusters('test', Clusters{:});
    
    % Legenda
    legend([TrainStrLabels, TestStrLabels]);   
    
    % Evidenzio vettori misclassificati
    
    if size(varargin, 2) >= 1   % Se L è stato passato
        
        Clusters = {};
        for i = 1:size(Labels, 1)
            l = Labels(i);
            Clusters{i} = Test((TestLabels == l) & (TestLabels ~= L), :);
        end
        plotClusters('miscl', Clusters{:});
    end
    
% SUBFIGURE PREDICTIONS

    if size(varargin, 2) >= 1
        
        subplot(1, 2, 2);
        title([method ' Predicted Labels']);

        Clusters = {};
        PredStrLabels = {};
        
        for i = 1:size(Labels, 1)
            l = Labels(i);
            Clusters{i} = Test(L == l, :);
            
            % Rimuovo dalla legenda clusters con 0 elementi
            if (size(Clusters{i}, 1) ~= 0); PredStrLabels = [PredStrLabels StrLabels(i)]; end
        end
        PredStrLabels = strcat({'Predicted '}, PredStrLabels);
        
        plotClusters('test', Clusters{:});
        
        % Legenda
        legend(PredStrLabels{:});
    end
    
end
