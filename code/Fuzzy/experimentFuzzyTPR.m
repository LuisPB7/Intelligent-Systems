%% experimentNet: objective function to minimize
function percentErrors = experimentFuzzyTPR(parameters)
	load('processedData');
	[features, nclusters] = convertParametersFuzzy(parameters);
	
	trainInputs = trainInputs(:, features);
	testInputs = testInputs(:, features);
	
	fis = clusterFuzzy(trainInputs, trainTargets, nclusters);

	y = evalfis(testInputs,fis);
	y(y<0.5) = 1;
	y(y>3) = 3;
	y = round(y);
	%percentErrors = nnz(y - testTargets)/size(y,1);

	yind = y;
	tind = testTargets;
	confusion = zeros(3,3);

	for i=1:size(tind,1)
		confusion(yind(i),tind(i)) = confusion(yind(i),tind(i)) + 1;

    end
	res = measures(confusion);

	percentErrors = -(res(1,1)+res(1,2)+res(1,3));

end