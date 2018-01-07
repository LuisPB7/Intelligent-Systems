%% experimentEnsemble: function description
function score = experimentHierarchic2TPR(parameters)

	load('ensembleData');
	
	outputs = cell(nModels,1);
	parameters2 = parameters((nModels+1):end);
	parameters = parameters(1:nModels);

	for j=1:nModels

		if j <= 3

			outputs{j,1} = vec2ind(models{j,1}(tIn(:,features{j,1})'));

		else

			aux = evalfis(tIn(:,features{j,1})',models{j,1});
			aux(aux<0.5) = 1;
			aux(aux>3) = 3;
			aux = round(aux);
			outputs{j,1} = aux';

		end

	end

	t = vec2ind(tOut');

	N = size(t,2);
	
	if nModels == 3

		regular = [1];
		balanced = [2];
		fraud = [3];

	else

		regular = [1 4 7];
		balanced = [2 5 8];
		fraud = [3 6 9];

	end

	votes = zeros(3, N);
	id = zeros(N,1);

	for i=1:N


		votes = zeros(3,1);

		for j=balanced
			
			votes(outputs{j,1}(i), 1) = votes(outputs{j,1}(i), 1) + parameters(j);
		
		end

		[~,idx] = max(votes, [], 1);

		if idx == 1

			votes = zeros(3,1);

			for j=[regular balanced]

				votes(outputs{j,1}(i), 1) = votes(outputs{j,1}(i), 1) + parameters2(j);

			end

			[~,id(i)] = max(votes, [], 1);

		else
				
			votes = zeros(3,1);

			for j=[balanced fraud]

				votes(outputs{j,1}(i), 1) = votes(outputs{j,1}(i), 1) + parameters2(j);

			end

			[~,id(i)] = max(votes, [], 1);

		end

	end

	confusion = zeros(3,3);

	for i=1:N

		confusion(id(i),t(i)) = confusion(id(i),t(i)) + 1;

	end

	res = measures(confusion)

	confusion
	acc = (confusion(1,1)+confusion(2,2)+confusion(3,3))/sum(confusion(:))

	score = -(res(1,1)+res(1,2)+res(1,3));
	
end