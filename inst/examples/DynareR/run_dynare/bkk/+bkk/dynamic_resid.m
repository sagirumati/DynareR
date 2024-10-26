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
    T = bkk.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(42, 1);
    residual(1) = (y(31)) - (T(35)^((-1)/params(7)));
    residual(2) = (y(25)) - ((1-params(9))*y(2)+y(29));
    residual(3) = (y(27)) - (y(29)*params(10)+params(10)*y(5)+params(10)*y(15)+params(10)*y(14));
    residual(4) = (y(24)) - (y(23)+(1-params(3))*y(1));
    residual(5) = (y(22)) - (1-y(23)*params(2)-y(1)*params(3)*(1-params(2)));
    residual(6) = (T(5)*params(4)*params(11)/y(21)) - (y(43));
    residual(7) = ((-params(2))*T(5)*(1-params(4))*params(11)/y(22)) - (T(7)*T(6)*T(34));
    residual(8) = (params(10)*y(43)+params(10)*params(1)*y(69)+T(25)+T(26)-(1-params(9))*params(10)*params(1)*y(69)-(1-params(9))*T(25)-(1-params(9))*T(26)-(1-params(9))*params(10)*T(10)*y(72)) - (y(75));
    residual(9) = (y(43)) - (params(1)*y(69)*(1+T(11)*T(12)));
    residual(10) = (y(28)-1) - (params(12)*(y(4)-1)+params(25)*(y(9)-1)+x(it_, 1));
    residual(11) = (y(30)) - ((y(31)-(y(26)+y(27)+y(21)-y(3)))/y(31));
    residual(12) = (y(42)) - (T(40)^((-1)/params(19)));
    residual(13) = (y(36)) - ((1-params(21))*y(7)+y(40));
    residual(14) = (y(38)) - (y(40)*params(22)+params(22)*y(10)+params(22)*y(20)+params(22)*y(19));
    residual(15) = (y(35)) - (y(34)+(1-params(15))*y(6));
    residual(16) = (y(33)) - (1-y(34)*params(14)-y(6)*params(15)*(1-params(14)));
    residual(17) = (T(17)*params(16)*params(23)/y(32)) - (y(43));
    residual(18) = ((-params(14))*T(17)*(1-params(16))*params(23)/y(33)) - (T(19)*T(18)*T(39));
    residual(19) = (y(43)*params(22)+params(22)*y(69)*params(13)+T(28)+T(29)-(1-params(21))*params(22)*y(69)*params(13)-(1-params(21))*T(28)-(1-params(21))*T(29)-(1-params(21))*params(22)*T(22)*y(72)) - (y(78));
    residual(20) = (y(43)) - (y(69)*params(13)*(1+T(23)*T(24)));
    residual(21) = (y(39)-1) - ((y(9)-1)*params(24)+(y(4)-1)*params(26)+x(it_, 2));
    residual(22) = (y(41)) - ((y(42)-(y(37)+y(38)+y(32)-y(8)))/y(42));
    residual(23) = (y(37)+y(38)+y(26)+y(27)+y(21)-y(3)+y(32)-y(8)) - (y(31)+y(42));
    residual(24) = (y(44)) - (y(69));
    residual(25) = (y(45)) - (y(70));
    residual(26) = (y(46)) - (y(71));
    residual(27) = (y(47)) - (T(12)*T(46));
    residual(28) = (y(48)) - (y(73));
    residual(29) = (y(49)) - (y(74));
    residual(30) = (y(50)) - (T(24)*T(52));
    residual(31) = (y(51)) - (y(76));
    residual(32) = (y(52)) - (y(77));
    residual(33) = (y(53)) - (y(2));
    residual(34) = (y(54)) - (y(11));
    residual(35) = (y(55)) - (y(12));
    residual(36) = (y(56)) - (y(5));
    residual(37) = (y(57)) - (y(14));
    residual(38) = (y(58)) - (y(7));
    residual(39) = (y(59)) - (y(16));
    residual(40) = (y(60)) - (y(17));
    residual(41) = (y(61)) - (y(10));
    residual(42) = (y(62)) - (y(19));

end
