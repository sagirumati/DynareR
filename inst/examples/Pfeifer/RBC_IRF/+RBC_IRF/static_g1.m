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
    T = RBC_IRF.static_g1_tt(T, y, x, params);
end
g1 = zeros(15, 15);
g1(1,2)=T(8)-T(4)*params(1)/params(8)*T(8);
g1(1,3)=(-(T(2)*params(5)*exp(y(5))*1/y(4)*T(9)));
g1(1,4)=(-(T(2)*params(5)*exp(y(5))*T(9)*(-y(3))/(y(4)*y(4))));
g1(1,5)=(-(T(2)*T(3)));
g1(2,2)=params(2)*getPowerDeriv(y(2),params(3),1)/(1-y(4));
g1(2,4)=T(5)/((1-y(4))*(1-y(4)));
g1(2,8)=(-1);
g1(3,3)=params(8)-(1-params(4));
g1(3,9)=(-1);
g1(4,1)=1;
g1(4,2)=(-1);
g1(4,6)=(-(params(14)*exp(y(6))));
g1(4,9)=(-1);
g1(5,1)=1;
g1(5,3)=(-(T(7)*exp(y(5))*getPowerDeriv(y(3),params(5),1)));
g1(5,4)=(-(T(6)*getPowerDeriv(y(4),1-params(5),1)));
g1(5,5)=(-(T(6)*T(7)));
g1(6,1)=(-((1-params(5))/y(4)));
g1(6,4)=(-((-(y(1)*(1-params(5))))/(y(4)*y(4))));
g1(6,8)=1;
g1(7,1)=(-(params(5)*4/y(3)));
g1(7,3)=(-((-(y(1)*params(5)*4))/(y(3)*y(3))));
g1(7,7)=1;
g1(8,5)=1-params(6);
g1(9,6)=1-params(7);
g1(10,1)=(-(1/y(1)));
g1(10,10)=1;
g1(11,3)=(-(1/y(3)));
g1(11,11)=1;
g1(12,2)=(-(1/y(2)));
g1(12,12)=1;
g1(13,4)=(-(1/y(4)));
g1(13,13)=1;
g1(14,8)=(-(1/y(8)));
g1(14,14)=1;
g1(15,9)=(-(1/y(9)));
g1(15,15)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
