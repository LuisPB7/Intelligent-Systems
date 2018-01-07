%% nfoldDataset: function description
function [trainTargets, trainInputs, testTargets, testInputs] = nfoldDataset(dataset, n, type)
	
	N = ceil(size(dataset,1)/n);
	
	randomizedDataset = zeros(size(dataset));
	nInstances = size(randomizedDataset, 1);
	idxs = randperm(nInstances);

	for i=1:nInstances

		randomizedDataset(i,:) = dataset(idxs(i),:);

	end

	testInputs = randomizedDataset(1:N, 1:6);
	testTargets = randomizedDataset(1:N, 7);

	trainInputs = randomizedDataset(N+1:end, 1:6);
	trainTargets = randomizedDataset(N+1:end, 7);

	if strcmp(type, 'neuro')
	
		testTargets = buildTargets(testTargets, 3);
		trainTargets = buildTargets(trainTargets,3);

	end

end