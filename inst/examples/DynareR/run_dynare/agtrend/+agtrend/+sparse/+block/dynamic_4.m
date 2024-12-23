function [y, T, residual, g1] = dynamic_4(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  T(1)=y(16)-params(14)*y(22)^params(15);
  T(2)=T(1)^(-params(2));
  residual(1)=(y(25))-(T(2));
  T(3)=params(15)*(-params(14))*y(22)^(params(15)-1);
  residual(2)=(y(26))-(T(2)*T(3));
  T(4)=exp(y(19)-params(8));
  residual(3)=(1/y(20))-(1+params(12)+params(7)*(T(4)-1));
  residual(4)=(y(26)+y(18)*params(9)*y(25)/y(22))-(0);
  T(5)=params(6)/2*(y(21)*y(17)/y(2)-params(1))^2;
  residual(5)=(y(16)+y(21)*y(17))-(y(18)+y(2)*(1-params(5))-y(2)*T(5)-y(4)+y(21)*y(20)*y(19));
  T(6)=1-params(5)+(1-params(9))*y(33)/y(17)+params(6)/2*(y(36)*y(32)/y(17)-params(1))*(params(1)+y(36)*y(32)/y(17));
  residual(6)=(y(21)*y(25)*(1+params(6)*(y(21)*y(17)/y(2)-params(1))))-(y(27)*y(40)*T(6));
  residual(7)=(y(20)*y(21)*y(25))-(y(27)*y(40));
  T(7)=exp(y(24));
  T(8)=T(7)*y(2)^(1-params(9));
  T(9)=(y(21)*y(22))^params(9);
  residual(8)=(y(18))-(T(8)*T(9));
  T(10)=getPowerDeriv(T(1),(-params(2)),1);
  T(11)=T(10)*(-(params(14)*getPowerDeriv(y(22),params(15),1)));
if nargout > 3
    g1_v = NaN(31, 1);
g1_v(1)=1;
g1_v(2)=(-(1-params(5)-(T(5)+y(2)*params(6)/2*(-(y(21)*y(17)))/(y(2)*y(2))*2*(y(21)*y(17)/y(2)-params(1)))));
g1_v(3)=y(21)*y(25)*params(6)*(-(y(21)*y(17)))/(y(2)*y(2));
g1_v(4)=(-(T(9)*T(7)*getPowerDeriv(y(2),1-params(9),1)));
g1_v(5)=(-T(11));
g1_v(6)=(-(T(3)*T(11)+T(2)*params(15)*(-params(14))*getPowerDeriv(y(22),params(15)-1,1)));
g1_v(7)=(-(y(18)*params(9)*y(25)))/(y(22)*y(22));
g1_v(8)=(-(T(8)*y(21)*getPowerDeriv(y(21)*y(22),params(9),1)));
g1_v(9)=(-T(10));
g1_v(10)=(-(T(3)*T(10)));
g1_v(11)=1;
g1_v(12)=(-1)/(y(20)*y(20));
g1_v(13)=(-(y(21)*y(19)));
g1_v(14)=y(21)*y(25);
g1_v(15)=1;
g1_v(16)=1;
g1_v(17)=(-(params(7)*T(4)));
g1_v(18)=(-(y(21)*y(20)));
g1_v(19)=y(21)+y(2)*params(6)/2*2*(y(21)*y(17)/y(2)-params(1))*y(21)/y(2);
g1_v(20)=y(21)*y(25)*params(6)*y(21)/y(2)-y(27)*y(40)*((-((1-params(9))*y(33)))/(y(17)*y(17))+(params(1)+y(36)*y(32)/y(17))*params(6)/2*(-(y(36)*y(32)))/(y(17)*y(17))+params(6)/2*(y(36)*y(32)/y(17)-params(1))*(-(y(36)*y(32)))/(y(17)*y(17)));
g1_v(21)=1;
g1_v(22)=y(18)*params(9)/y(22);
g1_v(23)=y(21)*(1+params(6)*(y(21)*y(17)/y(2)-params(1)));
g1_v(24)=y(21)*y(20);
g1_v(25)=params(9)*y(25)/y(22);
g1_v(26)=(-1);
g1_v(27)=1;
g1_v(28)=(-(y(27)*y(40)*((params(1)+y(36)*y(32)/y(17))*params(6)/2*y(36)/y(17)+params(6)/2*(y(36)*y(32)/y(17)-params(1))*y(36)/y(17))));
g1_v(29)=(-(y(27)*T(6)));
g1_v(30)=(-y(27));
g1_v(31)=(-(y(27)*y(40)*(1-params(9))/y(17)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 24);
end
end
