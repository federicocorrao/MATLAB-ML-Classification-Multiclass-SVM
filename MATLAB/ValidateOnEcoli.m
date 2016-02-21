function ValidateOnEcoli

    [Dataset, Labels] = Z_LoadEcoli;
    CrossValidateAllMethods(Dataset, Labels);
    