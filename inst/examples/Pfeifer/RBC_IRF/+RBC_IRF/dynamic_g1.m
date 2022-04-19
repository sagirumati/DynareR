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
    T = RBC_IRF.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(15, 23);
g1(1,5)=getPowerDeriv(y(5),(-params(3)),1);
g1(1,19)=(-(T(3)*params(1)/params(8)*getPowerDeriv(y(19),(-params(3)),1)));
g1(1,6)=(-(T(1)*params(5)*exp(y(21))*1/y(20)*T(7)));
g1(1,20)=(-(T(1)*params(5)*exp(y(21))*T(7)*(-y(6))/(y(20)*y(20))));
g1(1,21)=(-(T(1)*T(2)));
g1(2,5)=params(2)*getPowerDeriv(y(5),params(3),1)/(1-y(7));
g1(2,7)=T(4)/((1-y(7))*(1-y(7)));
g1(2,11)=(-1);
g1(3,1)=(-(1-params(4)));
g1(3,6)=params(8);
g1(3,12)=(-1);
g1(4,4)=1;
g1(4,5)=(-1);
g1(4,9)=(-(params(14)*exp(y(9))));
g1(4,12)=(-1);
g1(5,4)=1;
g1(5,1)=(-(T(6)*exp(y(8))*getPowerDeriv(y(1),params(5),1)));
g1(5,7)=(-(T(5)*getPowerDeriv(y(7),1-params(5),1)));
g1(5,8)=(-(T(5)*T(6)));
g1(6,4)=(-((1-params(5))/y(7)));
g1(6,7)=(-((-(y(4)*(1-params(5))))/(y(7)*y(7))));
g1(6,11)=1;
g1(7,4)=(-(params(5)*4/y(1)));
g1(7,1)=(-((-(y(4)*params(5)*4))/(y(1)*y(1))));
g1(7,10)=1;
g1(8,2)=(-params(6));
g1(8,8)=1;
g1(8,22)=(-1);
g1(9,3)=(-params(7));
g1(9,9)=1;
g1(9,23)=(-1);
g1(10,4)=(-(1/y(4)));
g1(10,13)=1;
g1(11,6)=(-(1/y(6)));
g1(11,14)=1;
g1(12,5)=(-(1/y(5)));
g1(12,15)=1;
g1(13,7)=(-(1/y(7)));
g1(13,16)=1;
g1(14,11)=(-(1/y(11)));
g1(14,17)=1;
g1(15,12)=(-(1/y(12)));
g1(15,18)=1;

end
