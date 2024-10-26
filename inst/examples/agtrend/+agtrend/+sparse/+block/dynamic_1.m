function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(24)=params(10)*y(9)+params(11)*x(1);
end
