load('Dataset');

[fraudSet, balSet, regSet, testSet] = getDatasets(dataset, 10);

save('data');