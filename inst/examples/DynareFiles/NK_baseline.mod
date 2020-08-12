/*
 * This file implements the Baseline New Keynesian DSGE model described in 
 * much detail in Jesús Fernández-Villaverde and Juan F. Rubio-Ramírez (2006): "A Baseline DSGE 
 * Model", available at http://economics.sas.upenn.edu/~jesusfv/benchmark_DSGE.pdf
 *
 * The parametrization is based on the estimated version of this model in 
 * Jesús Fernández-Villaverde (2010): "The econometrics of DSGE models", 
 * SERIEs, Vol. 1, pp. 3-49, DOI 10.1007/s13209-009-0014-7
 *
 * This implementation was written by Benjamin Born and Johannes Pfeifer. In
 * case you spot mistakes, email us at jpfeifer@gmx.de
 *
 * This mod-file implements a non-linearized version of the New Keynesian 
 * model based on a recursive formulation of the price and wage setting 
 * equations. Moreover, it makes use of a steady state file to i) set 
 * parameters that depend on other parameters that are potentially estimated
 * and ii) solve a nonlinear equation using a numerical solver to find the steady
 * state of labor. It provides an example on how the steady state file can be used
 * to circumvent some of the limitation of Dynare mod-file by accessing an external
 * file that allows calling general MATLAB routines. These capacities will mostly be 
 * interesting for power users. If one just wants to provide analytical steady state 
 * values and update parameters, the steady_state_model-block allows an easy and convenient
 * alternative. It even allows calling numerical solvers like fsolve. For an example, see
 * example3.mod
 * 
 * The model is written in the beginning of period stock notation. To make the model
 * conform with Dynare's end of period stock notation, we use the 
 * predetermined_variables-command.
 *
 * Please note that the following copyright notice only applies to this Dynare 
 * implementation of the model.
 */

/*
 * Copyright (C) 2013-2020 Dynare Team
 *
 * This file is part of Dynare.
 *
 * Dynare is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Dynare is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Dynare.  If not, see <http://www.gnu.org/licenses/>.
 */

var d       (long_name='preference shock')
    c       (long_name='consumption')
    mu_z    (long_name='trend growth rate of the economy (from neutral and investment specific technology)')
    mu_I    (long_name='growth rate of investment-specific technology growth')
    mu_A    (long_name='growth rate of neutral technology')
    lambda  (long_name='Lagrange multiplier')
    R       (long_name='Nominal Interest rate')
    PI      (long_name='Inflation')
    r       (long_name='rental rate of capital')
    x       (long_name='investment')
    u       (long_name='capacity utilization')
    q       (long_name='Tobin marginal q')
    f       (long_name='variable for recursive formulation of wage setting')
    ld      (long_name='aggregate labor demand')
    w       (long_name='real wage')
    wstar   (long_name='optimal real wage')
    PIstarw (long_name='optimal wage inflation')
    PIstar  (long_name='optimal price inflation')
    g1      (long_name='variable 1 for recursive formulation of price setting')
    g2      (long_name='variable 2 for recursive formulation of price setting')
    yd      (long_name='aggregate output')
    mc      (long_name='marginal costs')
    k       (long_name='capital')
    vp      (long_name='price dispersion term')
    vw      (long_name='wage dispersion term')
    l       (long_name='aggregate labor bundle')
    phi     (long_name='labor disutility shock')
    F       (long_name='firm profits')
    ;
    
varexo epsd (long_name='Innovation preference shock')
    epsphi  (long_name='Innovation labor disutility shock')
    epsmu_I (long_name='Innovation investment-specific technology')
    epsA    (long_name='Innovation neutral technology')
    epsm    (long_name='Innovation monetary policy shock')
    ;

predetermined_variables k;

parameters h            (long_name='consumption habits')
           betta        (long_name='discount factor')
           gammma1      (long_name='capital utilization, linear term')
           gammma2      (long_name='capital utilization, quadratic term')
           delta        (long_name='depreciation rate')
           kappa        (long_name='capital adjustment costs parameter')
           eta          (long_name='elasticity of substitution between labor varieties')
           epsilon      (long_name='elasticity of substitution between goods varieties')
           varpsi       (long_name='labor disutility parameter')
           gammma       (long_name='inverse Frisch elasticity')
           chiw         (long_name='wage indexation parameter')
           chi          (long_name='price indexation')
           thetap       (long_name='Calvo parameter prices')
           thetaw       (long_name='Calvo parameter wages')
           alppha       (long_name='capital share')
           Rbar         (long_name='steady state interest rate')
           PIbar        (long_name='steady state inflation')
           gammmaR      (long_name='interest smoothing coefficient Taylor rule')
           gammmaPI     (long_name='feedback coefficient to inflation monetary policy rule')
           gammmay      (long_name='feedback coefficient to output growth deviation in monetary policy rule')
           Phi          (long_name='firms fixed costs')
           rhod         (long_name='autocorrelation preference shock')
           rhophi       (long_name='autocorrelation labor disutility shock')
           Lambdamu  	(long_name='steady state growth rate of investmentment-specific technology')
           LambdaA      (long_name='steady state neutral technology growth')
           Lambdax      (long_name='steady state growth rate of investment')
           LambdaYd     (long_name='steady state growth rate of output')
           sigma_d      (long_name='standard deviation preference shock')
           sigma_phi    (long_name='standard deviation labor disutility shock')
           sigma_mu     (long_name='standard deviation investment-specific technology')
           sigma_A      (long_name='standard deviation neutral technology')
           sigma_m      (long_name='standard deviation monetary policy shock')
            ;

//Note that the parameter naming in FV(2010) differs from FV(2006)
//Fixed parameters, taken from FV(2010), Table 2, p. 37
delta=0.025; 
epsilon=10;
eta= 10;
Phi=0;
gammma2=0.001;

//Estimated parameters, taken from FV(2010), Table 3, p. 38, median estimate parameters

betta =0.998;
h=0.97;
varpsi =8.92;
gammma = 1.17;
kappa =9.51;
alppha =0.21;

thetap =0.82;
chi = 0.63;
thetaw =0.68;
chiw =0.62;
gammmaR =0.77;
gammmay =0.19;

gammmaPI =1.29;
PIbar = 1.01;
rhod  = 0.12;
rhophi = 0.93;
sigma_A = -3.97;
sigma_d = -1.51;

sigma_phi =-2.36;
sigma_mu =-5.43;
sigma_m  =-5.85;
Lambdamu=3.4e-3;
LambdaA = 2.8e-3;


/*
The following parameters are set in the steady state file as they depend on other 
deep parameters (some were estimated in the original study). Setting them in the
steady state file means they are updated for every parameter draw in the MCMC
algorithm, while the parameters initialized here are only set once for the initial
values of the parameters they depend on:

gammma1=mu_z*mu_I/betta-(1-delta);
R=1+(PIbar*mu_z/betta-1);
Lambdax=exp(LambdaYd);
LambdaYd= (LambdaA+alppha*Lambdamu)/(1-alppha);
*/



/*
The following model equations are the stationary model equations, taken from
FV(2006), p. 20, section 3.2.
*/

model; 
[name='FOC consumption']
d*(c-h*c(-1)*mu_z^(-1))^(-1)-h*betta*d(+1)*(c(+1)*mu_z(+1)-h*c)^(-1)=lambda;
[name='Euler equation']
lambda=betta*lambda(+1)*mu_z(+1)^(-1)/PI(+1)*R;
[name='FOC capital utilization']
r=gammma1+gammma2*(u-1);
[name='FOC capital']
q=betta*lambda(+1)/lambda*mu_z(+1)^(-1)*mu_I(+1)^(-1)*((1-delta)*q(+1)+r(+1)*u(+1)-(gammma1*(u(+1)-1)+gammma2/2*(u(+1)-1)^2));
[name='FOC investment']
1=q*(1-(kappa/2*(x/x(-1)*mu_z-Lambdax)^2)-(kappa*(x/x(-1)*mu_z-Lambdax)*x/x(-1)*mu_z))
  +betta*q(+1)*lambda(+1)/lambda*mu_z(+1)^(-1)*kappa*(x(+1)/x*mu_z(+1)-Lambdax)*(x(+1)/x*mu_z(+1))^2;
[name='Wage setting 1']
f=(eta-1)/eta*wstar^(1-eta)*lambda*w^eta*ld+betta*thetaw*(PI^chiw/PI(+1))^(1-eta)*(wstar(+1)/wstar*mu_z(+1))^(eta-1)*f(+1);
[name='Wage setting 2']
f=varpsi*d*phi*PIstarw^(-eta*(1+gammma))*ld^(1+gammma)+betta*thetaw*(PI^chiw/PI(+1))^(-eta*(1+gammma))*(wstar(+1)/wstar*mu_z(+1))^(eta*(1+gammma))*f(+1);

[name='Firm price setting 1']
g1=lambda*mc*yd+betta*thetap*(PI^chi/PI(+1))^(-epsilon)*g1(+1);
[name='Firm price setting 2']
g2=lambda*PIstar*yd+betta*thetap*(PI^chi/PI(+1))^(1-epsilon)*PIstar/PIstar(+1)*g2(+1);
[name='Firm price setting 3']
epsilon*g1=(epsilon-1)*g2;
[name='Optimal capital labor ratio']
u*k/ld=alppha/(1-alppha)*w/r*mu_z*mu_I;
[name='Marginal costs']
mc=(1/(1-alppha))^(1-alppha)*(1/alppha)^alppha*w^(1-alppha)*r^alppha;
[name='law of motion wages']
1=thetaw*(PI(-1)^chiw/PI)^(1-eta)*(w(-1)/w*mu_z^(-1))^(1-eta)+(1-thetaw)*PIstarw^(1-eta);
[name='law of motion prices']
1=thetap*(PI(-1)^chi/PI)^(1-epsilon)+(1-thetap)*PIstar^(1-epsilon);

[name='Taylor Rule']
R/Rbar=(R(-1)/Rbar)^gammmaR*((PI/PIbar)^gammmaPI*((yd/yd(-1)*mu_z)/exp(LambdaYd))^gammmay)^(1-gammmaR)*exp(epsm);

[name='Resource constraint']
yd=c+x+mu_z^(-1)*mu_I^(-1)*(gammma1*(u-1)+gammma2/2*(u-1)^2)*k;
[name='Aggregate production']
yd=(mu_A*mu_z^(-1)*(u*k)^alppha*ld^(1-alppha)-Phi)/vp;
[name='Aggregate labor market']
l=vw*ld; 
[name='LOM Price dispersion term']
vp=thetap*(PI(-1)^chi/PI)^(-epsilon)*vp(-1)+(1-thetap)*PIstar^(-epsilon);
[name='LOM Wage dispersion term']
vw=thetaw*(w(-1)/w*mu_z^(-1)*PI(-1)^chiw/PI)^(-eta)*vw(-1)+(1-thetaw)*(PIstarw)^(-eta);
[name='Law of motion for capital']
k(+1)*mu_z*mu_I-(1-delta)*k-mu_z*mu_I*(1-kappa/2*(x/x(-1)*mu_z-Lambdax)^2)*x=0;
[name='Profits']
F=yd-1/(1-alppha)*w*ld;
[name='definition optimal wage inflation']
PIstarw=wstar/w;

//exogenous processes
[name='Preference Shock']
log(d)=rhod*log(d(-1))+epsd;
[name='Labor disutility Shock']
log(phi)=rhophi*log(phi(-1))+epsphi;
[name='Investment specific technology']
log(mu_I)=Lambdamu+epsmu_I;
[name='Neutral technology']
log(mu_A)=LambdaA+epsA; 
[name='Defininition composite technology']
mu_z=mu_A^(1/(1-alppha))*mu_I^(alppha/(1-alppha));

end;

shocks;
var epsd; stderr exp(sigma_d);
var epsphi; stderr exp(sigma_phi);
var epsmu_I; stderr exp(sigma_mu);
var epsA; stderr exp(sigma_A);
var epsm; stderr exp(sigma_m);
end;

steady;
check;

stoch_simul(order=1,irf=20) yd c R PI;
