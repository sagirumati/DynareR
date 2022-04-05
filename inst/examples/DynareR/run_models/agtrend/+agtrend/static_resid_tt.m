function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 10);

T(1) = exp(y(9))*y(2)^(1-params(9));
T(2) = (y(6)*y(7))^params(9);
T(3) = y(1)-params(14)*y(7)^params(15);
T(4) = T(3)^(-params(2));
T(5) = params(15)*(-params(14))*y(7)^(params(15)-1);
T(6) = params(6)/2;
T(7) = T(6)*(y(6)-params(1))^2;
T(8) = y(2)*T(7);
T(9) = 1-params(5)+y(3)*(1-params(9))/y(2)+T(6)*(y(6)-params(1))*(y(6)+params(1));
T(10) = (T(8)+y(2)*y(6)-y(2)*(1-params(5)))/y(3);

end
