function [Training, Test, TrainingLabels, TestLabels] ...
    = generateDataset(varargin)
% Genera dataset di N clusters.
% Input: [N N_TR], [muX muY, stdX, stdY], ... per ogni cluster
% N_class_0, PAR_class_0, N_class_1, PAR_class_1, ...

    Training        = [];
    Test            = [];
    TrainingLabels  = [];
    TestLabels      = [];

    c = 1; % label classe
    
    for i = 1:2:nargin-1
        % Per ogni coppia di input (numero, parametri) cluster
        Size     = varargin{i};
        Params   = varargin{i+1};
    
        ALL     = Size(1);
        N_TR    = Size(2);
        muX     = Params(1);
        muY     = Params(2);
        stdX    = Params(3);
        stdY    = Params(4);
       
        Cluster  = generateCluster(ALL, muX, muY, stdX, stdY);
        Training = [Training; Cluster(1:N_TR, :)];
        Test     = [Test; Cluster(N_TR+1:end, :)];
        
        TrainingLabels = [TrainingLabels; c * ones(N_TR, 1)];
        TestLabels     = [TestLabels; c * ones(ALL - N_TR, 1)]; 
        c = c + 1;
    end
    
end

% [T TT TL TTL] = ...
%    generateDataset(
%        [10 5], [5 5 1 1], 
%        [10 5], [-5 -5 1 1], 
%        [10 5], [5 -5 1 1]
%     )
