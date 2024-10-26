function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(6, 1);
lhs = NaN(6, 1);
rhs = NaN(6, 1);
T(1) = y(11)^(1+params(6));
T(2) = y(8)*exp(y(12))/(exp(y(18))*y(14));
T(3) = params(3)*exp(y(18))*y(13)+y(9)*(1-params(4));
T(4) = exp(y(10))*y(3)^params(3);
T(5) = y(11)^(1-params(3));
T(6) = T(4)*T(5);
lhs(1) = y(8)*params(5)*T(1);
rhs(1) = (1-params(3))*y(7);
lhs(2) = y(9);
rhs(2) = params(1)*T(2)*T(3);
lhs(3) = y(7);
rhs(3) = T(6);
lhs(4) = y(9);
rhs(4) = exp(y(12))*(y(7)-y(8))+(1-params(4))*y(3);
lhs(5) = y(10);
rhs(5) = params(2)*y(4)+params(7)*y(6)+x(1);
lhs(6) = y(12);
rhs(6) = y(4)*params(7)+params(2)*y(6)+x(2);
end