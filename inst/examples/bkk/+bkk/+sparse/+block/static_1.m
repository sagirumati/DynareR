function [y, T, residual, g1] = static_1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(2, 1);
  residual(1)=(y(8)-1)-((y(8)-1)*params(12)+params(25)*(y(19)-1)+x(1));
  residual(2)=(y(19)-1)-((y(19)-1)*params(24)+(y(8)-1)*params(26)+x(2));
if nargout > 3
    g1_v = NaN(4, 1);
g1_v(1)=(-params(25));
g1_v(2)=1-params(24);
g1_v(3)=1-params(12);
g1_v(4)=(-params(26));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 2, 2);
end
end
