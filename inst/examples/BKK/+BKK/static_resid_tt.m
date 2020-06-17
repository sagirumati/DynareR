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

assert(length(T) >= 36);

T(1) = (y(1)^params(4)*y(2)^(1-params(4)))^params(5);
T(2) = (y(12)^params(16)*y(13)^(1-params(16)))^params(17);
T(3) = y(3)^(1-params(6));
T(4) = y(11)^(1+params(7));
T(5) = (1-params(6))*(-y(23))/y(3);
T(6) = params(1)^2;
T(7) = params(1)^3;
T(8) = params(1)^4;
T(9) = params(8)*y(6)^((-params(7))-1);
T(10) = y(14)^(1-params(18));
T(11) = y(22)^(1+params(19));
T(12) = (-y(23))*(1-params(18))/y(14);
T(13) = params(13)^2;
T(14) = params(13)^3;
T(15) = params(13)^4;
T(16) = params(20)*y(17)^((-params(19))-1);
T(17) = y(23)*T(8);
T(18) = y(23)*T(15);
T(19) = params(6)*T(17)/y(5);
T(20) = y(5)^params(6);
T(21) = y(8)*T(20);
T(22) = T(3)*T(21);
T(23) = T(22)^(-params(7));
T(24) = T(4)*T(19)*T(23);
T(25) = params(18)*T(18)/y(16);
T(26) = y(16)^params(18);
T(27) = y(19)*T(26);
T(28) = T(10)*T(27);
T(29) = T(28)^(-params(19));
T(30) = T(11)*T(25)*T(29);
T(31) = params(8)*y(6)^(-params(7))+T(23);
T(32) = params(10)*y(23)*T(6);
T(33) = params(10)*y(23)*T(7);
T(34) = params(20)*y(17)^(-params(19))+T(29);
T(35) = params(22)*y(23)*T(13);
T(36) = params(22)*y(23)*T(14);

end
