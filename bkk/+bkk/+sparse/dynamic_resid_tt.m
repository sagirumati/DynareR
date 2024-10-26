function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 52
    T = [T; NaN(52 - size(T, 1), 1)];
end
T(1) = y(45)^(1-params(6));
T(2) = y(43)^params(4);
T(3) = y(44)^(1-params(4));
T(4) = T(2)*T(3);
T(5) = T(4)^params(5);
T(6) = (1-params(6))*(-y(65))/y(45);
T(7) = y(53)^(1+params(7));
T(8) = params(1)^2;
T(9) = params(1)^3;
T(10) = params(1)^4;
T(11) = params(8)*y(48)^((-params(7))-1);
T(12) = y(95)^(1+params(7));
T(13) = y(56)^(1-params(18));
T(14) = y(54)^params(16);
T(15) = y(55)^(1-params(16));
T(16) = T(14)*T(15);
T(17) = T(16)^params(17);
T(18) = (-y(65))*(1-params(18))/y(56);
T(19) = y(64)^(1+params(19));
T(20) = params(13)^2;
T(21) = params(13)^3;
T(22) = params(13)^4;
T(23) = params(20)*y(59)^((-params(19))-1);
T(24) = y(106)^(1+params(19));
T(25) = params(10)*T(8)*y(108);
T(26) = params(10)*T(9)*y(109);
T(27) = y(87)^(1-params(6));
T(28) = params(22)*T(20)*y(108);
T(29) = params(22)*T(21)*y(109);
T(30) = y(98)^(1-params(18));
T(31) = y(35)^params(6);
T(32) = y(50)*T(31);
T(33) = T(1)*T(32);
T(34) = T(33)^(-params(7));
T(35) = params(8)*y(6)^(-params(7))+T(34);
T(36) = y(40)^params(18);
T(37) = y(61)*T(36);
T(38) = T(13)*T(37);
T(39) = T(38)^(-params(19));
T(40) = params(20)*y(17)^(-params(19))+T(39);
T(41) = params(6)*y(107)*T(10)/y(34);
T(42) = y(34)^params(6);
T(43) = y(92)*T(42);
T(44) = T(27)*T(43);
T(45) = T(44)^(-params(7));
T(46) = T(41)*T(45);
T(47) = params(18)*y(107)*T(22)/y(39);
T(48) = y(39)^params(18);
T(49) = y(103)*T(48);
T(50) = T(30)*T(49);
T(51) = T(50)^(-params(19));
T(52) = T(47)*T(51);
end