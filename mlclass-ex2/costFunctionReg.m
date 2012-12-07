function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

# inner = 0; %inner product
# for i = 1:length(X)
	# inner = X(i,:)*theta;
	# J = J + 1/m * (-y(i)*log(sigmoid(inner)) - (1-y(i))*log(1-sigmoid(inner)));
# end %J

J = 1/m * (sum(-y'*log(sigmoid(X*theta)) - (1-y)'*log(1-sigmoid(X*theta)))) + (lambda/(2*m)) * sum(theta(2:length(theta)).^2);

for f = 1:length(theta) % f = featureIndex
	if(f==1)
		grad(f) = 1/m * sum((sigmoid(X*theta) - y).*X(:,f));
	else
		grad(f) = 1/m * sum((sigmoid(X*theta) - y).*X(:,f)) + (theta(f)*lambda)/m;
	endif
end %for f

% =============================================================

end
