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
    T = agtrend.static_g1_tt(T, y, x, params);
end
g1 = zeros(15, 15);
g1(1,2)=(-(T(2)*exp(y(9))*getPowerDeriv(y(2),1-params(9),1)));
g1(1,3)=1;
g1(1,6)=(-(T(1)*y(7)*T(13)));
g1(1,7)=(-(T(1)*y(6)*T(13)));
g1(1,9)=(-(T(1)*T(2)));
g1(2,9)=1-params(10);
g1(3,6)=1/y(6)-params(3)*1/y(6);
g1(4,1)=(-(T(11)/(1-params(2))));
g1(4,7)=(-(T(11)*T(14)/(1-params(2))));
g1(4,8)=1;
g1(5,1)=(-T(12));
g1(5,7)=(-(T(12)*T(14)));
g1(5,10)=1;
g1(6,1)=(-(T(5)*T(12)));
g1(6,7)=(-(T(5)*T(12)*T(14)+T(4)*params(15)*(-params(14))*getPowerDeriv(y(7),params(15)-1,1)));
g1(6,11)=1;
g1(7,6)=(-(params(13)*getPowerDeriv(y(6),1-params(2),1)));
g1(7,12)=1;
g1(8,1)=1;
g1(8,2)=y(6)-(1-params(5)-T(7));
g1(8,3)=(-1);
g1(8,4)=(-(y(6)*y(5)-1));
g1(8,5)=(-(y(6)*y(4)));
g1(8,6)=y(2)-(y(4)*y(5)-y(2)*T(6)*2*(y(6)-params(1)));
g1(9,4)=(-(params(7)*exp(y(4)-params(8))));
g1(9,5)=(-1)/(y(5)*y(5));
g1(10,2)=(-(y(10)*y(12)*(-(y(3)*(1-params(9))))/(y(2)*y(2))));
g1(10,3)=(-(y(10)*y(12)*(1-params(9))/y(2)));
g1(10,6)=y(10)*(1+params(6)*(y(6)-params(1)))+y(6)*y(10)*params(6)-y(10)*y(12)*(T(6)*(y(6)-params(1))+T(6)*(y(6)+params(1)));
g1(10,10)=y(6)*(1+params(6)*(y(6)-params(1)))-y(12)*T(9);
g1(10,12)=(-(y(10)*T(9)));
g1(11,3)=params(9)*y(10)/y(7);
g1(11,7)=(-(y(3)*params(9)*y(10)))/(y(7)*y(7));
g1(11,10)=y(3)*params(9)/y(7);
g1(11,11)=1;
g1(12,5)=y(6)*y(10);
g1(12,6)=y(10)*y(5);
g1(12,10)=y(6)*y(5)-y(12);
g1(12,12)=(-y(10));
g1(13,3)=(-((-(y(4)-y(4)*y(6)*y(5)))/(y(3)*y(3))));
g1(13,4)=(-((1-y(6)*y(5))/y(3)));
g1(13,5)=(-((-(y(6)*y(4)))/y(3)));
g1(13,6)=(-((-(y(4)*y(5)))/y(3)));
g1(13,14)=1;
g1(14,1)=(-(1/y(3)/(y(1)/y(3))));
g1(14,3)=(-((-y(1))/(y(3)*y(3))/(y(1)/y(3))));
g1(14,13)=1;
g1(15,2)=(-((T(7)+y(6)-(1-params(5)))/y(3)/T(10)));
g1(15,3)=(-((-(T(8)+y(2)*y(6)-y(2)*(1-params(5))))/(y(3)*y(3))/T(10)));
g1(15,6)=(-((y(2)+y(2)*T(6)*2*(y(6)-params(1)))/y(3)/T(10)));
g1(15,15)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
