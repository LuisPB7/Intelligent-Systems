%% experimentNet: objective function to minimize
function percentErrors = experimentFuzzy(parameters)

	load('processedData');
	[features, nclusters] = convertParametersFuzzy(parameters);
	
	trainInputs = trainInputs(:, features);
	testInputs = testInputs(:, features);
	
	fis = clusterFuzzy(trainInputs, trainTargets, nclusters);

	y = evalfis(testInputs,fis);
	y(y<0.5) = 1;
	y(y>3) = 3;
	y = round(y);

	yind = y;
	tind = testTargets;
	confusion = zeros(3,3);

	for i=1:size(tind,1)
		confusion(yind(i),tind(i)) = confusion(yind(i),tind(i)) + 1;

    end

	percentErrors = nnz(y - testTargets)/size(y,1);

end