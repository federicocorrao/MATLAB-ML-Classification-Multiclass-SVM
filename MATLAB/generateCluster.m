function C = generateNCluster(N, mu_x, mu_y, sigma_x, sigma_y)
% Genera cluster di N punti bi-dimensionali normalmente distribuiti

    X = mu_x + sigma_x .* randn([N, 1]);
    Y = mu_y + sigma_y .* randn([N, 1]);

    C = [X Y];
 
end

