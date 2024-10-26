function [y, T] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(12)=params(13)*y(6)^(1-params(2));
end
