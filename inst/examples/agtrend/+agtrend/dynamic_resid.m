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
    residual(1) = (y(7)) - (T(1)*T(2));
    residual(2) = (y(13)) - (params(10)*y(4)+params(11)*x(it_, 1));
    residual(3) = (log(y(10))) - ((1-params(3))*log(params(1))+params(3)*log(y(3))+params(4)*x(it_, 2));
    residual(4) = (y(12)) - (T(3)^(1-params(2))/(1-params(2)));
    residual(5) = (y(14)) - (T(4));
    residual(6) = (y(15)) - (T(4)*T(5));
    residual(7) = (y(16)) - (params(13)*y(10)^(1-params(2)));
    residual(8) = (y(5)+y(10)*y(6)) - (y(7)+y(1)*(1-params(5))-T(8)-y(2)+y(10)*y(9)*y(8));
    residual(9) = (1/y(9)) - (1+params(12)+params(7)*(exp(y(8)-params(8))-1));
    residual(10) = (y(10)*y(14)*(1+params(6)*(y(10)*y(6)/y(1)-params(1)))) - (y(16)*y(23)*T(11));
residual(11) = y(15)+y(7)*params(9)*y(14)/y(11);
    residual(12) = (y(9)*y(10)*y(14)) - (y(16)*y(23));
    residual(13) = (y(18)) - ((y(2)-y(10)*y(9)*y(8))/y(7));
    residual(14) = (y(17)) - (log(y(5)/y(7)));
    residual(15) = (y(19)) - (log(T(12)));

end
