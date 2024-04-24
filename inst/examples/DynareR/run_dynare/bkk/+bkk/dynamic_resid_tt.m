function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 52);

T(1) = y(23)^(1-params(6));
T(2) = y(21)^params(4);
T(3) = y(22)^(1-params(4));
T(4) = T(2)*T(3);
T(5) = T(4)^params(5);
T(6) = (1-params(6))*(-y(43))/y(23);
T(7) = y(31)^(1+params(7));
T(8) = params(1)^2;
T(9) = params(1)^3;
T(10) = params(1)^4;
T(11) = params(8)*y(26)^((-params(7))-1);
T(12) = y(65)^(1+params(7));
T(13) = y(34)^(1-params(18));
T(14) = y(32)^params(16);
T(15) = y(33)^(1-params(16));
T(16) = T(14)*T(15);
T(17) = T(16)^params(17);
T(18) = (-y(43))*(1-params(18))/y(34);
T(19) = y(42)^(1+params(19));
T(20) = params(13)^2;
T(21) = params(13)^3;
T(22) = params(13)^4;
T(23) = params(20)*y(37)^((-params(19))-1);
T(24) = y(68)^(1+params(19));
T(25) = params(10)*T(8)*y(70);
T(26) = params(10)*T(9)*y(71);
T(27) = y(63)^(1-params(6));
T(28) = params(22)*T(20)*y(70);
T(29) = params(22)*T(21)*y(71);
T(30) = y(66)^(1-params(18));
T(31) = y(13)^params(6);
T(32) = y(28)*T(31);
T(33) = T(1)*T(32);
T(34) = T(33)^(-params(7));
T(35) = params(8)*y(3)^(-params(7))+T(34);
T(36) = y(18)^params(18);
T(37) = y(39)*T(36);
T(38) = T(13)*T(37);
T(39) = T(38)^(-params(19));
T(40) = params(20)*y(8)^(-params(19))+T(39);
T(41) = params(6)*y(69)*T(10)/y(12);
T(42) = y(12)^params(6);
T(43) = y(64)*T(42);
T(44) = T(27)*T(43);
T(45) = T(44)^(-params(7));
T(46) = T(41)*T(45);
T(47) = params(18)*y(69)*T(22)/y(17);
T(48) = y(17)^params(18);
T(49) = y(67)*T(48);
T(50) = T(30)*T(49);
T(51) = T(50)^(-params(19));
T(52) = T(47)*T(51);

end
