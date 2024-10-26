function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = agtrend.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 14
    T = [T; NaN(14 - size(T, 1), 1)];
end
T(11) = getPowerDeriv(T(3),1-params(2),1);
T(12) = getPowerDeriv(T(3),(-params(2)),1);
T(13) = getPowerDeriv(y(6)*y(7),params(9),1);
T(14) = (-(params(14)*getPowerDeriv(y(7),params(15),1)));
end
