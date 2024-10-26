function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = bkk.static_g1_tt(T, y, x, params);
end
g1 = zeros(42, 42);
g1(1,3)=(-(T(50)*T(51)));
g1(1,6)=(-(T(51)*params(8)*getPowerDeriv(y(6),(-params(7)),1)));
g1(1,8)=(-(T(51)*T(49)*T(9)*T(10)));
g1(1,11)=1;
g1(1,35)=(-(T(51)*T(63)));
g1(2,5)=1-(1-params(9));
g1(2,9)=(-1);
g1(3,7)=1;
g1(3,9)=(-(params(10)+params(10)));
g1(3,36)=(-params(10));
g1(3,37)=(-params(10));
g1(4,3)=(-1);
g1(4,4)=1-(1-params(3));
g1(5,2)=1;
g1(5,3)=params(2);
g1(5,4)=params(3)*(1-params(2));
g1(6,1)=params(4)*params(11)/y(1)*T(46)+T(4)*(-(params(4)*params(11)))/(y(1)*y(1));
g1(6,2)=params(4)*params(11)/y(1)*T(47);
g1(6,23)=(-1);
g1(7,1)=(-params(2))*(1-params(4))*params(11)/y(2)*T(46);
g1(7,2)=(-params(2))*((1-params(4))*params(11)/y(2)*T(47)+T(4)*(-((1-params(4))*params(11)))/(y(2)*y(2)));
g1(7,3)=(-(T(14)*(T(15)*T(50)+T(12)*(-((1-params(6))*(-y(23))))/(y(3)*y(3)))));
g1(7,8)=(-(T(14)*T(15)*T(49)*T(9)*T(10)));
g1(7,11)=(-(T(12)*T(15)*T(53)));
g1(7,23)=(-(T(14)*T(12)*(-(1-params(6)))/y(3)));
g1(7,35)=(-(T(14)*T(15)*T(63)));
g1(8,23)=params(10)+params(10)*params(1)-(1-params(9))*params(10)*params(1);
g1(8,24)=params(10)*T(16)-(1-params(9))*params(10)*T(16);
g1(8,25)=params(10)*T(18)-(1-params(9))*params(10)*T(18);
g1(8,26)=(-((1-params(9))*params(10)*T(20)));
g1(8,29)=(-1);
g1(9,6)=(-(y(23)*params(1)*T(14)*params(8)*getPowerDeriv(y(6),(-params(7))-1,1)));
g1(9,11)=(-(y(23)*params(1)*T(21)*T(53)));
g1(9,23)=1-params(1)*(1+T(14)*T(21));
g1(10,8)=1-params(12);
g1(10,19)=(-params(25));
g1(11,1)=(-((-1)/y(11)));
g1(11,7)=(-((-1)/y(11)));
g1(11,10)=1;
g1(11,11)=(-((y(11)-(y(11)-(y(1)+y(7))))/(y(11)*y(11))));
g1(12,14)=(-(T(59)*T(60)));
g1(12,17)=(-(T(60)*params(20)*getPowerDeriv(y(17),(-params(19)),1)));
g1(12,19)=(-(T(60)*T(58)*T(22)*T(23)));
g1(12,22)=1;
g1(12,40)=(-(T(60)*T(64)));
g1(13,16)=1-(1-params(21));
g1(13,20)=(-1);
g1(14,18)=1;
g1(14,20)=(-(params(22)+params(22)));
g1(14,41)=(-params(22));
g1(14,42)=(-params(22));
g1(15,14)=(-1);
g1(15,15)=1-(1-params(15));
g1(16,13)=1;
g1(16,14)=params(14);
g1(16,15)=params(15)*(1-params(14));
g1(17,12)=params(16)*params(23)/y(12)*T(55)+T(8)*(-(params(16)*params(23)))/(y(12)*y(12));
g1(17,13)=params(16)*params(23)/y(12)*T(56);
g1(17,23)=(-1);
g1(18,12)=(-params(14))*(1-params(16))*params(23)/y(13)*T(55);
g1(18,13)=(-params(14))*((1-params(16))*params(23)/y(13)*T(56)+T(8)*(-((1-params(16))*params(23)))/(y(13)*y(13)));
g1(18,14)=(-(T(27)*(T(28)*T(59)+T(25)*(-((-y(23))*(1-params(18))))/(y(14)*y(14)))));
g1(18,19)=(-(T(27)*T(28)*T(58)*T(22)*T(23)));
g1(18,22)=(-(T(25)*T(28)*T(62)));
g1(18,23)=(-(T(27)*T(25)*(-(1-params(18)))/y(14)));
g1(18,40)=(-(T(27)*T(28)*T(64)));
g1(19,23)=params(22)+params(22)*params(13)-(1-params(21))*params(22)*params(13);
g1(19,24)=params(22)*T(29)-(1-params(21))*params(22)*T(29);
g1(19,25)=params(22)*T(31)-(1-params(21))*params(22)*T(31);
g1(19,26)=(-((1-params(21))*params(22)*T(33)));
g1(19,32)=(-1);
g1(20,17)=(-(y(23)*params(13)*T(27)*params(20)*getPowerDeriv(y(17),(-params(19))-1,1)));
g1(20,22)=(-(y(23)*params(13)*T(34)*T(62)));
g1(20,23)=1-params(13)*(1+T(27)*T(34));
g1(21,8)=(-params(26));
g1(21,19)=1-params(24);
g1(22,12)=(-((-1)/y(22)));
g1(22,18)=(-((-1)/y(22)));
g1(22,21)=1;
g1(22,22)=(-((y(22)-(y(22)-(y(12)+y(18))))/(y(22)*y(22))));
g1(23,1)=1;
g1(23,7)=1;
g1(23,11)=(-1);
g1(23,12)=1;
g1(23,18)=1;
g1(23,22)=(-1);
g1(24,23)=(-1);
g1(24,24)=1;
g1(25,24)=(-1);
g1(25,25)=1;
g1(26,25)=(-1);
g1(26,26)=1;
g1(27,3)=(-(T(14)*T(35)*T(37)*T(48)*T(52)));
g1(27,8)=(-(T(14)*T(35)*T(52)*T(9)*T(36)));
g1(27,11)=(-(T(39)*T(53)));
g1(27,23)=(-(T(14)*T(38)*params(6)*T(20)/y(34)));
g1(27,27)=1;
g1(27,34)=(-(T(14)*(T(38)*(-(params(6)*y(23)*T(20)))/(y(34)*y(34))+T(35)*T(52)*T(9)*y(8)*getPowerDeriv(y(34),params(6),1))));
g1(28,27)=(-1);
g1(28,28)=1;
g1(29,28)=(-1);
g1(29,29)=1;
g1(30,14)=(-(T(27)*T(40)*T(42)*T(57)*T(61)));
g1(30,19)=(-(T(27)*T(40)*T(61)*T(22)*T(41)));
g1(30,22)=(-(T(44)*T(62)));
g1(30,23)=(-(T(27)*T(43)*params(18)*T(33)/y(39)));
g1(30,30)=1;
g1(30,39)=(-(T(27)*(T(43)*(-(params(18)*y(23)*T(33)))/(y(39)*y(39))+T(40)*T(61)*T(22)*y(19)*getPowerDeriv(y(39),params(18),1))));
g1(31,30)=(-1);
g1(31,31)=1;
g1(32,31)=(-1);
g1(32,32)=1;
g1(33,5)=(-1);
g1(33,33)=1;
g1(34,33)=(-1);
g1(34,34)=1;
g1(35,34)=(-1);
g1(35,35)=1;
g1(36,9)=(-1);
g1(36,36)=1;
g1(37,36)=(-1);
g1(37,37)=1;
g1(38,16)=(-1);
g1(38,38)=1;
g1(39,38)=(-1);
g1(39,39)=1;
g1(40,39)=(-1);
g1(40,40)=1;
g1(41,20)=(-1);
g1(41,41)=1;
g1(42,41)=(-1);
g1(42,42)=1;

end
