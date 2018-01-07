%% experimentNet: objective function to minimize
function percentErrors = experimentNetTPR(parameters)

	load('processedData');
	[features, hiddenLayerSize] = convertParametersNet(parameters);
	
	trainInputs = trainInputs(:, features);
	testInputs = testInputs(:, features);
	
	net = multiLayerPerceptron(trainInputs, trainTargets, hiddenLayerSize);

	y = net(testInputs');
	%e = gsubtract(testTargets',y);
	%performance = perform(net,testTargets',y);
	tind = vec2ind(testTargets');
	yind = vec2ind(y);
	%percentErrors = sum(tind ~= yind)/numel(tind);

	confusion = zeros(3,3);

	for i=1:size(tind,2)

		confusion(yind(i),tind(i)) = confusion(yind(i),tind(i)) + 1;

	end

	res = measures(confusion);

	percentErrors = -(res(1,1)+res(1,2)+res(1,3));

end