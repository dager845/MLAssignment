function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X,2);
temp = ones(n,1);
temp(1) = 0; %exclude theta(1), no need regularization for theta(1)
A=eye(n);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

hx = sigmoid(X*theta);
J= (-y'*log(hx)-(1-y)'*log(1-hx))/m + lambda*(temp'*(theta.^2))/(2*m);
grad = ((hx - y)'*X/m)' + lambda*A*theta/m;
grad(1) = sum(hx-y)/m;



% =============================================================

end
