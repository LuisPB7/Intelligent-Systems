optimizeTo = 'TPR'; % '' => Accuracy or 'TPR' => True Positive Rate

objectiveFunction = 'experimentSumTPR';

%% Basic GA parameters
gaDat.Objfun=objectiveFunction;
lb=zeros(1,nModels);
ub=ones(1,nModels);

%gaDat.MAXGEN=20; % Number of generations, gaDat.NVAR*20+10 by default
%gaDat.NIND=10;   % Size of the population, gaDat.NVAR*50 by default

gaDat.FieldD=[lb; ub];
% Execute GA
gaDat=ga2(gaDat);
% Result are in
gaDat.xmin
gaDat.fxmin