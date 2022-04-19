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
M_.fname = 'RBC_IRF';
M_.dynare_version = '5.0';
oo_.dynare_version = '5.0';
options_.dynare_version = '5.0';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(2,1);
M_.exo_names_tex = cell(2,1);
M_.exo_names_long = cell(2,1);
M_.exo_names(1) = {'eps_z'};
M_.exo_names_tex(1) = {'{\varepsilon_z}'};
M_.exo_names_long(1) = {'TFP shock'};
M_.exo_names(2) = {'eps_g'};
M_.exo_names_tex(2) = {'{\varepsilon_g}'};
M_.exo_names_long(2) = {'government spending shock'};
M_.endo_names = cell(15,1);
M_.endo_names_tex = cell(15,1);
M_.endo_names_long = cell(15,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'{y}'};
M_.endo_names_long(1) = {'output'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'{c}'};
M_.endo_names_long(2) = {'consumption'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'{k}'};
M_.endo_names_long(3) = {'capital'};
M_.endo_names(4) = {'l'};
M_.endo_names_tex(4) = {'{l}'};
M_.endo_names_long(4) = {'hours'};
M_.endo_names(5) = {'z'};
M_.endo_names_tex(5) = {'{z}'};
M_.endo_names_long(5) = {'TFP'};
M_.endo_names(6) = {'ghat'};
M_.endo_names_tex(6) = {'{\hat g}'};
M_.endo_names_long(6) = {'government spending'};
M_.endo_names(7) = {'r'};
M_.endo_names_tex(7) = {'{r}'};
M_.endo_names_long(7) = {'annualized interest rate'};
M_.endo_names(8) = {'w'};
M_.endo_names_tex(8) = {'{w}'};
M_.endo_names_long(8) = {'real wage'};
M_.endo_names(9) = {'invest'};
M_.endo_names_tex(9) = {'{i}'};
M_.endo_names_long(9) = {'investment'};
M_.endo_names(10) = {'log_y'};
M_.endo_names_tex(10) = {'{\log(y)}'};
M_.endo_names_long(10) = {'log output'};
M_.endo_names(11) = {'log_k'};
M_.endo_names_tex(11) = {'{\log(k)}'};
M_.endo_names_long(11) = {'log capital stock'};
M_.endo_names(12) = {'log_c'};
M_.endo_names_tex(12) = {'{\log(c)}'};
M_.endo_names_long(12) = {'log consumption'};
M_.endo_names(13) = {'log_l'};
M_.endo_names_tex(13) = {'{\log(l)}'};
M_.endo_names_long(13) = {'log labor'};
M_.endo_names(14) = {'log_w'};
M_.endo_names_tex(14) = {'{\log(w)}'};
M_.endo_names_long(14) = {'log real wage'};
M_.endo_names(15) = {'log_invest'};
M_.endo_names_tex(15) = {'{\log(i)}'};
M_.endo_names_long(15) = {'log investment'};
M_.endo_partitions = struct();
M_.param_names = cell(14,1);
M_.param_names_tex = cell(14,1);
M_.param_names_long = cell(14,1);
M_.param_names(1) = {'beta'};
M_.param_names_tex(1) = {'{\beta}'};
M_.param_names_long(1) = {'discount factor'};
M_.param_names(2) = {'psi'};
M_.param_names_tex(2) = {'{\psi}'};
M_.param_names_long(2) = {'labor disutility parameter'};
M_.param_names(3) = {'sigma'};
M_.param_names_tex(3) = {'{\sigma}'};
M_.param_names_long(3) = {'risk aversion'};
M_.param_names(4) = {'delta'};
M_.param_names_tex(4) = {'{\delta}'};
M_.param_names_long(4) = {'depreciation rate'};
M_.param_names(5) = {'alpha'};
M_.param_names_tex(5) = {'{\alpha}'};
M_.param_names_long(5) = {'capital share'};
M_.param_names(6) = {'rhoz'};
M_.param_names_tex(6) = {'{\rho_z}'};
M_.param_names_long(6) = {'persistence TFP shock'};
M_.param_names(7) = {'rhog'};
M_.param_names_tex(7) = {'{\rho_g}'};
M_.param_names_long(7) = {'persistence G shock'};
M_.param_names(8) = {'gammax'};
M_.param_names_tex(8) = {'{\gamma_x}'};
M_.param_names_long(8) = {'composite growth rate'};
M_.param_names(9) = {'gshare'};
M_.param_names_tex(9) = {'{\frac{G}{Y}}'};
M_.param_names_long(9) = {'government spending share'};
M_.param_names(10) = {'n'};
M_.param_names_tex(10) = {'{n}'};
M_.param_names_long(10) = {'population growth'};
M_.param_names(11) = {'x'};
M_.param_names_tex(11) = {'{x}'};
M_.param_names_long(11) = {'technology growth (per capita output growth)'};
M_.param_names(12) = {'i_y'};
M_.param_names_tex(12) = {'{\frac{I}{Y}}'};
M_.param_names_long(12) = {'investment-output ratio'};
M_.param_names(13) = {'k_y'};
M_.param_names_tex(13) = {'{\frac{K}{Y}}'};
M_.param_names_long(13) = {'capital-output ratio'};
M_.param_names(14) = {'g_ss'};
M_.param_names_tex(14) = {'{\bar G}'};
M_.param_names_long(14) = {'government spending in steady state'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 15;
M_.param_nbr = 14;
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
 0 4 0;
 0 5 19;
 1 6 0;
 0 7 20;
 2 8 21;
 3 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;]';
M_.nstatic = 10;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.dynamic_tmp_nbr = [6; 1; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Euler equation' ;
  2 , 'name' , 'Labor FOC' ;
  3 , 'name' , 'Law of motion capital' ;
  4 , 'name' , 'resource constraint' ;
  5 , 'name' , 'production function' ;
  6 , 'name' , 'real wage/firm FOC labor' ;
  7 , 'name' , 'annualized real interest rate/firm FOC capital' ;
  8 , 'name' , 'exogenous TFP process' ;
  9 , 'name' , 'government spending process' ;
  10 , 'name' , 'Definition log output' ;
  11 , 'name' , 'Definition log capital' ;
  12 , 'name' , 'Definition log consumption' ;
  13 , 'name' , 'Definition log hours' ;
  14 , 'name' , 'Definition log wage' ;
  15 , 'name' , 'Definition log investment' ;
};
M_.mapping.y.eqidx = [4 5 6 7 10 ];
M_.mapping.c.eqidx = [1 2 4 12 ];
M_.mapping.k.eqidx = [1 3 5 7 11 ];
M_.mapping.l.eqidx = [1 2 5 6 13 ];
M_.mapping.z.eqidx = [1 5 8 ];
M_.mapping.ghat.eqidx = [4 9 ];
M_.mapping.r.eqidx = [7 ];
M_.mapping.w.eqidx = [2 6 14 ];
M_.mapping.invest.eqidx = [3 4 15 ];
M_.mapping.log_y.eqidx = [10 ];
M_.mapping.log_k.eqidx = [11 ];
M_.mapping.log_c.eqidx = [12 ];
M_.mapping.log_l.eqidx = [13 ];
M_.mapping.log_w.eqidx = [14 ];
M_.mapping.log_invest.eqidx = [15 ];
M_.mapping.eps_z.eqidx = [8 ];
M_.mapping.eps_g.eqidx = [9 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 5 6 ];
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(15, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(14, 1);
M_.endo_trends = struct('deflator', cell(15, 1), 'log_deflator', cell(15, 1), 'growth_factor', cell(15, 1), 'log_growth_factor', cell(15, 1));
M_.NNZDerivatives = [43; -1; -1; ];
M_.static_tmp_nbr = [7; 2; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(3) = 1;
sigma = M_.params(3);
M_.params(5) = 0.33;
alpha = M_.params(5);
M_.params(12) = 0.25;
i_y = M_.params(12);
M_.params(13) = 10.4;
k_y = M_.params(13);
M_.params(11) = 0.0055;
x = M_.params(11);
M_.params(10) = 0.0027;
n = M_.params(10);
M_.params(6) = 0.97;
rhoz = M_.params(6);
M_.params(7) = 0.989;
rhog = M_.params(7);
M_.params(9) = 0.2038;
gshare = M_.params(9);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = 4.356e-05;
M_.Sigma_e(2, 2) = 0.00010609;
resid;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
write_latex_parameter_table;
write_latex_definitions ;
collect_latex_files ;
options_.TeX = true;
options_.hp_filter = 1600;
options_.irf = 40;
options_.order = 1;
var_list_ = {'log_y';'log_k';'log_c';'log_l';'log_w';'r';'z';'ghat'};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'RBC_IRF_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
