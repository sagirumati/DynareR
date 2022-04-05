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

assert(length(T) >= 42);

T(1) = y(1)^params(4);
T(2) = y(2)^(1-params(4));
T(3) = T(1)*T(2);
T(4) = T(3)^params(5);
T(5) = y(12)^params(16);
T(6) = y(13)^(1-params(16));
T(7) = T(5)*T(6);
T(8) = T(7)^params(17);
T(9) = y(3)^(1-params(6));
T(10) = y(11)^(1+params(7));
T(11) = (1-params(6))*(-y(23))/y(3);
T(12) = params(1)^2;
T(13) = params(1)^3;
T(14) = params(1)^4;
T(15) = params(8)*y(6)^((-params(7))-1);
T(16) = y(14)^(1-params(18));
T(17) = y(22)^(1+params(19));
T(18) = (-y(23))*(1-params(18))/y(14);
T(19) = params(13)^2;
T(20) = params(13)^3;
T(21) = params(13)^4;
T(22) = params(20)*y(17)^((-params(19))-1);
T(23) = y(23)*T(14);
T(24) = y(23)*T(21);
T(25) = params(6)*T(23)/y(5);
T(26) = y(5)^params(6);
T(27) = y(8)*T(26);
T(28) = T(9)*T(27);
T(29) = T(28)^(-params(7));
T(30) = T(10)*T(25)*T(29);
T(31) = params(18)*T(24)/y(16);
T(32) = y(16)^params(18);
T(33) = y(19)*T(32);
T(34) = T(16)*T(33);
T(35) = T(34)^(-params(19));
T(36) = T(17)*T(31)*T(35);
T(37) = params(8)*y(6)^(-params(7))+T(29);
T(38) = params(10)*y(23)*T(12);
T(39) = params(10)*y(23)*T(13);
T(40) = params(20)*y(17)^(-params(19))+T(35);
T(41) = params(22)*y(23)*T(19);
T(42) = params(22)*y(23)*T(20);

end
