optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

getData(type, kind);
	
objectiveFunction = strcat('experimentNeuroFuzzy', optimizeTo);

%% Basic GA parameters
lb=[0 0 0 0 0 0];
ub=[1 1 1 1 1 1];

MAXGEN=20; % Number of generations, gaDat.NVAR*20+10 by default
NIND=20 ;   % Size of the population, gaDat.NVAR*50 by default

opt = optimoptions('ga', 'MaxGenerations', MAXGEN, 'PopulationSize', NIND, 'MaxStallGenerations', 3, 'FunctionTolerance', 1e-4);
if(strcmp(optimizeTo,'TPR'))
    [x, fval] = ga(@experimentNeuroFuzzyTPR, 6, [], [], [], [], lb,ub, [], [1 2 3 4 5 6],opt);
else
    [x, fval] = ga(@experimentNeuroFuzzy, 6, [], [], [], [], lb,ub, [], [1 2 3 4 5 6],opt);
end
x
fval
