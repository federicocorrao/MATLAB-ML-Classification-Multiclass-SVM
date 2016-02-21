function plotClusters(style, varargin)
%Plotta un numero arbitrario di clusters con colore diverso (fino a 6)
%Il primo parametro indica lo stile dei punti (vedi plotCluster)

    hold all;
    for i = 1:nargin-1
        T = varargin(i);
        T = T{1};
        plotCluster(T, i, style);
    end
    hold off;
    
end

