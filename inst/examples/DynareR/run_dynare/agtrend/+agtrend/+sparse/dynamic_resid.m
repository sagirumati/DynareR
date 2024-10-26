function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = agtrend.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(15, 1);
    residual(1) = (y(18)) - (T(1)*T(2));
    residual(2) = (y(24)) - (params(10)*y(9)+params(11)*x(1));
    residual(3) = (log(y(21))) - ((1-params(3))*log(params(1))+params(3)*log(y(6))+params(4)*x(2));
    residual(4) = (y(23)) - (T(3)^(1-params(2))/(1-params(2)));
    residual(5) = (y(25)) - (T(4));
    residual(6) = (y(26)) - (T(4)*T(5));
    residual(7) = (y(27)) - (params(13)*y(21)^(1-params(2)));
    residual(8) = (y(16)+y(21)*y(17)) - (y(18)+y(2)*(1-params(5))-T(8)-y(4)+y(21)*y(20)*y(19));
    residual(9) = (1/y(20)) - (1+params(12)+params(7)*(exp(y(19)-params(8))-1));
    residual(10) = (y(21)*y(25)*(1+params(6)*(y(21)*y(17)/y(2)-params(1)))) - (y(27)*y(40)*T(11));
residual(11) = y(26)+y(18)*params(9)*y(25)/y(22);
    residual(12) = (y(20)*y(21)*y(25)) - (y(27)*y(40));
    residual(13) = (y(29)) - ((y(4)-y(21)*y(20)*y(19))/y(18));
    residual(14) = (y(28)) - (log(y(16)/y(18)));
    residual(15) = (y(30)) - (log(T(12)));
end
