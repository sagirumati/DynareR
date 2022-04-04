function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = example1.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
v2 = zeros(48,3);
v2(1,1)=1;
v2(2,1)=1;
v2(3,1)=1;
v2(4,1)=2;
v2(5,1)=2;
v2(6,1)=2;
v2(7,1)=2;
v2(8,1)=2;
v2(9,1)=2;
v2(10,1)=2;
v2(11,1)=2;
v2(12,1)=2;
v2(13,1)=2;
v2(14,1)=2;
v2(15,1)=2;
v2(16,1)=2;
v2(17,1)=2;
v2(18,1)=2;
v2(19,1)=2;
v2(20,1)=2;
v2(21,1)=2;
v2(22,1)=2;
v2(23,1)=2;
v2(24,1)=2;
v2(25,1)=2;
v2(26,1)=2;
v2(27,1)=2;
v2(28,1)=2;
v2(29,1)=2;
v2(30,1)=2;
v2(31,1)=2;
v2(32,1)=2;
v2(33,1)=2;
v2(34,1)=2;
v2(35,1)=3;
v2(36,1)=3;
v2(37,1)=3;
v2(38,1)=3;
v2(39,1)=3;
v2(40,1)=3;
v2(41,1)=3;
v2(42,1)=3;
v2(43,1)=3;
v2(44,1)=4;
v2(45,1)=4;
v2(46,1)=4;
v2(47,1)=4;
v2(48,1)=4;
v2(1,2)=64;
v2(2,2)=103;
v2(3,2)=106;
v2(4,2)=131;
v2(5,2)=66;
v2(6,2)=137;
v2(7,2)=150;
v2(8,2)=135;
v2(9,2)=122;
v2(10,2)=138;
v2(11,2)=164;
v2(12,2)=67;
v2(13,2)=145;
v2(14,2)=62;
v2(15,2)=75;
v2(16,2)=65;
v2(17,2)=117;
v2(18,2)=68;
v2(19,2)=159;
v2(20,2)=151;
v2(21,2)=146;
v2(22,2)=81;
v2(23,2)=149;
v2(24,2)=123;
v2(25,2)=152;
v2(26,2)=165;
v2(27,2)=79;
v2(28,2)=118;
v2(29,2)=82;
v2(30,2)=160;
v2(31,2)=121;
v2(32,2)=124;
v2(33,2)=163;
v2(34,2)=166;
v2(35,2)=1;
v2(36,2)=7;
v2(37,2)=85;
v2(38,2)=8;
v2(39,2)=99;
v2(40,2)=91;
v2(41,2)=92;
v2(42,2)=105;
v2(43,2)=106;
v2(44,2)=51;
v2(45,2)=116;
v2(46,2)=65;
v2(47,2)=117;
v2(48,2)=121;
v2(1,3)=params(5)*T(12);
v2(2,3)=v2(1,3);
v2(3,3)=y(5)*params(5)*getPowerDeriv(y(8),1+params(6),2);
v2(4,3)=(-(params(1)*params(3)*exp(y(12))*T(7)));
v2(5,3)=v2(4,3);
v2(6,3)=(-(params(1)*params(3)*exp(y(12))*T(9)));
v2(7,3)=v2(6,3);
v2(8,3)=(-(params(1)*T(2)*params(3)*exp(y(12))));
v2(9,3)=v2(8,3);
v2(10,3)=(-(params(1)*(T(2)*params(3)*exp(y(12))+params(3)*exp(y(12))*T(14))));
v2(11,3)=v2(10,3);
v2(12,3)=(-(params(1)*T(3)*(-(exp(y(9))*exp(y(12))))/T(8)));
v2(13,3)=v2(12,3);
v2(14,3)=(-(params(1)*(1-params(4))*T(7)));
v2(15,3)=v2(14,3);
v2(16,3)=(-(params(1)*T(3)*T(7)));
v2(17,3)=v2(16,3);
v2(18,3)=(-(params(1)*(params(3)*exp(y(12))*y(10)*T(7)+T(3)*(-(exp(y(9))*exp(y(12))*y(11)))/T(8))));
v2(19,3)=v2(18,3);
v2(20,3)=(-(params(1)*T(3)*(-((-(y(5)*exp(y(9))*exp(y(12))))*(exp(y(12))*exp(y(12))*y(11)+exp(y(12))*exp(y(12))*y(11))))/(T(8)*T(8))));
v2(21,3)=(-(params(1)*(1-params(4))*T(9)));
v2(22,3)=v2(21,3);
v2(23,3)=(-(params(1)*T(3)*T(9)));
v2(24,3)=v2(23,3);
v2(25,3)=(-(params(1)*(params(3)*exp(y(12))*y(10)*T(9)+T(3)*((-(y(5)*exp(y(9))*exp(y(12))))*T(8)-(-(y(5)*exp(y(9))*exp(y(12))))*(T(8)+T(8)))/(T(8)*T(8)))));
v2(26,3)=v2(25,3);
v2(27,3)=(-(params(1)*T(2)*(1-params(4))));
v2(28,3)=v2(27,3);
v2(29,3)=(-(params(1)*(1-params(4))*T(14)));
v2(30,3)=v2(29,3);
v2(31,3)=(-(params(1)*T(2)*T(3)));
v2(32,3)=(-(params(1)*(T(3)*T(14)+T(2)*params(3)*exp(y(12))*y(10))));
v2(33,3)=v2(32,3);
v2(34,3)=(-(params(1)*(params(3)*exp(y(12))*y(10)*T(14)+T(3)*(T(8)*(-(y(5)*exp(y(9))*exp(y(12))*y(11)))-(-(y(5)*exp(y(9))*exp(y(12))*y(11)))*(T(8)+T(8)))/(T(8)*T(8))+T(2)*params(3)*exp(y(12))*y(10)+params(3)*exp(y(12))*y(10)*T(14))));
v2(35,3)=(-(T(5)*exp(y(7))*getPowerDeriv(y(1),params(3),2)));
v2(36,3)=T(11);
v2(37,3)=v2(36,3);
v2(38,3)=(-(T(10)*T(13)));
v2(39,3)=v2(38,3);
v2(40,3)=(-T(6));
v2(41,3)=(-(T(4)*T(13)));
v2(42,3)=v2(41,3);
v2(43,3)=(-(T(4)*getPowerDeriv(y(8),1-params(3),2)));
v2(44,3)=(-exp(y(9)));
v2(45,3)=v2(44,3);
v2(46,3)=exp(y(9));
v2(47,3)=v2(46,3);
v2(48,3)=(-(exp(y(9))*(y(4)-y(5))));
g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,196);
end
