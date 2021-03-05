% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Quantities: getOptions
function getOptions(Q,options,reporter)

% Get options
Q.cpu_time_limit_ = options.getOption(reporter,'cpu_time_limit');
Q.iteration_limit_ = options.getOption(reporter,'iteration_limit');
Q.objective_function_evaluation_limit_ = options.getOption(reporter,'objective_function_evaluation_limit');
Q.objective_gradient_evaluation_limit_ = options.getOption(reporter,'objective_gradient_evaluation_limit');
Q.ratio_parameter_ = options.getOption(reporter,'ratio_parameter_initial');
Q.stationarity_tolerance_ = options.getOption(reporter,'stationarity_tolerance');

end % getOptions
