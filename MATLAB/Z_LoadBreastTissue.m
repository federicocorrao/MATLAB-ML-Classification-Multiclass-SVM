function [Dataset, Labels] = Z_LoadBreastTissue

    load breasttissue
    load breasttissue_labels
    
    data = data - repmat(mean(data), size(data, 1), 1);
    data = data ./ repmat(std(data), size(data, 1), 1);

    Dataset = data;
