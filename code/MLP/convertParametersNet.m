%% converParameters: function description
function [features, hiddenLayerSize] = convertParametersNet(parameters)

	hiddenLayerSize = round(parameters(1,end));

	features = [1];
	k = 1;
	for i=1:size(parameters,2)-1

		if parameters(i) == 1
		
			features(k) = round(i);
			k = k + 1;

		end

	end

end