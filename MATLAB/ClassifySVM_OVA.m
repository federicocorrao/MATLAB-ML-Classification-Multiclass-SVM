function [DEF_L, ALL_D] = ClassifySVM_OVA ...
    (Training, Test, TrainingLabels, TestLabels, kernel, silent)
% NOTA: questa funzione assume per comodità le etichette [1:C]

if ~silent; disp('OVA begins'); tic; end

    C = unique([unique(TrainingLabels); unique(TestLabels)]);
    
    ALL_D = [];
    
    if ~silent % waitbar se non silent
        num = 1;
        waitbar_handle = waitbar(0);
    end
    
    for i = C'
        if ~silent
            waitbar(num / length(C), waitbar_handle, [num2str(C(i)) ' vs Rest']);
            num = num + 1;
        end
        
        % E' opportuno settare le etichette a +1 e -1
        PositivesIndex = (TrainingLabels == i);
        NegativesIndex = (TrainingLabels ~= i);
        ActTrainingLabels = TrainingLabels;
        ActTrainingLabels(PositivesIndex) = 1;
        ActTrainingLabels(NegativesIndex) = -1;
        
        PositivesIndex = (TestLabels == i);
        NegativesIndex = (TestLabels ~= i);        
        ActTestLabels = TestLabels;
        ActTestLabels(PositivesIndex) = 1;
        ActTestLabels(NegativesIndex) = -1;
        
        [L, SVMStruct] = ClassifySVM(Training, Test, ActTrainingLabels, ActTestLabels, ...
            kernel, true); % soppressione dei grafici intermedi
        
        if numel(L) == 0 % errore non convergenza svm
            DEF_L = [];
            ALL_D = [];
            return
        end
        
        D = -getSVMScores(SVMStruct, Test);
        ALL_D = [ALL_D, D];
        
        if ~silent; disp(['    OVA: ' num2str(i) ' vs R done']); end
    end
    
    % Ottenere etichetta definitiva
    
    [~, DEF_L] = max(ALL_D, [], 2);
    
    if ~silent
        toc;
        close(waitbar_handle);
        displayClassificationPlot('SVM OVA', Training, Test, TrainingLabels, TestLabels, DEF_L); 
    end
end

