optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

getData(type, kind);
	
objectiveFunction = strcat('experimentNeuroFuzzy', optimizeTo);

%% Basic GA parameters
%gaDat.Objfun=objectiveFunction;
%lb=[0 0 0 0 0 0 1];
%ub=[1 1 1 1 1 1 MAXclusters];

%gaDat.MAXGEN=20; % Number of generations, gaDat.NVAR*20+10 by default
%gaDat.NIND=20 ;   % Size of the population, gaDat.NVAR*50 by default
MAXGEN = 5;
NIND = 5;

%gaDat.FieldD=[lb; ub];
% Execute GA
%gaDat=ga(gaDat);
% Result are in
opt = optimoptions('ga', 'MaxGenerations', MAXGEN, 'PopulationSize', NIND, 'MaxStallGenerations', 3, 'FunctionTolerance', 1e-4);
[x, fval] = ga(objectiveFunction, 7, [], [], [], [], [0 0 0 0 0 0 1], [1 1 1 1 1 1 MAXclusters], [], [1 2 3 4 5 6 7],opt);
%gaDat.xmin
%gaDat.fxmin
x
fval