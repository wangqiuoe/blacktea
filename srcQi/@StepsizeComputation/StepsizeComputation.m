classdef (Abstract) StepsizeComputation < handle

  properties (Abstract)

    n
    problem
  end


  % Methods (abstract)
  methods (Abstract)

    % Name
    n = name(self)

    % Compute stepsize
    stepsize = computeStepsize(self, iterate)

  end % methods (abstract)

end % StepsizeComputation
