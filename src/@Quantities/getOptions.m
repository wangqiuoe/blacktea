% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Quantities: getOptions
function getOptions(Q,options,reporter)

% Get options
Q.scale_problem_ = options.getOption(reporter,'scale_problem');
Q.constraint_function_evaluation_limit_ = options.getOption(reporter,'constraint_function_evaluation_limit');
Q.constraint_Jacobian_evaluation_limit_ = options.getOption(reporter,'constraint_Jacobian_evaluation_limit');
Q.cpu_time_limit_ = options.getOption(reporter,'cpu_time_limit');
Q.hessian_of_lagrangian_evaluation_limit_ = options.getOption(reporter,'hessian_of_lagrangian_evaluation_limit');
Q.iteration_limit_ = options.getOption(reporter,'iteration_limit');
Q.merit_parameter_ = options.getOption(reporter,'merit_parameter_initial');
Q.objective_function_evaluation_limit_ = options.getOption(reporter,'objective_function_evaluation_limit');
Q.objective_gradient_evaluation_limit_ = options.getOption(reporter,'objective_gradient_evaluation_limit');
Q.ratio_parameter_ = options.getOption(reporter,'ratio_parameter_initial');
Q.scale_factor_gradient_limit_ = options.getOption(reporter,'scale_factor_gradient_limit');
Q.size_limit_ = options.getOption(reporter,'size_limit');
Q.stationarity_tolerance_ = options.getOption(reporter,'stationarity_tolerance');

end % getOptions