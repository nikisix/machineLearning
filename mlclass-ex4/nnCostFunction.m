function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

warning ( "off" );
% Setup some useful variables
m = size(X, 1);
K = size(Theta2, 1);

%recode y
recoded = zeros(length(y), K);
for i = 1:length(y) % loop through every training example
	recoded(i,y(i)) = 1;
end %for
y = recoded;

% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

X = [ones(m,1) X]; % 25x401

Z2 = X*Theta1';
A2 = sigmoid(Z2);
A2 = [ones(size(A2),1) A2];

Z3 = A2*Theta2';
A3 = sigmoid(Z3);

% for i = 1:m
	% J = J + y(i,:)*log(A3(i,:)') + (1-y)*log(1-A3(i,:)') ;
% end %m

%J = -1/m * sum( y'*log(A3) + (1-y')*log(1-A3) ); % inner product don't want this 10x10
%J = -1/m * sum( log(A3')*y + log(1-A3')(1-y) );

for i = 1:m 
	for k = 1:K
		J = J + y(i,k)*log(A3(i,k)) + (1-y(i,k))*log(1-A3(i,k));
	end %k
end %m

J = J * -1/m;

reg = 0;
%reg = sum(sum(Theta1(2:end).^2)) + sum(sum(Theta2(2:end).^2)); % leave off first column

%regularize the cost function 
for i = 1:size(Theta1,1)
	for j = 2:size(Theta1,2)
		reg = reg + Theta1(i,j)^2;
	end
end
for i = 1:size(Theta2,1)
	for j = 2:size(Theta2,2)
		reg = reg + Theta2(i,j)^2;
	end
end

reg = reg * lambda/(2*m);
J = J + reg;

%Theta1_grad = randInitializeWeights(input_layer_size, hidden_layer_size);
%Theta2_grad = randInitializeWeights(hidden_layer_size, num_labels);
d3 = zeros(num_labels,1);
d2 = zeros(hidden_layer_size,1);
for t = 1:m
	%forward prop. step 1
	a1 = X(t,:);
	z2 = a1*Theta1';
	a2 = sigmoid(z2);
	a2 = [ones(size(a2),1) a2];
		
	z3 = a2*Theta2';
	a3 = sigmoid(z3)';
	
	%2. back prop		%size(a3) % 1x10
	d3 = a3 - y(t,:)';
	
	%step 3			%size(Theta2_grad) % 10x26	%size(d3)  % 1x10	%size(sigmoid(z2)) % 1x25
	d2 = Theta2' * d3; %26x1
	d2 = d2(2:end) .* sigmoidGradient(z2)'; % 1x25
	
	%4 accumulate gradients		%size(Theta2_grad) % 10x26
	Theta2_grad = Theta2_grad + d3*a2; 
	%size(a1) 1x401	%size(d2) 25x1
	Theta1_grad = Theta1_grad + d2*a1;
end %t

Theta2_grad = Theta2_grad/m;
Theta1_grad = Theta1_grad/m;

%regularization
%size(Theta2) % 10x26
%size(Theta1) % 25x401
Theta1(:,1)=0;
Theta2(:,1)=0;
Theta2_grad = Theta2_grad + (lambda/m) * Theta2;
Theta1_grad = Theta1_grad + (lambda/m) * Theta1;

grad = [Theta1_grad(:); Theta2_grad(:)];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
