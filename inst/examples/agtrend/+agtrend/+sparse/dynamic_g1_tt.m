function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = agtrend.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 17
    T = [T; NaN(17 - size(T, 1), 1)];
end
T(13) = getPowerDeriv(T(3),1-params(2),1);
T(14) = getPowerDeriv(T(3),(-params(2)),1);
T(15) = 2*(y(21)*y(17)/y(2)-params(1));
T(16) = getPowerDeriv(y(21)*y(22),params(9),1);
T(17) = (-(params(14)*getPowerDeriv(y(22),params(15),1)));
end
