function [TestGrid, TestLabels, GSize, X, Y] = generateTestGrid(Test, varargin)
% Genera griglia cartesiana di punti bidimensionali (per avere idea della
% forma della superficie di separazione.

    if size(varargin, 2) == 0
        p = 0.2;
    else
        p = varargin{1};
    end
    
    [X, Y] = meshgrid(...
        min(Test(:, 1)) : p : max(Test(:, 1)), ...
        min(Test(:, 2)) : p : max(Test(:, 2)));
    
    TestGrid = [X(:) Y(:)];
    GSize = size(X);
    
    TestLabels = ones(size(TestGrid, 1), 1);
end

