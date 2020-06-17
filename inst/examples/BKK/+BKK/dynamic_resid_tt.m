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

assert(length(T) >= 46);

T(1) = (y(21)^params(4)*y(22)^(1-params(4)))^params(5);
T(2) = (y(32)^params(16)*y(33)^(1-params(16)))^params(17);
T(3) = y(23)^(1-params(6));
T(4) = (1-params(6))*(-y(43))/y(23);
T(5) = y(31)^(1+params(7));
T(6) = params(1)^2;
T(7) = params(1)^3;
T(8) = params(1)^4;
T(9) = params(8)*y(26)^((-params(7))-1);
T(10) = y(65)^(1+params(7));
T(11) = y(34)^(1-params(18));
T(12) = (-y(43))*(1-params(18))/y(34);
T(13) = y(42)^(1+params(19));
T(14) = params(13)^2;
T(15) = params(13)^3;
T(16) = params(13)^4;
T(17) = params(20)*y(37)^((-params(19))-1);
T(18) = y(68)^(1+params(19));
T(19) = params(10)*T(6)*y(70);
T(20) = params(10)*T(7)*y(71);
T(21) = y(63)^(1-params(6));
T(22) = params(22)*T(14)*y(70);
T(23) = params(22)*T(15)*y(71);
T(24) = y(66)^(1-params(18));
T(25) = y(13)^params(6);
T(26) = y(28)*T(25);
T(27) = T(3)*T(26);
T(28) = T(27)^(-params(7));
T(29) = params(8)*y(3)^(-params(7))+T(28);
T(30) = y(18)^params(18);
T(31) = y(39)*T(30);
T(32) = T(11)*T(31);
T(33) = T(32)^(-params(19));
T(34) = params(20)*y(8)^(-params(19))+T(33);
T(35) = params(6)*y(69)*T(8)/y(12);
T(36) = y(12)^params(6);
T(37) = y(64)*T(36);
T(38) = T(21)*T(37);
T(39) = T(38)^(-params(7));
T(40) = T(35)*T(39);
T(41) = params(18)*y(69)*T(16)/y(17);
T(42) = y(17)^params(18);
T(43) = y(67)*T(42);
T(44) = T(24)*T(43);
T(45) = T(44)^(-params(19));
T(46) = T(41)*T(45);

end
