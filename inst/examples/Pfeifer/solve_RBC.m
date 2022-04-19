% Copyright (C) 2014-2018 Benjamin Born and Johannes Pfeifer
% 
%  This is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
% 
%  It is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
% 
%  For a copy of the GNU General Public License,
%  see <http://www.gnu.org/licenses/>.

%% RBC Model, Chapter 1
clear
%% define parameters and do model calibration

rhoz = 0.97;
rhog = 0.989;
siggma = 1;
alppha = 0.33;
i_y = 0.25;
k_y = 10.4;
g_x = 0.0055;
n = 0.0027;
gshare = 0.2038;
gamma_x = (1+n)*(1+g_x);
deltta = i_y/k_y-g_x-n-n*g_x;
betta = gamma_x/(alppha/k_y+(1-deltta));

%% compute steady state
l_ss = 0.33;
k_ss = ((1/betta*gamma_x-(1-deltta))/alppha)^(1/(alppha-1))*l_ss; 
i_ss = (g_x+n+deltta+n*g_x)*k_ss;
y_ss = k_ss^alppha*l_ss^(1-alppha);
g_ss = gshare*y_ss;
c_ss = y_ss - g_ss - i_ss;
pssi = (1-alppha)*(k_ss/l_ss)^alppha*(1-l_ss)/c_ss^siggma;

%% define coefficients and auxiliary variables
gamma_l=(l_ss/(1-l_ss)+alppha)^-1;

alpha1=1/gamma_x*(alppha*y_ss/k_ss*(1+(1-alppha)*gamma_l)+(1-deltta));
alpha2=-(c_ss/(gamma_x*k_ss)+y_ss/(gamma_x*k_ss)*(1-alppha)*gamma_l*siggma);
alpha3=y_ss/(gamma_x*k_ss)*(1+(1-alppha)*gamma_l);
alpha4=-g_ss/(gamma_x*k_ss);

alpha5=-betta/(gamma_x*siggma)*alppha*(k_ss/l_ss)^(alppha-1)*(alppha-1)*(1-alppha*gamma_l);
alpha6=1-betta/gamma_x*alppha*(k_ss/l_ss)^(alppha-1)*(alppha-1)*gamma_l;
alpha7=-betta/(gamma_x*siggma)*alppha*(k_ss/l_ss)^(alppha-1)*(1-(alppha-1)*gamma_l);

%% matrices of the linear RE model: A*E_t(x_{t+1})=B*x_t
% x = [k_t z_t g_t c_t]
A = [ 1 0 0 0;
    alpha5 alpha7 0 alpha6;
    0 0 1 0;
    0 1 0 0];
B = [alpha1 alpha3 alpha4 alpha2;
    0 0 0 1;
    0 0 rhog 0;
    0 rhoz 0 0];

% multiplying with inv(A)
W = A\B;

% partition matrices: need w11 and w12 for M
n_x = 3;
n_x1 = 1; % number of endogenous states
n_x2 = 2; % number of exogenous states
n_u = 1;

w11 = W(1:n_x,1:n_x);
w12 = W(1:n_x,n_x+1:end);

% Eigenvalue decomposition: W = D*Lambda*D^-1
[evec,eval] = eig(W);
% sort eigenvalues in increasing order
[mu, ind] = sort(abs(diag(eval)));

dinv = inv(evec(:,ind)); % take inverse of matrix D (reordered)
q21 = dinv(n_x+1:end,1:n_x);
q22 = dinv(n_x+1:end,n_x+1:end);

M = w11-w12*q21/q22;
PI = -q22\q21;

%% impulse response

T_irf = 40;
x_mat = zeros(n_x,T_irf);
c_irf = zeros(n_u,T_irf);

eta_mat=[zeros(n_x1,n_x2);eye(n_x2,n_x2)];
eps_vec=[0;1]; %eps_vec=[eps_z_t; eps_g_t]

x_mat(:,2)=M*x_mat(:,1)+eta_mat*eps_vec;
c_irf(1,2)=PI*x_mat(:,2);

for ii=3:T_irf
    x_mat(:,ii)=M*x_mat(:,ii-1);
    c_irf(:,ii)=PI*x_mat(:,ii);
end

k_irf = x_mat(1,:);
tfp_irf = x_mat(2,:);
g_irf = x_mat(3,:);
l_irf = gamma_l*(tfp_irf+alppha*k_irf-siggma*c_irf(1,:));
y_irf = tfp_irf + alppha*k_irf + (1-alppha)*l_irf;
w_irf = tfp_irf + alppha*k_irf-alppha*l_irf;

r_ss = 4*alppha*y_ss/k_ss;
r_irf = r_ss*(y_irf-k_irf);

figure

subplot(3,3,1)
plot(-1:T_irf-2,tfp_irf)
title('TFP')
axis tight

subplot(3,3,2)
plot(-1:T_irf-2,y_irf)
title('Output')
axis tight

subplot(3,3,3)
plot(-1:T_irf-2,c_irf)
title('Consumption')
axis tight

subplot(3,3,4)
plot(-1:T_irf-2,k_irf)
title('Capital')
axis tight

subplot(3,3,5)
plot(-1:T_irf-2,l_irf)
title('Labor')
axis tight

subplot(3,3,6)
plot(-1:T_irf-2,w_irf)
title('Wage')
axis tight

subplot(3,3,7)
plot(-1:T_irf-2,r_irf)
title('Interest rate')
axis tight

subplot(3,3,8)
plot(-1:T_irf-2,g_irf)
title('Gov. spending')
axis tight