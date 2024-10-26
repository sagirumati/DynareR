function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = agtrend.static_resid_tt(T, y, x, params);
end
residual = zeros(15, 1);
    residual(1) = (y(3)) - (T(1)*T(2));
    residual(2) = (y(9)) - (y(9)*params(10)+params(11)*x(1));
    residual(3) = (log(y(6))) - ((1-params(3))*log(params(1))+log(y(6))*params(3)+params(4)*x(2));
    residual(4) = (y(8)) - (T(3)^(1-params(2))/(1-params(2)));
    residual(5) = (y(10)) - (T(4));
    residual(6) = (y(11)) - (T(4)*T(5));
    residual(7) = (y(12)) - (params(13)*y(6)^(1-params(2)));
    residual(8) = (y(1)+y(2)*y(6)) - (y(3)+y(2)*(1-params(5))-T(8)-y(4)+y(4)*y(6)*y(5));
    residual(9) = (1/y(5)) - (1+params(12)+params(7)*(exp(y(4)-params(8))-1));
    residual(10) = (y(6)*y(10)*(1+params(6)*(y(6)-params(1)))) - (y(10)*y(12)*T(9));
residual(11) = y(11)+y(3)*params(9)*y(10)/y(7);
    residual(12) = (y(5)*y(6)*y(10)) - (y(10)*y(12));
    residual(13) = (y(14)) - ((y(4)-y(4)*y(6)*y(5))/y(3));
    residual(14) = (y(13)) - (log(y(1)/y(3)));
    residual(15) = (y(15)) - (log(T(10)));

end
