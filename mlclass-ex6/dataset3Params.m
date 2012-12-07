function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = .3;
sigma = 0.1;
end
% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% INFINITY = 9999999999;
% lowestError = INFINITY;
% lowestC 	= INFINITY;
% lowestS 	= INFINITY;

% for c = [.01, .03, .1, .3, 1, 3, 10, 30]
% %for c = [.01, .1, 1, 10]
	% for s = [.01, .03, .1, .3, 1, 3, 10, 30]
% %	for s = [.01, .1, 1, 10]
		% model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s));
		% predictions = svmPredict(model, Xval);
		% c
		% s
		% error = mean(double(predictions ~= yval))
		% if(error < lowestError)
			% lowestError = error
			% lowestC = c
			% lowestS = s
		% endif
	% end %s
% end %c

% lowestC
% lowestS
% lowestError
% C = lowestC;
% sigma = lowestS;
% =========================================================================
%end
