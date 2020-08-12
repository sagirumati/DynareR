function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 68);

T = BKK.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(47) = y(21)^params(4);
T(48) = y(22)^(1-params(4));
T(49) = y(32)^params(16);
T(50) = y(33)^(1-params(16));
T(51) = getPowerDeriv(T(47)*T(48),params(5),1);
T(52) = T(48)*getPowerDeriv(y(21),params(4),1)*T(51);
T(53) = T(51)*T(47)*getPowerDeriv(y(22),1-params(4),1);
T(54) = getPowerDeriv(T(27),(-params(7)),1);
T(55) = T(26)*getPowerDeriv(y(23),1-params(6),1)*T(54);
T(56) = getPowerDeriv(T(29),(-1)/params(7),1);
T(57) = getPowerDeriv(T(38),(-params(7)),1);
T(58) = getPowerDeriv(y(65),1+params(7),1);
T(59) = getPowerDeriv(T(49)*T(50),params(17),1);
T(60) = T(50)*getPowerDeriv(y(32),params(16),1)*T(59);
T(61) = T(59)*T(49)*getPowerDeriv(y(33),1-params(16),1);
T(62) = getPowerDeriv(T(32),(-params(19)),1);
T(63) = T(31)*getPowerDeriv(y(34),1-params(18),1)*T(62);
T(64) = getPowerDeriv(T(34),(-1)/params(19),1);
T(65) = getPowerDeriv(T(44),(-params(19)),1);
T(66) = getPowerDeriv(y(68),1+params(19),1);
T(67) = T(54)*T(3)*y(28)*getPowerDeriv(y(13),params(6),1);
T(68) = T(62)*T(11)*y(39)*getPowerDeriv(y(18),params(18),1);

end
