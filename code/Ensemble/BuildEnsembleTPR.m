features = cell(nModels,1);
models = cell(nModels,1);

%%% MLP

	%%% General
	features{1,1} = [2 3 4 5];
	hu = 94;
	getData('neuro', 'regular');
	load('processedData');
	[models{1,1}, percentErrors, tind, yind] = multiLayerPerceptron(trainInputs(:,features{1,1}), trainTargets, hu);

	tIn = testInputs;
	tOut = testTargets;	
	
	%%% Balanced
	features{2,1} = [1 2 4 5];
	hu = 89;
	getData('neuro', 'balanced');
	load('processedData');
	[models{2,1}, percentErrors, tind, yind] = multiLayerPerceptron(trainInputs(:,features{2,1}), trainTargets, hu);

	%%% Fraud
	features{3,1} = [1 2 4 5];
	hu = 82;
	getData('neuro', 'fraud');
	load('processedData');
	[models{3,1}, percentErrors, tind, yind] = multiLayerPerceptron(trainInputs(:,features{3,1}), trainTargets, hu);

% %%% FUZZY
 	
 	%%% General
 	features{4,1} = [1 4 5];
 	clusters = 30;
	getData('fuzzy', 'regular');
	load('processedData');
 	models{4,1} = clusterFuzzy(trainInputs(:,features{4,1}), trainTargets, clusters);
 	
% 	%%% Balanced
 	features{5,1} = [1 2 4 5];
 	clusters = 42;
	getData('fuzzy', 'balanced');
	load('processedData');
 	models{5,1} = clusterFuzzy(trainInputs(:,features{5,1}), trainTargets, clusters);
 
% 	%%% Fraud
 	features{6,1} = [1 2 3 4 5];
 	clusters = 42;
	getData('fuzzy', 'fraud');
	load('processedData');
 	models{6,1} = clusterFuzzy(trainInputs(:,features{6,1}), trainTargets, clusters);
 
% %%% ANFIS
 	
 	%%% General
 	features{7,1} = [2 3 5 6];
	getData('anfis', 'regular');
	load('processedData');
	models{7,1} = neuroFuzzy(trainInputs(:,features{7,1}), trainTargets);
 
% 	%%% Balanced
 	features{8,1} = [1 2 4 5];
	getData('anfis', 'balanced');
	load('processedData');
 	models{8,1} = neuroFuzzy(trainInputs(:,features{8,1}), trainTargets);
 
% 	%%% Fraud
 	features{9,1} = [1 2 3 4 5];
	getData('anfis', 'fraud');
	load('processedData');
 	models{9,1} = neuroFuzzy(trainInputs(:,features{9,1}), trainTargets);

clearvars -except features models trIn trOut tIn tOut nModels;

save('ensembleData');