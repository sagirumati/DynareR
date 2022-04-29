function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 62);

T = BKK.static_resid_tt(T, y, x, params);

T(43) = getPowerDeriv(T(3),params(5),1);
T(44) = T(2)*getPowerDeriv(y(1),params(4),1)*T(43);
T(45) = T(43)*T(1)*getPowerDeriv(y(2),1-params(4),1);
T(46) = getPowerDeriv(T(28),(-params(7)),1);
T(47) = T(27)*getPowerDeriv(y(3),1-params(6),1)*T(46);
T(48) = getPowerDeriv(T(37),(-1)/params(7),1);
T(49) = T(46)*T(9)*y(8)*getPowerDeriv(y(5),params(6),1);
T(50) = (-(T(10)*(T(29)*(-(params(6)*T(23)))/(y(5)*y(5))+T(25)*T(49))));
T(51) = getPowerDeriv(y(11),1+params(7),1);
T(52) = getPowerDeriv(T(7),params(17),1);
T(53) = T(6)*getPowerDeriv(y(12),params(16),1)*T(52);
T(54) = T(52)*T(5)*getPowerDeriv(y(13),1-params(16),1);
T(55) = getPowerDeriv(T(34),(-params(19)),1);
T(56) = T(33)*getPowerDeriv(y(14),1-params(18),1)*T(55);
T(57) = getPowerDeriv(T(40),(-1)/params(19),1);
T(58) = T(55)*T(16)*y(19)*getPowerDeriv(y(16),params(18),1);
T(59) = (-(T(17)*(T(35)*(-(params(18)*T(24)))/(y(16)*y(16))+T(31)*T(58))));
T(60) = getPowerDeriv(y(22),1+params(19),1);
T(61) = (-(T(10)*T(29)*params(6)*T(14)/y(5)));
T(62) = (-(T(17)*T(35)*params(18)*T(21)/y(16)));

end
