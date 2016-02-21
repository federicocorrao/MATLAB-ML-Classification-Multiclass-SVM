function displaySummaryDataset(Training, Test, TrainingLabels, TestLabels)
%Mostra un riepilogo del dataset.

    strings = ['\tTotale \t\t\t\t' ... 
        num2str(size(Training, 1) + size(Test, 1)) '\n'];
        
    Labels = unique([unique(TrainingLabels); unique(TestLabels)]);
    
    for i = 1:size(Labels, 1);
        sizetraining = size(Training(TrainingLabels == Labels(i)), 1);
        sizetest     = size(Test(TestLabels == Labels(i)), 1);
        
        strings = [strings '\tClasse ' num2str(Labels(i)) '\t\t\t' ...
                num2str(sizetraining + sizetest) '\n'...
            '\t\tTraining\t\t\t' num2str(sizetraining) '\n'...
            '\t\tTest\t\t\t\t'     num2str(sizetest) ' \n'];
    end
    
    disp('Dataset summary:');
    disp(sprintf(strings)); %, numbers{:}));
end

