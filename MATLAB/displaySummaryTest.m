function displaySummaryTest(method, Confusion)
% Mostra un riepilogo delle performance del classificatore dopo la fase
% di test. Il secondo parametro è una matrice di confusione ottenuta con
% confusionmat(L, PL)

    ALL = sum( sum(Confusion));
    OK  = sum(diag(Confusion));
    ERR = ALL - OK;
    
    Accuracy = OK / ALL;
    ErrRatio = 1 - Accuracy;
    
% Feedback
    
    disp([method ' test summary:']);
    disp(sprintf([              ...
        '\tOK: \t%d \n',        ...
        '\tERR: \t%d \n',       ...
        '\tAccuracy: \t%f \n',  ...
        '\tErrRatio: \t%f \n'], ...
        OK, ERR, Accuracy, ErrRatio));
    
end

