% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% StepsizeComputationConservative: addOptions
function addOptions(options,reporter)

% Add double options
options.addDoubleOption(reporter,'StepsizeInit',1e+00,0,inf);

end % addOptions
