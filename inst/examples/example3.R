# We use "example1" of the Dynare example files to illustrate
#how to use this function

FileName<-"example3"

library(DynareR)

DynareCodes='
/*
 * Example 1 from F. Collard (2001): "Stochastic simulations with DYNARE:
 * A practical guide" (see "guide.pdf" in the documentation directory).
 *
 * This file uses the steady_state_model-block to provide analytical steady state values.
 * To do so, the equations of the model have been transformed into a non-linear equation in
 * labor h. Within the steady_state_model-block, a helper function is called that uses fsolve
 * to solve this non-linear equation. The use of the helper function is necessary to avoid
 * interference of the MATLAB syntax with Dynare's preprocessor. A more complicated alternative
 * that provides more flexibility in the type of commands executed and functions called is the use
 * of an explicit steady state file. See the NK_baseline.mod in the Examples Folder.
 *
 * This mod-file also shows how to use Dynare's capacities to generate TeX-files of the model equations.
 * If you want to see the model equations belonging to this mod-file, run it using Dynare
 * and then use a TeX-editor to compile the TeX-files generated.
 */

/*
 * Copyright (C) 2013 Dynare Team
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


var y, c, k, a, h, b;
varexo e, u;

parameters beta $\beta$
     rho $\rho$
     alpha $\alpha$
     delta $\delta$
     theta $\theta$
     psi $\psi$
     tau $\tau$;

alpha = 0.36;
rho   = 0.95;
tau   = 0.025;
beta  = 0.99;
delta = 0.025;
psi   = 0;
theta = 2.95;

phi   = 0.1;

model;
c*theta*h^(1+psi)=(1-alpha)*y;
k = beta*(((exp(b)*c)/(exp(b(+1))*c(+1)))
    *(exp(b(+1))*alpha*y(+1)+(1-delta)*k));
y = exp(a)*(k(-1)^alpha)*(h^(1-alpha));
k = exp(b)*(y-c)+(1-delta)*k(-1);
a = rho*a(-1)+tau*b(-1) + e;
b = tau*a(-1)+rho*b(-1) + u;
end;

steady_state_model;
h=example3_steady_state_helper(alpha,beta,delta,psi,theta);
k=((1/beta-(1-delta))/alpha)^(1/(alpha-1))*h;
y = k^alpha*h^(1-alpha);
c=(1-alpha)*y/(theta*h^(1+psi));
a=0;
b=0;
end;

shocks;
var e; stderr 0.009;
var u; stderr 0.009;
var e, u = phi*0.009*0.009;
end;

//use command to generate TeX-Files with dynamic and static model equations
write_latex_dynamic_model;
write_latex_static_model;

stoch_simul;'

file<-FileName
code<-DynareCodes
run_dynare(file,code)

# You can create an absolute or relative path for the DynareR files.
# The following writes and run mod file in "DynareR/run_dynare/"  folder
# relative to the current path.

path=paste0("DynareR","/",file)

if(!dir.exists(path)) dir.create(path,recursive = T)

run_dynare(file,code,path)
