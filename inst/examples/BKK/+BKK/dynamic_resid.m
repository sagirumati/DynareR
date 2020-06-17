function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = BKK.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(42, 1);
lhs = y(31);
rhs = T(29)^((-1)/params(7));
residual(1) = lhs - rhs;
lhs = y(25);
rhs = (1-params(9))*y(2)+y(29);
residual(2) = lhs - rhs;
lhs = y(27);
rhs = y(29)*params(10)+params(10)*y(5)+params(10)*y(15)+params(10)*y(14);
residual(3) = lhs - rhs;
lhs = y(24);
rhs = y(23)+(1-params(3))*y(1);
residual(4) = lhs - rhs;
lhs = y(22);
rhs = 1-y(23)*params(2)-y(1)*params(3)*(1-params(2));
residual(5) = lhs - rhs;
lhs = params(4)*params(11)/y(21)*T(1);
rhs = y(43);
residual(6) = lhs - rhs;
lhs = T(1)*(1-params(4))*params(11)/y(22)*(-params(2));
rhs = T(5)*T(4)*T(28);
residual(7) = lhs - rhs;
lhs = params(10)*y(43)+params(10)*params(1)*y(69)+T(19)+T(20)-(1-params(9))*params(10)*params(1)*y(69)-(1-params(9))*T(19)-(1-params(9))*T(20)-(1-params(9))*params(10)*T(8)*y(72);
rhs = y(75);
residual(8) = lhs - rhs;
lhs = y(43);
rhs = params(1)*y(69)*(1+T(9)*T(10));
residual(9) = lhs - rhs;
lhs = y(28)-1;
rhs = params(12)*(y(4)-1)+params(25)*(y(9)-1)+x(it_, 1);
residual(10) = lhs - rhs;
lhs = y(30);
rhs = (y(31)-(y(26)+y(27)+y(21)-y(3)))/y(31);
residual(11) = lhs - rhs;
lhs = y(42);
rhs = T(34)^((-1)/params(19));
residual(12) = lhs - rhs;
lhs = y(36);
rhs = (1-params(21))*y(7)+y(40);
residual(13) = lhs - rhs;
lhs = y(38);
rhs = y(40)*params(22)+params(22)*y(10)+params(22)*y(20)+params(22)*y(19);
residual(14) = lhs - rhs;
lhs = y(35);
rhs = y(34)+(1-params(15))*y(6);
residual(15) = lhs - rhs;
lhs = y(33);
rhs = 1-y(34)*params(14)-y(6)*params(15)*(1-params(14));
residual(16) = lhs - rhs;
lhs = params(16)*params(23)/y(32)*T(2);
rhs = y(43);
residual(17) = lhs - rhs;
lhs = T(2)*(1-params(16))*params(23)/y(33)*(-params(14));
rhs = T(13)*T(12)*T(33);
residual(18) = lhs - rhs;
lhs = y(43)*params(22)+params(22)*y(69)*params(13)+T(22)+T(23)-(1-params(21))*params(22)*y(69)*params(13)-(1-params(21))*T(22)-(1-params(21))*T(23)-(1-params(21))*params(22)*T(16)*y(72);
rhs = y(78);
residual(19) = lhs - rhs;
lhs = y(43);
rhs = y(69)*params(13)*(1+T(17)*T(18));
residual(20) = lhs - rhs;
lhs = y(39)-1;
rhs = (y(9)-1)*params(24)+(y(4)-1)*params(26)+x(it_, 2);
residual(21) = lhs - rhs;
lhs = y(41);
rhs = (y(42)-(y(37)+y(38)+y(32)-y(8)))/y(42);
residual(22) = lhs - rhs;
lhs = y(37)+y(38)+y(26)+y(27)+y(21)-y(3)+y(32)-y(8);
rhs = y(31)+y(42);
residual(23) = lhs - rhs;
lhs = y(44);
rhs = y(69);
residual(24) = lhs - rhs;
lhs = y(45);
rhs = y(70);
residual(25) = lhs - rhs;
lhs = y(46);
rhs = y(71);
residual(26) = lhs - rhs;
lhs = y(47);
rhs = T(10)*T(40);
residual(27) = lhs - rhs;
lhs = y(48);
rhs = y(73);
residual(28) = lhs - rhs;
lhs = y(49);
rhs = y(74);
residual(29) = lhs - rhs;
lhs = y(50);
rhs = T(18)*T(46);
residual(30) = lhs - rhs;
lhs = y(51);
rhs = y(76);
residual(31) = lhs - rhs;
lhs = y(52);
rhs = y(77);
residual(32) = lhs - rhs;
lhs = y(53);
rhs = y(2);
residual(33) = lhs - rhs;
lhs = y(54);
rhs = y(11);
residual(34) = lhs - rhs;
lhs = y(55);
rhs = y(12);
residual(35) = lhs - rhs;
lhs = y(56);
rhs = y(5);
residual(36) = lhs - rhs;
lhs = y(57);
rhs = y(14);
residual(37) = lhs - rhs;
lhs = y(58);
rhs = y(7);
residual(38) = lhs - rhs;
lhs = y(59);
rhs = y(16);
residual(39) = lhs - rhs;
lhs = y(60);
rhs = y(17);
residual(40) = lhs - rhs;
lhs = y(61);
rhs = y(10);
residual(41) = lhs - rhs;
lhs = y(62);
rhs = y(19);
residual(42) = lhs - rhs;

end
