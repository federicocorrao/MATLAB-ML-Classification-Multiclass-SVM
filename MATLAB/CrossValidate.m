function [Accuracies, MeanRec] = CrossValidate(Dataset, Labels, K, method, MethodParams)
% Ritorna Accuracies e riconoscimento medio sui k-fold

    C = length(unique(Labels));
    
    Accuracies  = [];   % Accuracy classificatore i-esimo (in k-fold)
    MeanRec = [];       % Riconoscimento medio per classe i-esimo
    
    I = getCrossValidationIndexes(Labels, K);
    
    for i = 1:K
        disp(['Testing fold ' num2str(i)]);
        
        TestIndexes     = (I == i); 
        TrainIndexes    = ~TestIndexes;
        
        Params = {Dataset(TrainIndexes, :),    ...
                  Dataset(TestIndexes, :),     ...
                  Labels(TrainIndexes, :),    ...
                  Labels(TestIndexes, :)};
        
        if strcmp(method, 'OVA')
            L = ClassifySVM_OVA(Params{:}, MethodParams{:});
        elseif strcmp(method, 'OVO')
            L = ClassifySVM_OVO(Params{:}, MethodParams{:});
        elseif strcmp(method, 'KNN')
            L = knnclassify(Params{2}, Params{1}, Params{3}, 5);
        elseif strcmp(method, 'HYB')
            L = ClassifySVM_Hybrid(Params{:}, MethodParams{:});
        end
        
        if numel(L) == 0 % noconv
            continue
        end
        
        CONF = confusionmat(Labels(TestIndexes), L);
        
        % Riporto la matrice di confusione in percentuale
        for j = 1:C
             CONFPERC(j, :) = CONF(j, :) ./ sum(CONF(j, :));
        end
        
        Accuracies  = [Accuracies,  trace(CONF) / sum(sum(CONF))];
        MeanRec = [MeanRec, trace(CONFPERC) / C];
    end
    
