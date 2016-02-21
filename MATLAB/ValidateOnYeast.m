function ValidateOnYeast

    [Dataset, Labels] = Z_LoadYeast;
    CrossValidateAllMethods(Dataset, Labels);
    