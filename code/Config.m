addpath('.');
addpath('./Dataset');
addpath('./MLP');
addpath('./Fuzzy');
addpath('./ANFIS');
%addpath('./GeneticToolboxInt');
%addpath('./GeneticToolbox');
addpath('./Optimizations');
addpath('./Ensemble');

nModels = 9;
LoadData;

clearvars -except dataset testSet balSet fraudSet regSet nModels