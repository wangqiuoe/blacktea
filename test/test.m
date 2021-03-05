clear;clc;
% Add source code to path
addpath('../objective_functions/');
addpath('../src/');

Problem = Genhumps;

params.iteration_limit = 1000;
params.tol = 1e-8;
params.stepsize = 10;
params.x0 = ones(Problem.n,1);
params.gamma = 0.9;

%S1 = SolverSteepestDescentFixedStep(Problem, params);
%S1.optimize();

S = SolverSteepestDescentAdaQi(Problem, params);
S.optimize();


