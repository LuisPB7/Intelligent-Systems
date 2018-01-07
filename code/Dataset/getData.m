%% getData: function description
function getData(type, kind)

	load('data');

	if strcmp(type,'neuro')

		testTargets = buildTargets(testSet(:,7),3);
		testInputs = testSet(:,1:6);

		if strcmp(kind, 'regular')

			regSet = shuffleSet(regSet);
			trainTargets = buildTargets(regSet(:,7),3);
			trainInputs = regSet(:,1:6);
			save('processedData');

		elseif strcmp(kind, 'balanced')
	
			balSet = shuffleSet(balSet);
			trainTargets = buildTargets(balSet(:,7),3);
			trainInputs = balSet(:,1:6);
			save('processedData');

		else
	
			fraudSet = shuffleSet(fraudSet);
			trainTargets = buildTargets(fraudSet(:,7),3);
			trainInputs = fraudSet(:,1:6);
			save('processedData');

		end

	else
	
		testTargets = testSet(:,7)+1;
		testInputs = testSet(:,1:6);

		if strcmp(kind, 'regular')

			regSet = shuffleSet(regSet);
			trainTargets = regSet(:,7)+1;
			trainInputs = regSet(:,1:6);
			save('processedData');

		elseif strcmp(kind, 'balanced')
	
			balSet = shuffleSet(balSet);
			trainTargets = balSet(:,7)+1;
			trainInputs = balSet(:,1:6);
			save('processedData');

		else
	
			fraudSet = shuffleSet(fraudSet);
			trainTargets = fraudSet(:,7)+1;
			trainInputs = fraudSet(:,1:6);
			save('processedData');

		end

	end
	
end