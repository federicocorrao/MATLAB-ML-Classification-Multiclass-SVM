function RunBinary

    % Generazione Dataset
    
    [Training, Test, TrainingLabels, TestLabels] = ...
        generateDataset(            ...
            [100 50], [10 10 3 2],   ...
            [100 50], [0   0 2 3]     ...
        );
    
    % SVM binaria
    [L, SVMStruct] = ClassifySVM(Training, Test, TrainingLabels, TestLabels, 'quadratic', false);
    
    displaySummaryDataset(Training, Test, TrainingLabels, TestLabels);
    displaySummaryTest('SVM', confusionmat(TestLabels, L));
   