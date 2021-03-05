% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
function err = computeDirection(D,options,quantities,reporter,strategies)

% Initialize error
err = false;

% Compute direction
g = quantities.currentIterate.objectiveGradient(quantities);
h = quantities.currentIterate.objectiveHessian(quantities);
v = -h\g;
% Set direction
quantities.setDirectionPrimal(v);
  
end % computeDirection
