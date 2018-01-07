optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

objectiveFunction = strcat('experimentSum' ,optimizeTo);

%% Basic GA parameters
gaDat.Objfun=objectiveFunction;
lb=zeros(1,nModels);
ub=ones(1,nModels);

MAXGEN=10; % Number of generations, gaDat.NVAR*20+10 by default
NIND=10;   % Size of the population, gaDat.NVAR*50 by default

opt = optimoptions('ga', 'MaxGenerations', MAXGEN, 'PopulationSize', NIND, 'MaxStallGenerations', 3, 'FunctionTolerance', 1e-4);

if(strcmp(optimizeTo,'TPR'))
    [x, fval] = ga(@experimentSumTPR, nModels, [], [], [], [], lb,ub, [],opt);
else
    [x, fval] = ga(@experimentSum,nModels, [], [], [], [], lb,ub, [],opt);
end

