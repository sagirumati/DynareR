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

assert(length(T) >= 60);

T = BKK.static_resid_tt(T, y, x, params);

T(37) = y(1)^params(4);
T(38) = y(2)^(1-params(4));
T(39) = y(12)^params(16);
T(40) = y(13)^(1-params(16));
T(41) = getPowerDeriv(T(37)*T(38),params(5),1);
T(42) = T(38)*getPowerDeriv(y(1),params(4),1)*T(41);
T(43) = T(41)*T(37)*getPowerDeriv(y(2),1-params(4),1);
T(44) = getPowerDeriv(T(22),(-params(7)),1);
T(45) = T(21)*getPowerDeriv(y(3),1-params(6),1)*T(44);
T(46) = getPowerDeriv(T(31),(-1)/params(7),1);
T(47) = T(44)*T(3)*y(8)*getPowerDeriv(y(5),params(6),1);
T(48) = (-(T(4)*(T(23)*(-(params(6)*T(17)))/(y(5)*y(5))+T(19)*T(47))));
T(49) = getPowerDeriv(y(11),1+params(7),1);
T(50) = getPowerDeriv(T(39)*T(40),params(17),1);
T(51) = T(40)*getPowerDeriv(y(12),params(16),1)*T(50);
T(52) = T(50)*T(39)*getPowerDeriv(y(13),1-params(16),1);
T(53) = getPowerDeriv(T(28),(-params(19)),1);
T(54) = T(27)*getPowerDeriv(y(14),1-params(18),1)*T(53);
T(55) = getPowerDeriv(T(34),(-1)/params(19),1);
T(56) = T(53)*T(10)*y(19)*getPowerDeriv(y(16),params(18),1);
T(57) = (-(T(11)*(T(29)*(-(params(18)*T(18)))/(y(16)*y(16))+T(25)*T(56))));
T(58) = getPowerDeriv(y(22),1+params(19),1);
T(59) = (-(T(4)*T(23)*params(6)*T(8)/y(5)));
T(60) = (-(T(11)*T(29)*params(18)*T(15)/y(16)));

end
