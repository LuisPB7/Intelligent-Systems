%% multiLayerPerceptron: function description
function [net,percentErrors, tind, yind] = multiLayerPerceptron(inputs, targets, hiddenLayerSize)

	x = inputs';
	t = targets';

	% Choose a Training Function
	trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

	% Create a Pattern Recognition Network
	net = patternnet(hiddenLayerSize);

	% Setup Division of Data for Training, Validation, Testing
	% For a list of all data division functions type: help nndivide
	net.divideFcn = 'dividerand';  % Divide data randomly
	net.divideMode = 'sample';  % Divide up every sample
	net.divideParam.trainRatio = 70/100;
	net.divideParam.valRatio = 15/100;
	net.divideParam.testRatio = 15/100;

	% Choose a Performance Function
	% For a list of all performance functions type: help nnperformance
	net.performFcn = 'crossentropy';  % Cross-Entropy

	% Train the Network
	[net,tr] = train(net,x,t);


	in=x(:, tr.testInd);
	out=t(:, tr.testInd);

	% Test the Network
	y = net(in);
	tind = vec2ind(out);
	yind = vec2ind(y);

	percentErrors = sum(tind ~= yind)/numel(tind);

	% View the Network
	%view(net)

	% Plots
	% Uncomment these lines to enable various plots.
	%figure, plotperform(tr)
	%figure, plottrainstate(tr)
	%figure, ploterrhist(e)
	%figure, 
	%plotconfusion(out,y);
	%figure, plotroc(t,y)

end