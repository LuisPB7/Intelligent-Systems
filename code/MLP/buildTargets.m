%% buildTargets: function description
function targetMatrix = buildTargets(vector, nclasses)

	nInstances = size(vector,1);
	targetMatrix = zeros(nInstances, nclasses);
	for i=1:nInstances

		target = zeros(1, nclasses);
		target(1,vector(i)+1) = 1;
		targetMatrix(i,:) = target;

	end

end