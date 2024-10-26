function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = bkk.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 70
    T = [T; NaN(70 - size(T, 1), 1)];
end
T(53) = getPowerDeriv(T(4),params(5),1);
T(54) = T(3)*getPowerDeriv(y(43),params(4),1)*T(53);
T(55) = T(53)*T(2)*getPowerDeriv(y(44),1-params(4),1);
T(56) = getPowerDeriv(T(33),(-params(7)),1);
T(57) = T(32)*getPowerDeriv(y(45),1-params(6),1)*T(56);
T(58) = getPowerDeriv(T(35),(-1)/params(7),1);
T(59) = getPowerDeriv(T(44),(-params(7)),1);
T(60) = getPowerDeriv(y(95),1+params(7),1);
T(61) = getPowerDeriv(T(16),params(17),1);
T(62) = T(15)*getPowerDeriv(y(54),params(16),1)*T(61);
T(63) = T(61)*T(14)*getPowerDeriv(y(55),1-params(16),1);
T(64) = getPowerDeriv(T(38),(-params(19)),1);
T(65) = T(37)*getPowerDeriv(y(56),1-params(18),1)*T(64);
T(66) = getPowerDeriv(T(40),(-1)/params(19),1);
T(67) = getPowerDeriv(T(50),(-params(19)),1);
T(68) = getPowerDeriv(y(106),1+params(19),1);
T(69) = T(56)*T(1)*y(50)*getPowerDeriv(y(35),params(6),1);
T(70) = T(64)*T(13)*y(61)*getPowerDeriv(y(40),params(18),1);
end
