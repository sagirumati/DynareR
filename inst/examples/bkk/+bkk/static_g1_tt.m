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

assert(length(T) >= 64);

T = bkk.static_resid_tt(T, y, x, params);

T(45) = getPowerDeriv(T(3),params(5),1);
T(46) = T(2)*getPowerDeriv(y(1),params(4),1)*T(45);
T(47) = T(45)*T(1)*getPowerDeriv(y(2),1-params(4),1);
T(48) = getPowerDeriv(y(3),1-params(6),1);
T(49) = getPowerDeriv(T(9)*T(11),(-params(7)),1);
T(50) = T(11)*T(48)*T(49);
T(51) = getPowerDeriv(T(13),(-1)/params(7),1);
T(52) = getPowerDeriv(T(9)*T(37),(-params(7)),1);
T(53) = getPowerDeriv(y(11),1+params(7),1);
T(54) = getPowerDeriv(T(7),params(17),1);
T(55) = T(6)*getPowerDeriv(y(12),params(16),1)*T(54);
T(56) = T(54)*T(5)*getPowerDeriv(y(13),1-params(16),1);
T(57) = getPowerDeriv(y(14),1-params(18),1);
T(58) = getPowerDeriv(T(22)*T(24),(-params(19)),1);
T(59) = T(24)*T(57)*T(58);
T(60) = getPowerDeriv(T(26),(-1)/params(19),1);
T(61) = getPowerDeriv(T(22)*T(42),(-params(19)),1);
T(62) = getPowerDeriv(y(22),1+params(19),1);
T(63) = T(49)*T(9)*y(8)*getPowerDeriv(y(35),params(6),1);
T(64) = T(58)*T(22)*y(19)*getPowerDeriv(y(40),params(18),1);

end
