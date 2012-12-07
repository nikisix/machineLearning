function p = predict(Theta1, Theta2, X)
% Theta1 has size 25 x 401. 
% Theta2 has size 10 x 26
% X	 has size 5000 x 400
%the First row of Theta1 corresponds to the first hidden unit in the second layer. 'a(2)_1'

%for i in size(X,1)
%	a(i) = Theta1(:,i)*X(:,i);
%end

%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

X = [ones(m,1) X]; % 25x401

Z2 = X*Theta1';
A2 = sigmoid(Z2);
A2 = [ones(size(A2),1) A2];

Z3 = A2*Theta2';
A3 = sigmoid(Z3);

[temp p] = max(A3');
p = p';

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


% =========================================================================


end
