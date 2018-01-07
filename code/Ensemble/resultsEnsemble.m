%% experimentEnsemble: function description
function res = resultsEnsemble(parameters)

	load('ensembleData');
	
	outputs = cell(nModels,1);

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

	votes = zeros(3, N);

	for i=1:N

		for j=1:nModels
			
			votes(outputs{j,1}(i), i) = votes(outputs{j,1}(i), i) + parameters(j);
		end

	end

	[m,id] = max(votes, [], 1);

	confusion = zeros(3,3);

	for i=1:N

		confusion(id(i),t(i)) = confusion(id(i),t(i)) + 1;

	end

	res = measures(confusion);

end