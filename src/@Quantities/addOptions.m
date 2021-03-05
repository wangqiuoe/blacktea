% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Quantities: addOptions
function addOptions(options,reporter)

% Add integer options
options.addIntegerOption(reporter,'objective_function_evaluation_limit',1e+03,0,inf);
options.addIntegerOption(reporter,'objective_gradient_evaluation_limit',1e+03,0,inf);
options.addIntegerOption(reporter,'iteration_limit',1e+03,0,inf);

% Add double options
options.addDoubleOption(reporter,'cpu_time_limit',600,0,inf);
options.addDoubleOption(reporter,'stationarity_tolerance',1e-04,0,inf);
options.addDoubleOption(reporter,'ratio_parameter_initial',1e+00,0,inf);

end % addOptions
