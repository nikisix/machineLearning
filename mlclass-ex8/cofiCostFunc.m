function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad 		= zeros(size(X));
Theta_grad 	= zeros(size(Theta));

%C = A * B; total = sum(sum(C(R == 1)));
%C = (A * B) .* R; total = sum(C(:));
%J = .5 * sum((Theta(R==1)'*X(R==1)-Y(R==1)).^2);

%size(Theta) 4x3;
%size(X) 5x3;
%size(Y); %5x4
%C = X*Theta';
%J = .5 * sum(sum((C(R)-Y(R)).^2)); %also works
J 					= .5 * sum(sum(( (X*Theta' - Y).*R).^2 )) + (lambda/2) * (sum(sum(Theta.^2)) + sum(sum(X.^2)));
X_grad			= ((X*Theta' - Y) .*R) *Theta	+ lambda.*X;
Theta_grad	= ((X*Theta' - Y) .*R)' *X		+ lambda.*Theta;

grad = [X_grad(:); Theta_grad(:)];

%fprintf('size of grad %d %d \n\n',size(grad));

%indicies for gradient computations
%ind_x 		= R(1:size(X_grad,1), 1:size(X_grad,2));
%ind_theta 	= R(1:size(Theta_grad,1), 1:size(Theta_grad,2));

%Theta_grad 	= sum(sum((X(ind_x)*Theta(ind_theta)'-Y(ind_theta)).*Theta(ind_theta)));
%X_grad 		= sum(sum((X(ind_x)*Theta(ind_theta)'-Y(ind_x)).*X(ind_x)));

%for j = 1:num_movies
%	X_grad(i) = Theta;
%end %movie gradient
%for i = 1:num_users

%	Theta_grad(j) = ;
%end %user gradient

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% =============================================================


end
