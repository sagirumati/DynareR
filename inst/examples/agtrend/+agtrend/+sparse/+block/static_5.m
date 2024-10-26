function [y, T] = static_5(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(13)=log(y(1)/y(3));
  y(15)=log((y(2)*T(8)+y(2)*y(6)-y(2)*(1-params(5)))/y(3));
  y(14)=(y(4)-y(4)*y(6)*y(5))/y(3);
  y(8)=T(2)^(1-params(2))/(1-params(2));
end
