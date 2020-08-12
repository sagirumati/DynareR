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
    T = BKK.static_resid_tt(T, y, x, params);
end
residual = zeros(42, 1);
lhs = y(11);
rhs = T(31)^((-1)/params(7));
residual(1) = lhs - rhs;
lhs = y(5);
rhs = y(5)*(1-params(9))+y(9);
residual(2) = lhs - rhs;
lhs = y(7);
rhs = y(9)*params(10)+y(9)*params(10)+y(9)*params(10)+y(9)*params(10);
residual(3) = lhs - rhs;
lhs = y(4);
rhs = y(3)+y(4)*(1-params(3));
residual(4) = lhs - rhs;
lhs = y(2);
rhs = 1-y(3)*params(2)-y(4)*params(3)*(1-params(2));
residual(5) = lhs - rhs;
lhs = params(4)*params(11)/y(1)*T(1);
rhs = y(23);
residual(6) = lhs - rhs;
lhs = T(1)*(1-params(4))*params(11)/y(2)*(-params(2));
rhs = T(4)*T(5)*T(23);
residual(7) = lhs - rhs;
lhs = params(10)*y(23)+params(10)*y(23)*params(1)+T(32)+T(33)-(1-params(9))*params(10)*y(23)*params(1)-(1-params(9))*T(32)-(1-params(9))*T(33)-(1-params(9))*params(10)*T(17);
rhs = T(24);
residual(8) = lhs - rhs;
lhs = y(23);
rhs = y(23)*params(1)*(1+T(4)*T(9));
residual(9) = lhs - rhs;
lhs = y(8)-1;
rhs = (y(8)-1)*params(12)+params(25)*(y(19)-1)+x(1);
residual(10) = lhs - rhs;
lhs = y(10);
rhs = (y(11)-(y(1)+y(7)))/y(11);
residual(11) = lhs - rhs;
lhs = y(22);
rhs = T(34)^((-1)/params(19));
residual(12) = lhs - rhs;
lhs = y(16);
rhs = y(16)*(1-params(21))+y(20);
residual(13) = lhs - rhs;
lhs = y(18);
rhs = y(20)*params(22)+y(20)*params(22)+y(20)*params(22)+y(20)*params(22);
residual(14) = lhs - rhs;
lhs = y(15);
rhs = y(14)+y(15)*(1-params(15));
residual(15) = lhs - rhs;
lhs = y(13);
rhs = 1-y(14)*params(14)-y(15)*params(15)*(1-params(14));
residual(16) = lhs - rhs;
lhs = params(16)*params(23)/y(12)*T(2);
rhs = y(23);
residual(17) = lhs - rhs;
lhs = T(2)*(1-params(16))*params(23)/y(13)*(-params(14));
rhs = T(11)*T(12)*T(29);
residual(18) = lhs - rhs;
lhs = y(23)*params(22)+params(22)*y(23)*params(13)+T(35)+T(36)-(1-params(21))*params(22)*y(23)*params(13)-(1-params(21))*T(35)-(1-params(21))*T(36)-(1-params(21))*params(22)*T(18);
rhs = T(30);
residual(19) = lhs - rhs;
lhs = y(23);
rhs = y(23)*params(13)*(1+T(11)*T(16));
residual(20) = lhs - rhs;
lhs = y(19)-1;
rhs = (y(19)-1)*params(24)+(y(8)-1)*params(26)+x(2);
residual(21) = lhs - rhs;
lhs = y(21);
rhs = (y(22)-(y(12)+y(18)))/y(22);
residual(22) = lhs - rhs;
lhs = y(18)+y(12)+y(1)+y(7);
rhs = y(11)+y(22);
residual(23) = lhs - rhs;
lhs = y(24);
rhs = y(23);
residual(24) = lhs - rhs;
lhs = y(25);
rhs = y(23);
residual(25) = lhs - rhs;
lhs = y(26);
rhs = y(23);
residual(26) = lhs - rhs;
lhs = y(27);
rhs = T(24);
residual(27) = lhs - rhs;
lhs = y(28);
rhs = T(24);
residual(28) = lhs - rhs;
lhs = y(29);
rhs = T(24);
residual(29) = lhs - rhs;
lhs = y(30);
rhs = T(30);
residual(30) = lhs - rhs;
lhs = y(31);
rhs = T(30);
residual(31) = lhs - rhs;
lhs = y(32);
rhs = T(30);
residual(32) = lhs - rhs;
lhs = y(33);
rhs = y(5);
residual(33) = lhs - rhs;
lhs = y(34);
rhs = y(5);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(5);
residual(35) = lhs - rhs;
lhs = y(36);
rhs = y(9);
residual(36) = lhs - rhs;
lhs = y(37);
rhs = y(9);
residual(37) = lhs - rhs;
lhs = y(38);
rhs = y(16);
residual(38) = lhs - rhs;
lhs = y(39);
rhs = y(16);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(16);
residual(40) = lhs - rhs;
lhs = y(41);
rhs = y(20);
residual(41) = lhs - rhs;
lhs = y(42);
rhs = y(20);
residual(42) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
