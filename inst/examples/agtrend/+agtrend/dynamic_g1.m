function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = agtrend.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(15, 25);
g1(1,1)=(-(T(2)*exp(y(13))*getPowerDeriv(y(1),1-params(9),1)));
g1(1,7)=1;
g1(1,10)=(-(T(1)*y(11)*T(16)));
g1(1,11)=(-(T(1)*y(10)*T(16)));
g1(1,13)=(-(T(1)*T(2)));
g1(2,4)=(-params(10));
g1(2,13)=1;
g1(2,24)=(-params(11));
g1(3,3)=(-(params(3)*1/y(3)));
g1(3,10)=1/y(10);
g1(3,25)=(-params(4));
g1(4,5)=(-(T(13)/(1-params(2))));
g1(4,11)=(-(T(13)*T(17)/(1-params(2))));
g1(4,12)=1;
g1(5,5)=(-T(14));
g1(5,11)=(-(T(14)*T(17)));
g1(5,14)=1;
g1(6,5)=(-(T(5)*T(14)));
g1(6,11)=(-(T(5)*T(14)*T(17)+T(4)*params(15)*(-params(14))*getPowerDeriv(y(11),params(15)-1,1)));
g1(6,15)=1;
g1(7,10)=(-(params(13)*getPowerDeriv(y(10),1-params(2),1)));
g1(7,16)=1;
g1(8,5)=1;
g1(8,1)=(-(1-params(5)-(T(7)+y(1)*T(6)*(-(y(10)*y(6)))/(y(1)*y(1))*T(15))));
g1(8,6)=y(10)+y(1)*T(6)*T(15)*y(10)/y(1);
g1(8,7)=(-1);
g1(8,2)=1;
g1(8,8)=(-(y(10)*y(9)));
g1(8,9)=(-(y(10)*y(8)));
g1(8,10)=y(6)-(y(9)*y(8)-y(1)*T(6)*T(15)*y(6)/y(1));
g1(9,8)=(-(params(7)*exp(y(8)-params(8))));
g1(9,9)=(-1)/(y(9)*y(9));
g1(10,1)=y(10)*y(14)*params(6)*(-(y(10)*y(6)))/(y(1)*y(1));
g1(10,6)=y(10)*y(14)*params(6)*y(10)/y(1)-y(16)*y(23)*((-((1-params(9))*y(21)))/(y(6)*y(6))+T(10)*T(6)*(-(y(22)*y(20)))/(y(6)*y(6))+T(9)*(-(y(22)*y(20)))/(y(6)*y(6)));
g1(10,20)=(-(y(16)*y(23)*(T(10)*T(6)*y(22)/y(6)+T(9)*y(22)/y(6))));
g1(10,21)=(-(y(16)*y(23)*(1-params(9))/y(6)));
g1(10,10)=y(14)*(1+params(6)*(y(10)*y(6)/y(1)-params(1)))+y(10)*y(14)*params(6)*y(6)/y(1);
g1(10,22)=(-(y(16)*y(23)*(T(10)*T(6)*y(20)/y(6)+T(9)*y(20)/y(6))));
g1(10,14)=y(10)*(1+params(6)*(y(10)*y(6)/y(1)-params(1)));
g1(10,23)=(-(y(16)*T(11)));
g1(10,16)=(-(y(23)*T(11)));
g1(11,7)=params(9)*y(14)/y(11);
g1(11,11)=(-(y(7)*params(9)*y(14)))/(y(11)*y(11));
g1(11,14)=y(7)*params(9)/y(11);
g1(11,15)=1;
g1(12,9)=y(10)*y(14);
g1(12,10)=y(14)*y(9);
g1(12,14)=y(10)*y(9);
g1(12,23)=(-y(16));
g1(12,16)=(-y(23));
g1(13,7)=(-((-(y(2)-y(10)*y(9)*y(8)))/(y(7)*y(7))));
g1(13,2)=(-(1/y(7)));
g1(13,8)=(-((-(y(10)*y(9)))/y(7)));
g1(13,9)=(-((-(y(10)*y(8)))/y(7)));
g1(13,10)=(-((-(y(9)*y(8)))/y(7)));
g1(13,18)=1;
g1(14,5)=(-(1/y(7)/(y(5)/y(7))));
g1(14,7)=(-((-y(5))/(y(7)*y(7))/(y(5)/y(7))));
g1(14,17)=1;
g1(15,1)=(-((T(7)+y(1)*T(6)*(-(y(10)*y(6)))/(y(1)*y(1))*T(15)-(1-params(5)))/y(7)/T(12)));
g1(15,6)=(-((y(10)+y(1)*T(6)*T(15)*y(10)/y(1))/y(7)/T(12)));
g1(15,7)=(-((-(T(8)+y(10)*y(6)-y(1)*(1-params(5))))/(y(7)*y(7))/T(12)));
g1(15,10)=(-((y(6)+y(1)*T(6)*T(15)*y(6)/y(1))/y(7)/T(12)));
g1(15,19)=1;

end
