%% experimentNet: objective function to minimize
function [percentErrors , fis]= experimentNeuroFuzzy(parameters)

	load('processedData');
    parameters
	features = convertParametersNeuroFuzzy(parameters);
	
	trainInputs = trainInputs(:, features);
	testInputs = testInputs(:, features);
	
	fis = neuroFuzzy(trainInputs, trainTargets);

	y = evalfis(testInputs,fis);
	y = round(y);
	percentErrors = nnz(y - testTargets)/size(y,1);

end