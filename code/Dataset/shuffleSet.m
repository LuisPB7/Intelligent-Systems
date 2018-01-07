%% shuffleSet: function description
function randomizedDataset = shuffleSet(dataset)

	nInstances = size(dataset,1);
	randomizedDataset = zeros(size(dataset));
	nInstances = size(randomizedDataset, 1);
	idxs = randperm(nInstances);

	for i=1:nInstances

		randomizedDataset(i,:) = dataset(idxs(i),:);

	end

end