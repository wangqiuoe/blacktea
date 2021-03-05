% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Strategies: initialize
function initialize(S,options,quantities,reporter)

% Initialize
S.direction_computation_.initialize(options,quantities,reporter);
S.stepsize_computation_.initialize(options,quantities,reporter);

end % initialize
