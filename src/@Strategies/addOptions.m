% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Strategies: addOptions
function addOptions(options,reporter)

% Add options
options.addStringOption(reporter,'direction_computation','EQP');
options.addStringOption(reporter,'stepsize_computation','Adaptive');

% Add direction computation options
d = DirectionComputationEQP;
d.addOptions(options,reporter);
d = DirectionComputationSubgradient;
d.addOptions(options,reporter);
d = DirectionComputationSteepestDescent;
d.addOptions(options,reporter);

% Add stepsize computation options
s = StepsizeComputationAdaptive;
s.addOptions(options,reporter);
s = StepsizeComputationConservative;
s.addOptions(options,reporter);
s = StepsizeComputationFixed;
s.addOptions(options,reporter);

end % addOptions
