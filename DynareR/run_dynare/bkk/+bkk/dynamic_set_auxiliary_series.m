function ds = dynamic_set_auxiliary_series(ds, params)
%
% Computes auxiliary variables of the dynamic model
%
ds.AUX_ENDO_LEAD_106=ds.LGM(1);
ds.AUX_ENDO_LEAD_111=ds.AUX_ENDO_LEAD_106(1);
ds.AUX_ENDO_LEAD_122=ds.AUX_ENDO_LEAD_111(1);
ds.AUX_ENDO_LEAD_386=ds.Y_H(1)^(1+params(7))*params(6)*ds.LGM(1)*params(1)^4/ds.K_H(-3)*(ds.LAMBDA_H(1)*ds.K_H(-3)^params(6)*ds.N_H(1)^(1-params(6)))^(-params(7));
ds.AUX_ENDO_LEAD_403=ds.AUX_ENDO_LEAD_386(1);
ds.AUX_ENDO_LEAD_139=ds.AUX_ENDO_LEAD_403(1);
ds.AUX_ENDO_LEAD_453=ds.Y_F(1)^(1+params(19))*params(18)*ds.LGM(1)*params(13)^4/ds.K_F(-3)*(ds.LAMBDA_F(1)*ds.K_F(-3)^params(18)*ds.N_F(1)^(1-params(18)))^(-params(19));
ds.AUX_ENDO_LEAD_470=ds.AUX_ENDO_LEAD_453(1);
ds.AUX_ENDO_LEAD_291=ds.AUX_ENDO_LEAD_470(1);
ds.AUX_ENDO_LAG_4_1=ds.K_H(-1);
ds.AUX_ENDO_LAG_4_2=ds.AUX_ENDO_LAG_4_1(-1);
ds.AUX_ENDO_LAG_4_3=ds.AUX_ENDO_LAG_4_2(-1);
ds.AUX_ENDO_LAG_8_1=ds.S_H(-1);
ds.AUX_ENDO_LAG_8_2=ds.AUX_ENDO_LAG_8_1(-1);
ds.AUX_ENDO_LAG_28_1=ds.K_F(-1);
ds.AUX_ENDO_LAG_28_2=ds.AUX_ENDO_LAG_28_1(-1);
ds.AUX_ENDO_LAG_28_3=ds.AUX_ENDO_LAG_28_2(-1);
ds.AUX_ENDO_LAG_32_1=ds.S_F(-1);
ds.AUX_ENDO_LAG_32_2=ds.AUX_ENDO_LAG_32_1(-1);
end
