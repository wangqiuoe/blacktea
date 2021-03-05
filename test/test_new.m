clear;clc;
% Add source code to path
addpath('../objective_functions/');
addpath('../src/');

%funobj = Genhumps;

% params for Quadratic function
props.n       = 100;
props.density = 0.2;
props.rc      = 1e-2;
props.kind    = 1;
props.g_mean  = 1;
props.g_sd    = 1;
funobj = Quadratic(props); 



S = NonconstraintSolver;
S.options.modifyOption(S.reporter,'StepsizeInit',10);
S.options.modifyOption(S.reporter,'stepsize_computation' ,'Armijo');
S.options.modifyOption(S.reporter,'direction_computation','SteepestDescent');
P = Class417Problems(funobj);
S.optimize(P);


