function [DEF_L, ALL_L, M] = ClassifySVM_OVO ...
    (Training, Test, TrainingLabels, TestLabels, kernel, silent)
% NOTA: questa funzione assume che le etichette degli elementi [1:C]

if ~silent; disp('OVO begins'); tic; end

    C = length(unique([unique(TrainingLabels); unique(TestLabels)]));
    
    ALL_L = [];
    M = -ones(C, C, size(Test, 1));
    
    if ~silent
        num = 1;
        waitbar_handle = waitbar(0);
    end
    
    for c = combnk(1:C, 2)'        
        if ~silent
            waitbar(num / (C*(C-1)/2), waitbar_handle, [num2str(c(1)) ' vs ' num2str(c(2))]);
            num = num + 1;
        end
        
        i = c(1);
        j = c(2);
        
        TrainingPositives       = Training(TrainingLabels == i, :);
        TrainingNegatives       = Training(TrainingLabels == j, :);
        TrainingPositivesLabels = TrainingLabels(TrainingLabels == i);
        TrainingNegativesLabels = TrainingLabels(TrainingLabels == j);
        
        [L, ~] = ClassifySVM(          ...
            [TrainingPositives; TrainingNegatives], ...
            Test,                                   ...    
            [TrainingPositivesLabels; TrainingNegativesLabels], ...
            i*ones(size(Test, 1), 1), ...
            kernel, true); % soppressione dei grafici intermedi
       
        if numel(L) == 0 % errore non convergenza svm
            DEF_L = [];
            return
        end
            
        ALL_L = [ALL_L, L];
        
        M(i, j, :) = L;
        M(j, i, :) = L;
        
        if ~silent; disp(['    OVO: ' num2str(i) ' vs ' num2str(j) ' done']); end
    end
    
    DEF_L = mode(ALL_L')';
   
    if ~silent
        toc;
        close(waitbar_handle);    
        displayClassificationPlot('SVM OVO', Training, Test, TrainingLabels, TestLabels, DEF_L); 
    end
    
    [ALL_L, DEF_L];
    M;
end

