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
    T = bkk.static_resid_tt(T, y, x, params);
end
residual = zeros(42, 1);
    residual(1) = (y(11)) - (T(13)^((-1)/params(7)));
    residual(2) = (y(5)) - (y(5)*(1-params(9))+y(9));
    residual(3) = (y(7)) - (y(9)*params(10)+y(9)*params(10)+params(10)*y(37)+params(10)*y(36));
    residual(4) = (y(4)) - (y(3)+y(4)*(1-params(3)));
    residual(5) = (y(2)) - (1-y(3)*params(2)-y(4)*params(3)*(1-params(2)));
    residual(6) = (T(4)*params(4)*params(11)/y(1)) - (y(23));
    residual(7) = ((-params(2))*T(4)*(1-params(4))*params(11)/y(2)) - (T(14)*T(12)*T(15));
    residual(8) = (params(10)*y(23)+params(10)*y(23)*params(1)+T(17)+T(19)-(1-params(9))*params(10)*y(23)*params(1)-(1-params(9))*T(17)-(1-params(9))*T(19)-(1-params(9))*params(10)*T(20)*y(26)) - (y(29));
    residual(9) = (y(23)) - (y(23)*params(1)*(1+T(14)*T(21)));
    residual(10) = (y(8)-1) - ((y(8)-1)*params(12)+params(25)*(y(19)-1)+x(1));
    residual(11) = (y(10)) - ((y(11)-(y(1)+y(7)))/y(11));
    residual(12) = (y(22)) - (T(26)^((-1)/params(19)));
    residual(13) = (y(16)) - (y(16)*(1-params(21))+y(20));
    residual(14) = (y(18)) - (y(20)*params(22)+y(20)*params(22)+params(22)*y(42)+params(22)*y(41));
    residual(15) = (y(15)) - (y(14)+y(15)*(1-params(15)));
    residual(16) = (y(13)) - (1-y(14)*params(14)-y(15)*params(15)*(1-params(14)));
    residual(17) = (T(8)*params(16)*params(23)/y(12)) - (y(23));
    residual(18) = ((-params(14))*T(8)*(1-params(16))*params(23)/y(13)) - (T(27)*T(25)*T(28));
    residual(19) = (y(23)*params(22)+params(22)*y(23)*params(13)+T(30)+T(32)-(1-params(21))*params(22)*y(23)*params(13)-(1-params(21))*T(30)-(1-params(21))*T(32)-(1-params(21))*params(22)*y(26)*T(33)) - (y(32));
    residual(20) = (y(23)) - (y(23)*params(13)*(1+T(27)*T(34)));
    residual(21) = (y(19)-1) - ((y(19)-1)*params(24)+(y(8)-1)*params(26)+x(2));
    residual(22) = (y(21)) - ((y(22)-(y(12)+y(18)))/y(22));
    residual(23) = (y(18)+y(12)+y(1)+y(7)) - (y(11)+y(22));
    residual(24) = (y(24)) - (y(23));
    residual(25) = (y(25)) - (y(24));
    residual(26) = (y(26)) - (y(25));
    residual(27) = (y(27)) - (T(14)*T(39));
    residual(28) = (y(28)) - (y(27));
    residual(29) = (y(29)) - (y(28));
    residual(30) = (y(30)) - (T(27)*T(44));
    residual(31) = (y(31)) - (y(30));
    residual(32) = (y(32)) - (y(31));
    residual(33) = (y(33)) - (y(5));
    residual(34) = (y(34)) - (y(33));
    residual(35) = (y(35)) - (y(34));
    residual(36) = (y(36)) - (y(9));
    residual(37) = (y(37)) - (y(36));
    residual(38) = (y(38)) - (y(16));
    residual(39) = (y(39)) - (y(38));
    residual(40) = (y(40)) - (y(39));
    residual(41) = (y(41)) - (y(20));
    residual(42) = (y(42)) - (y(41));

end
