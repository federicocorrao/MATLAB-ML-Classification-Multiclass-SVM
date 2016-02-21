function ValidateOnIris

    [Dataset, Labels] = Z_LoadIris;
    CrossValidateAllMethods(Dataset, Labels);
    