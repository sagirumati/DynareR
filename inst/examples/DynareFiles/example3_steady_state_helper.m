function h=example3_steady_state_helper(alpha,beta,delta,psi,theta)
options=optimset('Display','Final','TolX',1e-10,'TolFun',1e-10);
h=fsolve(@(h)1- ((((((1/beta-(1-delta))/alpha)^(1/(alpha-1))*h)^(alpha-1))*(h^(1-alpha))-(((1-alpha)*((((1/beta-(1-delta))/alpha)^(1/(alpha-1)))^alpha))/(theta*h^psi))/(((1/beta-(1-delta))/alpha)^(1/(alpha-1))*h))+(1-delta)),0.2,options);


