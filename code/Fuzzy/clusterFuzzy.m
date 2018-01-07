%% clusterFuzzy: function description
function fis = clusterFuzzy(inputs, targets, nclusters)

	fis = genfis3(inputs, targets, 'sugeno', nclusters);

end