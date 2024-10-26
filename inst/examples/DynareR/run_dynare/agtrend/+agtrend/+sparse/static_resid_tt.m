function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(1) = exp(y(9))*y(2)^(1-params(9));
T(2) = (y(6)*y(7))^params(9);
T(3) = y(1)-params(14)*y(7)^params(15);
T(4) = T(3)^(-params(2));
T(5) = params(15)*(-params(14))*y(7)^(params(15)-1);
T(6) = params(6)/2;
T(7) = T(6)*(y(6)-params(1))^2;
T(8) = y(2)*T(7);
T(9) = 1-params(5)+y(3)*(1-params(9))/y(2)+T(6)*(y(6)-params(1))*(y(6)+params(1));
T(10) = (T(8)+y(2)*y(6)-y(2)*(1-params(5)))/y(3);
end
