% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Strategies: getOptions
function getOptions(S,options,reporter)

% Get strategies options
direction_computation_name = options.getOption(reporter,'direction_computation');
stepsize_computation_name = options.getOption(reporter,'stepsize_computation');

% Initial direction_computation
S.direction_computation_ = eval(['DirectionComputation', char(direction_computation_name)]);

% Switch on stepsize computation names
S.stepsize_computation_ = eval(['StepsizeComputation', char(stepsize_computation_name)]);

% Get options
S.direction_computation_.getOptions(options,reporter);
S.stepsize_computation_.getOptions(options,reporter);

end % getOptions
