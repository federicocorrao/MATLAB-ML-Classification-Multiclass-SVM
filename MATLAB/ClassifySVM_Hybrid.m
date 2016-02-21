function [L] = ClassifySVM_Hybrid(Training, Test, TrainingLabels, TestLabels, kernel, epsilon, gamma)
% Metodo ibrido

    Params = {Training, Test, TrainingLabels, TestLabels, kernel, true};
    C      = unique(TestLabels);   % !
   
    [OVA_L, ALL_D]  = ClassifySVM_OVA(Params{:});
    [OVO_L, ~, M]   = ClassifySVM_OVO(Params{:});

    if numel(OVO_L) == 0 % non conv
        L = [];
        return
    end
    if numel(OVA_L) == 0 % non conv
        L = [];
        return
    end
    
    N = ALL_D';
    MIN = min(N)';
    MAX = max(N)';
    AMP =  MAX - MIN;
    N = bsxfun(@minus, ALL_D, MIN);
    N = bsxfun(@times, N, 1./AMP);
    
    [S, sortindexes] = sort(N, 2, 'descend');
    Delta = S(:, 1) - S(:, 2); 
    
    # el. soddisfano condizione di incertezza
    I_OVA_COND = (Delta <= epsilon); 
    
    OVO_2 = [];
    for i = 1:size(Test, 1)
        OVO_2 = [OVO_2; M(sortindexes(i, 1), sortindexes(i, 2), i)];
    end
    
    L = OVA_L;
    L(I_OVA_COND) = OVO_2(I_OVA_COND);
    
end

