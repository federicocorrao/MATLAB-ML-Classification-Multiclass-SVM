function Indexes = getCrossValidationIndexes(Labels, K)
% Ritorna gli indici di un partizionamento kfold del dataset (similmente a
% crossvalind). Nota: questa funzione suppone etichette 1:C

    Classes = unique(Labels);
    
    Indexes = [];
    
    for c = Classes'
        ClassC = (Labels == c);
        NC = sum(ClassC);
        bin = floor(sum(ClassC) / K);
        
        % Nota: a causa dell'arrotondamento ci sono degli elementi che non
        % vanno mai in test, e delle classi leggermente più frequenti (al
        % max di 1 elemento per C-1) in training
        c_begin = 1;
        c_end   = bin;
        
        A = -ones(NC, 1);
        
        for i = 1:K+1
            if i < K+1
                A(c_begin:c_end) = ones(c_end - c_begin + 1, 1) * i;
                
                c_begin = c_end+1;
                c_end = c_end + bin;
            else
                A(c_begin:NC) = ones(NC-c_begin + 1, 1) * 0;  % per mandarli tutti in tr
            end 
        end
        Indexes = [Indexes; A];
    end

end

