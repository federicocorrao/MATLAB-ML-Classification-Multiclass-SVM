function [L, SVMStruct] = ClassifySVM ...
    (Training, Test, TrainingLabels, TestLabels, varargin)
% Varargin: kernel, silent

    % default kernel function
    if size(varargin, 2) == 0
        kernel = 'linear';
    else
        kernel = varargin{1};
    end

% Training
 
    try
        SVMStruct = svmtrain(Training, TrainingLabels, 'autoscale', 'false', ...   
          'kernel_function', kernel); %, 'options', opts);
    catch
        disp('no convergence');
        L = [];
        SVMStruct = [];
        return
    end

% Test
    
    L = svmclassify(SVMStruct, Test);
       
% Disegno

    if size(varargin, 2) == 2 && varargin{2} == true
        return % silent
    end
        
    displayClassificationPlotSVM(...
        Training, Test, TrainingLabels, TestLabels, SVMStruct, L);

end

