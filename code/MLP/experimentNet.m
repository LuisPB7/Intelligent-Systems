%% experimentNet: objective function to minimize
function percentErrors = experimentNet(parameters)

	load('processedData');
	parameters
	[features, hiddenLayerSize] = convertParametersNet(parameters);
	
	trainInputs = trainInputs(:, features);
	testInputs = testInputs(:, features);
	
	net = multiLayerPerceptron(trainInputs, trainTargets, hiddenLayerSize);

	y = net(testInputs');
	%e = gsubtract(testTargets',y);
	%performance = perform(net,testTargets',y);
	tind = vec2ind(testTargets');
	yind = vec2ind(y);
	percentErrors = sum(tind ~= yind)/numel(tind);

end