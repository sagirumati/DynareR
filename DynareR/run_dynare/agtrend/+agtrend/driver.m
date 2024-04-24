%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'agtrend';
M_.dynare_version = '5.3';
oo_.dynare_version = '5.3';
options_.dynare_version = '5.3';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'eps_z'};
M_.exo_names_tex(1) = {'eps\_z'};
M_.exo_names_long(1) = {'eps_z'};
M_.exo_names(2) = {'eps_g'};
M_.exo_names_tex(2) = {'eps\_g'};
M_.exo_names_long(2) = {'eps_g'};
M_.endo_names = cell(15,1);
M_.endo_names_tex = cell(15,1);
M_.endo_names_long = cell(15,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'c'};
M_.endo_names_long(1) = {'c'};
M_.endo_names(2) = {'k'};
M_.endo_names_tex(2) = {'k'};
M_.endo_names_long(2) = {'k'};
M_.endo_names(3) = {'y'};
M_.endo_names_tex(3) = {'y'};
M_.endo_names_long(3) = {'y'};
M_.endo_names(4) = {'b'};
M_.endo_names_tex(4) = {'b'};
M_.endo_names_long(4) = {'b'};
M_.endo_names(5) = {'q'};
M_.endo_names_tex(5) = {'q'};
M_.endo_names_long(5) = {'q'};
M_.endo_names(6) = {'g'};
M_.endo_names_tex(6) = {'g'};
M_.endo_names_long(6) = {'g'};
M_.endo_names(7) = {'l'};
M_.endo_names_tex(7) = {'l'};
M_.endo_names_long(7) = {'l'};
M_.endo_names(8) = {'u'};
M_.endo_names_tex(8) = {'u'};
M_.endo_names_long(8) = {'u'};
M_.endo_names(9) = {'z'};
M_.endo_names_tex(9) = {'z'};
M_.endo_names_long(9) = {'z'};
M_.endo_names(10) = {'uc'};
M_.endo_names_tex(10) = {'uc'};
M_.endo_names_long(10) = {'uc'};
M_.endo_names(11) = {'ul'};
M_.endo_names_tex(11) = {'ul'};
M_.endo_names_long(11) = {'ul'};
M_.endo_names(12) = {'f'};
M_.endo_names_tex(12) = {'f'};
M_.endo_names_long(12) = {'f'};
M_.endo_names(13) = {'c_y'};
M_.endo_names_tex(13) = {'c\_y'};
M_.endo_names_long(13) = {'c_y'};
M_.endo_names(14) = {'tb_y'};
M_.endo_names_tex(14) = {'tb\_y'};
M_.endo_names_long(14) = {'tb_y'};
M_.endo_names(15) = {'i_y'};
M_.endo_names_tex(15) = {'i\_y'};
M_.endo_names_long(15) = {'i_y'};
M_.endo_partitions = struct();
M_.param_names = cell(15,1);
M_.param_names_tex = cell(15,1);
M_.param_names_long = cell(15,1);
M_.param_names(1) = {'mu_g'};
M_.param_names_tex(1) = {'mu\_g'};
M_.param_names_long(1) = {'mu_g'};
M_.param_names(2) = {'sigma'};
M_.param_names_tex(2) = {'sigma'};
M_.param_names_long(2) = {'sigma'};
M_.param_names(3) = {'rho_g'};
M_.param_names_tex(3) = {'rho\_g'};
M_.param_names_long(3) = {'rho_g'};
M_.param_names(4) = {'sigma_g'};
M_.param_names_tex(4) = {'sigma\_g'};
M_.param_names_long(4) = {'sigma_g'};
M_.param_names(5) = {'delta'};
M_.param_names_tex(5) = {'delta'};
M_.param_names_long(5) = {'delta'};
M_.param_names(6) = {'phi'};
M_.param_names_tex(6) = {'phi'};
M_.param_names_long(6) = {'phi'};
M_.param_names(7) = {'psi'};
M_.param_names_tex(7) = {'psi'};
M_.param_names_long(7) = {'psi'};
M_.param_names(8) = {'b_star'};
M_.param_names_tex(8) = {'b\_star'};
M_.param_names_long(8) = {'b_star'};
M_.param_names(9) = {'alpha'};
M_.param_names_tex(9) = {'alpha'};
M_.param_names_long(9) = {'alpha'};
M_.param_names(10) = {'rho_z'};
M_.param_names_tex(10) = {'rho\_z'};
M_.param_names_long(10) = {'rho_z'};
M_.param_names(11) = {'sigma_z'};
M_.param_names_tex(11) = {'sigma\_z'};
M_.param_names_long(11) = {'sigma_z'};
M_.param_names(12) = {'r_star'};
M_.param_names_tex(12) = {'r\_star'};
M_.param_names_long(12) = {'r_star'};
M_.param_names(13) = {'beta'};
M_.param_names_tex(13) = {'beta'};
M_.param_names_long(13) = {'beta'};
M_.param_names(14) = {'tau'};
M_.param_names_tex(14) = {'tau'};
M_.param_names_long(14) = {'tau'};
M_.param_names(15) = {'nu'};
M_.param_names_tex(15) = {'nu'};
M_.param_names_long(15) = {'nu'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 15;
M_.param_nbr = 15;
M_.orig_endo_nbr = 15;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 15;
M_.eq_nbr = 15;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 0;
 1 6 20;
 0 7 21;
 2 8 0;
 0 9 0;
 3 10 22;
 0 11 0;
 0 12 0;
 4 13 0;
 0 14 23;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;]';
M_.nstatic = 9;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [12; 5; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'y' ;
  2 , 'name' , 'z' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'u' ;
  5 , 'name' , 'uc' ;
  6 , 'name' , 'ul' ;
  7 , 'name' , 'f' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
  13 , 'name' , 'tb_y' ;
  14 , 'name' , 'c_y' ;
  15 , 'name' , 'i_y' ;
};
M_.mapping.c.eqidx = [4 5 6 8 14 ];
M_.mapping.k.eqidx = [1 8 10 15 ];
M_.mapping.y.eqidx = [1 8 10 11 13 14 15 ];
M_.mapping.b.eqidx = [8 9 13 ];
M_.mapping.q.eqidx = [8 9 12 13 ];
M_.mapping.g.eqidx = [1 3 7 8 10 12 13 15 ];
M_.mapping.l.eqidx = [1 4 5 6 11 ];
M_.mapping.u.eqidx = [4 ];
M_.mapping.z.eqidx = [1 2 ];
M_.mapping.uc.eqidx = [5 10 11 12 ];
M_.mapping.ul.eqidx = [6 11 ];
M_.mapping.f.eqidx = [7 10 12 ];
M_.mapping.c_y.eqidx = [14 ];
M_.mapping.tb_y.eqidx = [13 ];
M_.mapping.i_y.eqidx = [15 ];
M_.mapping.eps_z.eqidx = [2 ];
M_.mapping.eps_g.eqidx = [3 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 4 6 9 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(15, 1);
M_.endo_trends = struct('deflator', cell(15, 1), 'log_deflator', cell(15, 1), 'growth_factor', cell(15, 1), 'log_growth_factor', cell(15, 1));
M_.NNZDerivatives = [64; -1; -1; ];
M_.static_tmp_nbr = [10; 4; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(14) = 1.4;
tau = M_.params(14);
M_.params(15) = 1.6;
nu = M_.params(15);
M_.params(9) = 0.68;
alpha = M_.params(9);
M_.params(2) = 2;
sigma = M_.params(2);
M_.params(5) = 0.03;
delta = M_.params(5);
M_.params(13) = 0.98;
beta = M_.params(13);
M_.params(7) = 0.001;
psi = M_.params(7);
M_.params(8) = 0.1;
b_star = M_.params(8);
M_.params(1) = 1.006;
mu_g = M_.params(1);
M_.params(11) = 0.0041;
sigma_z = M_.params(11);
M_.params(10) = 0.94;
rho_z = M_.params(10);
M_.params(4) = 0.0109;
sigma_g = M_.params(4);
M_.params(3) = 0.72;
rho_g = M_.params(3);
M_.params(6) = 3.79;
phi = M_.params(6);
M_.params(12) = M_.params(1)^M_.params(2)/M_.params(13)-1;
r_star = M_.params(12);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(5) = 1/(1+M_.params(12));
oo_.steady_state(4) = M_.params(8);
oo_.steady_state(9) = 0;
oo_.steady_state(6) = M_.params(1);
oo_.steady_state(1) = 0.583095;
oo_.steady_state(2) = 4.02387;
oo_.steady_state(3) = 0.721195;
oo_.steady_state(7) = 0.321155;
oo_.steady_state(8) = (oo_.steady_state(1)-M_.params(14)*oo_.steady_state(7)^M_.params(15))^(1-M_.params(2))/(1-M_.params(2));
oo_.steady_state(10) = (oo_.steady_state(1)-M_.params(14)*oo_.steady_state(7)^M_.params(15))^(-M_.params(2));
oo_.steady_state(11) = M_.params(15)*(-M_.params(14))*oo_.steady_state(7)^(M_.params(15)-1)*(oo_.steady_state(1)-M_.params(14)*oo_.steady_state(7))^(-M_.params(2));
oo_.steady_state(12) = M_.params(13)*oo_.steady_state(6)^(1-M_.params(2));
oo_.steady_state(14) = (oo_.steady_state(4)-oo_.steady_state(4)*oo_.steady_state(6)*oo_.steady_state(5))/oo_.steady_state(3);
oo_.steady_state(13) = oo_.steady_state(1)/oo_.steady_state(3);
oo_.steady_state(15) = (oo_.steady_state(6)*oo_.steady_state(2)-oo_.steady_state(2)*(1-M_.params(5)))/oo_.steady_state(3);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1/M_.params(11)/100)^2;
M_.Sigma_e(2, 2) = (1/M_.params(4)/100)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.order = 1;
var_list_ = {'tb_y';'c_y';'i_y'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'agtrend_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
