% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% StepsizeComputationConservative: getOptions
function getOptions(S,options,reporter)

% Get options
S.stepsizeinit_ = options.getOption(reporter,'StepsizeInit');
S.c1_ = options.getOption(reporter,'c1');
S.tao_ = options.getOption(reporter,'tao');

end % getOptions
