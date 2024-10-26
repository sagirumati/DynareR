function [y, T] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(28)=log(y(16)/y(18));
  y(30)=log((y(2)*T(5)+y(21)*y(17)-y(2)*(1-params(5)))/y(18));
  y(29)=(y(4)-y(21)*y(20)*y(19))/y(18);
  y(23)=T(1)^(1-params(2))/(1-params(2));
end
