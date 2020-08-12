function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = BKK.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(42, 80);
g1(1,23)=(-(T(55)*T(56)));
g1(1,3)=(-(T(56)*params(8)*getPowerDeriv(y(3),(-params(7)),1)));
g1(1,28)=(-(T(56)*T(54)*T(3)*T(25)));
g1(1,31)=1;
g1(1,13)=(-(T(56)*T(67)));
g1(2,2)=(-(1-params(9)));
g1(2,25)=1;
g1(2,29)=(-1);
g1(3,27)=1;
g1(3,5)=(-params(10));
g1(3,29)=(-params(10));
g1(3,14)=(-params(10));
g1(3,15)=(-params(10));
g1(4,23)=(-1);
g1(4,1)=(-(1-params(3)));
g1(4,24)=1;
g1(5,22)=1;
g1(5,23)=params(2);
g1(5,1)=params(3)*(1-params(2));
g1(6,21)=T(1)*(-(params(4)*params(11)))/(y(21)*y(21))+params(4)*params(11)/y(21)*T(52);
g1(6,22)=params(4)*params(11)/y(21)*T(53);
g1(6,43)=(-1);
g1(7,21)=(-params(2))*(1-params(4))*params(11)/y(22)*T(52);
g1(7,22)=(-params(2))*((1-params(4))*params(11)/y(22)*T(53)+T(1)*(-((1-params(4))*params(11)))/(y(22)*y(22)));
g1(7,23)=(-(T(5)*(T(28)*(-((1-params(6))*(-y(43))))/(y(23)*y(23))+T(4)*T(55))));
g1(7,28)=(-(T(5)*T(4)*T(54)*T(3)*T(25)));
g1(7,31)=(-(T(4)*T(28)*getPowerDeriv(y(31),1+params(7),1)));
g1(7,43)=(-(T(5)*T(28)*(-(1-params(6)))/y(23)));
g1(7,13)=(-(T(5)*T(4)*T(67)));
g1(8,43)=params(10);
g1(8,69)=params(10)*params(1)-(1-params(9))*params(10)*params(1);
g1(8,70)=params(10)*T(6)-(1-params(9))*params(10)*T(6);
g1(8,71)=params(10)*T(7)-(1-params(9))*params(10)*T(7);
g1(8,72)=(-((1-params(9))*params(10)*T(8)));
g1(8,75)=(-1);
g1(9,26)=(-(params(1)*y(69)*T(10)*params(8)*getPowerDeriv(y(26),(-params(7))-1,1)));
g1(9,65)=(-(params(1)*y(69)*T(9)*T(58)));
g1(9,43)=1;
g1(9,69)=(-(params(1)*(1+T(9)*T(10))));
g1(10,4)=(-params(12));
g1(10,28)=1;
g1(10,79)=(-1);
g1(10,9)=(-params(25));
g1(11,21)=(-((-1)/y(31)));
g1(11,3)=(-(1/y(31)));
g1(11,26)=(-((-1)/y(31)));
g1(11,27)=(-((-1)/y(31)));
g1(11,30)=1;
g1(11,31)=(-((y(31)-(y(31)-(y(26)+y(27)+y(21)-y(3))))/(y(31)*y(31))));
g1(12,34)=(-(T(63)*T(64)));
g1(12,8)=(-(T(64)*params(20)*getPowerDeriv(y(8),(-params(19)),1)));
g1(12,39)=(-(T(64)*T(62)*T(11)*T(30)));
g1(12,42)=1;
g1(12,18)=(-(T(64)*T(68)));
g1(13,7)=(-(1-params(21)));
g1(13,36)=1;
g1(13,40)=(-1);
g1(14,38)=1;
g1(14,10)=(-params(22));
g1(14,40)=(-params(22));
g1(14,19)=(-params(22));
g1(14,20)=(-params(22));
g1(15,34)=(-1);
g1(15,6)=(-(1-params(15)));
g1(15,35)=1;
g1(16,33)=1;
g1(16,34)=params(14);
g1(16,6)=params(15)*(1-params(14));
g1(17,32)=T(2)*(-(params(16)*params(23)))/(y(32)*y(32))+params(16)*params(23)/y(32)*T(60);
g1(17,33)=params(16)*params(23)/y(32)*T(61);
g1(17,43)=(-1);
g1(18,32)=(-params(14))*(1-params(16))*params(23)/y(33)*T(60);
g1(18,33)=(-params(14))*((1-params(16))*params(23)/y(33)*T(61)+T(2)*(-((1-params(16))*params(23)))/(y(33)*y(33)));
g1(18,34)=(-(T(13)*(T(33)*(-((-y(43))*(1-params(18))))/(y(34)*y(34))+T(12)*T(63))));
g1(18,39)=(-(T(13)*T(12)*T(62)*T(11)*T(30)));
g1(18,42)=(-(T(12)*T(33)*getPowerDeriv(y(42),1+params(19),1)));
g1(18,43)=(-(T(13)*T(33)*(-(1-params(18)))/y(34)));
g1(18,18)=(-(T(13)*T(12)*T(68)));
g1(19,43)=params(22);
g1(19,69)=params(22)*params(13)-(1-params(21))*params(22)*params(13);
g1(19,70)=params(22)*T(14)-(1-params(21))*params(22)*T(14);
g1(19,71)=params(22)*T(15)-(1-params(21))*params(22)*T(15);
g1(19,72)=(-((1-params(21))*params(22)*T(16)));
g1(19,78)=(-1);
g1(20,37)=(-(y(69)*params(13)*T(18)*params(20)*getPowerDeriv(y(37),(-params(19))-1,1)));
g1(20,68)=(-(y(69)*params(13)*T(17)*T(66)));
g1(20,43)=1;
g1(20,69)=(-(params(13)*(1+T(17)*T(18))));
g1(21,4)=(-params(26));
g1(21,9)=(-params(24));
g1(21,39)=1;
g1(21,80)=(-1);
g1(22,32)=(-((-1)/y(42)));
g1(22,8)=(-(1/y(42)));
g1(22,37)=(-((-1)/y(42)));
g1(22,38)=(-((-1)/y(42)));
g1(22,41)=1;
g1(22,42)=(-((y(42)-(y(42)-(y(37)+y(38)+y(32)-y(8))))/(y(42)*y(42))));
g1(23,21)=1;
g1(23,3)=(-1);
g1(23,26)=1;
g1(23,27)=1;
g1(23,31)=(-1);
g1(23,32)=1;
g1(23,8)=(-1);
g1(23,37)=1;
g1(23,38)=1;
g1(23,42)=(-1);
g1(24,69)=(-1);
g1(24,44)=1;
g1(25,70)=(-1);
g1(25,45)=1;
g1(26,71)=(-1);
g1(26,46)=1;
g1(27,63)=(-(T(10)*T(35)*T(37)*getPowerDeriv(y(63),1-params(6),1)*T(57)));
g1(27,64)=(-(T(10)*T(35)*T(57)*T(21)*T(36)));
g1(27,65)=(-(T(40)*T(58)));
g1(27,69)=(-(T(10)*T(39)*params(6)*T(8)/y(12)));
g1(27,47)=1;
g1(27,12)=(-(T(10)*(T(39)*(-(params(6)*y(69)*T(8)))/(y(12)*y(12))+T(35)*T(57)*T(21)*y(64)*getPowerDeriv(y(12),params(6),1))));
g1(28,73)=(-1);
g1(28,48)=1;
g1(29,74)=(-1);
g1(29,49)=1;
g1(30,66)=(-(T(18)*T(41)*T(43)*getPowerDeriv(y(66),1-params(18),1)*T(65)));
g1(30,67)=(-(T(18)*T(41)*T(65)*T(24)*T(42)));
g1(30,68)=(-(T(46)*T(66)));
g1(30,69)=(-(T(18)*T(45)*params(18)*T(16)/y(17)));
g1(30,50)=1;
g1(30,17)=(-(T(18)*(T(45)*(-(params(18)*y(69)*T(16)))/(y(17)*y(17))+T(41)*T(65)*T(24)*y(67)*getPowerDeriv(y(17),params(18),1))));
g1(31,76)=(-1);
g1(31,51)=1;
g1(32,77)=(-1);
g1(32,52)=1;
g1(33,2)=(-1);
g1(33,53)=1;
g1(34,11)=(-1);
g1(34,54)=1;
g1(35,12)=(-1);
g1(35,55)=1;
g1(36,5)=(-1);
g1(36,56)=1;
g1(37,14)=(-1);
g1(37,57)=1;
g1(38,7)=(-1);
g1(38,58)=1;
g1(39,16)=(-1);
g1(39,59)=1;
g1(40,17)=(-1);
g1(40,60)=1;
g1(41,10)=(-1);
g1(41,61)=1;
g1(42,19)=(-1);
g1(42,62)=1;

end
