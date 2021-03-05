% Copyright (C) 2020 Frank E. Curtis
%
% All Rights Reserved.
%
% Authors: Frank E. Curtis

% StepsizeComputation class
classdef (Abstract) StepsizeComputation < Strategy
  
  % Methods (abstract, static)
  methods (Abstract, Static)
    
    % Add options
    addOptions(options,reporter)
    
  end % methods (abstract, static)
  
  % Methods (abstract)
  methods (Abstract)
    
    % Print iteration header
    printIterationHeader(S,reporter)
    
    % Print iteration values
    printIterationValues(S,quantities,reporter)
    
    % Get options
    getOptions(S,options,reporter)
    
    % Initialize
    initialize(S,options,quantities,reporter)
    
    % Name
    n = name(S)
    
    % Compute stepsize
    computeStepsize(S,options,quantities,reporter,strategies)
    
  end % methods (abstract)
  
end % StepsizeComputation