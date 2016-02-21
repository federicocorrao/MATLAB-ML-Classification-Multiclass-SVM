function RunMaps

[Training, Test, TrainingLabels, TestLabels] = ...
    generateDataset( ...
    [200 150], [5  5  1 1], ...
    [200 150], [-5 -5 1 1], ...
    [200 140], [5 -5  1 1],   ...
    [200 120], [-5 5  1 1]);


    [Test, TestLabels, GSize, X, Y] = generateTestGrid([Training; Test], 0.1);

    kernel = 'quadratic';
    L_OVO = ClassifySVM_OVO(Training, Test, TrainingLabels, TestLabels, kernel, true);
    L_OVA = ClassifySVM_OVA(Training, Test, TrainingLabels, TestLabels, kernel, true);
    L_HYB = ClassifySVM_Hybrid(Training, Test, TrainingLabels, TestLabels, kernel, 0);
    
    %close all
    displayPredictionMap('SVM OVO', Training, Test, TrainingLabels, TestLabels, L_OVO, GSize, X, Y);
    displayPredictionMap('SVM OVA', Training, Test, TrainingLabels, TestLabels, L_OVA, GSize, X, Y);
    displayPredictionMap('SVM HYB', Training, Test, TrainingLabels, TestLabels, L_HYB, GSize, X, Y);
    
    
