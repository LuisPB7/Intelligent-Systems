Config;

BuildEnsemble;

parameters = [0.9835    0.8909    0.0977    0.5911    0.8509    0.7177    0.8024    0.4679    0.1237    8.2284    9.8664   -5.6814    4.9946   -2.2569    5.2323    7.4524    3.9318    9.8607];

[res, acc] = showResultsHierarchic2TPR(parameters);

ACCURACY = acc
TPRfraud1 = res(1,2)
TNRfraud1 = res(2,2)
TPRfraud2 = res(1,3)
TNRfraud2 = res(2,3)

save('bestResults');
