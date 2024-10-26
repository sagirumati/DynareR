function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  residual(1)=(y(5)*y(6)*y(10))-(y(10)*y(12));
  T(2)=y(1)-params(14)*y(7)^params(15);
  T(3)=T(2)^(-params(2));
  residual(2)=(y(10))-(T(3));
  T(4)=params(15)*(-params(14))*y(7)^(params(15)-1);
  residual(3)=(y(11))-(T(3)*T(4));
  T(5)=exp(y(9));
  T(6)=T(5)*y(2)^(1-params(9));
  T(7)=(y(6)*y(7))^params(9);
  residual(4)=(y(3))-(T(6)*T(7));
  T(8)=params(6)/2*(y(6)-params(1))^2;
  residual(5)=(y(1)+y(2)*y(6))-(y(3)+y(2)*(1-params(5))-y(2)*T(8)-y(4)+y(4)*y(6)*y(5));
  T(9)=exp(y(4)-params(8));
  residual(6)=(1/y(5))-(1+params(12)+params(7)*(T(9)-1));
  residual(7)=(y(6)*y(10)*(1+params(6)*(y(6)-params(1))))-(y(10)*y(12)*(1-params(5)+y(3)*(1-params(9))/y(2)+params(6)/2*(y(6)-params(1))*(y(6)+params(1))));
  residual(8)=(y(11)+y(3)*params(9)*y(10)/y(7))-(0);
  T(10)=getPowerDeriv(T(2),(-params(2)),1);
  T(11)=T(10)*(-(params(14)*getPowerDeriv(y(7),params(15),1)));
if nargout > 3
    g1_v = NaN(25, 1);
g1_v(1)=y(6)*y(10);
g1_v(2)=(-(y(6)*y(4)));
g1_v(3)=(-1)/(y(5)*y(5));
g1_v(4)=y(6)*y(5)-y(12);
g1_v(5)=1;
g1_v(6)=y(6)*(1+params(6)*(y(6)-params(1)))-y(12)*(1-params(5)+y(3)*(1-params(9))/y(2)+params(6)/2*(y(6)-params(1))*(y(6)+params(1)));
g1_v(7)=y(3)*params(9)/y(7);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=(-(T(7)*T(5)*getPowerDeriv(y(2),1-params(9),1)));
g1_v(11)=y(6)-(1-params(5)-T(8));
g1_v(12)=(-(y(10)*y(12)*(-(y(3)*(1-params(9))))/(y(2)*y(2))));
g1_v(13)=(-T(10));
g1_v(14)=(-(T(4)*T(10)));
g1_v(15)=1;
g1_v(16)=(-(y(6)*y(5)-1));
g1_v(17)=(-(params(7)*T(9)));
g1_v(18)=1;
g1_v(19)=(-1);
g1_v(20)=(-(y(10)*y(12)*(1-params(9))/y(2)));
g1_v(21)=params(9)*y(10)/y(7);
g1_v(22)=(-T(11));
g1_v(23)=(-(T(4)*T(11)+T(3)*params(15)*(-params(14))*getPowerDeriv(y(7),params(15)-1,1)));
g1_v(24)=(-(T(6)*y(6)*getPowerDeriv(y(6)*y(7),params(9),1)));
g1_v(25)=(-(y(3)*params(9)*y(10)))/(y(7)*y(7));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
end
