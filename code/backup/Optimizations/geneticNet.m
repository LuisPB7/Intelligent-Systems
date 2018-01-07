optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

getData(type, kind);
	
objectiveFunction = strcat('experimentNet', optimizeTo);

MAXneurons = 100; %Max number of hidden units
%% Basic GA parameters
gaDat.Objfun=objectiveFunction;
lb=[0 0 0 0 0 0 1];
ub=[1 1 1 1 1 1 MAXneurons];

gaDat.MAXGEN=20; % Number of generations, gaDat.NVAR*20+10 by default
gaDat.NIND=20;   % Size of the population, gaDat.NVAR*50 by default

gaDat.FieldD=[lb; ub];
% Execute GA
gaDat=ga(gaDat);
% Result are in
gaDat.xmin
gaDat.fxmin