% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% Quantities: printIterationValues
function printIterationValues(Q,reporter)

% Print iteration values
reporter.printf(Enumerations.R_SOLVER,Enumerations.R_PER_ITERATION,...
  '%6d %+e',...
  Q.iterationCounter,...
  Q.currentIterate.objectiveFunction(Q));

end % printIterationValues
