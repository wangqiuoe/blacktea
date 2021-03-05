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

% Switch on direction computation names
switch direction_computation_name
  case 'EQP'
    S.direction_computation_ = DirectionComputationEQP;
  case 'Subgradient'
    S.direction_computation_ = DirectionComputationSubgradient;
  case 'SteepestDescent'
    S.direction_computation_ = DirectionComputationSteepestDescent;
  otherwise
    S.direction_computation_ = DirectionComputationEQP;
end

% Switch on stepsize computation names
switch stepsize_computation_name
  case 'Adaptive'
    S.stepsize_computation_ = StepsizeComputationAdaptive;
  case 'Conservative'
    S.stepsize_computation_ = StepsizeComputationConservative;
  case 'Fixed'
    S.stepsize_computation_ = StepsizeComputationFixed;
  otherwise
    S.stepsize_computation_ = StepsizeComputationAdaptive;
end

% Get options
S.direction_computation_.getOptions(options,reporter);
S.stepsize_computation_.getOptions(options,reporter);

end % getOptions
