function y = set_auxiliary_variables(y, x, params)
%
% Computes auxiliary variables of the static model
%
y(24)=y(23);
y(25)=y(24);
y(26)=y(25);
y(27)=y(11)^(1+params(7))*params(6)*y(23)*params(1)^4/y(5)*(y(3)^(1-params(6))*y(8)*y(5)^params(6))^(-params(7));
y(28)=y(27);
y(29)=y(28);
y(30)=y(22)^(1+params(19))*params(18)*y(23)*params(13)^4/y(16)*(y(14)^(1-params(18))*y(19)*y(16)^params(18))^(-params(19));
y(31)=y(30);
y(32)=y(31);
y(33)=y(5);
y(34)=y(33);
y(35)=y(34);
y(36)=y(9);
y(37)=y(36);
y(38)=y(16);
y(39)=y(38);
y(40)=y(39);
y(41)=y(20);
y(42)=y(41);
end
