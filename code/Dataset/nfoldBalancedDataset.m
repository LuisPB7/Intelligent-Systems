%% nfoldDataset: function description
function [trainTargets, trainInputs, testTargets, testInputs] = nfoldBalancedDataset(dataset, n, type)
	
	randomizedDataset = zeros(size(dataset));
	nInstances = size(randomizedDataset, 1);
	idxs = randperm(nInstances);

	for i=1:nInstances

		randomizedDataset(i,:) = dataset(idxs(i),:);

	end

	dataset = randomizedDataset;

	lists = cell(3,1);

	lists{1,1} = [];
	lists{2,1} = [];
	lists{3,1} = [];

	for i=1:size(dataset,1)

		lists{dataset(i,7)+1,1} = [lists{dataset(i,7)+1,1}; dataset(i,:)];

	end

	m = min([size(lists{1,1},1) size(lists{2,1},1) size(lists{3,1},1)]);

	dataset = [lists{1,1}(1:m,:); lists{2,1}(1:m,:); lists{3,1}(1:m,:)];

	randomizedDataset = zeros(size(dataset));
	nInstances = size(randomizedDataset, 1);
	idxs = randperm(nInstances);

	for i=1:nInstances

		randomizedDataset(i,:) = dataset(idxs(i),:);

	end

	N = ceil(size(dataset,1)/n);
	
	testInputs = randomizedDataset(1:N, 1:6);
	testTargets = randomizedDataset(1:N, 7);

	trainInputs = randomizedDataset(N+1:end, 1:6);
	trainTargets = randomizedDataset(N+1:end, 7);

	if strcmp(type, 'neuro')
	
		testTargets = buildTargets(testTargets, 3);
		trainTargets = buildTargets(trainTargets,3);

	end

end