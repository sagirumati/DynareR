function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 44);

T(1) = y(1)^params(4);
T(2) = y(2)^(1-params(4));
T(3) = T(1)*T(2);
T(4) = T(3)^params(5);
T(5) = y(12)^params(16);
T(6) = y(13)^(1-params(16));
T(7) = T(5)*T(6);
T(8) = T(7)^params(17);
T(9) = y(3)^(1-params(6));
T(10) = y(35)^params(6);
T(11) = y(8)*T(10);
T(12) = (T(9)*T(11))^(-params(7));
T(13) = params(8)*y(6)^(-params(7))+T(12);
T(14) = y(11)^(1+params(7));
T(15) = (1-params(6))*(-y(23))/y(3);
T(16) = params(1)^2;
T(17) = params(10)*T(16)*y(24);
T(18) = params(1)^3;
T(19) = params(10)*T(18)*y(25);
T(20) = params(1)^4;
T(21) = params(8)*y(6)^((-params(7))-1);
T(22) = y(14)^(1-params(18));
T(23) = y(40)^params(18);
T(24) = y(19)*T(23);
T(25) = (T(22)*T(24))^(-params(19));
T(26) = params(20)*y(17)^(-params(19))+T(25);
T(27) = y(22)^(1+params(19));
T(28) = (-y(23))*(1-params(18))/y(14);
T(29) = params(13)^2;
T(30) = params(22)*y(24)*T(29);
T(31) = params(13)^3;
T(32) = params(22)*y(25)*T(31);
T(33) = params(13)^4;
T(34) = params(20)*y(17)^((-params(19))-1);
T(35) = params(6)*y(23)*T(20)/y(34);
T(36) = y(34)^params(6);
T(37) = y(8)*T(36);
T(38) = (T(9)*T(37))^(-params(7));
T(39) = T(35)*T(38);
T(40) = params(18)*y(23)*T(33)/y(39);
T(41) = y(39)^params(18);
T(42) = y(19)*T(41);
T(43) = (T(22)*T(42))^(-params(19));
T(44) = T(40)*T(43);

end
