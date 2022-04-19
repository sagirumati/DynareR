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
    T = RBC_IRF.static_resid_tt(T, y, x, params);
end
residual = zeros(15, 1);
lhs = T(1);
rhs = T(2)*T(4);
residual(1) = lhs - rhs;
lhs = T(5)/(1-y(4));
rhs = y(8);
residual(2) = lhs - rhs;
lhs = params(8)*y(3);
rhs = y(3)*(1-params(4))+y(9);
residual(3) = lhs - rhs;
lhs = y(1);
rhs = y(2)+y(9)+params(14)*exp(y(6));
residual(4) = lhs - rhs;
lhs = y(1);
rhs = T(6)*T(7);
residual(5) = lhs - rhs;
lhs = y(8);
rhs = y(1)*(1-params(5))/y(4);
residual(6) = lhs - rhs;
lhs = y(7);
rhs = y(1)*params(5)*4/y(3);
residual(7) = lhs - rhs;
lhs = y(5);
rhs = y(5)*params(6)+x(1);
residual(8) = lhs - rhs;
lhs = y(6);
rhs = y(6)*params(7)+x(2);
residual(9) = lhs - rhs;
lhs = y(10);
rhs = log(y(1));
residual(10) = lhs - rhs;
lhs = y(11);
rhs = log(y(3));
residual(11) = lhs - rhs;
lhs = y(12);
rhs = log(y(2));
residual(12) = lhs - rhs;
lhs = y(13);
rhs = log(y(4));
residual(13) = lhs - rhs;
lhs = y(14);
rhs = log(y(8));
residual(14) = lhs - rhs;
lhs = y(15);
rhs = log(y(9));
residual(15) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
