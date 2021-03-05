% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
function err = computeDirection(D,options,quantities,reporter,strategies)

% Initialize error
err = false;

% Compute direction
v = -quantities.currentIterate.objectiveGradient(quantities);
% Set direction
quantities.setDirectionPrimal(v);
  
end % computeDirection
