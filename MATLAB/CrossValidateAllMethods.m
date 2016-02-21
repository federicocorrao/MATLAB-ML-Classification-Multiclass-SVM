function Results = CrossValidateAllMethods(Dataset, Labels)
% NOTA: questa funzione assume etichette 1:C

    K = 10;
    disp('KNN');
    [~, MeanRec_KNN] = CrossValidate(Dataset, Labels, K, 'KNN', {});

%     disp('OVO_LIN');
%     [~, MeanRec_OVO_LIN] = CrossValidate(Dataset, Labels, K, 'OVO', {'linear', true});
%     disp('OVO_QUA');
%     [~, MeanRec_OVO_QUA] = CrossValidate(Dataset, Labels, K, 'OVO', {'quadratic', true});
%     disp('OVO_POL');
%     [~, MeanRec_OVO_POL] = CrossValidate(Dataset, Labels, K, 'OVO', {'polynomial', true});
%     disp('OVO_RBF');
%     [~, MeanRec_OVO_RBF] = CrossValidate(Dataset, Labels, K, 'OVO', {'rbf', true});
%     
%     disp('OVA_LIN');
%     [~, MeanRec_OVA_LIN] = CrossValidate(Dataset, Labels, K, 'OVA', {'linear', true});
%     disp('OVA_QUA');
%     [~, MeanRec_OVA_QUA] = CrossValidate(Dataset, Labels, K, 'OVA', {'quadratic', true});
%     disp('OVA_POL');
%     [~, MeanRec_OVA_POL] = CrossValidate(Dataset, Labels, K, 'OVA', {'polynomial', true});
%     disp('OVA_RBF');
%     [~, MeanRec_OVA_RBF] = CrossValidate(Dataset, Labels, K, 'OVA', {'rbf', true});
%     
    Results = {
        'KNN5', mean(MeanRec_KNN), std(MeanRec_KNN);
        
%         'OVA_LIN', mean(MeanRec_OVA_LIN), std(MeanRec_OVA_LIN);
%         'OVA_QUA', mean(MeanRec_OVA_QUA), std(MeanRec_OVA_QUA);
%         'OVA_POL', mean(MeanRec_OVA_POL), std(MeanRec_OVA_POL);
%         'OVA_RBF', mean(MeanRec_OVA_RBF), std(MeanRec_OVA_RBF);
%         
%         'OVO_LIN', mean(MeanRec_OVO_LIN), std(MeanRec_OVO_LIN);
%         'OVO_QUA', mean(MeanRec_OVO_QUA), std(MeanRec_OVO_QUA);
%         'OVO_POL', mean(MeanRec_OVO_POL), std(MeanRec_OVO_POL);
%         'OVO_RBF', mean(MeanRec_OVO_RBF), std(MeanRec_OVO_RBF);
    }

end
