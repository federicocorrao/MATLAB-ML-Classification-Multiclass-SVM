function displayPredictionMap(method, Training, Test, TrainingLabels, TestLabels, L, GSize, X, Y)
% Mostra mappa di classificazione

    figure; 
    title([method ' Predicted Labels']);
    
    Labels = unique([unique(TrainingLabels); unique(TestLabels)]);
    StrLabels = {};
    for l = Labels'
        StrLabels = [StrLabels num2str(l)];
    end
    
    nlines = length(Labels)-1;
    Z = reshape(L, GSize);
    h = contourf(X, Y, Z, nlines);
    shading flat
    colormap([0 0 1; 0 1 1; 0 1 0; 1 1 0]);
    
    % Disegno vettori di training
    
    Clusters = {};
    TestStrLabels = StrLabels;
    
    for i = 1:size(Labels, 1)
        l = Labels(i);
        Clusters{i} = Training(TrainingLabels == l, :);   
        
        if (size(Clusters{i}, 1) == 0); TestStrLabels(i) = []; end
    end
    TestStrLabels = strcat({'Training '}, TestStrLabels);
    
    plotClusters('test', Clusters{:});

    legend(['Boundary', TestStrLabels]);
   
end

