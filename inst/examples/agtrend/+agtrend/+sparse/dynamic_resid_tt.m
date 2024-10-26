function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(1) = exp(y(24))*y(2)^(1-params(9));
T(2) = (y(21)*y(22))^params(9);
T(3) = y(16)-params(14)*y(22)^params(15);
T(4) = T(3)^(-params(2));
T(5) = params(15)*(-params(14))*y(22)^(params(15)-1);
T(6) = params(6)/2;
T(7) = T(6)*(y(21)*y(17)/y(2)-params(1))^2;
T(8) = y(2)*T(7);
T(9) = T(6)*(y(36)*y(32)/y(17)-params(1));
T(10) = params(1)+y(36)*y(32)/y(17);
T(11) = 1-params(5)+(1-params(9))*y(33)/y(17)+T(9)*T(10);
T(12) = (T(8)+y(21)*y(17)-y(2)*(1-params(5)))/y(18);
end
