function RunHybrid

    [Dataset, Labels] = Z_LoadBreastTissue;    
    
    EPSrange = 0.2 : 0.01 : 0.25;
    
    AllMeanMeanRec = [];
    AllStdMeanAcc  = [];
    for eps = EPSrange;
        eps
        % (con eps = 0 � tutto OVA, con eps = 1 � tutto OVO)
   
        [~, MeanRec] = CrossValidate(Dataset, Labels, 10, 'HYB', {'rbf', eps, 0});
        Mean_MeanRec = mean(MeanRec);
        Std_MeanAcc  = std(MeanRec);
        
        AllMeanMeanRec = [AllMeanMeanRec, Mean_MeanRec];
        AllStdMeanAcc  = [AllStdMeanAcc, Std_MeanAcc];
    
        [Mean_MeanRec, Std_MeanAcc]
    end
    figure; plot(EPSrange, AllMeanMeanRec);
    [EPSrange; AllMeanMeanRec]
    [EPSrange; AllStdMeanAcc]
    
    
    
    
