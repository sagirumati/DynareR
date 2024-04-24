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
    T = agtrend.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(15, 1);
lhs = y(7);
rhs = T(1)*T(2);
residual(1) = lhs - rhs;
lhs = y(13);
rhs = params(10)*y(4)+params(11)*x(it_, 1);
residual(2) = lhs - rhs;
lhs = log(y(10));
rhs = (1-params(3))*log(params(1))+params(3)*log(y(3))+params(4)*x(it_, 2);
residual(3) = lhs - rhs;
lhs = y(12);
rhs = T(3)^(1-params(2))/(1-params(2));
residual(4) = lhs - rhs;
lhs = y(14);
rhs = T(4);
residual(5) = lhs - rhs;
lhs = y(15);
rhs = T(4)*T(5);
residual(6) = lhs - rhs;
lhs = y(16);
rhs = params(13)*y(10)^(1-params(2));
residual(7) = lhs - rhs;
lhs = y(5)+y(10)*y(6);
rhs = y(7)+y(1)*(1-params(5))-T(8)-y(2)+y(10)*y(9)*y(8);
residual(8) = lhs - rhs;
lhs = 1/y(9);
rhs = 1+params(12)+params(7)*(exp(y(8)-params(8))-1);
residual(9) = lhs - rhs;
lhs = y(10)*y(14)*(1+params(6)*(y(10)*y(6)/y(1)-params(1)));
rhs = y(16)*y(23)*T(11);
residual(10) = lhs - rhs;
residual(11) = y(15)+y(7)*params(9)*y(14)/y(11);
lhs = y(9)*y(10)*y(14);
rhs = y(16)*y(23);
residual(12) = lhs - rhs;
lhs = y(18);
rhs = (y(2)-y(10)*y(9)*y(8))/y(7);
residual(13) = lhs - rhs;
lhs = y(17);
rhs = log(y(5)/y(7));
residual(14) = lhs - rhs;
lhs = y(19);
rhs = log(T(12));
residual(15) = lhs - rhs;

end
