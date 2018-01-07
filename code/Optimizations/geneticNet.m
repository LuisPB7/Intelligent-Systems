optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

getData(type, kind);
	
objectiveFunction = strcat('experimentNet', optimizeTo);


%% Basic GA parameters

MAXneurons = 100; %Max number of hidden units
lb=[0 0 0 0 0 0 1];
ub=[1 1 1 1 1 1 MAXneurons];

MAXGEN=30; % Number of generations, gaDat.NVAR*20+10 by default
NIND=30;   % Size of the population, gaDat.NVAR*50 by default


opt = optimoptions('ga', 'MaxGenerations', MAXGEN, 'PopulationSize', NIND, 'MaxStallGenerations', 3, 'FunctionTolerance', 1e-4);
if(strcmp(optimizeTo,'TPR'))
    [x, fval] = ga(@experimentNetTPR, 7, [], [], [], [], lb,ub, [], [1 2 3 4 5 6 7],opt);
else
    [x, fval] = ga(@experimentNet, 7, [], [], [], [], lb,ub, [], [1 2 3 4 5 6 7],opt);
end
x
fval
