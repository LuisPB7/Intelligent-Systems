%% nfoldDataset: function description
function [fraudSet, balSet, regSet, testSet] = getDatasets(dataset, n)
	
	randomizedDataset = zeros(size(dataset));
	nInstances = size(randomizedDataset, 1);
	idxs = randperm(nInstances);

	for i=1:nInstances

		randomizedDataset(i,:) = dataset(idxs(i),:);

	end

	dataset = randomizedDataset;

	N = size(dataset,1);

	lists = cell(3,1);

	lists{1,1} = [];
	lists{2,1} = [];
	lists{3,1} = [];

	for i=1:size(dataset,1)

		lists{dataset(i,7)+1,1} = [lists{dataset(i,7)+1,1}; dataset(i,:)];

	end

	m = ceil((N/n)/3);

	minSize = min([size(lists{1,1},1) size(lists{2,1},1) size(lists{3,1},1)]);

	r = minSize - m;

	testSet = [lists{1,1}(1:m,:); lists{2,1}(1:m,:); lists{3,1}(1:m,:)];

	fraudSet = [lists{2,1}((m+1):end,:); lists{3,1}((m+1):end,:)];

	regSet = [lists{1,1}((m+1):end,:); lists{2,1}((m+1):end,:); lists{3,1}((m+1):end,:)];
	
	balSet = [lists{1,1}((m+1):(m+r),:); lists{2,1}((m+1):(m+r),:); lists{3,1}((m+1):(m+r),:)];

end