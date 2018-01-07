optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

getData(type, kind);
	
objectiveFunction = strcat('experimentFuzzy', optimizeTo);

%% Basic GA parameters
MAXclusters = 100; %Max number of clusters
lb=[0 0 0 0 0 0 1];
ub=[1 1 1 1 1 1 MAXclusters];


MAXGEN = 5;
NIND = 5;

opt = optimoptions('ga', 'MaxGenerations', MAXGEN, 'PopulationSize', NIND, 'MaxStallGenerations', 3, 'FunctionTolerance', 1e-4);
if(strcmp(optimizeTo,'TPR'))
    [x, fval] = ga(@experimentFuzzyTPR, 7, [], [], [], [], lb, ub, [], [1 2 3 4 5 6 7],opt);
else
    [x, fval] = ga(@experimentFuzzy, 7, [], [], [], [], lb, ub, [], [1 2 3 4 5 6 7],opt);
end

x
fval