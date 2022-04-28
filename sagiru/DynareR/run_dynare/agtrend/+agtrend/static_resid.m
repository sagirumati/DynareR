function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = agtrend.static_resid_tt(T, y, x, params);
end
residual = zeros(15, 1);
lhs = y(3);
rhs = T(1)*T(2);
residual(1) = lhs - rhs;
lhs = y(9);
rhs = y(9)*params(10)+params(11)*x(1);
residual(2) = lhs - rhs;
lhs = log(y(6));
rhs = (1-params(3))*log(params(1))+log(y(6))*params(3)+params(4)*x(2);
residual(3) = lhs - rhs;
lhs = y(8);
rhs = T(3)^(1-params(2))/(1-params(2));
residual(4) = lhs - rhs;
lhs = y(10);
rhs = T(4);
residual(5) = lhs - rhs;
lhs = y(11);
rhs = T(4)*T(5);
residual(6) = lhs - rhs;
lhs = y(12);
rhs = params(13)*y(6)^(1-params(2));
residual(7) = lhs - rhs;
lhs = y(1)+y(2)*y(6);
rhs = y(3)+y(2)*(1-params(5))-T(8)-y(4)+y(4)*y(6)*y(5);
residual(8) = lhs - rhs;
lhs = 1/y(5);
rhs = 1+params(12)+params(7)*(exp(y(4)-params(8))-1);
residual(9) = lhs - rhs;
lhs = y(6)*y(10)*(1+params(6)*(y(6)-params(1)));
rhs = y(10)*y(12)*T(9);
residual(10) = lhs - rhs;
residual(11) = y(11)+y(3)*params(9)*y(10)/y(7);
lhs = y(5)*y(6)*y(10);
rhs = y(10)*y(12);
residual(12) = lhs - rhs;
lhs = y(14);
rhs = (y(4)-y(4)*y(6)*y(5))/y(3);
residual(13) = lhs - rhs;
lhs = y(13);
rhs = log(y(1)/y(3));
residual(14) = lhs - rhs;
lhs = y(15);
rhs = log(T(10));
residual(15) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
