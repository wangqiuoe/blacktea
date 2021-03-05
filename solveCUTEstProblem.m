function solveCUTEstProblem(name,algorithm,kappa_str)

% Add source files to path
addpath('/Users/baoyuzhou/Desktop/Software/StochasticSQP/');
addpath('/Users/baoyuzhou/Desktop/Software/StochasticSQP/StochasticSQP/problems/');
addpath('/Users/baoyuzhou/Desktop/Software/StochasticSQP/StochasticSQP/src/');
addpath('/usr/local/opt/cutest/libexec/src/matlab');

% Move to problem directory
cd(sprintf('/Users/baoyuzhou/Desktop/Software/SCO/decoded/%s',name));

% Create objects
P = ProblemCUTEst;
S = StochasticSQP;

% Add file report
S.reporter.addFileReport(Enumerations.R_SOLVER,Enumerations.R_PER_ITERATION,...
                         sprintf('/Users/baoyuzhou/Desktop/Software/SCO/output/%s_%s_%s.out',name,algorithm,kappa_str));

% Switch string to number
kappa = str2num(kappa_str);

% Compute other input values
mu_2 = 10*kappa;
mu_1 = kappa; % min(0.5,5*kappa);
theta_1 = min(1,sqrt(1-kappa^2)/(2*kappa));
theta_2 = kappa;
                     
% Set options
if strcmp(algorithm,'Subgradient')
	S.options.modifyOption(S.reporter,'direction_computation','Subgradient');
    S.options.modifyOption(S.reporter,'merit_parameter_computation','Fixed');
    S.options.modifyOption(S.reporter,'stepsize_computation','Conservative');
    S.options.modifyOption(S.reporter,'merit_parameter_initial',1e-04);
    S.options.modifyOption(S.reporter,'SCC_stepsize_scaling',1e-01);
elseif strcmp(algorithm,'IEQP')
    S.options.modifyOption(S.reporter,'direction_computation','IEQP');
    S.options.modifyOption(S.reporter,'stepsize_computation','IAdaptive');
    S.options.modifyOption(S.reporter,'merit_parameter_computation','ModelReductionInexact');
    S.options.modifyOption(S.reporter,'DCIEQP_full_residual_norm_factor',kappa);
    S.options.modifyOption(S.reporter,'DCIEQP_primal_residual_norm_factor',mu_2);
    S.options.modifyOption(S.reporter,'DCIEQP_dual_residual_norm_factor',mu_1);
    S.options.modifyOption(S.reporter,'DCIEQP_constraint_norm_factor',theta_1);
    S.options.modifyOption(S.reporter,'DCIEQP_lagrangian_primal_norm_factor',theta_2);
    S.options.modifyOption(S.reporter,'SCIA_stepsize_diminishing',false);
    S.options.modifyOption(S.reporter,'DCIEQP_use_hessian_of_lagrangian',true);
end

% Optimize
S.optimize(P);

% Solution (best)
[x,yE,yI,infeasibility,stationarity] = S.solution;

% Check how many iterations to get stationarities
innerIteration = S.baselineInnerIteration;
ratio = S.getUpperRatio;

if infeasibility <= 1e-6 && stationarity <= 1e-3
    innerIteration = S.baselineInnerIteration;
    ratio = innerIteration/(size(x,1) + size(yE,1) + size(yI,1));
end

% Save solution
save(sprintf('/Users/baoyuzhou/Desktop/Software/SCO/output/%s_%s_%s.mat',name,algorithm,kappa_str),'x','yE','yI','infeasibility','stationarity','innerIteration','ratio');

% Delete objects
delete(P);
delete(S);

% Move back
cd('/Users/baoyuzhou/Desktop/Software/SCO');