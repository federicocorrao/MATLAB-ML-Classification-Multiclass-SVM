function ValidateOnBreastTissue

    [Dataset, Labels] = Z_LoadBreastTissue;
    CrossValidateAllMethods(Dataset, Labels);
    