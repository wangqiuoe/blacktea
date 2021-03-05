% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% NonconstranintSolver: printHeader
function printHeader(S,P)

% Print software name
S.reporter_.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
  ['+---------------------------------------------------------------------------+\n'...
  '|                             NonconstranintSolver                           |\n'...
  '| NonconstranintSolver is released as open source code under the MIT License |\n'...
  '+----------------------------------------------------------------------------+\n'...
  '\n'...
  'This is NonconstranintSolver version 0.1.0\n'...
  '\n']);

% Print problem information
S.reporter_.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
  ['Problem name...................... : %s\n'...
  'Number of variables............... : %8d\n'...
  '\n\n'],...
  P.name,...
  P.numberOfVariables);

% Print header information
S.reporter_.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
  ['Direction computation............. : %s\n'...
  'Stepsize computation.............. : %s\n'...
  '\n'],...
  S.strategies_.directionComputation.name,...
  S.strategies_.stepsizeComputation.name);

end % printHeader
