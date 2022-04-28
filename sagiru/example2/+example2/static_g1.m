function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = example2.static_g1_tt(T, y, x, params);
end
g1 = zeros(6, 6);
g1(1,1)=(-((1-params(3))*exp(y(1))));
g1(1,2)=T(1);
g1(1,5)=exp(y(2))*params(5)*exp(y(5))*getPowerDeriv(exp(y(5)),1+params(6),1);
g1(2,1)=(-(params(1)*exp(y(1))*params(3)*exp(y(6))));
g1(2,3)=exp(y(3))-params(1)*exp(y(3))*(1-params(4));
g1(2,6)=(-(params(1)*exp(y(1))*params(3)*exp(y(6))));
g1(3,1)=exp(y(1));
g1(3,3)=(-(T(3)*exp(y(4))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3),1)));
g1(3,4)=(-T(4));
g1(3,5)=(-(T(2)*exp(y(5))*getPowerDeriv(exp(y(5)),1-params(3),1)));
g1(4,1)=(-(exp(y(1))*exp(y(6))));
g1(4,2)=(-(exp(y(6))*(-exp(y(2)))));
g1(4,3)=exp(y(3))-exp(y(3))*(1-params(4));
g1(4,6)=(-(exp(y(6))*(exp(y(1))-exp(y(2)))));
g1(5,4)=1-params(2);
g1(5,6)=(-params(7));
g1(6,4)=(-params(7));
g1(6,6)=1-params(2);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
