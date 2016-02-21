function Distances = getSVMScores(SVMStruct, Test)
% Ritorna le distanze tra SVM e elementi Test Set

    S       = SVMStruct.SupportVectors;
    Alpha   = SVMStruct.Alpha;
    B       = SVMStruct.Bias;
    kfun    = SVMStruct.KernelFunction;
    kfunarg = SVMStruct.KernelFunctionArgs;
    
    SxS = feval(kfun, S, S, kfunarg{:});
    norm_of_w = Alpha' * SxS * Alpha;
    
    Distances = zeros(size(Test, 1), 1);
    
    for i = 1:size(Test, 1)
        
        % Per ogni elemento di test t
        t = Test(i, :);
        
        Sxt = feval(kfun, S, t, kfunarg{:});
        
        Distances(i) = (Sxt' * Alpha + B) / norm_of_w;
    end
    
end

